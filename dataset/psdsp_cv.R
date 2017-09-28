library(randomForest)
d=read.csv('trainset',header=F,stringsAsFactors=F)
group=scan('fold')
response=as.factor(c(rep(1,2100),rep(0,2100)))
score=numeric(nrow(d))
dn=as.vector(outer(c('A','T','C','G'),c('A','T','C','G'),'paste',sep=''))
for(i in 1:5){
	m1=matrix(0,16,100)
	rownames(m1)=dn
	m2=matrix(0,16,100)
	rownames(m2)=dn
	d1=d[group!=i,]
	for(r in 1:nrow(d1)){
		m=matrix(0,16,100)
		rownames(m)=dn
		exon=d[r,4]
		for(p in 1:(nchar(exon)-1)){
			if(substr(exon,p,p)!='N' && substr(exon,p+1,p+1)!='N'){
				m[substr(exon,p,p+1),p]=1
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
	model=randomForest(x=coding[group!=i,],y=response[group!=i],ntree=1000,norm.votes=F)
	pred=predict(model,coding[group==i,],type='prob')
	score[group==i]=pred[,2]
	
}
write(score,file='psdsp_cv_score',sep='\n')
