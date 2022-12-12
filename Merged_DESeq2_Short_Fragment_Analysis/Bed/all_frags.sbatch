#!/bin/bash

#SBATCH --job-name=bedFile_fragLength
#SBATCH --output=bedFile_fragLength_%A_%a.out
#SBATCH --time=4:00:00
#SBATCH --array=1-24
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bdmcmi@ad.unc.edu

i=$SLURM_ARRAY_TASK_ID
line=$(sed -n "${i}{p;}" < ./allFrags_bed.list)

awk -F '\t' 'BEGIN {OFS=FS} {{print $0, ($6-$2)}}' ${line}.bed > ${line}_fragLength.bed
