library(randomForest)
d=read.csv('trainset',header=F,stringsAsFactors=F)
group=scan('fold')
response=as.factor(c(rep(1,2100),rep(0,2100)))
score=numeric(nrow(d))
for(i in 1:5){
	m1=matrix(0,4,99)
	rownames(m1)=c('A','T','C','G')
	m2=matrix(0,4,99)
	rownames(m2)=c('A','T','C','G')
	d1=d[group!=i,]
	for(r in 1:nrow(d1)){
		m=matrix(0,4,99)
		rownames(m)=c('A','T','C','G')
		exon=unlist(strsplit(d1[r,4],''))
		exon=exon[-(51:52)]
		for(p in 1:length(exon)){
			if(exon[p]!='N'){
				m[exon[p],p]=1
			}
		}
		if(d1[r,3]==1){
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
	model=randomForest(x=coding[group!=i,],y=response[group!=i],ntree=1000,norm.votes=F)
	pred=predict(model,coding[group==i,],type='prob')
	score[group==i]=pred[,2]
	
}
write(score,file='psnsp_cv_score',sep='\n')
