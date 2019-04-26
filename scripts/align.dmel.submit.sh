#!/bin/bash
#SBATCH --partition=sixhour
#SBATCH --export=NONE
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=$USER@ku.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=30gb
#SBATCH --time=1:00:00
#SBATCH --output=${SCRATCH}/hpc_demo/reports/dmel_alignment_%j.out
#SBATCH --job-name=dmel_alignment_demo

# load necessary programs
module load bwa
module load samtools

# change to the hpc_demo dir
cd ${SCRATCH}/hpc_demo/

# 
