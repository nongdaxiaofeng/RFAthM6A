# RFAthM6A
RFAthM6A is a tool for predicting m6A sites in Arabidopsis thaliana.

1. Prerequisites to use RFAthM6A

Python3 is installed in the computer. R software is installed in the computer. The R package randomForest is installed. 

If randomForest is not installed, you can run this command in R:
>install.packages('randomForest')

2. Use well-trained models to predict m6A sites in Arabidopsis thaliana.

First, prepare the exon sequence file in fasta format and the exon sequence should only contain letters 'A', 'T', 'C' and 'G'. We used the file 'test.fasta' as an example to illustrate the prediction process. Run the following command to find the 'RRACH' motif, which are saved to the file 'test_site'.

>python find_site.py test.fasta test_site

Run the following command to predict m6A sites by RFPSNSP model and the prediction scores are saved to the file 'psnsp_score'.

>Rscript predict_by_psnsp.R test_site psnsp_score

Run the following command to predict m6A sites by RFPSDSP model and the prediction scores are saved to the file 'psdsp_score'.

>Rscript predict_by_psdsp.R test_site psdsp_score

Use the following commands to do the KSNPF encoding and predicting.

>python ks.py test_site test_ks

>Rscript predict_by_ksnpf.R test_ks ksnpf_score

Use the following commands to do the KNF encoding and predicting.

>python knf.py test_site test_knf

>Rscript predict_by_knf.R test_knf knf_score

3.Repeat the work of the paper and build your own prediction models

The 'dataset_sourcecode' directory includes the datasets and sourcecodes metioned in the paper "RFAthM6A: a new tool for predicting m6A sites in Arabidopsis thaliana" (unpublished). Making use of the files in the directory, one can repeat the main work in the paper, including feature encoding, 5-fold cross validation and independent test for different methods. This directory also include the rules we extracted from the random forest models. 
