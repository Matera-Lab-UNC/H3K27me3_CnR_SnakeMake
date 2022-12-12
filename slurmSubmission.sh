if [ ! -d slurmOut/ ];
then
				mkdir slurmOut
fi

snakemake --use-envmodules --snakefile Snakefile -k --cluster-config slurmConfig.json -R all --latency-wait 200 --cluster "sbatch -J {rule} -o slurmOut/slurm-%j.out -e slurmOut/slurm-%j.err -N1 -n {cluster.threads} --time {cluster.time} --mem={cluster.mem}" --jobs 500
