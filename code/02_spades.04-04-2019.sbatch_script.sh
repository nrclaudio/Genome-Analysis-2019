#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J spades-04-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load spades
# Your commands
spades.py -t 2 -1 /home/clno2215/stunning-garbanzo/data/genomics/raw_data/01_Illumina_1_clean.fq.gz -2 /home/clno2215/stunning-garbanzo/data/genomics/raw_data/02_Illumina_2_clean.fq.gz --nanopore /home/clno2215/stunning-garbanzo/data/genomics/raw_data/03_Nanopore_all.fasta.gz --careful --cov-cutoff auto -o spades_outdir.04-04-2019
