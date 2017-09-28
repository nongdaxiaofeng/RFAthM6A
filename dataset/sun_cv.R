fold=scan('fold')
lines=readLines('coding_train_sun')
response=c(rep(1,2100),rep(0,2100))
g=2^-8
c=2^5
pred_value=numeric(length(lines))
for(label in 1:5){
	writeLines(lines[fold!=label],'train_temp1')
	writeLines(lines[fold==label],'test_temp1')
	system(paste('~/libsvm/svm-train -g',g,'-c',c,'train_temp1 model_temp1'))
	v=system(paste('~/libsvm/svm-predict test_temp1 model_temp1 output_temp1|grep -v ^Accuracy'),intern=TRUE)
	pred_value[fold==label]=as.numeric(v)
}
write(paste(response,pred_value,sep='\t'),file='sun_cv_score',sep='\n')
