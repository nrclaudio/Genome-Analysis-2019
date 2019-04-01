# Project Plan

## Background

The Gram-positive bacterium *Enterococcus faecium* is a commensal of the human gastrointestinal tract and a frequent cause of bloodstream infections in hospitalized patients. The mechanisms by which E. faecium can survive and grow in blood during an infection have not yet been characterized. Here, we identify genes that contribute to growth of E. faecium in human serum through transcriptome profiling (RNA-seq) and a highthroughput transposon mutant library sequencing approach (Tn-seq).

---

## What is the aim of the project? What question are they trying to answer?

This is a exploratory experiment since they are trying to look for drug / treatment targets that could lead to a reduced fitness of the bacteria. 

How come can *E. faecium* grow on human serum (low nutrients)? They try to find out by identifying essential genes in this process by Tn-seq (high throughput sequencing technique for screening). In addition, they determined the transcriptomal response in that environment followed by an analysis of two of the found genes that contribute to growth in serum. 

---

## Type of data

Biological data:

1. *Enterococcus faecium* E745
    -  G+ 
    -  non-hemolytic
    -  commensal
    -  Amp - Vmc resistant

It was extracted form **hospitalized patients**. 

2. *De novo* genome assembly
    - PacBio RS II SMRT long-reads
    - Nanopore MinION R7 long-reads
    - Illumina HiSeq 100 bp pair-end short-reads
    * Corrected PacBio were assembled using Celera 8.1
    * Assembled contigs were corrected with Illumins using BWA 0.7.9a
        * BWA-MEM algorithm
        * -M alignment
    *  5 non-overlapping contigs. These 5 contigs were aligned against the NCBI Genbank database and all were found to be part of the E. faecium plasmid pMG1 A single gap between two contigs, could not be closed by PCR. Thus, we assembled Illumina reads together with MinION 2D reads using the SPAdes assembler (version 3.0)
    * Sequence coverage was  determined with SAMtools 0.1.18 using short-reads to the assembly using BWA 0.7.9a
    * Base-calling and assembly errors using SAMtools aligning short reads
    * Genome annotation using Prokka 1.10
    * Identify antibiotic resistance genes with ResFinder

3. RNA-seq

## Metadata

| Plasmid name | Size (bp) | Sequence coverage | Accession number |
|:------------:|:---------:|:-----------------:|:----------------:|
|  Chromosome  |  2765010  |       85,74       |     CP014529     |
|    pE745-1   |   223688  |       99,69       |     CP014530     |
|    pE745-2   |   32423   |       340,23      |     CP014531     |
|    pE745-3   |    9310   |       396,93      |     CP014532     |
|    pE745-4   |   17254   |       81,08       |     CP014533     |
|    pE745-5   |   55167   |       166,16      |     CP014534     |
|    pE745-6   |   65558   |       176,04      |     CP014535     |


## Time consuming steps

## Diagram

## Metadata


## What is our data?

De novo assembly with Illumina, PacBio, Nanopore. 

 - How were the samples prepared? 

    Isolated strain, don't worry about heterozygosity. Extra analysis: BLAST against human to check for contaminations. 2Mbp

    Enterobacteria -> look for general properties.

 - What kind of data we have?

    DNA reads as well as RNA reads. Annotation of the genome.  
    Both long (PacBio and Nanopore) and short reads (Illumina). 

    RNA-seq : Illumina + Nanopore
    Genome assembly : Illumina + PacBio 


Expression analysis with RNA-seq.

## What can we download?

What is the accession number -> SRA archive -> find the reads. -> unzip it to FASTQ files

## Steps for analysis

1. Check read quality with FASTQC. 
    
    Get rid of bad reads and trim the tail of the read that is not good enough.

    3 thousand CDS. 

    How to run FASTQC with all the different types of data. 

2. Filter the reads

    Tool for filtering the reads -> trimomatic

3. Genome assembly 

    - PacBio -> Celera
    - Nanopore -> MaSURCa
    - Illumina HiSeq -> Spades

4.  Genome assembly quality checking

Find software to do so 

5. Compare genome assemblies and their qualities 

6. Synteny, look at the genome, does the genes look equally disposed as closely related genomes
7. 

