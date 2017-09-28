library(randomForest)
group=scan('fold')
response=as.factor(c(rep(1,2100),rep(0,2100)))
d1<-read.csv('coding_train_ksnpf',header=F,stringsAsFactors=F)
d1=d1[4:ncol(d1)]
score=rep(0,nrow(d1))
for(i in 1:5){
	model=randomForest(x=d1[group!=i,],y=response[group!=i],ntree=1000,norm.votes=F)
	pred=predict(model,d1[group==i,],type='prob')
	score[group==i]=pred[,2]
}
write(score,file='ksnpf_cv_score',sep='\n',quote=F,row.names=F,col.names=F)
