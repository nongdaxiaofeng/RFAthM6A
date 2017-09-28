library(randomForest)
response=as.factor(c(rep(1,2100),rep(0,2100)))
testresponse=as.factor(c(rep(1,418),rep(0,418)))
d1<-read.csv('coding_train_knf',header=F,stringsAsFactors=F)
d1=d1[4:ncol(d1)]
testd1<-read.csv('coding_test_knf',header=F,stringsAsFactors=F)
testd1=testd1[4:ncol(testd1)]
score=rep(0,nrow(testd1))
model=randomForest(x=d1,y=response,ntree=1000,norm.votes=F)
pred=predict(model,testd1,type='prob')
score=pred[,2]
write(score,file='knf_test_score',sep='\n')

