#!/bin/bash

#  Extract cCRE IDs from allcCRE.txt (skip header)
echo "Extracting cCRE IDs from allcCRE.txt..."
tail -n +2 allcCRE.txt | cut -d ',' -f1 > ccre_ids.txt

#  Filter for elements that are CTCF-bound using V2.hg38-cCREs-Final.bed
echo "Filtering for CTFC-bound elements..."
awk '$6 ~ /(CTCF-bound|CTCF-only)/' V2.hg38-cCREs-Final.bed > ctcf_elements.bed

#  Match allcCRE.txt to filtered cCREs
echo "Matching cCRE IDs..."
awk -v OFS='\t' 'FNR==NR {ids[$1]; next} ($5 in ids)' ccre_ids.txt ctcf_elements.bed > filtered_cCREs.bed
echo "Common elements saved to filtered_cCREs.bed"

#  Cleanup intermediate files
rm ccre_ids.txt ctcf_elements.bed

#  Extract matched cCRE IDs to .txt
cut -f5 filtered_cCREs.bed | sort -u > filtered_names.txt
echo "Matched cCRE IDs saved to filtered_names.txt"

# Output number of matched cCREs
num_matches=$(wc -l < filtered_names.txt)  # Counts lines in filtered_names.txt
echo "Number of matched cCREs: $num_matches"
