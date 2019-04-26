#!/bin/bash
#SBATCH --partition=sixhour
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=30gb
#SBATCH --time=1:00:00
#SBATCH --output=dmel_alignment_%j.out
#SBATCH --job-name=dmel_alignment_demo

# load necessary programs
module load bwa
module load samtools

# define some variables - aids in reusing a script
## directories
MAIN_DIR=${SCRATCH}/hpc_demo
OUTPUTS_DIR=${MAIN_DIR}/outputs
DATA_DIR=${MAIN_DIR}/data
## files
REF_GENOME=${MAIN_DIR}/refs/dmel.chr3R.fa
R1=${DATA_DIR}/dmel.R1.fq.gz
R2=${DATA_DIR}/dmel.R2.fq.gz

# change to the hpc_demo dir
cd ${SCRATCH}/hpc_demo/

# index the reference
bwa index ${REF_GENOME}

# align the reads
bwa mem -t 4 ${REF_GENOME} ${R1} ${R2} > ${OUTPUTS_DIR}/dmel.aln.sam

# convert SAM to BAM file
samtools view -@ 3 -b -o ${OUTPUTS_DIR}/dmel.aln.bam ${OUTPUTS_DIR}/dmel.aln.sam

# sort the BAM file
samtools sort -@ 3 -O bam -o ${OUTPUTS_DIR}/dmel.sorted.bam ${OUTPUTS_DIR}/dmel.aln.bam

# index the BAM file
samtools index ${OUTPUTS_DIR}/dmel.sorted.bam
