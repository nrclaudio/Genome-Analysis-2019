#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J bwa-05-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bwa
module load samtools/1.9
module load pilon
# Your commands
pilon --genome /home/clno2215/canu_outdir.04-04-2019/canu.04-04-2019.contigs.fasta --bam /home/clno2215/bwa_outdir.05-05.2019/aln.sorted.05-04-2019.bam  --output pilon_outdir.bam.05-04-2019 --fix all --threads 2 --changes --verbose

