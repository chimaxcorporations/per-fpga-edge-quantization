"""P3-M03-07: Reproducible reference-vector QAT/PTQ/FP32 analysis.

Run: python -m scripts.analyze_qat_results --input-dir results/p3_qat/evaluation/int8/max

The analysis is descriptive: cross-validation folds have overlapping training data,
and reference vectors are not necessarily representative of full held-out scenarios.
"""
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from scipy.stats import binomtest, t

METHODS = {'FP32': 'pred_fp32', 'INT8 PTQ': 'pred_integer_ptq', 'INT8 QAT': 'pred_integer_qat'}
MODELS = ('mlp', 'cnn')
FOLDS = range(1, 10)
SCENARIO_RE = re.compile(r'(?:^|_)d(?P<density>\d+)_r(?P<rate>\d+)_(?P<channel>log_distance_nakagami|log_distance|urban)(?:_|$)')


def scores(y, p):
    y, p = np.asarray(y, dtype=np.float64), np.asarray(p, dtype=np.float64)
    err = p - y
    sst = np.sum((y - np.mean(y)) ** 2)
    return {'n': len(y), 'mae': float(np.mean(np.abs(err))),
            'rmse': float(np.sqrt(np.mean(err ** 2))),
            'bias': float(np.mean(err)),
            'r2': float(1 - np.sum(err ** 2) / sst) if sst > 0 else np.nan}


def scenario_attributes(s):
    m = SCENARIO_RE.search(str(s))
    if m is None:
        return {'density': 'unknown', 'cam_hz': 'unknown', 'channel': 'unknown'}
    return {'density': m['density'], 'cam_hz': m['rate'], 'channel': m['channel']}


def write_table(df, path, float_format='%.6f'):
    path.parent.mkdir(parents=True, exist_ok=True)
    df.to_csv(path.with_suffix('.csv'), index=False, float_format=float_format)
    try:
        path.with_suffix('.tex').write_text(
            df.to_latex(index=False, escape=True, na_rep='--', float_format=lambda x: float_format % x),
            encoding='utf-8')
    except Exception as exc:
        raise RuntimeError(f'LaTeX export failed for {path}: {exc}') from exc


