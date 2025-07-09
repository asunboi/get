#!/bin/sh

export PATH=~/:$PATH

#bigWigToBedGraph SAA-125-2M_L2-3.CGN-both.frac.bw ~/get/1_methyl_preprocess/SAA-125-2M_L2-3.CGN-both.frac.bedgraph
bigWigToBedGraph pseudobulk_bw/L2_3_IT_CTX_Glut.CGN.bw ./L2_3_IT_CTX_Glut.CGN.bedgraph
bigWigToBedGraph pseudobulk_bw/Lamp5_Gaba.CGN.bw Lamp5_Gaba.CGN.bedgraph

bedSort /home/alsun/get/1_methyl_pre_070725/DMR/L23_IT_CTX_Glut_Hypo.DMR.bed /home/alsun/get/1_methyl_pre_070725/L23_IT_CTX_Glut_Hypo.DMR.sorted.bed
bedSort /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.bedgraph /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.sorted.bedgraph


bedSort /home/alsun/get/1_methyl_pre_070725/DMR/Lamp5_Gaba_Hypo.DMR.bed /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba_Hypo.DMR.sorted.bed
bedSort /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.bedgraph /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.sorted.bedgraph

bedtools map -a /home/alsun/get/1_methyl_pre_070725/L23_IT_CTX_Glut_Hypo.DMR.sorted.bed \
    -b /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.sorted.bedgraph \
    -c 4 \
    -o mean > /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.bed

bedtools map -a /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba_Hypo.DMR.sorted.bed \
    -b /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.sorted.bedgraph \
    -c 4 \
    -o mean > /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.bed

cat /home/alsun/get/1_methyl_pre_070725/DMR/L23_IT_CTX_Glut_Hypo.DMR.bed /home/alsun/get/1_methyl_pre_070725/DMR/Lamp5_Gaba_Hypo.DMR.bed > Lamp5_L23_DMR.bed
bedSort Lamp5_L23_DMR.bed Lamp5_L23_DMR.sorted.bed

bedtools map -a /home/alsun/get/1_methyl_pre_070725/Lamp5_L23_DMR.sorted.bed \
    -b /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.sorted.bedgraph \
    -c 4 \
    -o mean > /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.bed

bedtools map -a /home/alsun/get/1_methyl_pre_070725/Lamp5_L23_DMR.sorted.bed \
    -b /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.sorted.bedgraph \
    -c 4 \
    -o mean > /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.bed