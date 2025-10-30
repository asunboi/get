e# Set the library paths in the desired order
#.libPaths(c("/opt/applications/R/4.3.0/gnu/lib64/R/library",
            #"/gpfs/group/home/xzheng/R/x86_64-pc-linux-gnu-library/4.3"))

# Verify the change
.libPaths()

library(ggplot2)
library(reshape2)
library(Seurat)
library("ggrastr")
library(RColorBrewer)
library(dplyr)
library(patchwork)
library(Azimuth)
library(tibble)
library(RColorBrewer)
library(Signac)
library(SeuratDisk)
packageVersion("Seurat")

rm(list = ls())
xin_pallet_21 = c("#8DD3C7","#BEBADA","#BF812E","#DFC27D","#FCCDE5","#FB9A99","#08519C","#FFF7BC","#80B1D3","#FCBBA1","#FDB462","#A1D99B","#D9F0A3","#DD3497","#02818A","#D9D9D9","#a37c7c","#cdab83","7C4A69","417067","2D4451")

# REFERENCE: https://satijalab.org/seurat/articles/integration_introduction.html

# UPDATE ME: back to your working folder
setwd("/gpfs/home/asun/jin_lab/get/pipeline2_aggr_preprocessing/")

# Load from 10X Seurat object output

data <- Read10X(data.dir = "/gpfs/home/asun/jin_lab/get/pipeline2_aggr_preprocessing/ssp_agg/outs/filtered_feature_bc_matrix") 
all <- CreateSeuratObject(counts = data$`Gene Expression`)
all[["percent.mt"]] <- PercentageFeatureSet(all, pattern = "^mt-")

save(all, file="all_obj.Robj")

##### Azimuth to cluster and annotate
# remove low quality cells from here on:
# seur <- subset(all, subset = nFeature_RNA > 500) 
# 3455 cells
seur = RunAzimuth(all, reference = 'mousecortexref')

seur <- NormalizeData(seur, assay = "RNA")
seur <- FindVariableFeatures(seur)
seur <- ScaleData(seur)
seur <- RunPCA(seur)
seur <- FindNeighbors(seur, dims = 1:30, reduction = "pca")
seur <- FindClusters(seur, resolution = 0.5, cluster.name = "unintegrated_clusters")
seur <- RunUMAP(seur, dims = 1:30, reduction = "pca", reduction.name = "umap.unintegrated")

seur[["RNA3"]] <- as(object = seur[["RNA"]], Class = "Assay")
DefaultAssay(seur) <- "RNA3"
seur[["RNA"]] <- NULL
seur <- RenameAssays(object = seur, RNA3 = 'RNA')
SaveH5Seurat(seur, filename = "rna.h5Seurat")
Convert("rna.h5Seurat", dest = "h5ad")