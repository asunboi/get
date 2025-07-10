#!/bin/bash

export PATH=~/:$PATH

# Define the input file
#mapping_file="/home/alsun/get/1_methyl_pre_070725/matched_celltype_CGN_bw_paths_with_dmr.txt"
mapping_file="/home/alsun/get/1_methyl_pre_070725/bw_dmr_matches.tsv"

# Skip header, extract column 1 and column 2 into separate arrays
mapfile -t BW_FILES < <(tail -n +2 "$mapping_file" | awk -F'\t' '{print $1}')
mapfile -t DMR_FILES < <(tail -n +2 "$mapping_file" | awk -F'\t' '{print $2}')

# Build a list of argument pairs
ARGS=()
for ((i=0; i<${#DMR_FILES[@]}; i++)); do
    ARGS+=("${DMR_FILES[$i]}:::${BW_FILES[$i]}")
done

process_file() {
    DMR_NAME="$1"
    BW_NAME="$2"

    DMR_FILE="/home/alsun/get/1_methyl_pre_070725/DMR/${DMR_NAME}_Hypo.DMR.bed"
    BW_FILE="/home/alsun/get/1_methyl_pre_070725/pseudobulk_bw/${BW_NAME}.CGN.bw"
    SORTED_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/${DMR_NAME}_Hypo.DMR.sorted.bed"
    BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${BW_NAME}.CGN.bedgraph"
    SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${BW_NAME}.CGN.sorted.bedgraph"

    bigWigToBedGraph "$BW_FILE" "$BEDGRAPH_FILE"
    bedSort "$DMR_FILE" "$SORTED_DMR_FILE"
    bedSort "$BEDGRAPH_FILE" "$SORTED_BEDGRAPH_FILE"

    rm -f "$BEDGRAPH_FILE"
}
export -f process_file

# Run parallel with two arguments per job
parallel --colsep ':::' process_file ::: "${ARGS[@]}"

sorted_dmr_files=(/home/alsun/get/1_methyl_pre_070725/*_Hypo.DMR.sorted.bed)

CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.bed"
SORTED_CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.sorted.bed"
UNIQ_CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.uniq.bed"

# Concatenate all sorted DMR files
cat "${sorted_dmr_files[@]}" > $CONCAT_DMR_FILE

rm -f "${sorted_dmr_files[@]}"

# Sort the combined DMR file
bedSort $CONCAT_DMR_FILE $SORTED_CONCAT_DMR_FILE

uniq $SORTED_CONCAT_DMR_FILE > $UNIQ_CONCAT_DMR_FILE

rm $CONCAT_DMR_FILE
rm $SORTED_CONCAT_DMR_FILE

map_to_dmr() {
    name="$1"
    UNIQ_CONCAT_DMR_FILE="/home/alsun/get/1_methyl_pre_070725/All_DMR_combined.uniq.bed"
    SORTED_BEDGRAPH_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.sorted.bedgraph"
    if [[ -f "$SORTED_BEDGRAPH_FILE" ]]; then
        BED_FILE="/home/alsun/get/1_methyl_pre_070725/${name}.CGN.bed"
        echo "Mapping using file: $SORTED_BEDGRAPH_FILE"
        bedtools map -a $UNIQ_CONCAT_DMR_FILE -b $SORTED_BEDGRAPH_FILE -c 4 -o mean > $BED_FILE

        rm $SORTED_BEDGRAPH_FILE
    fi
}
export -f map_to_dmr

parallel map_to_dmr ::: "${BW_FILES[@]}"

