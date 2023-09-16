#!/usr/bin/env python

import argparse
import gzip
import matplotlib.pyplot as plt
import numpy as np

cntrl_fwd = "/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/control_fwd_paired.tsv"
cntrl_rev = "/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/control_rev_paired.tsv"

fox_fwd = "/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_fwd_paired.tsv"
fox_rev = "/projects/bgmp/ebart/bioinfo/Bi623/QAA/trimmomatic/fox_rev_paired.tsv"


fwd_readlength = {} #key: read length, value: count at specific read length
with open(fox_fwd, "r") as fh1:
    fh1.readline()#open file and read through input file line by line
    for line in fh1:
        split_line = line.strip().split() #Now line strings are indexed
        fwd_count = int(split_line[0])#assign variable count to first number
        fwd_read_length = int(split_line[1])#assign variable read length to second number
        fwd_readlength[fwd_read_length] = fwd_count

rev_readlength = {} #key: read length, value: count at specific read length
with open(fox_rev, "r") as fh1:
    fh1.readline()#open file and read through input file line by line
    for line in fh1:
        split_line = line.strip().split() #Now line strings are indexed
        rev_count = int(split_line[0])#assign variable count to first number
        rev_read_length = int(split_line[1])#assign variable read length to second number
        rev_readlength[rev_read_length] = rev_count

# x = np.arange(len(fwd_readlength))
# # Define the width of each bar
# bar_width = 0.35
# # Create the figure and axis objects
# fig, ax = plt.subplots()
# # Plot the Forward_Read data
# ax.bar(x - bar_width/2, fwd_readlength.values(), bar_width, alpha=0.5, label='Forward_Read', color="black")
# # Plot the Reverse_Read data with an offset
# ax.bar(x + bar_width/2, rev_readlength.values(), bar_width, alpha=0.5, label='Reverse_Read', color="pink")
# plt.yscale('log')
# plt.legend(loc='upper right')
# plt.xlabel("Read Length")
# plt.title("Read Length Distribution for FWD and REV")
# # Set the x-axis labels to be the keys from the dictionaries
# ax.set_xticks(x)
# ax.set_xticklabels(fwd_readlength.keys())
# # Ensure that the x-axis labels fit within the figure
# plt.xticks(rotation=45)
# # Save the plot
# plt.savefig('control_rldist_2.png')

plt.bar(fwd_readlength.keys(), fwd_readlength.values(), alpha = 0.5, label = 'Forward_Read', color = "black")
plt.bar(rev_readlength.keys(), rev_readlength.values(), alpha = 0.5, label = 'Reverse_Read', color = "pink")
plt.yscale('log')
plt.legend(loc='upper right')
plt.xlabel("Read Length")
plt.title("Read Length Distribution for FWD and REV")
plt.savefig('fox_rldist.png')