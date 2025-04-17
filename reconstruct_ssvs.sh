#!/bin/bash

#  Stitch file back together
cat results_* > reconstructed.bed

#  Filter out SNPs
awk '($3 - $2) > 1' reconstructed.bed > filtered_ssvs.bed
echo "Filtered SSVs (no SNPs) saved to filtered_ssvs.bed"

#  Remove intermediate files
rm reconstructed.bed
