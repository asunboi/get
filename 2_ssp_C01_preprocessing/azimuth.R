# Set the library paths in the desired order
.libPaths(c("/opt/applications/R/4.3.0/gnu/lib64/R/library",
            "/gpfs/group/home/xzheng/R/x86_64-pc-linux-gnu-library/4.3"))

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
packageVersion("Seurat")

rm(list = ls())
xin_pallet_21 = c("#8DD3C7","#BEBADA","#BF812E","#DFC27D","#FCCDE5","#FB9A99","#08519C","#FFF7BC","#80B1D3","#FCBBA1","#FDB462","#A1D99B","#D9F0A3","#DD3497","#02818A","#D9D9D9","#a37c7c","#cdab83","7C4A69","417067","2D4451")

# REFERENCE: https://satijalab.org/seurat/articles/integration_introduction.html

# UPDATE ME: back to your working folder
setwd("/gpfs/home/asun/jin_lab/get/pipeline2_ssp_C01/")

# Load from 10X Seurat object output

data <- Read10X(data.dir = "/gpfs/home/asun/jin_lab/get/pipeline2_ssp_C01/M2XM_220316_211-R_C01/outs/filtered_feature_bc_matrix") 
all <- CreateSeuratObject(counts = rna_counts)
all[["percent.mt"]] <- PercentageFeatureSet(all, pattern = "^mt-")


save(all, file="all_obj.Robj")

##### Azimuth to cluster and annotate
# remove low quality cells from here on:
seur <- subset(all, subset = nFeature_RNA > 500) 
# 3455 cells
seur = RunAzimuth(all, reference = 'mousecortexref')

SaveH5Seurat(query, filename = "rna_annotated.h5seurat")
