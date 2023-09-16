#!/usr/bin/env python

# file_path = "/projects/bgmp/ebart/bioinfo/Bi621/PS/PS8/align1Aligned.out.sam"

def is_mapped(flag):
    return (flag & 4) != 4

mapped_reads = 0
unmapped_reads = 0

with open("/projects/bgmp/ebart/bioinfo/Bi623/QAA/star_align/align_foxAligned.out.sam", 'r') as samfile:
    for line in samfile:
        if line.startswith('@'): #make sure its pulling the reads not all the fluff in the beginning
            continue

        fields = line.strip().split('\t')
        flag = int(fields[1])
        if (flag & 256) != 256:
            if is_mapped(flag):
                mapped_reads += 1
            else:
                unmapped_reads += 1
print(f'"Mapped Reads:"{mapped_reads}\n"Unmapped Reads:"{unmapped_reads}')