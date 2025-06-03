# 05/28/25
Working on converting atac peaks into regions and averaging methylation across the regions. Currently bedtools has a bad intersection with the fact that two different references used to generate the files, so I am limiting it to canonical + sex chromosomes.  

Made distribution.ipynb to visualize the methylation and accessibility distribution curves.   
Training model again with methyl_atac_peaks.zarr, but running into the same issues.   
Have to look into how get_motif.bed and query_motif.bed are gathered.  

# 05/07/25
For each abundant cell type, we'll generate:
1. Peak accessibility file (.atac.bed) containing:
   - Peak coordinates (chr, start, end)
   - Normalized accessibility scores (aCPM, $10^5$ scale factor)
2. Gene expression file (.rna.csv) containing:
   - Gene names
   - Normalized expression values (TPM, $10^6$ scale factor)


# 05/06/25
Use preprocess utils to convert bed file into zarr format. BW CGN is methylation data at single base pair resolution, so have to take average over regions.
