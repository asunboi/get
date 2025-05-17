# Links
[Single-cell analysis of chromatin accessibility in the adult mouse brain](https://www.nature.com/articles/s41586-023-06824-9)  
[Low Dimensionality in Gene Expression Data Enables the Accurate Extraction of Transcriptional Programs from Shallow Sequencing](https://www.cell.com/fulltext/S2405-4712(16)30109-0)  
[DNA Methylation and Its Basic Function](https://www.nature.com/articles/npp2012112)  
[Towards multimodal foundation models in molecular cell biology](https://www.nature.com/articles/s41586-025-08710-y)  
[An Introductory Guide to Quality Training Data for Machine Learning](https://www.v7labs.com/blog/quality-training-data-for-machine-learning-guide)  
[The Effects of Data Quality on Machine Learning Performance on Tabular Data](https://arxiv.org/pdf/2207.14529)  
[In vitro versus in vivo approaches to immunology](https://www.nature.com/articles/nri935/figures/1)  
[Gene regulatory network inference in the era of single-cell multi-omics](https://www.nature.com/articles/s41576-023-00618-5?fromPaywallRec=false)  
[Massively parallel in vivo Perturb-seq reveals cell-type-specific transcriptional networks in cortical development](https://www.cell.com/cell/fulltext/S0092-8674(24)00476-8)  
[Single-cell analysis of chromatin accessibility in the adult mouse brain](https://www.nature.com/articles/s41586-023-06824-9)  
[Robust enhancer-gene regulation identified by single-cell transcriptomes and epigenomes](https://www.cell.com/cell-genomics/fulltext/S2666-979X(23)00117-9?rss=yes&utm_source=dlvr.it&utm_medium=twitter)  
[Single-cell DNA methylome and 3D multi-omic atlas of the adult mouse brain](https://www.nature.com/articles/s41586-023-06805-y)  
[Human prefrontal cortex gene regulatory dynamics from gestation to adulthood at single-cell resolution](https://www.sciencedirect.com/science/article/pii/S0092867422012582?via%3Dihub)  
[Toward learning a foundational representation of cells and genes](https://www.nature.com/articles/s41592-024-02367-7)  
[Dissecting cell identity via network inference and in silico gene perturbation](https://www.nature.com/articles/s41586-022-05688-9)  
[Flexible modeling of regulatory networks improves transcription factor activity estimation](https://www.nature.com/articles/s41540-024-00386-w?fromPaywallRec=false)  
[Discrete Latent Spaces: Generative AI II](https://synthesis.ai/2023/03/21/generative-ai-ii-discrete-latent-spaces/)  
[Relationship between different epigenomic marks: DNA accessibility and methylation, histone marks, and RNA](https://www.nature.com/articles/nature14310)  
[In vivo Perturb-Seq reveals neuronal and glial abnormalities associated with autism risk genes](https://www.science.org/doi/10.1126/science.aaz6063)  
[Massively parallel in vivo Perturb-seq reveals cell-type-specific transcriptional networks in cortical development](https://www.sciencedirect.com/science/article/pii/S0092867424004768)  
[Probing pluripotency gene regulatory networks with quantitative live cell imaging](https://pmc.ncbi.nlm.nih.gov/articles/PMC7560648/#:~:text=3.5.&text=Live%20cell%20imaging%20allows%20individual,predict%20the%20activity%20of%20GRNs.)  
[Distinguishing direct versus indirect transcription factor–DNA interactions](https://pmc.ncbi.nlm.nih.gov/articles/PMC2775597/#:~:text=We%20also%20tested%20our%20method,using%20in%20vitro%20nucleosome%20data.)  
[](https://www.reddit.com/r/biology/comments/a09hmp/what_is_stochastic_gene_expression_genetic_noise/)  
[Flexible modeling of regulatory networks improves transcription factor activity estimation](https://www.nature.com/articles/s41540-024-00386-w?fromPaywallRec=false%5D)  
[Deep learning-based models for preimplantation mouse and human embryos based on single-cell RNA sequencing](https://www.nature.com/articles/s41592-024-02511-3)  
[Computational systems biology in disease modeling and control, review and perspectives](https://www.nature.com/articles/s41540-022-00247-4)  
[Delineating the effective use of self-supervised learning in single-cell genomics](https://www.nature.com/articles/s42256-024-00934-3?fromPaywallRec=false)  
[Large-scale foundation model on single-cell transcriptomics](https://www.nature.com/articles/s41592-024-02305-7?fromPaywallRec=false)  
[The importance of in-silico studies in drug discovery](https://www.sciencedirect.com/science/article/pii/S2949866X24000200)

# 05/16/25
Working on methylation data preprocessing.

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
