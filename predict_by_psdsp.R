arg=commandArgs(TRUE)
library(randomForest)
d1=read.csv(arg[1],header=F,stringsAsFactors=F)
load('psdsp.RData')
m=psdsp
testcoding=matrix(0,nr=nrow(d1),nc=100)
for(r in 1:nrow(d1)){
	s=d1[r,3]
	for(p in 1:(nchar(s)-1)){
		if(is.element(substr(s,p,p),c('A','T','C','G')) && is.element(substr(s,p+1,p+1),c('A','T','C','G'))){
			testcoding[r,p]=m[substr(s,p,p+1),p]
		}
	}
}
testcoding=testcoding[,-51]
pred=predict(psdsp_model,testcoding,type='prob')
write.table(cbind(d1[,1:2],pred[,2]),file=arg[2],sep='\t',row.names=F,col.names=F,quote=F)
