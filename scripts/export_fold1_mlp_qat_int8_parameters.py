#!/usr/bin/env python3
"""P3-M04-04A: checkpoint-faithful fold-1 MLP INT8 ROM export and verification."""
import argparse, hashlib, json
from pathlib import Path
import numpy as np
import pandas as pd
import torch
from src.integer_ptq import weight_quantize, fixedpoint_params, quantize, dense, qmax

FEATURES=[f'{name}_lag{lag}' for lag in range(10) for name in ('per_t','dist_m','v_src_mps','v_dst_mps')]
LAYERS=[('fc1','layers.0',40,64,True),('fc2','layers.2',64,32,True),('output','layers.4',32,1,False)]
def sha(p):
    h=hashlib.sha256()
    with open(p,'rb') as f:
        for chunk in iter(lambda:f.read(1<<20),b''): h.update(chunk)
    return h.hexdigest()
def write_mem(path, values, bits):
    vals=[int(x) for x in np.asarray(values).reshape(-1)]
    with open(path,'w') as f:
        for x in vals:
            if not -(1<<(bits-1)) <= x < (1<<(bits-1)):
                raise OverflowError(f'{path}: {x} not signed {bits}-bit')
            f.write(f'{x & ((1<<bits)-1):0{bits//4}x}\n')
    return {'path':path.name,'words':len(vals),'width_bits':bits,'sha256':sha(path)}
def read_mem(path,bits):
    a=np.array([int(line.strip(),16) for line in path.read_text().splitlines()],dtype=np.int64)
    return np.where(a >= (1<<(bits-1)),a-(1<<bits),a)
