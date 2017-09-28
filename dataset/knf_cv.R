library(pROC)
library(randomForest)
group=scan('fold')
response=as.factor(c(rep(1,2100),rep(0,2100)))
d<-read.csv('coding_train_knf',header=F,stringsAsFactors=F)
score=numeric(nrow(d))
for(i in 1:5){
	model=randomForest(x=d[group!=i,4:ncol(d)],y=response[group!=i],ntree=1000,norm.votes=F)
	pred=predict(model,d[group==i,4:ncol(d)],type='prob')
	score[group==i]=pred[,2]
}
write(score,file='knf_cv_score',sep='\n')
