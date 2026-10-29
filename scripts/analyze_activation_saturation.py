"""P3-M03-08B: INT8 QAT activation saturation on frozen held-out vectors.

Read-only analysis: no checkpoint or calibration modifications.
Captures each FakeQuantActivation input using forward pre-hooks.
"""
import argparse
import json
from collections import defaultdict
from pathlib import Path

import numpy as np
import pandas as pd
import torch

from scripts.verify_trained_qat import load_checkpoint, create_models
from scripts.run_integer_ptq import CAL, ROOT, FEATURES, scales

LAYERS = {
    'mlp': ('quant_input', 'quant_hidden1', 'quant_hidden2', 'quant_output'),
    'cnn': ('quant_input', 'quant_conv1', 'quant_conv2', 'quant_hidden', 'quant_output'),
}
QMAX = 127


def new_stats():
    return dict(elements=0, clipped_positive=0, clipped_negative=0,
                rail_positive=0, rail_negative=0, clipped_excess_lsb_sum=0.0,
                clipped_excess_lsb_max=0.0, nonfinite=0)


def update_stats(stat, values, scale):
    v = np.asarray(values, dtype=np.float64).reshape(-1)
    stat['elements'] += len(v)
    finite = np.isfinite(v)
    stat['nonfinite'] += int((~finite).sum())
    if not finite.all():
        return
    normalized = v / float(scale)
    pos = normalized > QMAX
    neg = normalized < -QMAX
    codes = np.clip(np.rint(normalized), -QMAX, QMAX)
    stat['clipped_positive'] += int(pos.sum())
    stat['clipped_negative'] += int(neg.sum())
    stat['rail_positive'] += int((codes == QMAX).sum())
    stat['rail_negative'] += int((codes == -QMAX).sum())
    excess = np.maximum(np.abs(normalized) - QMAX, 0)
    stat['clipped_excess_lsb_sum'] += float(excess.sum())
    stat['clipped_excess_lsb_max'] = max(stat['clipped_excess_lsb_max'], float(excess.max(initial=0)))


def finalize(key, stat, scale):
    n = stat['elements']
    clipped = stat['clipped_positive'] + stat['clipped_negative']
    rail = stat['rail_positive'] + stat['rail_negative']
    return dict(**key, activation_scale=scale, **stat,
                clipped_total=clipped, clipped_pct=100 * clipped / n if n else np.nan,
                rail_total=rail, rail_pct=100 * rail / n if n else np.nan,
                clipped_excess_lsb_mean_all=stat['clipped_excess_lsb_sum'] / n if n else np.nan,
                clipped_excess_lsb_mean_clipped=stat['clipped_excess_lsb_sum'] / clipped if clipped else 0.0)


