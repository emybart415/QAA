#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=interactive               #REQUIRED: which partition to use
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --error=trimmomatic_%j.err
#SBATCH --out=trimmomatic_%j.out
#SBATCH --reservation=bgmp-res

conda activate QAA

#input files
#control_r1="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_control_R1.fastq.gz"
#control_r2="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_control_R2.fastq.gz"
fox_r1="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_fox_R1.fastq.gz"
fox_r2="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_fox_R2.fastq.gz"
#control output files
#cfwdpaired_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/control_fwd_paired.fastq.gz"
#cfwd_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/control_fwd_unpaired.fastq.gz"
#crevpaired_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/control_rev_paired.fastq.gz"
#crev_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/control_rev_unpaired.fastq.gz"
#fox output files
ffwdpaired_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_fwd_paired.fastq.gz"
ffwd_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_fwd_unpaired.fastq.gz"
frevpaired_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_rev_paired.fastq.gz"
frev_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_rev_unpaired.fastq.gz"

#/usr/bin/time -v trimmomatic PE -phred33 $control_r1 $control_r2 $cfwdpaired_out $cfwd_out $crevpaired_out $crev_out LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35
/usr/bin/time -v trimmomatic PE -phred33 $fox_r1 $fox_r2 $ffwdpaired_out $ffwd_out $frevpaired_out $frev_out LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35