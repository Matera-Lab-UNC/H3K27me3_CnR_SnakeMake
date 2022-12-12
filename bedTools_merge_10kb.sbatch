#!/bin/bash

#BATCH --job-name=bedTools_merge_peaks
#SBATCH --output=bedTools_merge_peaks%A_%a.out
#SBATCH --time=04:00:00
#SBATCH --array=1-8
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bdmcmi@ad.unc.edu

module load bedtools

declare -a samples=(ls Peaks/Pooled*_allFrags_peaks.broadPeak)

c=${samples[$SLURM_ARRAY_TASK_ID]}
OUTFILE=$(basename ${c} _peaks.broadPeak)_merge10kb_peaks.bed

bedtools merge -i ${c} -d 10000 > mergedPeaks10kb/$OUTFILE 

