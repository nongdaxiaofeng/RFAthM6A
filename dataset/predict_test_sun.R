test_response=c(rep(1,418),rep(0,418))
g=2^-8
c=2^5
pred_value=numeric(836)
system(paste('~/libsvm/svm-train -g',g,'-c',c,'coding_train_sun sun_model'))
v=system(paste('~/libsvm/svm-predict coding_test_sun sun_model sun_output|grep -v ^Accuracy'),intern=TRUE)
pred_value=as.numeric(v)
write(paste(test_response,pred_value,sep='\t'),file='sun_test_score',sep='\n')