library(randomForest)
d=read.csv('trainset',header=F,stringsAsFactors=F)
d1=read.csv('testset',header=F,stringsAsFactors=F)
response=as.factor(c(rep(1,2100),rep(0,2100)))
testresponse=as.factor(c(rep(1,418),rep(0,418)))
m1=matrix(0,4,99)
rownames(m1)=c('A','T','C','G')
m2=matrix(0,4,99)
rownames(m2)=c('A','T','C','G')
for(r in 1:nrow(d)){
	m=matrix(0,4,99)
	rownames(m)=c('A','T','C','G')
	exon=unlist(strsplit(d[r,4],''))
	exon=exon[-(51:52)]
	for(p in 1:length(exon)){
		if(exon[p]!='N'){
			m[exon[p],p]=1
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
coding=matrix(0,nr=4200,nc=99)
for(r in 1:nrow(d)){
	s=substring(d[r,4],c(1:50,53:101),c(1:50,53:101))
	for(p in 1:length(s)){
		if(s[p]!='N'){
			coding[r,p]=m[s[p],p]
		}
	}
}
model=randomForest(x=coding,y=response,ntree=1000,norm.votes=F)
testcoding=matrix(0,nr=nrow(d1),nc=99)
for(r in 1:nrow(d1)){
	s=substring(d1[r,4],c(1:50,53:101),c(1:50,53:101))
	for(p in 1:length(s)){
		if(s[p]!='N'){
			testcoding[r,p]=m[s[p],p]
		}
	}
}
pred=predict(model,testcoding,type='prob')
score=pred[,2]
write(score,file='psnsp_test_score',sep='\n')
