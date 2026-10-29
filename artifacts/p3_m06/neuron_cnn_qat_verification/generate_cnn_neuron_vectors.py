#!/usr/bin/env python3
"""ROM-only CNN fold-1 QAT neuron vectors; no PyTorch dependency.

Creates packed operand streams and expected outputs for all 11,296 neurons.
Checks each generated result against independently exported layer golden data.
"""
import argparse, hashlib, json
from pathlib import Path

LAYERS = [('conv1',4,16,12,True),('conv2',16,16,48,True),('fc1',160,32,160,True),('output',32,1,32,False)]

def read(path,bits):
    raw=[int(s,16) for s in path.read_text().split()]
    lim=1<<(bits-1)
    return [x-(1<<bits) if x>=lim else x for x in raw]

def write(path,values,bits,unsigned=False):
    mask=(1<<bits)-1
    with path.open('w') as f:
        for x in values:
            if not (0 <= x < (1<<bits) if unsigned else -(1<<(bits-1)) <= x < (1<<(bits-1))):
                raise ValueError(f'{path}: {x} outside signed {bits} range')
            f.write(f'{x&mask:0{bits//4}x}\n')

def round_even(x,shift):
    a=abs(x); q,r=divmod(a,1<<shift)
    if shift and (r>(1<<(shift-1)) or (r==(1<<(shift-1)) and (q&1))):q+=1
    return -q if x<0 else q

def main():
    p=argparse.ArgumentParser()
    p.add_argument('--rom',type=Path,default=Path('results/p3_m06/qat_hardware/parameter_rom'))
    p.add_argument('--out',type=Path,default=Path('hardware/tb/p3_m06_03a_02/vectors'))
    a=p.parse_args(); rom=a.rom.resolve(); out=a.out.resolve(); out.mkdir(parents=True,exist_ok=True)
    manifest=json.loads((rom/'manifest.json').read_text())
    n=manifest['samples']; assert n==32, f'Expected 32 samples, got {n}'
    assert manifest['rom_readback']==manifest['layerwise_rom_backend_parity']==manifest['final_per_parity']=='PASS'
    # Ensure ROM inputs are unchanged from the manifest.
    for info in manifest['layer_parameters']:
        for item in info['files'].values():
            f=rom/item['file']
            assert hashlib.sha256(f.read_bytes()).hexdigest()==item['sha256'],f'Hash mismatch: {f}'
    for item in manifest['test_vectors'].values():
        f=rom/item['file']
        assert hashlib.sha256(f.read_bytes()).hexdigest()==item['sha256'],f'Hash mismatch: {f}'
    inputs=read(rom/'inputs_int8.memh',8)
    assert len(inputs)==n*40
    # Original input order is sample,time,channel (10x4).
    previous=[[[inputs[s*40+t*4+c] for t in range(10)] for c in range(4)] for s in range(n)]
    vectors={key:[] for key in ('features','weights','counts','biases','multipliers','shifts','relus','expected','layer_ids','sample_ids','neuron_ids')}
    stats=[]
    for lid,(name,channels,outs,fan_in,relu) in enumerate(LAYERS):
        w=read(rom/f'{name}_weights.memh',8)
        bias=read(rom/f'{name}_bias.memh',32)
        mult=read(rom/f'{name}_multiplier.memh',32)
        shift=read(rom/f'{name}_shift.memh',8)
        gold=read(rom/f'{name}_golden_int8.memh',8)
        assert len(w)==outs*fan_in and len(bias)==len(mult)==len(shift)==outs
        positions=10 if lid<2 else 1
        assert len(gold)==n*outs*positions
        current=[[[0]*positions for _ in range(outs)] for _ in range(n)] if lid<2 else [[0]*outs for _ in range(n)]
        count=0; padding=0
        for s in range(n):
            for oc in range(outs):
                for t in range(positions):
                    if lid<2:
                        x=[]
                        for ic in range(channels):
                            for k in range(3):
                                pos=t+k-1
                                if not 0<=pos<10: padding+=1
                                x.append(previous[s][ic][pos] if 0<=pos<10 else 0)
                    elif lid==2:
                        # Conv2 golden is [sample,channel,time]; flatten channel-major.
                        x=[previous[s][ic][tt] for ic in range(16) for tt in range(10)]
                    else:
                        x=list(previous[s])
                    assert len(x)==fan_in
                    ww=w[oc*fan_in:(oc+1)*fan_in]
                    acc=bias[oc]
                    for xx,wt in zip(x,ww):
                        acc+=xx*wt
                        assert -(1<<31)<=acc<(1<<31), f'Intermediate overflow {name} sample={s} channel={oc} time={t}'
                    prod=acc*mult[oc]
                    assert -(1<<63)<=prod<(1<<63)
                    assert 0<=shift[oc]<=63
                    result=max(-127,min(127,round_even(prod,shift[oc])))
                    if relu: result=max(0,result)
                    gold_index=(s*outs+oc)*positions+t
                    assert result==gold[gold_index], (name,s,oc,t,result,gold[gold_index])
                    if lid<2:current[s][oc][t]=result
                    else:current[s][oc]=result
                    vectors['features'].extend(x)
                    vectors['weights'].extend(ww)
                    for key,val in [('counts',fan_in),('biases',bias[oc]),('multipliers',mult[oc]),('shifts',shift[oc]),('relus',int(relu)),('expected',result),('layer_ids',lid),('sample_ids',s),('neuron_ids',oc*positions+t)]:
                        vectors[key].append(val)
                    count+=1
        stats.append({'layer':name,'cases':count,'padding_operands':padding})
        print(f'PASS: {name}: {count} golden-matched neurons; padding operands={padding}')
        previous=current
    assert len(vectors['expected'])==11296
    widths={'features':8,'weights':8,'counts':8,'biases':32,'multipliers':32,'shifts':8,'relus':8,'expected':8,'layer_ids':8,'sample_ids':8,'neuron_ids':16}
    for key,vals in vectors.items():write(out/f'{key}.memh',vals,widths[key],unsigned=key in ('counts','shifts','relus','layer_ids','sample_ids','neuron_ids'))
    meta={'milestone':'P3-M06-03A-02','samples':n,'cases':len(vectors['expected']),'operands':len(vectors['features']),'layers':stats,'rom_manifest_sha256':hashlib.sha256((rom/'manifest.json').read_bytes()).hexdigest(),'vector_files':{k:hashlib.sha256((out/f'{k}.memh').read_bytes()).hexdigest() for k in vectors}}
    (out/'verification_manifest.json').write_text(json.dumps(meta,indent=2)+'\n')
    print(f'PASS: generated {meta["cases"]} CNN QAT neuron vectors, {meta["operands"]} packed MAC operands')

if __name__=='__main__':main()
