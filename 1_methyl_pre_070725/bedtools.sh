#!/bin/bash

export PATH=~/:$PATH

dir="/home/alsun/get/1_methyl_pre_070725/DMR"
names=()

for file in "$dir"/*_Hypo.DMR.bed; do
    basename=$(basename "$file" "_Hypo.DMR.bed")
    names+=("$basename")
done

SORTED_CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.sorted.bed"


for name in "${names[@]}"; do
    SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.sorted.bedgraph"
    if [[ -f "$SORTED_BEDGRAPH_FILE" ]]; then
        BED_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.bed"

        bedtools map -a $SORTED_CONCAT_DMR_FILE \
        -b $SORTED_BEDGRAPH_FILE \
        -c 4 \
        -o mean > $BED_FILE

        rm $SORTED_BEDGRAPH_FILE
    fi
done
