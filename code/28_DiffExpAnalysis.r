library("DESeq2")
library("IHW")

counts = read.delim("htseq_all_sample_count.tsv", header=F, row.names=1)
numc <- sapply(counts, is.factor)
counts[numc] <- lapply(counts[numc], function(x) as.numeric(as.character(x)))
counts <- na.omit(counts)
head(counts)
colnames(counts) = c("BH1", "SR1", "BH2", "SR2", "BH3", "SR3")
my.design <- data.frame(
  row.names = colnames( counts ),
  condition = c( "BH", "Serum", "BH", "Serum","BH", "Serum"),
  libType = c( "paired-end", "paired-end","paired-end","paired-end","paired-end","paired-end" )
)
conds <- factor(my.design$condition)
dds <- DESeqDataSetFromMatrix(countData = counts, colData = my.design, design = ~ condition)
featureData <- data.frame(gene=rownames(counts))
mcols(dds) <- DataFrame(mcols(dds), featureData)


## Pre-Filtering
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

## Refactor control and BH

dds$condition <- relevel(dds$condition, ref = "BH")

##Differential Expression analysis

dds <- DESeq(dds)
res <- results(dds)
resOrdered <- res[order(res$pvalue),]
summary(res)
sum(res$padj < 0.1, na.rm=TRUE)
## alpha = 0.05
res05 <- results(dds, alpha=0.05)
summary(res05)
sum(res05$padj < 0.05, na.rm=TRUE)

##Independent hypothesis weighting

resIHW <- results(dds, filterFun=ihw)
summary(resIHW)
sum(resIHW$padj < 0.1, na.rm=TRUE)


##Log fold change shrinkage (effect size)

resLFC <- lfcShrink(dds, coef=resultsNames(dds)[2], type="apeglm")
resLFC


## Plotting

plotMA(resLFC, ylim=c(-2,2))

## keeping log change >2 or <0.5 

filter.res <- (abs(res$log2FoldChange) > 2) | (abs(res$log2FoldChange) < 0.5)
f.res <- res[filter.res,]

##paper result

sum(f.res$padj < 0.001, na.rm=TRUE)


par(mfrow=c(1,1))
ylim <- c(-2.5,2.5)
plotMA(f.res, ylim=ylim)

## Filtered plots

par(mfrow=c(2,1))
ylim <- c(-2.5,2.5)
resGA <- results(dds, lfcThreshold=2, altHypothesis="greaterAbs")
resGA
resLA <- results(dds, lfcThreshold=.5, altHypothesis="lessAbs")
drawLines <- function() abline(h=c(-.5,.5),col="dodgerblue",lwd=2)
drawLines2 <- function() abline(h=c(-2,2),col="dodgerblue",lwd=2)

plotMA(resGA, ylim=ylim); drawLines2()
plotMA(resLA, ylim=ylim); drawLines()



## Report
dir.create('DESeq2 report', showWarnings = FALSE, recursive = TRUE)
library('ggplot2')
library('regionReport')
report <- DESeq2Report(dds, project = 'DESeq2 PDF report', 
                       intgroup = c('condition'), outdir = 'DESeq2 report',
                       output = 'DESeq2Report', theme = theme_bw(), output_format = 'pdf_document',
                       device = 'pdf')
reporthtml <- DESeq2Report(dds, project = 'DESeq2 HTML report',
                       intgroup = c('condition'), outdir = 'DESeq2 report',
                       output = 'index', theme = theme_bw())
