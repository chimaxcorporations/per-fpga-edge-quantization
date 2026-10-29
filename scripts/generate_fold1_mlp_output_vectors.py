#!/usr/bin/env python3
"""P3-M04-03D: checkpoint-derived INT8 MLP output-layer neuron vectors."""
import argparse, hashlib, json
from pathlib import Path
import numpy as np
import pandas as pd
import torch
from src.integer_ptq import quantize, weight_quantize, fixedpoint_params, round_shift_even, qmax, dense
FEATURES=[f'{name}_lag{lag}' for lag in range(10) for name in ('per_t','dist_m','v_src_mps','v_dst_mps')]
def sha(path):
    h=hashlib.sha256()
    with open(path,'rb') as f:
        for part in iter(lambda:f.read(1048576),b''): h.update(part)
    return h.hexdigest()
def main():
    p=argparse.ArgumentParser()
    p.add_argument('--count',type=int,default=32,help='Number of output neuron cases; one per reference row')
    p.add_argument('--method',choices=('max','p999'),default='max')
    p.add_argument('--out',default='results/p3_m04/mlp_fold1_output_neuron')
    a=p.parse_args()
    ckpt=Path('artifacts/p3_m01/reference_models/mlp/mlp_fold1.pt')
    ref=Path('artifacts/p3_m01/reference_vectors/fold1.parquet')
    cal=Path('results/p3_quantization/calibration/activation_statistics/activation_percentiles_exact_by_fold.csv')
    for path in (ckpt,ref,cal):
        if not path.is_file(): p.error(f'Missing prerequisite: {path}')
    checkpoint=torch.load(ckpt,map_location='cpu',weights_only=False)
    state=checkpoint['state_dict']
    w1=state['layers.0.weight'].detach().cpu().numpy()
    b1=state['layers.0.bias'].detach().cpu().numpy()
    w2=state['layers.2.weight'].detach().cpu().numpy()
    b2=state['layers.2.bias'].detach().cpu().numpy()
    w3=state['layers.4.weight'].detach().cpu().numpy()
    b3=state['layers.4.bias'].detach().cpu().numpy()
    if (w1.shape,b1.shape,w2.shape,b2.shape,w3.shape,b3.shape)!=((64,40),(64,),(32,64),(32,),(1,32),(1,)):
        raise RuntimeError(f'Unexpected layer shapes: {w1.shape}, {b1.shape}, {w2.shape}, {b2.shape}, {w3.shape}, {b3.shape}')
    df=pd.read_parquet(ref)
    raw=df[FEATURES].to_numpy(dtype=np.float64)
    mean=np.asarray(checkpoint['scaler_mean'],dtype=np.float64)
    std=np.asarray(checkpoint['scaler_scale'],dtype=np.float64)
    if np.any(std==0): raise RuntimeError('Zero scaler standard deviation')
    calibration=pd.read_csv(cal)
    subset=calibration[(calibration.fold==1)&(calibration.model=='mlp')]
    if len(subset)!=4: raise RuntimeError(f'Expected 4 calibration rows, got {len(subset)}')
    column='absmax' if a.method=='max' else 'abs_p999'
    scales={str(r.layer):max(float(getattr(r,column))/qmax(8),1e-12) for r in subset.itertuples()}
    for name in ('standardized_input','fc1_relu','fc2_relu'):
        if name not in scales: raise RuntimeError(f'Missing calibration layer {name}; found {list(scales)}')
    sx1,sy1,sy2=(scales[k] for k in ('standardized_input','fc1_relu','fc2_relu'))
    output_layers=set(scales)-{'standardized_input','fc1_relu','fc2_relu'}
    if len(output_layers)!=1: raise RuntimeError(f'Expected exactly one output calibration layer, found {sorted(output_layers)}')
    output_layer=next(iter(output_layers))
    sy3=scales[output_layer]
    rows=min(a.count,len(raw))
    if rows<=0: raise RuntimeError('No reference rows')
    x=quantize(((raw[:rows]-mean)/std).astype(np.float32),sx1,8)
    q1=dense(x,w1,b1,sx1,sy1,8,relu=True)
    if q1.shape!=(rows,64): raise RuntimeError(f'Unexpected first-layer activation shape {q1.shape}')
    q2=dense(q1,w2,b2,sy1,sy2,8,relu=True)
    if q2.shape!=(rows,32): raise RuntimeError(f'Unexpected second-layer shape {q2.shape}')
    qw3,sw3=weight_quantize(w3,8)
    bq3=np.rint(b3.astype(np.float64)/(sy2*sw3)).astype(np.int64)
    backend=dense(q2,w3,b3,sy2,sy3,8,relu=False)
    if backend.shape!=(rows,1): raise RuntimeError(f'Unexpected output shape {backend.shape}')
    count=rows
    out=Path(a.out); out.mkdir(parents=True,exist_ok=True)
    vec=out/'golden_vectors.memh'; cases=[]; zero_shift=0
    with vec.open('w') as f:
        for case in range(count):
            row,neuron=case,0
            xx=q2[row].astype(np.int64); ww=qw3[neuron].astype(np.int64)
            acc=int(bq3[neuron])+sum(int(i)*int(j) for i,j in zip(xx,ww))
            if not -(1<<31)<=acc<(1<<31): raise OverflowError(f'INT32 overflow at case={case}, acc={acc}')
            multiplier,shift=fixedpoint_params(float(sy2*sw3[neuron]/sy3))
            if not 0<=shift<=31: raise RuntimeError(f'Unsupported shift {shift}')
            if shift==0: zero_shift+=1
            product=acc*multiplier
            if not -(1<<63)<=product<(1<<63): raise OverflowError(f'INT64 overflow at case={case}')
            rounded=int(round_shift_even(np.array([product],dtype=np.int64),shift)[0])
            expected=min(127,max(-127,rounded))
            if int(backend[row,neuron])!=expected:
                raise AssertionError(f'Python backend mismatch case={case}, {backend[row,neuron]} != {expected}')
            header=((int(bq3[neuron])&0xffffffff)<<48)|((int(multiplier)&0xffffffff)<<16)|(shift<<10)|((expected&255)<<1)
            f.write(f'{header:020x}\n')
            for i,j in zip(xx,ww): f.write(f'{((int(i)&255)<<8)|(int(j)&255):04x}\n')
            cases.append(dict(case=case,row=row,neuron=neuron,acc=acc,expected=expected,multiplier=int(multiplier),shift=int(shift)))
    pd.DataFrame(cases).to_csv(out/'cases.csv',index=False)
    manifest=dict(fold=1,model='mlp',layer='layers.4 / output',bits=8,method=a.method,cases=count,features=32,
                  checkpoint_sha256=sha(ckpt),reference_vectors_sha256=sha(ref),calibration_sha256=sha(cal),
                  golden_vectors_sha256=sha(vec),first_layer_input_scale=sx1,first_layer_output_scale=sy1,
                  second_layer_input_scale=sy1,second_layer_output_scale=sy2,output_layer_calibration_name=output_layer,output_layer_input_scale=sy2,output_layer_output_scale=sy3,output_relu=False,accumulator_overflow_cases=0,
                  zero_shift_cases=zero_shift,backend_comparison='PASS',intermediate_activations='first and second hidden layers from integer dense()')
    (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print(f'PASS: {count} fold-1 MLP output checkpoint-derived neuron cases, 32 features, Python backend matched')
    print(f'Vectors: {vec}; manifest: {out}/manifest.json; zero-shift cases: {zero_shift}')
    print(f'Compile testbench with -Ptb_neuron_int8_serial.N_FEATURES=32 -Ptb_neuron_int8_serial.N_CASES={count}')
if __name__=='__main__': main()
