# 04/14/25
/gpfs/home/asun/miniforge3/envs/get/lib/python3.12/site-packages/lightning/pytorch/trainer/setup.py:177: GPU available but not used. You can set it by doing `Trainer(accelerator='gpu')`.

Main issue was in https://github.com/GET-Foundation/get_model/issues/7, where the run name was inconsistent between interpretation and cell type.

# 03/27/2025
Incredible that it's basically been a month since i've worked on GET, that's a suprisingly big setback in terms of my project progress.  
Setup the GET project, put current tasks as issues on it.  
Updated TODO, updated readme.


# 02/27/2025
Making a gitignore for the project.

# 02/26/2025 (pipeline2_ssp_C01)
Needed to do cell type annotation, followed xinhe's procedure. Initially wanted to set up Seurat and R environment
for myself, but it is awfully difficult with conda and the R environment also needing things that are not in conda-forge. Wanted to find a workaround with renv, but not too used to R.
Annotated cells with workflow in Untitled1.ipynb, but will make a runall script.
Modified prepare_ssp to work with our data, will have to check if it does a full run through as some of the changes did not save. Also adding to runall.
Copied preprocess_utils.py into the directory.
Should I have an inputs / outputs?
Most important data is in ssp_C01_mutliome_zarr, will run tomorrow. 

# 02/25/2025 (pipeline2_ssp_C01)
ssp_B01_cellranger.sbatch still running in pipeline 1. Take both files, aggr, and then create a instance of a pretrained GET network.

Started analysis on C01 dataset using prepare PMBC as a reference. 
Could not find a corresponding cCRE on catlas; only bed files, not a tsv.gz as indicated by prepare_pbmc. 
Issue in cell type assignment, rna = snap.read(snap.datasets.pbmc10k_multiome(modality='RNA'), backed=None) does not tell me which equivalent files I should be using to replace the pbmc10k_multiome. 
Currently trying to get around this by using scanpy read 10x mtx.
Cannot convert CscMatrix(F32) to f64 CsrMatrix
FIXED THIS BY FORCING TO CSR f64; not sure if this will cause any problems downstream.
I have to annotate cells? Symlinked xinhe's multiome to reference. Probably going to do seurat & azimuth annotation.
