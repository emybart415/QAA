#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --error=star_%j.err
#SBATCH --out=star_%j.out

conda activate bgmp_star

/usr/bin/time -v STAR \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir /projects/bgmp/ebart/bioinfo/Bi623/QAA/star_output \
    --genomeFastaFiles /projects/bgmp/ebart/bioinfo/Bi623/QAA/FASTA/Mus_musculus.GRCm39.dna.primary_assembly.fa \
    --sjdbGTFfile /projects/bgmp/ebart/bioinfo/Bi623/QAA/FASTA/Mus_musculus.GRCm39.110.gtf