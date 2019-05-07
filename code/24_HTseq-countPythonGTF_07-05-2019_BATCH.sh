#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J HTseq-count_07-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load htseq/0.9.1
# Your commands
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/BH/bowtie2
for i in *.bam
do
echo $i
htseq-count $i /home/clno2215/stunning-garbanzo/results/genomics/prokka_annotation/PROKKA_04292019.gtf > $i.count
done
cd /home/clno2215/stunning-garbanzo/results/transcriptomics/Serum/bowtie2
for i in *.bam
do
echo $i
htseq-count $i /home/clno2215/stunning-garbanzo/results/genomics/prokka_annotation/PROKKA_04292019.gtf > $i.count
done
