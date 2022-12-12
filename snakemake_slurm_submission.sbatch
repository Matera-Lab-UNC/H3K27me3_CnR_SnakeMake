#!/bin/bash

#SBATCH --job-name=SnakeMake_CUTnRUN
#SBATCH --output=SnakeMake_CUTnRUN_%A.out
#SBATCH --time=08:00:00
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=bdmcmi@ad.unc.edu

module load python/3.5.1

bash slurmSubmission.sh
