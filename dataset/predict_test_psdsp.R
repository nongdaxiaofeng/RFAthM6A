library(randomForest)
d=read.csv('trainset',header=F,stringsAsFactors=F)
d1=read.csv('testset',header=F,stringsAsFactors=F)
response=as.factor(c(rep(1,2100),rep(0,2100)))
testresponse=as.factor(c(rep(1,418),rep(0,418)))
dn=as.vector(outer(c('A','T','C','G'),c('A','T','C','G'),'paste',sep=''))
m1=matrix(0,16,100)
rownames(m1)=dn
m2=matrix(0,16,100)
rownames(m2)=dn
for(r in 1:nrow(d)){
	m=matrix(0,16,100)
	rownames(m)=dn
	exon=d[r,4]
	for(p in 1:(nchar(exon)-1)){
		if(substr(exon,p,p)!='N' && substr(exon,p+1,p+1)!='N'){
			m[substr(exon,p,p+1),p]=1
		}
	}
	if(d[r,3]==1){
		m1=m1+m
	}else{
		m2=m2+m
	}
}
m1=sweep(m1,2,apply(m1,2,sum),'/')
m2=sweep(m2,2,apply(m2,2,sum),'/')
m=m1-m2
coding=matrix(0,nr=4200,nc=100)
for(r in 1:nrow(d)){
	s=d[r,4]
	for(p in 1:(nchar(s)-1)){
		if(substr(s,p,p)!='N' && substr(s,p+1,p+1)!='N'){
			coding[r,p]=m[substr(s,p,p+1),p]
		}
	}
}
coding=coding[,-51]
model=randomForest(x=coding,y=response,ntree=1000,norm.votes=F)
testcoding=matrix(0,nr=nrow(d1),nc=100)
for(r in 1:nrow(d1)){
	s=d1[r,4]
	for(p in 1:(nchar(s)-1)){
		if(substr(s,p,p)!='N' && substr(s,p+1,p+1)!='N'){
			testcoding[r,p]=m[substr(s,p,p+1),p]
		}
	}
}
testcoding=testcoding[,-51]
pred=predict(model,testcoding,type='prob')
score=pred[,2]

write(score,file='psdsp_test_score',sep='\n')
