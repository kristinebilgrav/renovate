#!/bin/bash -l
#SBATCH -A sens2017106
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 2-20:00:00
#SBATCH -J remap

module load bioinfo-tools samtools bwa

samtools view -b -h -T {PATH}human_g1k_v37_decoy.fasta $1 >  $TMPDIR/$2.bam
samtools index $TMPDIR/$2.bam
samtools view -bh -u -F 3328 $TMPDIR/$2.bam |samtools sort -l 0 -m 6G -n -@ 16 - | samtools fastq -  > $TMPDIR/$2.fq.gz

ref=

bwa mem -p -t 16 $ref $TMPDIR/$2.fq.gz | samtools view -Sbh - | samtools sort -m 3G -@ 16  -  > $2_hg38.bam
samtools index $2_hg38.bam

#run FindSV

#run filtering and ranking
