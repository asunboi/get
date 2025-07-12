#!/bin/bash
#SBATCH --mem=240G
#SBATCH --partition=highmem
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --time=48:00:00

## Running cellranger analysis of 10X data
## NB: use different script for cDNA only libraries
## Configured to work with Slurm

export PATH=/gpfs/group/jin/software/cellranger-arc-2.0.2:$PATH

ID="ssp_agg"
LIBRARIESPATH="/gpfs/home/asun/jin_lab/get/pipeline1_cellranger/ssp_aggr.csv"
REFDIR="/gpfs/group/jin/ref_genomes/mm10_arc/refdata-cellranger-arc-mm10-2020-A-2.0.0"

cellranger-arc aggr --id=$ID \
                  --csv=$LIBRARIESPATH \
                  --normalize=depth \
                  --reference=$REFDIR
