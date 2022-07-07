#!/bin/bash -l
#SBATCH -A sens2017106
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 1-10:00:00
#SBATCH -J tiddit
#SBATCH -o RENOVATE_%j.out

ref={}
singularity exec {PATH}TIDDIT.sif tiddit --sv --bam $1 -p 5 -r 4 -q 10 -o $2 --ref $ref


