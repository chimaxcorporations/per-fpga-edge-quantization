#!/usr/bin/env python3
"""Evaluate frozen Project-2 Ridge/HistGB checkpoints on exact Project-3 reference rows.
Read-only inputs; writes new output directory. No retraining or synthesis.
"""
import argparse
import hashlib
import json
from pathlib import Path
import numpy as np
import pandas as pd
import pyarrow.parquet as pq
import joblib

FEATURES = [f'{stem}_lag{i}' for i in range(10) for stem in ('per_t', 'dist_m', 'v_src_mps', 'v_dst_mps')]
KEY = ['fold', 'scenario', 'source_row']

def sha256(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def metrics(y, p):
    err = p - y
    sst = np.sum((y - y.mean()) ** 2)
    return {'n': len(y), 'mae': float(np.mean(np.abs(err))),
            'rmse': float(np.sqrt(np.mean(err ** 2))),
            'bias': float(np.mean(err)),
            'r2': float(1 - np.sum(err ** 2) / sst) if sst > 0 else float('nan')}

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--p3-root', type=Path, default=Path('/workspace/p3'))
    ap.add_argument('--p2-root', type=Path, default=Path('/workspace/p2'))
    ap.add_argument('--output', type=Path, default=Path('/workspace/p3/results/p3_m08_05a'))
    args = ap.parse_args()
    refroot = args.p3_root / 'results/p3_qat/evaluation/int8/max'
    srcroot = args.p2_root / 'data/temporal_h10'
    ckptroot = args.p3_root / 'artifacts/p3_m01/reference_models'
    out = args.output
    out.mkdir(parents=True, exist_ok=True)
    records, folds, audit = [], [], {'status': 'PASS', 'folds': {}, 'source_files': {}, 'checkpoints': {}}
    try:
        for fold in range(1, 10):
            paths = {m: refroot / m / f'fold{fold}_predictions.parquet' for m in ('mlp', 'cnn')}
            refs = {m: pd.read_parquet(path) for m, path in paths.items()}
            for m, df in refs.items():
                assert len(df) == 1000, (fold, m, len(df))
                assert not df.duplicated(KEY).any(), (fold, m, 'duplicate keys')
                assert (df.fold == fold).all(), (fold, m, 'incorrect fold')
                assert df.source_row.notna().all(), (fold, m, 'missing row identifiers')
            a = refs['mlp'].sort_values(KEY).reset_index(drop=True)
            b = refs['cnn'].sort_values(KEY).reset_index(drop=True)
            assert a[KEY].equals(b[KEY]), (fold, 'MLP/CNN sample keys differ')
            assert np.allclose(a.target_per, b.target_per, atol=1e-12, rtol=0), (fold, 'MLP/CNN targets differ')
            assert np.isfinite(a.target_per).all(), (fold, 'invalid targets')
            recovered = []
            for scenario, part in a.groupby('scenario', sort=False):
                assert Path(scenario).name == scenario, 'Unsafe scenario path'
                src = srcroot / scenario
                assert src.is_file(), f'Missing temporal scenario: {src}'
                pf = pq.ParquetFile(src)
                missing = set(FEATURES + ['target_per']) - set(pf.schema_arrow.names)
                assert not missing, (src, sorted(missing))
                indices = part.source_row.to_numpy(dtype=np.int64)
                assert np.array_equal(indices, part.source_row.to_numpy()), (fold, scenario, 'noninteger source_row')
                assert indices.min() >= 0 and indices.max() < pf.metadata.num_rows, (fold, scenario, 'out of bounds')
                # Read only selected columns; Parquet source-row offsets are positional.
                frame = pd.read_parquet(src, columns=FEATURES + ['target_per'])
                selected = frame.iloc[indices].copy()
                selected.index = part.index
                assert np.allclose(selected.target_per.to_numpy(), part.target_per.to_numpy(), atol=1e-12, rtol=0), (fold, scenario, 'TARGET MISMATCH: stop; source row alignment unverified')
                recovered.append(selected[FEATURES])
                audit['source_files'][str(src)] = {'sha256': sha256(src), 'rows': pf.metadata.num_rows}
            X = pd.concat(recovered).loc[a.index, FEATURES]
            assert X.shape == (1000, 40) and np.isfinite(X.to_numpy(dtype=np.float64)).all(), (fold, 'invalid features')
            y = a.target_per.to_numpy(dtype=np.float64)
            fold_info = {'n': len(a), 'scenarios': a.scenario.value_counts().to_dict(), 'target_match': True, 'mlp_cnn_keys_match': True}
            for model, ckptdir, filename in [('ridge', 'ridge', f'ridge_fold{fold}.joblib'), ('hist_gb', 'histgb', f'hist_gb_fold{fold}.joblib')]:
                ckpt = ckptroot / ckptdir / filename
                assert ckpt.is_file(), f'Missing checkpoint {ckpt}'
                estimator = joblib.load(ckpt)  # trusted local research checkpoints only
                assert getattr(estimator, 'n_features_in_', 40) == 40, (model, fold, 'feature count mismatch')
                if hasattr(estimator, 'feature_names_in_'):
                    assert list(estimator.feature_names_in_) == FEATURES, (model, fold, 'feature order mismatch')
                # Project-2 classical inference used raw features and [0,1] clipping.
                pred = np.clip(estimator.predict(X.to_numpy(dtype=np.float64)), 0, 1)
                assert np.isfinite(pred).all(), (model, fold, 'nonfinite predictions')
                audit['checkpoints'][str(ckpt)] = sha256(ckpt)
                folds.append({'model': model, 'method': 'FP32 reference', 'fold': fold, **metrics(y, pred)})
                records.append(a[KEY + ['target_per']].assign(model=model, method='FP32 reference', prediction=pred))
            audit['folds'][str(fold)] = fold_info
            print(f'Fold {fold}: verified 1000 samples; Ridge and HistGB evaluated', flush=True)
        pred_df = pd.concat(records, ignore_index=True)
        fold_df = pd.DataFrame(folds)
        summary = fold_df.groupby(['model', 'method']).agg(mean_mae=('mae','mean'), sd_mae=('mae','std'), mean_rmse=('rmse','mean'), sd_rmse=('rmse','std'), mean_r2=('r2','mean'), sd_r2=('r2','std')).reset_index()
        # Write only after all nine folds and source targets have passed verification.
        pred_df.to_parquet(out / 'classical_reference_predictions.parquet', index=False)
        fold_df.to_csv(out / 'classical_fold_metrics.csv', index=False)
        summary.to_csv(out / 'classical_aggregate_metrics.csv', index=False)
        with open(out / 'reference_alignment_audit.json', 'w') as f:
            json.dump(audit, f, indent=2)
        print('\nSUCCESS — outputs:', out)
        print(summary.to_string(index=False))
    except Exception as exc:
        audit['status'] = 'FAIL'
        audit['error'] = repr(exc)
        with open(out / 'reference_alignment_audit.json', 'w') as f:
            json.dump(audit, f, indent=2)
        raise

if __name__ == '__main__':
    main()
