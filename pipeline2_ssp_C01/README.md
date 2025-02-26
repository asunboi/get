02/25/2025
Started analysis on C01 dataset using prepare PMBC as a reference. 
Could not find a corresponding cCRE on catlas; only bed files, not a tsv.gz as indicated by prepare_pbmc. 
Issue in cell type assignment, rna = snap.read(snap.datasets.pbmc10k_multiome(modality='RNA'), backed=None) does not tell me 
which equivalent files I should be using to replace the pbmc10k_multiome. 
Currently trying to get around this by using scanpy read 10x mtx.
Cannot convert CscMatrix(F32) to f64 CsrMatrix
FIXED THIS BY FORCING TO CSR f64; not sure if this will cause any problems downstream.
I have to annotate cells? Symlinked xinhe's multiome to reference. Probably going to do seurat & azimuth annotation.