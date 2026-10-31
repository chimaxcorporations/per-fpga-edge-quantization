#!/usr/bin/env python3
"""P3-M08-05: reproducible IEEE figures from frozen Project 3 evidence.
Run in repository root; output goes to a separate directory by default.
"""
import argparse
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

AGG = Path('results/p3_qat/analysis/int8/max/tables/aggregate_metrics.csv')
PAIRED = Path('results/p3_qat/analysis/int8/max/tables/paired_difference_summary.csv')
# Post-route results audited against frozen P3-M04/M05/M06 reports.
HW = pd.DataFrame([
    {'model':'mlp','method':'INT8 PTQ','label':'MLP PTQ','luts':631,'ffs':524,'dsps':4,'bram36eq':2.5,'slices':201,'cycles':25803,'clock_mhz':107.5},
    {'model':'mlp','method':'INT8 QAT','label':'MLP QAT','luts':633,'ffs':524,'dsps':4,'bram36eq':2.5,'slices':215,'cycles':25803,'clock_mhz':107.5},
    {'model':'cnn','method':'INT8 QAT','label':'CNN QAT','luts':741,'ffs':652,'dsps':4,'bram36eq':4.0,'slices':277,'cycles':62581,'clock_mhz':100.0},
])

def save(fig, path):
    fig.savefig(path.with_suffix('.pdf'), bbox_inches='tight')
    fig.savefig(path.with_suffix('.png'), dpi=300, bbox_inches='tight')
    plt.close(fig)

