#!/bin/bash

#SBATCH --job-name=bedPE_to_Bam
#SBATCH --output=bedPE_to_Bam_%A_%a.out
#SBATCH --time=4:00:00
#SBATCH --array=1-24
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bdmcmi@ad.unc.edu

module load bedtools/2.26

i=$SLURM_ARRAY_TASK_ID
line=$(sed -n "${i}{p;}" < ./smallFrags_bed.list)

bedtools bedpetobam \
-i ${line}.bed \
-g /proj/mckaylab/genomeFiles/dm6/dm6_chromSizes.txt > \
/nas/longleaf/home/bdmcmi/work/Benjamin/H3K27me3_CutnRun/Pel_Sup_IgGcon_Analysis_20221202/Merged_DESeq2_Short_Fragment_Analysis/Bam/${line}.bam
