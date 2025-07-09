#!/bin/bash

# export PATH=~/:$PATH

# #bigWigToBedGraph SAA-125-2M_L2-3.CGN-both.frac.bw ~/get/1_methyl_preprocess/SAA-125-2M_L2-3.CGN-both.frac.bedgraph
# bigWigToBedGraph pseudobulk_bw/L2_3_IT_CTX_Glut.CGN.bw ./L2_3_IT_CTX_Glut.CGN.bedgraph
# bigWigToBedGraph pseudobulk_bw/Lamp5_Gaba.CGN.bw Lamp5_Gaba.CGN.bedgraph

# bedSort /home/alsun/get/1_methyl_pre_070725/DMR/L23_IT_CTX_Glut_Hypo.DMR.bed /home/alsun/get/1_methyl_pre_070725/L23_IT_CTX_Glut_Hypo.DMR.sorted.bed
# bedSort /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.bedgraph /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.sorted.bedgraph


# bedSort /home/alsun/get/1_methyl_pre_070725/DMR/Lamp5_Gaba_Hypo.DMR.bed /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba_Hypo.DMR.sorted.bed
# bedSort /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.bedgraph /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.sorted.bedgraph

# bedtools map -a /home/alsun/get/1_methyl_pre_070725/L23_IT_CTX_Glut_Hypo.DMR.sorted.bed \
#     -b /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.sorted.bedgraph \
#     -c 4 \
#     -o mean > /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.bed

# bedtools map -a /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba_Hypo.DMR.sorted.bed \
#     -b /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.sorted.bedgraph \
#     -c 4 \
#     -o mean > /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.bed

# cat /home/alsun/get/1_methyl_pre_070725/DMR/L23_IT_CTX_Glut_Hypo.DMR.bed /home/alsun/get/1_methyl_pre_070725/DMR/Lamp5_Gaba_Hypo.DMR.bed > Lamp5_L23_DMR.bed
# bedSort Lamp5_L23_DMR.bed Lamp5_L23_DMR.sorted.bed

# bedtools map -a /home/alsun/get/1_methyl_pre_070725/Lamp5_L23_DMR.sorted.bed \
#     -b /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.sorted.bedgraph \
#     -c 4 \
#     -o mean > /home/alsun/get/1_methyl_pre_070725/L2_3_IT_CTX_Glut.CGN.bed

# bedtools map -a /home/alsun/get/1_methyl_pre_070725/Lamp5_L23_DMR.sorted.bed \
#     -b /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.sorted.bedgraph \
#     -c 4 \
#     -o mean > /home/alsun/get/1_methyl_pre_070725/Lamp5_Gaba.CGN.bed

# ### Non-parallelized ###

# export PATH=~/:$PATH

# dir="/home/alsun/get/1_methyl_pre_070725/DMR"
# names=()

# for file in "$dir"/*_Hypo.DMR.bed; do
#     basename=$(basename "$file" "_Hypo.DMR.bed")
#     names+=("$basename")
# done

# # Print the resulting list
# #printf "%s\n" "${names[@]}"

# for name in "${names[@]}"; do
#     DMR_FILE="/home/alsun/get/1_methyl_pre_070725/DMR/${name}_Hypo.DMR.bed"
#     BW_FILE="/home/alsun/get/1_methyl_pre_070725/pseudobulk_bw/${name}.CGN.bw"
#     SORTED_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/${name}_Hypo.DMR.sorted.bed"

#     BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.bedgraph"
#     SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.sorted.bedgraph"

#     bigWigToBedGraph $BW_FILE $BEDGRAPH_FILE
#     bedSort $DMR_FILE $SORTED_DMR_FILE
#     bedSort $BEDGRAPH_FILE $SORTED_BEDGRAPH_FILE

#     sorted_dmr_files+=("$SORTED_DMR_FILE")

#     rm $BEDGRAPH_FILE
# done

# CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.bed"
# SORTED_CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.sorted.bed"

# # Concatenate all sorted DMR files
# cat "${sorted_dmr_files[@]}" > $CONCAT_DMR_FILE

# rm -f "${sorted_dmr_files[@]}"

# # Sort the combined DMR file
# bedSort $CONCAT_DMR_FILE $SORTED_CONCAT_DMR_FILE

# rm $CONCAT_DMR_FILE

# for name in "${names[@]}"; do
#     SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.sorted.bedgraph"
#     BED_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.bed"

#     bedtools map -a $SORTED_CONCAT_DMR_FILE \
#     -b $SORTED_BEDGRAPH_FILE \
#     -c 4 \
#     -o mean > $BED_FILE

#     rm $SORTED_BEDGRAPH_FILE
# done

export PATH=~/:$PATH

# Define the input file
mapping_file="/home/alsun/get/1_methyl_pre_070725/pseudobulk_bw/matched_celltype_CGN_bw_paths_with_dmr.txt"

# Skip header, extract column 1 and column 2 into separate arrays
mapfile -t DMR_FILES < <(tail -n +2 "$mapping_file" | awk -F'\t' '{print $1}')
mapfile -t BW_FILES < <(tail -n +2 "$mapping_file" | awk -F'\t' '{print $2}')

# Now you can access them as Bash arrays
echo "Column 1 values:"
printf "%s\n" "${col1[@]}"

echo "Column 2 values:"
printf "%s\n" "${col2[@]}"

dir="/home/alsun/get/1_methyl_pre_070725/DMR"
names=()

for file in "$dir"/*_Hypo.DMR.bed; do
    basename=$(basename "$file" "_Hypo.DMR.bed")
    names+=("$basename")
done

# Print the resulting list
#printf "%s\n" "${names[@]}"

process_file() {
    name="$1"

    DMR_FILE="/home/alsun/get/1_methyl_pre_070725/DMR/${name}_Hypo.DMR.bed"
    BW_FILE="/home/alsun/get/1_methyl_pre_070725/pseudobulk_bw/${name}.CGN.bw"
    SORTED_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/${name}_Hypo.DMR.sorted.bed"
    BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.bedgraph"
    SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.sorted.bedgraph"

    bigWigToBedGraph "$BW_FILE" "$BEDGRAPH_FILE"
    bedSort "$DMR_FILE" "$SORTED_DMR_FILE"
    bedSort "$BEDGRAPH_FILE" "$SORTED_BEDGRAPH_FILE"

    rm -f "$BEDGRAPH_FILE"
}
export -f process_file

parallel process_file ::: "${names[@]}"

sorted_dmr_files=(/home/alsun/get/1_methyl_pre_070725/*_Hypo.DMR.sorted.bed)

CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.bed"
SORTED_CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.sorted.bed"

# Concatenate all sorted DMR files
cat "${sorted_dmr_files[@]}" > $CONCAT_DMR_FILE

rm -f "${sorted_dmr_files[@]}"

# Sort the combined DMR file
bedSort $CONCAT_DMR_FILE $SORTED_CONCAT_DMR_FILE

rm $CONCAT_DMR_FILE

map_to_dmr() {
    name="$1"
    SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.sorted.bedgraph"
    if [[ -f "$SORTED_BEDGRAPH_FILE" ]]; then
        BED_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.bed"

        bedtools map -a $SORTED_CONCAT_DMR_FILE \
        -b $SORTED_BEDGRAPH_FILE \
        -c 4 \
        -o mean > $BED_FILE

        rm $SORTED_BEDGRAPH_FILE
    fi
}
export -f map_to_dmr

parallel map_to_dmr ::: "${names[@]}"

