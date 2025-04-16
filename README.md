# BINF6310_FinalProject

V2 Encode CCREs downloaded from:  
https://github.com/weng-lab/ENCODE-cCREs/blob/master/Version-2/cCRE-Pipeline/Annotations/V2.hg38-cCREs-Final.bed.gz

filter_ccres.sh finds common elements between allcCRE.txt and V2 ENCODE CCREs that are proximal and CTCF-bound. It then cross-references the resulting set with elements in filtered_cCREs_brain.bed, and outputs tissue_cCREs.bed
