#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --mail-type=ALL                   #optional: must set email first, what type of email you want
#SBATCH --cpus-per-task=8                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --error=FoxR2error.err

conda activate bgmp_py311

# f1=/projects/bgmp/shared/2017_sequencing/1294_S1_L008_R1_001.fastq.gz 101
# f2=/projects/bgmp/shared/2017_sequencing/1294_S1_L008_R2_001.fastq.gz 8
# f3=/projects/bgmp/shared/2017_sequencing/1294_S1_L008_R3_001.fastq.gz 8
# f4=/projects/bgmp/shared/2017_sequencing/1294_S1_L008_R4_001.fastq.gz 101
#control
# f5=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R1_001.fastq.gz
# f6=/projects/bgmp/shared/2017_sequencing/demultiplexed/2_2B_control_S2_L008_R2_001.fastq.gz
#fox
# f7=/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R1_001.fastq.gz
# f8=/projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R2_001.fastq.gz



/usr/bin/time -v /projects/bgmp/ebart/bioinfo/Bi622/Demultiplex/Demultiplex/Assignment-the-first/demultiplex_A1P1.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/19_3F_fox_S14_L008_R2_001.fastq.gz -l 101 -o /projects/bgmp/ebart/bioinfo/Bi623/QAA/fox/FoxR2_results
