#!/bin/bash

#  Stitch file back together
cat chunk_* > reconstructed.bed

#  Filter out SNPs
awk '($3 - $2) > 1' reconstructed.bed > filtered_ssvs.bed
