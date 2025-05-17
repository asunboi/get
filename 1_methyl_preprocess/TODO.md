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
