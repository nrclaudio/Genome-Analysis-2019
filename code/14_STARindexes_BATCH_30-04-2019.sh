#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J STAR_30-04-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load star
# Your commands

STAR --runThreadN 4 \
--runMode genomeGenerate \
--genomeDir /home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/STAR_indexes \
--genomeFastaFiles /home/clno2215/stunning-garbanzo/results/genomics/pilon_assembly/Pilon_assembly_05-04-2019.fasta \
--sjdbGTFfile /home/clno2215/stunning-garbanzo/results/genomics/prokka_annotation/PROKKA_04292019.gtf \
--sjdbOverhang 99



