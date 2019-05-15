## Loading libraries
library("DESeq2")
library("IHW")
library('ggplot2')
library('regionReport')


# ## Tidying the data
# counts = read.delim("htseq_all_sample_count.tsv", header=F, row.names=1)
# numc <- sapply(counts, is.factor)
# counts[numc] <- lapply(counts[numc], function(x) as.numeric(as.character(x)))
# counts <- na.omit(counts)
# colnames(counts) = c("BH1", "SR1", "BH2", "SR2", "BH3", "SR3")
# my.design <- data.frame(
#   row.names = colnames( counts ),
#   condition = c( "BH", "Serum", "BH", "Serum","BH", "Serum"),
#   libType = c( "paired-end", "paired-end","paired-end","paired-end","paired-end","paired-end" )
# )
# conds <- factor(my.design$condition)
# dds <- DESeqDataSetFromMatrix(countData = counts, colData = my.design, design = ~ condition)
# featureData <- data.frame(gene=rownames(counts))
# mcols(dds) <- DataFrame(mcols(dds), featureData)
# 
# 
# ## Pre-Filtering for reads with at least 10 counts
# keep <- rowSums(counts(dds)) >= 10
# dds <- dds[keep,]
# 
# ## Refactor control and BH
# dds$condition <- relevel(dds$condition, ref = "BH")
# 
# ##Differential Expression analysis
# dds <- DESeq(dds)
# mcols(mcols(dds))
# res <- results(dds, filterFun = ihw)
# resOrdered <- res[order(res$pvalue),]
# 
# ## Top 50 results
# n = 50
# topResults <- rbind( resOrdered[ abs(resOrdered[,'log2FoldChange']) > 2, ][1:n,], 
#                      resOrdered[ abs(resOrdered[,'log2FoldChange']) < 0.5, ][n:1,] )
# topResults[c(1:5,(2*n-4):(2*n)), c('baseMean','log2FoldChange','padj')]
# 
# #Plot log fold change vs mean expression for all genes, red = p < 0.05
# plotMA(resOrdered, main='DESeq2: BH vs Serum', ylim=c(-2,2), alpha = 0.05)
# 
# 
# #PCA
# rld <- rlogTransformation(dds, blind=TRUE)
# plotPCA(rld)
# 
# ##Plot count for the best gene (lowest pval)
# plotCounts(dds, gene=which.min(resOrdered$padj), intgroup='condition', pch = 19)
# 
# #Top genes normalized counts heatmap
# hmcol <- brewer.pal(11,'RdBu')
# nCounts <- counts(dds, normalized=TRUE)
# heatmap(as.matrix(nCounts[ row.names(topResults), ]), Rowv = NA, col = hmcol, mar = c(8,2))
# ## Filtering
# filterL2FCG2L05 <- (abs(resOrdered$log2FoldChange) > 2) | (abs(resOrdered$log2FoldChange) < 0.5)
# filtered_res <- resOrdered[filterL2FCG2L05,]
# 
# #How many genes have a padj value smaller than 0.001
# sum(filtered_res$padj < 0.001, na.rm=TRUE)
# 
# ##Filtered plot
# 
# par(mfrow=c(1,1))
# ylim <- c(-2.5,2.5)
# plotMA(filtered_res, ylim=ylim)
# 
# 
# 
# 
# ##Log fold change shrinkage (effect size)
# resLFC <- lfcShrink(dds, coef=resultsNames(dds)[2], type="apeglm")
# 
# ## How many genes have a padj less than 0.05
# sum(resOrdered$padj < 0.05, na.rm=TRUE)
# sum(resLFC$padj < 0.05, na.rm=TRUE)
# 
# 
# 
# ## Filtering
# #filterL2FCG2L05 <- (abs(resOrdered$log2FoldChange) > 2) | (abs(resOrdered$log2FoldChange) < 0.5)
# #filtered_res <- resOrdered[filterL2FCG2L05,]
# 
# #How many genes have a padj value smaller than 0.001
# #sum(filtered_res$padj < 0.001, na.rm=TRUE)
# 
# ##Filtered plot
# 
# #par(mfrow=c(1,1))
# #ylim <- c(-2.5,2.5)
# #plotMA(filtered_res, ylim=ylim)
# 
# ## Filtered plots
# 
# ##par(mfrow=c(2,1))
# ##ylim <- c(-2.5,2.5)
# ##resGA <- results(dds, lfcThreshold=2, altHypothesis="greaterAbs")
# ##resLA <- results(dds, lfcThreshold=.5, altHypothesis="lessAbs")
# ##drawLines <- function() abline(h=c(-.5,.5),col="dodgerblue",lwd=2)
# ##drawLines2 <- function() abline(h=c(-2,2),col="dodgerblue",lwd=2)
# 
# ##plotMA(resGA, ylim=ylim); drawLines2()
# ##plotMA(resLA, ylim=ylim); drawLines()
# 
# 

## Report
dir.create('DESeq2 report', showWarnings = FALSE, recursive = TRUE)
reporthtml <- DESeq2Report(dds, project = 'DESeq2 HTML report',
                       intgroup = c('condition'), outdir = 'DESeq2 report',
                       output = 'index', theme = theme_bw(), nBest = 100)



## CSV

write.csv(as.data.frame(resOrdered), 
          file="BH_Serum_results.csv")
write.csv(as.data.frame(f.res), 
          file="BH_Serum_results_padjGreater2Less05.csv")
write.csv(as.data.frame(ff.res), 
          file="BH_Serum_results_padjGreater2Less05_padj0001.csv")
