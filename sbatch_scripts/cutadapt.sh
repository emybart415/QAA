#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=interactive               #REQUIRED: which partition to use
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --error=cutadapt_%j.err
#SBATCH --out=cutadapt_%j.out
#SBATCH --reservation=bgmp-res

conda activate QAA
#Adpater sequences
adp1="AGATCGGAAGAGCACACGTCTGAACTCCAGTCA"
adp2="AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"
#input files
control_r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz"
control_r2="/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz"
fox_r1="/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R1_001.fastq.gz"
fox_rf="/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R2_001.fastq.gz"
#output directories
controlr1_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_control_R1.fastq.gz"
controlr2_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_control_R2.fastq.gz"
foxr1_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_fox_R1.fastq.gz"
foxr2_out="/projects/bgmp/ebart/bioinfo/Bi623/QAA/cutadapt/cutadapt_fox_R2.fastq.gz"

/usr/bin/time -v cutadapt -a $adp1 -A $adp2 -o $controlr1_out -p $controlr2_out $control_r1 $control_r2
/usr/bin/time -v cutadapt -a $adp1 -A $adp2 -o $foxr1_out -p $foxr2_out $fox_r1 $fox_rf