def main():
    p=argparse.ArgumentParser()
    p.add_argument('--out',default='p3_m08_05_figures',help='Output folder (outside frozen results recommended)')
    args=p.parse_args()
    out=Path(args.out);out.mkdir(parents=True,exist_ok=True)
    for file in [AGG, PAIRED]:
        if not file.exists(): raise SystemExit(f'Missing required input: {file}')
    agg=pd.read_csv(AGG); paired=pd.read_csv(PAIRED)
    assert len(agg)==6, f'Expected six aggregate rows; got {len(agg)}'
    assert (agg['folds']==9).all(), 'Expected nine folds in every aggregate row'
    plt.rcParams.update({'font.family':'DejaVu Sans','font.size':8,'axes.labelsize':8,'axes.titlesize':9,'legend.fontsize':7,'pdf.fonttype':42,'ps.fonttype':42})
    methods=['FP32','INT8 PTQ','INT8 QAT']; models=['mlp','cnn']
    x=np.arange(3); width=.34
    # Fig 1: separate MAE and RMSE axes, each model with fold SD.
    fig, axs=plt.subplots(1,2,figsize=(7.1,2.75),layout='constrained')
    for ax,(metric,sdmetric,title) in zip(axs,[('mean_rmse','sd_rmse','RMSE'),('mean_mae','sd_mae','MAE')]):
        for j,model in enumerate(models):
            sub=agg.set_index(['model','method'])
            means=[sub.loc[(model,m),metric] for m in methods]
            sds=[sub.loc[(model,m),sdmetric] for m in methods]
            ax.bar(x+(j-.5)*width,means,width,yerr=sds,capsize=2,label=model.upper(),alpha=.8)
        ax.set_xticks(x,methods);ax.set_ylabel(f'{title} (mean ± fold SD)');ax.set_title(title)
        ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
    axs[0].legend(frameon=False)
    save(fig,out/'fig1_nine_fold_accuracy')
    # Fig 2: two separate error metrics, QAT minus comparator; source CIs are descriptive.
    fig,axs=plt.subplots(1,2,figsize=(7.1,3.0),layout='constrained')
    for ax,metric in zip(axs,['rmse','mae']):
        rows=paired[paired.metric==metric].copy()
        labels=[]; centers=[]; left=[]; right=[]
        for model in models:
            for comp in ['QAT - FP32','QAT - INT8 PTQ']:
                row=rows[(rows.model==model)&(rows.comparison==comp)]
                if len(row)!=1: raise ValueError(f'Missing/duplicate {model}, {metric}, {comp}')
                r=row.iloc[0]; labels.append(f'{model.upper()}: {comp}')
                centers.append(r.mean_delta);left.append(r.mean_delta-r.descriptive_t95_low)
                right.append(r.descriptive_t95_high-r.mean_delta)
        y=np.arange(len(labels));ax.errorbar(centers,y,xerr=[left,right],fmt='o',capsize=3)
        ax.axvline(0,color='black',linewidth=.8,linestyle='--')
        ax.set_yticks(y,labels);ax.invert_yaxis();ax.set_xlabel('Paired difference (QAT − comparator)')
        ax.set_title(metric.upper());ax.grid(axis='x',alpha=.2)
    save(fig,out/'fig2_paired_quantization_differences')
    # Fig 3: resource types have separate panels to avoid false comparisons of units.
    fig,axs=plt.subplots(1,5,figsize=(7.1,2.3),layout='constrained')
    for ax,(col,title) in zip(axs,[('luts','LUTs'),('ffs','Registers'),('dsps','DSP48E1'),('bram36eq','BRAM36 eq.'),('slices','Slices')]):
        ax.bar(np.arange(3),HW[col],alpha=.85)
        ax.set_xticks(range(3),['MLP\nPTQ','MLP\nQAT','CNN\nQAT'])
        ax.set_title(title);ax.set_ylim(bottom=0);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
    save(fig,out/'fig3_postroute_resources')
    # Fig 4: mean 9-fold software RMSE vs Fold 1 simulated cycles at target clock.
    fig,ax=plt.subplots(figsize=(3.55,2.75),layout='constrained')
    sub=agg.set_index(['model','method'])
    for _,r in HW.iterrows():
        latency=r.cycles/r.clock_mhz  # cycles / MHz = microseconds
        rmse=sub.loc[(r.model,r.method),'mean_rmse']
        ax.scatter(latency,rmse,s=55)
        ax.annotate(r.label,(latency,rmse),xytext=(5,5),textcoords='offset points',fontsize=7)
    ax.set_xlabel('Nominal inference latency (µs; Fold 1 hardware)')
    ax.set_ylabel('Mean RMSE (nine software folds)')
    ax.grid(alpha=.25)
    ax.set_xlim(180,740)
    save(fig,out/'fig4_accuracy_latency_tradeoff')
    # Traceable metadata and caveats alongside plots.
    HW.assign(latency_us=HW.cycles/HW.clock_mhz).to_csv(out/'hardware_values_used.csv',index=False)
    (out/'README.txt').write_text(
        'P3-M08-05 publication figure inputs\n'
        f'Accuracy: {AGG}\nPaired comparisons: {PAIRED}\n'
        'Hardware: post-route reports audited in P3-M08-04, Fold 1 only.\n'
        'MLP PTQ: results/p3_m04/mlp_fold1_pipelined_v2_timing/T6_107p5MHz/\n'
        'MLP QAT: results/p3_m05/qat_hardware/mlp_pipelined_v2_timing/T1_107p5MHz/\n'
        'CNN QAT: results/p3_m06/synthesis/cnn_v3_artix7_ooc/reports/p3_m06_05/\n'
        'Fig 1 error bars: standard deviation across nine folds (not confidence intervals).\n'
        'Fig 2 intervals: descriptive, unadjusted paired-t 95% intervals.\n'
        'Fig 4 mixes nine-fold software accuracy and Fold 1 routed implementation latency; '
        'clock rates differ (MLP 107.5 MHz, CNN 100 MHz).\n'
        'Post-route timing excludes complete external I/O timing constraints.\n'
        'No physical FPGA measurements; CNN SDF timing simulation unresolved.\n'
    )
    print(f'Generated four PDF/PNG figure pairs in {out.resolve()}')

if __name__=='__main__':main()
