library(pROC)
ksscore=scan('ksnpf_test_score')
dpscore=scan('psdsp_test_score')
kmscore=scan('knf_test_score')
score=0.2*ksscore+0.35*dpscore+0.45*kmscore
write(score,file='combine_test_score',sep='\n')