def run_fold(model_name, fold, calibration, batch_size):
    ckpt, path = load_checkpoint(model_name, fold)
    if ckpt['model'] != model_name or int(ckpt['fold']) != fold:
        raise RuntimeError('Checkpoint model/fold mismatch')
    if list(ckpt['features']) != FEATURES:
        raise RuntimeError('Checkpoint feature ordering mismatch')
    meta = ckpt.get('quantization', {})
    if meta.get('bits') != 8 or meta.get('calibration') != 'max':
        raise RuntimeError('Expected INT8/max QAT checkpoint')
    activation_scales = scales(calibration, fold, model_name, 8, 'max')
    qat, _ = create_models(model_name, ckpt, activation_scales)
    qat.eval()
    labels = LAYERS[model_name]
    layer_scales = {label: float(getattr(qat, label).scale.item()) for label in labels}
    ref_path = ROOT / 'reference_vectors' / f'fold{fold}.parquet'
    ref = pd.read_parquet(ref_path)
    if len(ref) == 0:
        raise RuntimeError(f'Empty reference vectors: {ref_path}')
    raw = ref[FEATURES].to_numpy(dtype=np.float64)
    mean = np.asarray(ckpt['scaler_mean'], dtype=np.float64)
    std = np.asarray(ckpt['scaler_scale'], dtype=np.float64)
    if not (np.isfinite(raw).all() and np.isfinite(mean).all() and np.isfinite(std).all() and (std > 0).all()):
        raise RuntimeError('Invalid features or scaler')
    x = ((raw - mean) / std).astype(np.float32)
    scenario = ref['scenario'].astype(str).to_numpy() if 'scenario' in ref else np.full(len(ref), 'unknown')
    overall = defaultdict(new_stats)
    by_scenario = defaultdict(new_stats)
    sample_rows = []
    captured = {}
    handles = []

    def hook_factory(label):
        def hook(_module, inputs):
            captured[label] = inputs[0].detach().cpu().numpy().copy()
        return hook

    for label in labels:
        handles.append(getattr(qat, label).register_forward_pre_hook(hook_factory(label)))
    try:
        with torch.no_grad():
            for start in range(0, len(x), batch_size):
                stop = min(start + batch_size, len(x))
                captured.clear()
                _ = qat(torch.from_numpy(x[start:stop]))
                if set(captured) != set(labels):
                    raise RuntimeError(f'Hook mismatch: {set(captured)} vs {set(labels)}')
                for label in labels:
                    scale = layer_scales[label]
                    arr = captured[label]
                    if arr.shape[0] != stop - start:
                        raise RuntimeError('Batch shape mismatch')
                    update_stats(overall[label], arr, scale)
                    for j in range(len(arr)):
                        scen = scenario[start + j]
                        update_stats(by_scenario[(label, scen)], arr[j], scale)
                        z = np.asarray(arr[j], dtype=np.float64).reshape(-1) / scale
                        if not np.isfinite(z).all():
                            raise RuntimeError('Nonfinite activation encountered')
                        clipped = int((np.abs(z) > QMAX).sum())
                        sample_rows.append(dict(model=model_name, fold=fold, layer=label,
                                                scenario=scen,
                                                source_row=int(ref.iloc[start + j]['source_row']) if 'source_row' in ref else start + j,
                                                elements=len(z), clipped_elements=clipped,
                                                any_clipping=int(clipped > 0)))
    finally:
        for h in handles:
            h.remove()

    rows = [finalize(dict(model=model_name, fold=fold, layer=label), overall[label], layer_scales[label]) for label in labels]
    scen_rows = [finalize(dict(model=model_name, fold=fold, layer=label, scenario=scen), stats, layer_scales[label])
                 for (label, scen), stats in sorted(by_scenario.items())]
    print(f'{model_name.upper()} fold {fold}: {len(ref)} observations; ' +
          ', '.join(f'{r["layer"]}={r["clipped_pct"]:.4f}%' for r in rows), flush=True)
    return rows, scen_rows, sample_rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--model', choices=('mlp', 'cnn', 'both'), default='both')
    parser.add_argument('--fold', type=int, choices=range(1, 10), help='One fold; default all nine')
    parser.add_argument('--batch-size', type=int, default=128)
    parser.add_argument('--output-dir', type=Path, default=Path('results/p3_qat/verification/activation_saturation'))
    args = parser.parse_args()
    if args.batch_size <= 0:
        parser.error('--batch-size must be positive')
    torch.set_num_threads(1)
    calibration = pd.read_csv(CAL)
    models = ('mlp', 'cnn') if args.model == 'both' else (args.model,)
    folds = (args.fold,) if args.fold else range(1, 10)
    all_rows, all_scenarios, all_samples = [], [], []
    for name in models:
        for fold in folds:
            rows, scenarios, samples = run_fold(name, fold, calibration, args.batch_size)
            all_rows.extend(rows)
            all_scenarios.extend(scenarios)
            all_samples.extend(samples)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    pd.DataFrame(all_rows).to_csv(args.output_dir / 'saturation_by_fold_layer.csv', index=False)
    pd.DataFrame(all_scenarios).to_csv(args.output_dir / 'saturation_by_fold_layer_scenario.csv', index=False)
    pd.DataFrame(all_samples).to_parquet(args.output_dir / 'saturation_by_observation.parquet', index=False)
    df = pd.DataFrame(all_rows)
    aggregated = []
    for (model, layer), group in df.groupby(['model', 'layer'], sort=False):
        elements = int(group['elements'].sum())
        clipped = int(group['clipped_total'].sum())
        rails = int(group['rail_total'].sum())
        aggregated.append(dict(model=model, layer=layer, elements=elements,
                               clipped_positive=int(group['clipped_positive'].sum()),
                               clipped_negative=int(group['clipped_negative'].sum()),
                               clipped_total=clipped, clipped_pct=100 * clipped / elements,
                               rail_total=rails, rail_pct=100 * rails / elements,
                               max_fold_clipped_pct=float(group['clipped_pct'].max())))
    summary = pd.DataFrame(aggregated)
    summary.to_csv(args.output_dir / 'saturation_summary.csv', index=False)
    metadata = dict(models=list(models), folds=list(folds), bits=8, calibration='max',
                    scope='QAT fake-quantizer inputs on frozen held-out reference vectors',
                    clipping_rule='abs(prequant_activation/scale)>127',
                    rail_rule='abs(round_even(prequant_activation/scale) clipped to [-127,127])==127',
                    checkpoint_changes=False)
    (args.output_dir / 'run_metadata.json').write_text(json.dumps(metadata, indent=2))
    print('\nAGGREGATE SATURATION\n' + summary.to_string(index=False))
    print('\nSaved results to:', args.output_dir)


if __name__ == '__main__':
    main()

