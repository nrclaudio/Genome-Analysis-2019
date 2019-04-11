#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J spades-11-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load prokka
# Your commands
prokka /home/clno2215/stunning-garbanzo/results/genomics/pilon_assembly/Pilon_assembly_05-04-2019.fasta --outdir /home/clno2215/stunning-garbanzo/results/genomics/prokka_annotation/
