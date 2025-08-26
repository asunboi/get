#!/bin/bash
#SBATCH --job-name="predict_methyl_ACT"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --time=72:00:00
#SBATCH --mem=72000
#SBATCH --mail-type=END
#SBATCH --mail-user=asun@scripps.edu

python run_predict_methyl.py
