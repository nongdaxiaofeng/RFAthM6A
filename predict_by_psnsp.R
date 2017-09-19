arg=commandArgs(TRUE)
library(randomForest)
d1=read.csv(arg[1],header=F,stringsAsFactors=F)
load('psnsp.RData')
m=psnsp
testcoding=matrix(0,nr=nrow(d1),nc=99)
for(r in 1:nrow(d1)){
	s=substring(d1[r,3],c(1:50,53:101),c(1:50,53:101))
	for(p in 1:length(s)){
		if(is.element(s[p],c('A','T','C','G'))){
			testcoding[r,p]=m[s[p],p]
		}
	}
}
pred=predict(psnsp_model,testcoding,type='prob')
score=pred[,2]
	
write.table(cbind(d1[,1:2],pred[,2]),file=arg[2],sep='\t',row.names=F,col.names=F,quote=F)
