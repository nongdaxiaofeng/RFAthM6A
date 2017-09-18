# RFAthM6A
RFAthM6A is a tool for predicting m6A sites in Arabidopsis thaliana.

1. Prerequisites to use RFAthM6A

Python3 is installed in the computer. R software is installed in the computer. The R package randomForest is installed. 

If randomForest is not installed, you can run this command in R:
>install.packages('randomForest')

2. Use well-trained models to predict m6A sites in Arabidopsis thaliana.

First, prepare the exon sequence file in fasta format and the exon sequence should only contain letters 'A', 'T', 'C' and 'G'. 'test.fasta' is an example file of exon sequences in fasta format.

>
