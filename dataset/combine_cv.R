library(pROC)
ksscore=scan('ksnpf_cv_score')
dpscore=scan('psdsp_cv_score')
kmscore=scan('knf_cv_score')
score=0.2*ksscore+0.35*dpscore+0.45*kmscore
write(score,file='combine_cv_score',sep='\n')