def main():
    p=argparse.ArgumentParser()
    p.add_argument('--method',choices=['max','p999'],default='max')
    p.add_argument('--count',type=int,default=32)
    p.add_argument('--out',default='results/p3_m05/qat_hardware/parameter_rom')
    a=p.parse_args()
    if a.count<1: p.error('--count must be positive')
    ckpt=Path('results/p3_qat/training/mlp/fold1/mlp_fold1_qat_int8.pt')
    ref=Path('artifacts/p3_m01/reference_vectors/fold1.parquet')
    cal=Path('results/p3_quantization/calibration/activation_statistics/activation_percentiles_exact_by_fold.csv')
    for path in (ckpt,ref,cal):
        if not path.is_file(): p.error(f'Missing prerequisite: {path}')
    state=torch.load(ckpt,map_location='cpu',weights_only=False)
    weights=state['state_dict']
    subset=pd.read_csv(cal)
    subset=subset[(subset.fold==1)&(subset.model=='mlp')]
    if len(subset)!=4: raise RuntimeError(f'Expected 4 calibration entries, got {len(subset)}')
    col='absmax' if a.method=='max' else 'abs_p999'
    scales={str(r.layer):max(float(getattr(r,col))/qmax(8),1e-12) for r in subset.itertuples()}
    expected={'standardized_input','fc1_relu','fc2_relu','output_linear'}
    if set(scales)!=expected: raise RuntimeError(f'Unexpected calibration layers: {scales.keys()}')
    sx=[scales['standardized_input'],scales['fc1_relu'],scales['fc2_relu']]
    sy=[scales['fc1_relu'],scales['fc2_relu'],scales['output_linear']]
    out=Path(a.out); out.mkdir(parents=True,exist_ok=True)
    meta=[]
    for idx,(name,key,nin,nout,relu) in enumerate(LAYERS):
        w=weights[f'{key}.weight'].detach().cpu().numpy()
        b=weights[f'{key}.bias'].detach().cpu().numpy()
        if w.shape!=(nout,nin) or b.shape!=(nout,):
            raise RuntimeError(f'{name}: unexpected shapes {w.shape} {b.shape}')
        qw,sw=weight_quantize(w,8)
        bq=np.rint(b.astype(np.float64)/(sx[idx]*sw)).astype(np.int64)
        mult,shift=[],[]
        for s in sw:
            m,sh=fixedpoint_params(float(sx[idx]*s/sy[idx]))
            if m>(1<<31)-1 or sh>31: raise RuntimeError('Unsupported requantization parameters')
            mult.append(m);shift.append(sh)
        files={}
        for suffix,data,bits in [('weights',qw,8),('bias',bq,32),('multiplier',mult,32),('shift',shift,8)]:
            path=out/f'{name}_{suffix}.memh'
            files[suffix]=write_mem(path,data,bits)
            if not np.array_equal(read_mem(path,bits),np.asarray(data).reshape(-1)):
                raise AssertionError(f'{name} {suffix} ROM readback mismatch')
        meta.append({'name':name,'input_features':nin,'output_neurons':nout,'relu':relu,
                     'weight_order':'neuron-major, input-feature-minor','input_scale':sx[idx],
                     'output_scale':sy[idx],'files':files})
    df=pd.read_parquet(ref)
    raw=df[FEATURES].to_numpy(dtype=np.float64)
    rows=min(a.count,len(raw))
    if rows==0: raise RuntimeError('No reference rows')
    mean=np.asarray(state['scaler_mean'],dtype=np.float64)
    std=np.asarray(state['scaler_scale'],dtype=np.float64)
    if mean.shape!=(40,) or std.shape!=(40,) or np.any(std==0): raise RuntimeError('Invalid scaler')
    x=quantize(((raw[:rows]-mean)/std).astype(np.float32),sx[0],8)
    files={'inputs':write_mem(out/'inputs_int8.memh',x,8)}
    q=x
    for idx,(name,key,nin,nout,relu) in enumerate(LAYERS):
        w=weights[f'{key}.weight'].detach().cpu().numpy()
        b=weights[f'{key}.bias'].detach().cpu().numpy()
        q=dense(q,w,b,sx[idx],sy[idx],8,relu=relu)
        files[name+'_golden']=write_mem(out/f'{name}_golden_int8.memh',q,8)
    # Validate that ROM-derived integer parameters reproduce the original Python backend.
    q_rom=x.astype(np.int64)
    for idx,(name,key,nin,nout,relu) in enumerate(LAYERS):
        w=read_mem(out/f'{name}_weights.memh',8).reshape(nout,nin)
        b=read_mem(out/f'{name}_bias.memh',32)
        m=read_mem(out/f'{name}_multiplier.memh',32)
        sh=read_mem(out/f'{name}_shift.memh',8)
        acc=q_rom @ w.T + b
        if np.any((acc<-(1<<31))|(acc>(1<<31)-1)):
            raise OverflowError(f'{name}: INT32 accumulator overflow')
        from src.integer_ptq import round_shift_even
        output=np.empty_like(acc)
        for j in range(nout):
            products=acc[:,j]*int(m[j])
            # Magnitude bound ensures signed INT64 multiplication does not overflow.
            if any(abs(int(v))*int(m[j])>(1<<63)-1 for v in acc[:,j]):
                raise OverflowError(f'{name}: INT64 product overflow')
            output[:,j]=round_shift_even(products,int(sh[j]))
        q_rom=np.clip(output,-127,127)
        if relu:q_rom=np.maximum(q_rom,0)
        expected_q=read_mem(out/f'{name}_golden_int8.memh',8).reshape(rows,nout)
        if not np.array_equal(q_rom,expected_q):
            ix=np.argwhere(q_rom!=expected_q)[0]
            raise AssertionError(f'{name}: ROM/backend mismatch at {tuple(ix)}')
    manifest={'milestone':'P3-M05-04F','model':'mlp','fold':1,'bits':8,'method':a.method,
              'checkpoint_sha256':sha(ckpt),'calibration_sha256':sha(cal),
              'reference_vectors_sha256':sha(ref),'samples':rows,
              'feature_order':FEATURES,'input_scaler':'checkpoint scaler_mean/scaler_scale; standardized float32 then INT8 quantize',
              'layer_parameters':meta,'test_vectors':files,
              'rom_readback':'PASS','rom_integer_inference_vs_python_dense':'PASS',
              'note':'ROM output is quantized INT8; PER dequantization and any downstream clipping remain separate.'}
    (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print(f'PASS: P3-M05-04F fold-1 MLP QAT INT8 ROM export; {rows} samples; ROM readback and integer inference match Python backend')
    print(f'Manifest: {out}/manifest.json')
if __name__=='__main__':main()
