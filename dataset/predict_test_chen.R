test_response=c(rep(1,418),rep(0,418))
g=2^-5
c=2^1
pred_value=numeric(836)
system(paste('~/libsvm/svm-train -g',g,'-c',c,'coding_train_chen chen_model'))
v=system(paste('~/libsvm/svm-predict coding_test_chen chen_model chen_output|grep -v ^Accuracy'),intern=TRUE)
pred_value=as.numeric(v)
write(paste(test_response,pred_value,sep='\t'),file='chen_test_score',sep='\n')

