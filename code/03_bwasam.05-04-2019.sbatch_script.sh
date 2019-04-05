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
# Your commands
bwa index /home/clno2215/canu_outdir.04-04-2019/canu.04-04-2019.contigs.fasta
cd /home/clno2215/bwa_outdir.05-04-2019
bwa mem -M -p bwa -t 2 /home/clno2215/canu_outdir.04-04-2019/canu.04-04-2019.contigs.fasta /home/clno2215/stunning-garbanzo/data/genomics/raw_data/01_Illumina_1_clean_fastqc.gz /home/clno2215/stunning-garbanzo/data/genomics/raw_data/02_Illumina_2_clean_fastqc.gz | samtools sort > aln.05-04-2019.bam 
