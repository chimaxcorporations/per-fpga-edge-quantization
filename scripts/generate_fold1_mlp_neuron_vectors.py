#!/usr/bin/env python3
"""Checkpoint-derived fold-1 MLP fc1 vectors; imports actual src.integer_ptq.
Run from repository root. Requires torch, pandas, numpy, pyarrow and original artifacts.
"""
import argparse, hashlib, json
from pathlib import Path
import numpy as np
import pandas as pd
import torch
from src.integer_ptq import quantize, weight_quantize, fixedpoint_params, round_shift_even, qmax

FEATURES = [f'{name}_lag{lag}' for lag in range(10)
            for name in ('per_t','dist_m','v_src_mps','v_dst_mps')]

def digest(path):
    h = hashlib.sha256()
    with open(path,'rb') as f:
        for chunk in iter(lambda:f.read(1024*1024),b''): h.update(chunk)
    return h.hexdigest()

def main():
    p=argparse.ArgumentParser()
    p.add_argument('--fold',type=int,default=1)
    p.add_argument('--count',type=int,default=2048)
    p.add_argument('--method',choices=('max','p999'),default='max')
    p.add_argument('--out',default='results/p3_m04/mlp_fold1_neuron')
    a=p.parse_args()
    if a.fold!=1: p.error('M04-03B is restricted to fold 1')
    ckpt=Path('artifacts/p3_m01/reference_models/mlp/mlp_fold1.pt')
    ref=Path('artifacts/p3_m01/reference_vectors/fold1.parquet')
    cal=Path('results/p3_quantization/calibration/activation_statistics/activation_percentiles_exact_by_fold.csv')
    for path in (ckpt,ref,cal):
        if not path.exists(): p.error(f'Missing prerequisite: {path}')
    checkpoint=torch.load(ckpt,map_location='cpu',weights_only=False)
    state=checkpoint['state_dict']
    weight=state['layers.0.weight'].detach().cpu().numpy()
    bias=state['layers.0.bias'].detach().cpu().numpy()
    if weight.shape!=(64,40) or bias.shape!=(64,): raise RuntimeError(f'Unexpected MLP layer shape: {weight.shape}, {bias.shape}')
    df=pd.read_parquet(ref)
    raw=df[FEATURES].to_numpy(dtype=np.float64)
    mean=np.asarray(checkpoint['scaler_mean'],dtype=np.float64)
    std=np.asarray(checkpoint['scaler_scale'],dtype=np.float64)
    if np.any(std==0): raise RuntimeError('Zero standardization scale')
    calib=pd.read_csv(cal)
    subset=calib[(calib.fold==1)&(calib.model=='mlp')]
    if len(subset)!=4: raise RuntimeError(f'Expected 4 calibration layers, found {len(subset)}')
    column='absmax' if a.method=='max' else 'abs_p999'
    scale_map={str(r.layer):max(float(getattr(r,column))/qmax(8),1e-12) for r in subset.itertuples()}
    sx=scale_map['standardized_input']; sy=scale_map['fc1_relu']
    qw,sw=weight_quantize(weight,8)
    bq=np.rint(bias.astype(np.float64)/(sx*sw)).astype(np.int64)
    standardized=((raw-mean)/std).astype(np.float32)
    qx=quantize(standardized,sx,8)
    if qx.shape[1]!=40: raise RuntimeError('Expected 40 input features')
    out=Path(a.out); out.mkdir(parents=True,exist_ok=True)
    dest=out/'golden_vectors.memh'
    count=min(a.count,len(qx)*64)
    if count<=0: raise RuntimeError('No reference inputs')
    cases=[]
    with dest.open('w') as f:
        for case in range(count):
            row=case//64; neuron=case%64
            x=qx[row].astype(np.int64); w=qw[neuron].astype(np.int64)
            acc=int(bq[neuron])+sum(int(xx)*int(ww) for xx,ww in zip(x,w))
            if not -(1<<31)<=acc<1<<31: raise OverflowError(f'INT32 accumulator out of range: case={case} acc={acc}')
            multiplier,shift=fixedpoint_params(float(sx*sw[neuron]/sy))
            product=acc*multiplier
            if not -(1<<63)<=product<1<<63: raise OverflowError(f'INT64 product out of range: case={case}')
            rounded=int(round_shift_even(np.array([product],dtype=np.int64),shift)[0])
            expected=max(0,min(127,max(-127,rounded)))
            # Cross-check actual backend dense() semantics for this neuron.
            # dense() requantizes using the same weight_quantize, fixedpoint_params and round_shift_even functions.
            header=((int(bq[neuron])&0xffffffff)<<48)|((multiplier&0xffffffff)<<16)|(shift<<10)|(1<<9)|((expected&255)<<1)
            f.write(f'{header:020x}\n')
            for xx,ww in zip(x,w): f.write(f'{((int(xx)&255)<<8)|(int(ww)&255):04x}\n')
            cases.append({'case':case,'row':row,'neuron':neuron,'acc':acc,'expected':expected,'multiplier':multiplier,'shift':shift})
    # Full first-layer backend comparison on the selected rows.
    from src.integer_ptq import dense
    num_rows=(count+63)//64
    backend=dense(qx[:num_rows],weight,bias,sx,sy,8,relu=True)
    for c in cases:
        if int(backend[c['row'],c['neuron']])!=c['expected']:
            raise AssertionError(f'Backend mismatch: {c}')
    manifest={'fold':1,'model':'mlp','layer':'layers.0 / fc1_relu','bits':8,'method':a.method,
              'cases':count,'features':40,'checkpoint_sha256':digest(ckpt),
              'reference_vectors_sha256':digest(ref),'calibration_sha256':digest(cal),
              'golden_vectors_sha256':digest(dest),'input_scale':sx,'output_scale':sy,
              'accumulator_overflow_cases':0,'backend_comparison':'PASS'}
    (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    pd.DataFrame(cases).to_csv(out/'cases.csv',index=False)
    print(f'PASS: {count} fold-1 MLP checkpoint-derived neuron cases, 40 features, Python backend matched')
    print(f'Vectors: {dest}; manifest: {out}/manifest.json')
    print(f'Compile testbench with -Ptb_neuron_int8_serial.N_CASES={count}')

if __name__=='__main__': main()
