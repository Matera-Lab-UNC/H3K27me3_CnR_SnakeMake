#!/bin/bash

#SBATCH --job-name=samtools_index
#SBATCH --output=samtools_index_%A_%a.out
#SBATCH --time=4:00:00
#SBATCH --array=1-24
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bdmcmi@ad.unc.edu

module load samtools

i=$SLURM_ARRAY_TASK_ID
line=$(sed -n "${i}{p;}" < ./shortFrag_sortedBam.list)

samtools index ${line}.bam
