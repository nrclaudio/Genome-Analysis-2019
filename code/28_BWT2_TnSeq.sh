#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J BWT2alignBHI_17-05-2019
#SBATCH --mail-type=ALL
#SBATCH --mail-user c.novella.rausell@gmail.com
# Load modules
module load bioinfo-tools
module load bowtie2
module load samtools/1.9
# Your commands
REF=/home/clno2215/stunning-garbanzo/data/transcriptomics/RNA-seq/metadata/bowtie2_index/efaec_pilon
RES=/home/clno2215/stunning-garbanzo/results/transcriptomics/Tn-seq/BWT2/
cd /home/clno2215/projectdata/transcriptomics_data/Tn-Seq_BHI/
for file in `ls trim*.fastq.gz | sed 's/.fastq.gz//'`; do
    bowtie2 -x $REF -U ${file}.fastq.gz -p 2  | samtools sort -o $RES${file}.bam
    samtools index $RES${file}.bam
done
cd /home/clno2215/projectdata/transcriptomics_data/Tn-Seq_HSerum/
for file in `ls trim*.fastq.gz | sed 's/.fastq.gz//'`; do
    bowtie2 -x $REF -U ${file}.fastq.gz -p 2 | samtools sort -o $RES${file}.bam
    samtools index $RES${file}.bam
done
cd /home/clno2215/projectdata/transcriptomics_data/Tn-Seq_Serum/
for file in `ls trim*.fastq.gz | sed 's/.fastq.gz//'`; do
    bowtie2 -x $REF -U ${file}.fastq.gz -p 2 | samtools sort -o $RES${file}.bam
    samtools index $RES${file}.bam
done
