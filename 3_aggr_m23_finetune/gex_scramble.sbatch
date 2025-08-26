#!/bin/bash
#SBATCH --job-name="gex_scramble"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=alphafold
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=16
#SBATCH --time=72:00:00
#SBATCH --mem=128000
#SBATCH --mail-type=END
#SBATCH --mail-user=asun@scripps.edu

python gex_scramble.py
