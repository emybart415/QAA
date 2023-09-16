#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --error=staralignfox_%j.err
#SBATCH --out=staralignfox_%j.out

#Be sure to use the queuing system and request 8 cores on 1 node

conda activate bgmp_star

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn /projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_fwd_paired.fastq.gz /projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_rev_paired.fastq.gz \
    --genomeDir /projects/bgmp/ebart/bioinfo/Bi623/QAA/star_output \
    --outFileNamePrefix align_fox