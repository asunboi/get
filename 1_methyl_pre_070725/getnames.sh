#!/bin/bash

export PATH=~/:$PATH

# dmr_dir="/home/alsun/get/1_methyl_pre_070725/DMR"
# dmr_names=()

# for file in "$dmr_dir"/*_Hypo.DMR.bed; do
#     basename=$(basename "$file" "_Hypo.DMR.bed")
#     dmr_names+=("$basename")
# done

# printf "%s\n" "${dmr_names[@]}" > dmr_names.txt

# bw_dir="/home/alsun/get/1_methyl_pre_070725/pseudobulk_bw"
# bw_names=()

# for file in "$bw_dir"/*.CGN.bw; do
#     basename=$(basename "$file" ".CGN.bw")
#     bw_names+=("$basename")
# done

# printf "%s\n" "${bw_names[@]}" > bw_names.txt

bed_dir="/home/alsun/get/1_methyl_pre_070725/"
bed_names=()

for file in "$bed_dir"/*.CGN.bed; do
    basename=$(basename "$file" ".CGN.bed")
    bed_names+=("$basename")
done

printf "%s\n" "${bed_names[@]}" > bed_names.txt