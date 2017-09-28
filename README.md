# RFAthM6A
RFAthM6A is a tool for predicting m6A sites in Arabidopsis thaliana.

1. Prerequisites to use RFAthM6A

Python3 is installed in the computer. R software is installed in the computer. The R package randomForest is installed. 

If randomForest is not installed, you can run this command in R:
>install.packages('randomForest')

2. Use well-trained models to predict m6A sites in Arabidopsis thaliana.

First, enter into the directory where the scripts are placed and prepare the exon sequence file in fasta format and the exon sequence should only contain letters "A", "T", "C" and "G". We used the file 'test.fasta' as an example to illustrate the prediction process. Run the following command to find the "RRACH" motif, which are saved to the file "test_site".

>python find_site.py test.fasta test_site

Run the following command to predict m6A sites by RFPSNSP model and the prediction scores are saved to the file "psnsp_score".

>Rscript predict_by_psnsp.R test_site psnsp_score

Run the following command to predict m6A sites by RFPSDSP model and the prediction scores are saved to the file "psdsp_score".

>Rscript predict_by_psdsp.R test_site psdsp_score

Use the following commands to do the KSNPF encoding and RFKSNPF predicting.

>python ks.py test_site test_ks

>Rscript predict_by_ksnpf.R test_ks ksnpf_score

Use the following commands to do the KNF encoding and RFKNF predicting.

>python knf.py test_site test_knf

>Rscript predict_by_knf.R test_knf knf_score

Use the following commands to combine the prediction scores of RFPSDSP, RFKSNPF and RFKNF and save the results to the file "combine_score".

>Rscript RFCombine.R psdsp_score ksnpf_score knf_score score

All the score files contain 3 columns. The first column is the name of the test sequence. The second column is the position of the "RRACH" motif in the sequence. The second column is the prediction score. The prediction score is between 0 and 1, and can be considered as the predictive probability to be m6A.

3.Repeating the work of the paper and building your own prediction models

The "dataset" directory includes the datasets and sourcecodes metioned in the paper "RFAthM6A: a new tool for predicting m6A sites in Arabidopsis thaliana" (unpublished). Making use of the files in the directory and according to the introduction of the Readme file in the directory, one can repeat the main work in the paper, including feature encoding, 5-fold cross validation and independent test for different methods. This directory also includes the files of rules we extracted from the random forest models. 
