library(RDocumentation)
require(gbm)  #AL FINALLL

nn.data =  read.csv('C:/Users/user/Desktop/newrobo/audjpyNew.csv', header = TRUE)
n=nrow(nn.data); filas = (n-15); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 


#shrinkage

test.err = double(10)
min = double(10)
max = double(10)
tabla = matrix(2,2)
y=0
for(x in  seq(from = 0.01, to = 0.1, by = 0.01)){
  fit=boost.audnzd = gbm(P ~.,data = train.n
                         , distribution = "bernoulli", n.trees = 3000, shrinkage = x, interaction.depth = 5)
  predu = plogis(predict(boost.audnzd, newdata = test.n, n.trees = 3000))
  pred=ifelse(predu >0.5,"1","0")
  tabla = with(test.n, table(pred, P))
  y=y+1
  
  test.err[y] = sum(fit$confusion[,3])
  min[y] = tabla[2,1] + tabla[1,2]
  max[y] = tabla[2,2] + tabla[1,1]
  cat(y," ")
}
matplot(1:10,cbind(min,max),pch=19,col=c("red","blue"),type="b",ylab="TP")
min
max

#numero de arboles
boost.audnzd = gbm(P ~.,data = train.n
, distribution = "bernoulli", n.trees = 5000, shrinkage = 0.03, interaction.depth = 2, cv.folds = 5, n.cores = 1)
bestTree = gbm.perf(boost.audnzd)
 boost.audnzd
summary(boost.audnzd)


#depth
test.errori = double(9)
mini = double(9)
maxi = double(9)
tablai = matrix(2,2)
yi=0
for(xi in  seq(from=1, to=9, by = 1)){
  fit=boost.audnzd = gbm(P ~.,data = train.n
                         , distribution = "bernoulli", n.trees = 3000, shrinkage = 0.12, interaction.depth = xi)
  predui = plogis(predict(boost.audnzd, newdata = test.n, n.trees = 3000))
  predii=ifelse(predui >0.5,"1","0")
  tablai = with(test.n, table(predii, P))
  yi=yi+1
  test.errori[yi] = sum(fit$confusion[,3])
  mini[yi] = tablai[2,1] + tablai[1,2]
  maxi[yi] = tablai[2,2] + tablai[1,1]
  cat(yi," ")
}
matplot(1:9,cbind(mini,maxi),pch=19,col=c("red","blue"),type="b",ylab="TP")
mini
maxi


#comprobar
comprueba = gbm(BIEN ~.,data = train.n
                   , distribution = "bernoulli", n.trees = 3000, shrinkage = 0.1, interaction.depth = 4)
predictiti = plogis(predict(comprueba, newdata = test.n, n.trees = 3000))
gbm.pred=ifelse(predictiti >0.5,"1","0")
tabla1 = with(test.n, table(gbm.pred, BIEN));tabla1


nn.data =  read.csv('C:/Users/User/Desktop/AudJpy&Momen15.csv', header = TRUE)
n=nrow(nn.data); filas = (n-60); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 

LogitReg = glm(TARGET ~.,data = train.n, family = binomial(link = "logit"))

results.1 = predict(LogitReg, newdata = test.n, type = "response")
results.2 = ifelse(results.1 >0.5,"1","0");results.2
tabla2 = with(test.n, table(results.2, TARGET));tabla2


