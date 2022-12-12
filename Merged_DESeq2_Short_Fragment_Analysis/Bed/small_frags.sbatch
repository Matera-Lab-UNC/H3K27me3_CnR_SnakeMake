#!/bin/bash

#SBATCH --job-name=bedFile_smallFrag
#SBATCH --output=bedFile_smallFrag_%A_%a.out
#SBATCH --time=4:00:00
#SBATCH --array=1-24
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bdmcmi@ad.unc.edu

i=$SLURM_ARRAY_TASK_ID
line=$(sed -n "${i}{p;}" < ./fragLength_bed.list)

awk -v OFS='\t' '($11>20) && ($11<120) {{print $0}}' ${line}.bed | cut -f 1,2,3,4,5,6,7,8,9,10 > ${line}_smallFrags.bed
