"""P3-M02.5: integer PTQ evaluation, using frozen training-only calibration."""
from pathlib import Path
import numpy as np
import pandas as pd
import torch
from torch import nn
from src.integer_ptq import quantize, dense, conv1d, qmax

ROOT = Path('artifacts/p3_m01')
CAL = Path('results/p3_quantization/calibration/activation_statistics/activation_percentiles_exact_by_fold.csv')
PTQ = Path('results/p3_quantization/ptq')
OUT = Path('results/p3_quantization/integer_ptq')
FEATURES = [f'{name}_lag{lag}' for lag in range(10) for name in ('per_t', 'dist_m', 'v_src_mps', 'v_dst_mps')]

class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = nn.Sequential(nn.Linear(40,64), nn.ReLU(), nn.Linear(64,32), nn.ReLU(), nn.Linear(32,1))

class CNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Sequential(nn.Conv1d(4,16,3,padding=1), nn.ReLU(), nn.Conv1d(16,16,3,padding=1), nn.ReLU())
        self.head = nn.Sequential(nn.Flatten(), nn.Linear(160,32), nn.ReLU(), nn.Linear(32,1))

def scales(cal, fold, model, bits, method):
    sub = cal[(cal.fold == fold) & (cal.model == model)]
    if len(sub) != (4 if model == 'mlp' else 5):
        raise RuntimeError(f'Incomplete calibration {model} fold {fold}')
    col = 'absmax' if method == 'max' else 'abs_p999'
    return {r.layer: max(float(getattr(r,col)) / qmax(bits), 1e-12) for r in sub.itertuples()}

def wb(layer):
    return layer.weight.detach().numpy(), layer.bias.detach().numpy()

def infer(model, name, raw, mean, std, s, bits, batch_size=128):
    outputs = []
    for i in range(0,len(raw),batch_size):
        x = ((raw[i:i+batch_size] - mean) / std).astype(np.float32)
        q = quantize(x, s['standardized_input'], bits)
        sx = s['standardized_input']
        if name == 'mlp':
            for idx, layername in ((0,'fc1_relu'),(2,'fc2_relu'),(4,'output_linear')):
                w,b = wb(model.layers[idx]); sy=s[layername]
                q=dense(q,w,b,sx,sy,bits,relu=(idx!=4)); sx=sy
            pred=q[:,0].astype(np.float64)*sx
        else:
            q=q.reshape(-1,10,4).transpose(0,2,1)
            for idx,layername in ((0,'conv1_relu'),(2,'conv2_relu')):
                w,b=wb(model.conv[idx]); sy=s[layername]
                q=conv1d(q,w,b,sx,sy,bits,relu=True); sx=sy
            q=q.reshape(len(q),-1)
            for idx,layername in ((1,'dense_relu'),(3,'output_linear')):
                w,b=wb(model.head[idx]); sy=s[layername]
                q=dense(q,w,b,sx,sy,bits,relu=(idx!=3)); sx=sy
            pred=q[:,0].astype(np.float64)*sx
        outputs.append(np.clip(pred,0,1))
    return np.concatenate(outputs)

def main():
    cal=pd.read_csv(CAL)
    rows=[]
    for name in ('mlp','cnn'):
        for fold in range(1,10):
            checkpoint=torch.load(ROOT/'reference_models'/name/f'{name}_fold{fold}.pt',map_location='cpu',weights_only=False)
            model=MLP() if name=='mlp' else CNN()
            model.load_state_dict(checkpoint['state_dict']);model.eval()
            df=pd.read_parquet(ROOT/'reference_vectors'/f'fold{fold}.parquet')
            raw=df[FEATURES].to_numpy(dtype=np.float64)
            mean=np.asarray(checkpoint['scaler_mean'],dtype=np.float64)
            std=np.asarray(checkpoint['scaler_scale'],dtype=np.float64)
            target=df['target_per'].to_numpy(dtype=np.float64)
            fp32=df[f'pred_{name}_fp32'].to_numpy(dtype=np.float64)
            for bits in (8,16):
                for method in ('max','p999'):
                    s=scales(cal,fold,name,bits,method)
                    pred=infer(model,name,raw,mean,std,s,bits)
                    previous=pd.read_parquet(PTQ/f'int{bits}'/method/name/f'fold{fold}_predictions.parquet')
                    fake=previous['pred_ptq'].to_numpy(dtype=np.float64)
                    if len(pred)!=len(fake) or not np.allclose(previous['target_per'],target,atol=0,rtol=0):
                        raise RuntimeError('Reference prediction mismatch')
                    dest=OUT/f'int{bits}'/method/name
                    dest.mkdir(parents=True,exist_ok=True)
                    pd.DataFrame({'fold':fold,'scenario':df['scenario'],'source_row':df['source_row'],
                                  'target_per':target,'pred_fp32':fp32,'pred_fake_ptq':fake,
                                  'pred_integer_ptq':pred}).to_parquet(dest/f'fold{fold}_predictions.parquet',index=False)
                    rmse=lambda z:float(np.sqrt(np.mean((z-target)**2)))
                    high=target>=0.9
                    rows.append(dict(model=name,fold=fold,bits=bits,method=method,samples=len(target),
                                     rmse=rmse(pred),rmse_fp32=rmse(fp32),rmse_fake=rmse(fake),
                                     delta_rmse_fp32=rmse(pred)-rmse(fp32),
                                     max_abs_diff_fake=float(np.max(np.abs(pred-fake))),
                                     mean_abs_diff_fake=float(np.mean(np.abs(pred-fake))),
                                     high_per_count=int(high.sum()),
                                     high_per_bias=float(np.mean(pred[high]-target[high])) if high.any() else np.nan))
                    print(f'{name.upper()} fold={fold} INT{bits} {method}: RMSE={rmse(pred):.6f} '
                          f'vs fake max|diff|={np.max(np.abs(pred-fake)):.6f}',flush=True)
    OUT.mkdir(parents=True,exist_ok=True)
    metrics=pd.DataFrame(rows); metrics.to_csv(OUT/'integer_ptq_metrics_all_folds.csv',index=False)
    summary=metrics.groupby(['model','bits','method'],as_index=False).agg(
        mean_rmse=('rmse','mean'),mean_delta_rmse_fp32=('delta_rmse_fp32','mean'),
        max_abs_diff_fake=('max_abs_diff_fake','max'),mean_abs_diff_fake=('mean_abs_diff_fake','mean'))
    summary.to_csv(OUT/'integer_ptq_metrics_summary.csv',index=False)
    print('\nINTEGER PTQ SUMMARY\n'+summary.to_string(index=False))
    print('\nINTEGER PTQ EVALUATION COMPLETE')

if __name__=='__main__':
    main()
