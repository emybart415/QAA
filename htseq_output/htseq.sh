#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --error=htseq_CONTROL_YES2%j.err

#/projects/bgmp/ebart/bioinfo/Bi623/QAA/star_align/align_controlAligned.out.sam
#/projects/bgmp/ebart/bioinfo/Bi623/QAA/star_align/align_foxAligned.out.sam

conda activate QAA

/usr/bin/time -v htseq-count \
    --stranded=yes \
    /projects/bgmp/ebart/bioinfo/Bi623/QAA/star_align/align_controlAligned.out.sam \
    /projects/bgmp/ebart/bioinfo/Bi623/QAA/FASTA/Mus_musculus.GRCm39.110.gtf > htseq_CONTROL_YES2.txt