def save_figure(fig, stem):
    fig.savefig(stem.with_suffix('.pdf'), bbox_inches='tight')
    fig.savefig(stem.with_suffix('.png'), dpi=300, bbox_inches='tight')
    plt.close(fig)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input-dir', type=Path, default=Path('results/p3_qat/evaluation/int8/max'))
    parser.add_argument('--output-dir', type=Path, default=Path('results/p3_qat/analysis/int8/max'))
    parser.add_argument('--expected-samples', type=int, default=1000,
                        help='Expected reference-vector rows per fold; use 0 to disable')
    args = parser.parse_args()
    out = args.output_dir
    (out / 'tables').mkdir(parents=True, exist_ok=True)
    (out / 'figures').mkdir(parents=True, exist_ok=True)
    fold_rows, group_rows, coverage_rows = [], [], []
    all_data = []
    warnings = []

    for model in MODELS:
        for fold in FOLDS:
            path = args.input_dir / model / f'fold{fold}_predictions.parquet'
            if not path.is_file():
                raise FileNotFoundError(f'Missing predictions: {path}')
            df = pd.read_parquet(path)
            required = ['target_per', 'scenario', 'source_row', *METHODS.values()]
            missing = sorted(set(required) - set(df.columns))
            if missing:
                raise ValueError(f'{path}: missing columns {missing}')
            if 'fold' in df and not (df['fold'] == fold).all():
                raise ValueError(f'{path}: fold identifier mismatch')
            if df.empty:
                raise ValueError(f'{path}: empty prediction file')
            if args.expected_samples and len(df) != args.expected_samples:
                raise ValueError(f'{path}: {len(df)} rows, expected {args.expected_samples}')
            if df[required].isna().any().any():
                raise ValueError(f'{path}: null entries in required columns')
            for col in ['target_per', *METHODS.values()]:
                if not np.isfinite(df[col].to_numpy(dtype=float)).all():
                    raise ValueError(f'{path}: nonfinite values in {col}')
            if not df['target_per'].between(0, 1).all():
                raise ValueError(f'{path}: target PER outside [0,1]')
            if df.duplicated(['scenario', 'source_row']).any():
                raise ValueError(f'{path}: duplicate (scenario, source_row) keys')
            for method, col in METHODS.items():
                if not df[col].between(-1e-6, 1 + 1e-6).all():
                    warnings.append(f'{model} fold {fold} {method}: predictions outside [0,1]')
            df = df.copy()
            df['model'], df['fold'] = model, fold
            parsed = df['scenario'].map(scenario_attributes).apply(pd.Series)
            for col in parsed.columns:
                df[col] = parsed[col].to_numpy()
            if (df['channel'] == 'unknown').any():
                warnings.append(f'{model} fold {fold}: unparsed scenario identifiers')
            coverage_rows.append({'model': model, 'fold': fold, 'n': len(df),
                                  'scenarios': df['scenario'].nunique(),
                                  'unknown_scenario_rows': int((df['channel'] == 'unknown').sum())})
            for method, col in METHODS.items():
                fold_rows.append({'model': model, 'fold': fold, 'method': method,
                                  **scores(df['target_per'], df[col])})
                for dimension in ['scenario', 'density', 'cam_hz', 'channel']:
                    for value, sub in df.groupby(dimension, sort=True):
                        group_rows.append({'model': model, 'fold': fold, 'method': method,
                                           'dimension': dimension, 'group': str(value),
                                           **scores(sub['target_per'], sub[col])})
            all_data.append(df)

    fold_df = pd.DataFrame(fold_rows)
    group_df = pd.DataFrame(group_rows)
    coverage_df = pd.DataFrame(coverage_rows)
    write_table(fold_df, out / 'tables/fold_metrics')
    write_table(group_df, out / 'tables/scenario_stratified_metrics')
    write_table(coverage_df, out / 'tables/reference_coverage')

    # Verify identical held-out reference observations across architectures.
    for fold in FOLDS:
        a = all_data[fold - 1].sort_values(['scenario', 'source_row']).reset_index(drop=True)
        b = all_data[9 + fold - 1].sort_values(['scenario', 'source_row']).reset_index(drop=True)
        if not a[['scenario', 'source_row']].equals(b[['scenario', 'source_row']]):
            raise ValueError(f'Fold {fold}: MLP/CNN reference keys do not align')
        if not np.array_equal(a['target_per'].to_numpy(), b['target_per'].to_numpy()):
            raise ValueError(f'Fold {fold}: MLP/CNN targets differ')

    agg = (fold_df.groupby(['model', 'method'], sort=False)
           .agg(folds=('fold', 'nunique'), n_per_fold=('n', 'mean'),
                mean_mae=('mae', 'mean'), sd_mae=('mae', 'std'),
                mean_rmse=('rmse', 'mean'), sd_rmse=('rmse', 'std'),
                mean_bias=('bias', 'mean'), sd_bias=('bias', 'std'),
                mean_r2=('r2', 'mean'), sd_r2=('r2', 'std'))
           .reset_index())
    write_table(agg, out / 'tables/aggregate_metrics')

    pairs = []
    summary = []
    for model in MODELS:
        sub = fold_df[fold_df.model == model]
        for metric in ['rmse', 'mae', 'bias']:
            pivot = sub.pivot(index='fold', columns='method', values=metric).sort_index()
            for baseline in ['INT8 PTQ', 'FP32']:
                delta = (pivot['INT8 QAT'] - pivot[baseline]).to_numpy(dtype=float)
                for fold, val in zip(pivot.index, delta):
                    pairs.append({'model': model, 'fold': int(fold), 'metric': metric,
                                  'comparison': f'QAT - {baseline}', 'delta': val})
                n = len(delta)
                mean = float(np.mean(delta))
                sd = float(np.std(delta, ddof=1))
                halfwidth = float(t.ppf(0.975, n - 1) * sd / np.sqrt(n))
                wins = int(np.sum(delta < 0))
                losses = int(np.sum(delta > 0))
                ties = int(np.sum(delta == 0))
                p_sign = float(binomtest(min(wins, losses), wins + losses, 0.5).pvalue) if wins + losses else np.nan
                summary.append({'model': model, 'metric': metric,
                                'comparison': f'QAT - {baseline}', 'folds': n,
                                'mean_delta': mean, 'sd_delta': sd,
                                'descriptive_t95_low': mean - halfwidth,
                                'descriptive_t95_high': mean + halfwidth,
                                'negative_delta_folds': wins,
                                'positive_delta_folds': losses,
                                'zero_delta_folds': ties,
                                'descriptive_sign_p_two_sided': p_sign})
    pair_df = pd.DataFrame(pairs)
    summary_df = pd.DataFrame(summary)
    write_table(pair_df, out / 'tables/paired_fold_differences')
    write_table(summary_df, out / 'tables/paired_difference_summary')

    # Scenario-pooled metrics within each architecture. Each scenario is held out
    # in one fold in the standard 9-fold/27-scenario design; do not assume otherwise.
    pooled_rows = []
    for model in MODELS:
        combined = pd.concat([x for x in all_data if x['model'].iat[0] == model], ignore_index=True)
        for dimension in ['scenario', 'density', 'cam_hz', 'channel']:
            for value, sub in combined.groupby(dimension, sort=True):
                for method, col in METHODS.items():
                    pooled_rows.append({'model': model, 'dimension': dimension,
                                        'group': str(value), 'method': method,
                                        'folds_represented': int(sub.fold.nunique()),
                                        **scores(sub.target_per, sub[col])})
    pooled = pd.DataFrame(pooled_rows)
    write_table(pooled, out / 'tables/pooled_stratum_metrics')

    # Figure 1: fold-level RMSE (one figure per model).
    for model in MODELS:
        sub = fold_df[fold_df.model == model]
        fig, ax = plt.subplots(figsize=(8.2, 4.5))
        for method in METHODS:
            d = sub[sub.method == method].sort_values('fold')
            ax.plot(d.fold, d.rmse, marker='o', linewidth=1.6, label=method)
        ax.set(xlabel='Held-out fold', ylabel='RMSE (PER)',
               title=f'{model.upper()}: held-out reference-vector RMSE')
        ax.set_xticks(list(FOLDS))
        ax.grid(alpha=0.25)
        ax.legend()
        save_figure(fig, out / f'figures/{model}_fold_rmse')

        # Figure 2: paired RMSE changes.
        subpair = pair_df[(pair_df.model == model) & (pair_df.metric == 'rmse') &
                          (pair_df.comparison == 'QAT - INT8 PTQ')].sort_values('fold')
        fig, ax = plt.subplots(figsize=(8.2, 4.2))
        ax.bar(subpair.fold.astype(str), subpair.delta)
        ax.axhline(0, linewidth=1, color='black')
        ax.set(xlabel='Held-out fold', ylabel='RMSE difference (QAT − PTQ)',
               title=f'{model.upper()}: paired INT8 QAT − PTQ RMSE')
        ax.grid(axis='y', alpha=0.25)
        save_figure(fig, out / f'figures/{model}_paired_rmse_delta')

        # Figure 3: propagation-channel RMSE (pooled reference vectors).
        d = pooled[(pooled.model == model) & (pooled.dimension == 'channel') &
                   (pooled.group != 'unknown')]
        channels = sorted(d.group.unique())
        x = np.arange(len(channels))
        fig, ax = plt.subplots(figsize=(9, 4.6))
        width = 0.25
        for j, method in enumerate(METHODS):
            series = d[d.method == method].set_index('group').reindex(channels)
            ax.bar(x + (j - 1) * width, series.rmse, width, label=method)
        ax.set_xticks(x, channels, rotation=15, ha='right')
        ax.set(ylabel='Pooled RMSE (PER)', title=f'{model.upper()}: channel-stratified RMSE')
        ax.legend()
        ax.grid(axis='y', alpha=0.25)
        save_figure(fig, out / f'figures/{model}_channel_rmse')

    manifest = {'models': list(MODELS), 'folds_per_model': 9,
                'method_columns': METHODS, 'reference_rows_total': int(coverage_df.n.sum()),
                'reference_rows_per_model': coverage_df.groupby('model').n.sum().to_dict(),
                'notes': [
                    'All results use held-out reference vectors, not necessarily full held-out datasets.',
                    'Mean fold RMSE is not pooled RMSE.',
                    'Student-t intervals and sign tests are descriptive: folds are not independent replications.',
                    'Stratum-level pooled metrics describe only the sampled reference observations.',
                    'Bias is signed: negative bias is not necessarily an improvement.',
                ], 'warnings': warnings}
    (out / 'analysis_manifest.json').write_text(json.dumps(manifest, indent=2), encoding='utf-8')
    print('\nP3-M03-07 ANALYSIS COMPLETE')
    print(f'Output: {out}')
    print('\nAggregate accuracy:')
    print(agg[['model', 'method', 'mean_mae', 'mean_rmse', 'sd_rmse']].to_string(index=False))
    print('\nPaired RMSE comparison:')
    print(summary_df[summary_df.metric == 'rmse'][
        ['model', 'comparison', 'mean_delta', 'descriptive_t95_low',
         'descriptive_t95_high', 'negative_delta_folds']].to_string(index=False))
    if warnings:
        print('\nWARNINGS:')
        for w in warnings:
            print(' -', w)


if __name__ == '__main__':
    main()

