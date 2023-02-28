library(party)

nn.data =  read.csv('C:/Users/User/Desktop/AudJpy&cub30.csv', header = TRUE)
n=nrow(nn.data); filas = (n-27); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 


#minsplit

test.err = double(5)
min = double(5)
max = double(5)
tabla = matrix(2,2)
y=0
for(x in  seq(from = 20, to = 60, by = 10)){
  fit = ctree(TARGET ~.,data = train.n
                         , controls = ctree_control(minsplit=x, minbucket=10, maxdepth=5))
  predu = predict(fit, newdata = test.n)
  pred=ifelse(predu >0.5,"1","0")
  tabla = with(test.n, table(pred, TARGET))
  y=y+1
  
 # test.err[y] = sum(fit$confusion[,3])
  #ifelse(dim(tabla) < 3, min[y] = tabla[1,1] + tabla[1,2] max[y] = tabla[1,2] + tabla[1,1],  min[y] = tabla[2,1] + tabla[1,2] max[y] = tabla[2,2] + tabla[1,1])
  min[y] =  tabla[1,2] #+ tabla[2,1] 
  max[y] =  tabla[1,1] #+ tabla[2,2] 
  cat(y," ")
}
matplot(1:5,cbind(min,max),pch=19,col=c("red","blue"),type="b",ylab="TP")
min
max

#minbucket

test.err = double(5)
min = double(5)
max = double(5)
tabla = matrix(2,2)
y=0
for(x in  seq(from = 10, to = 50, by = 10)){
  fit = ctree(TARGET ~.,data = train.n
                           , controls = ctree_control(minsplit=30, minbucket=x, maxdepth=5))
  predu = predict(fit, newdata = test.n)
  pred=ifelse(predu >0.5,"1","0")
  tabla = with(test.n, table(pred, TARGET))
  y=y+1
  
  # test.err[y] = sum(fit$confusion[,3])
  #ifelse(dim(tabla) < 3, min[y] = tabla[1,1] + tabla[1,2] max[y] = tabla[1,2] + tabla[1,1],  min[y] = tabla[2,1] + tabla[1,2] max[y] = tabla[2,2] + tabla[1,1])
  min[y] =  tabla[1,2] #+ tabla[2,1] 
  max[y] =  tabla[1,1] #+ tabla[2,2] 
  cat(y," ")
}
matplot(1:5,cbind(min,max),pch=19,col=c("red","blue"),type="b",ylab="TP")
min
max

#depth

test.err = double(10)
min = double(10)
max = double(10)
tabla = matrix(2,2)
y=0
for(x in  seq(from = 1, to = 10, by = 1)){
  fit = ctree(TARGET ~.,data = train.n
                           , controls = ctree_control(minsplit=30, minbucket=10, maxdepth=x))
  predu = predict(fit, newdata = test.n)
  pred=ifelse(predu >0.5,"1","0")
  tabla = with(test.n, table(pred, TARGET))
  y=y+1
  
  # test.err[y] = sum(fit$confusion[,3])
  #ifelse(dim(tabla) < 3, min[y] = tabla[1,1] + tabla[1,2] max[y] = tabla[1,2] + tabla[1,1],  min[y] = tabla[2,1] + tabla[1,2] max[y] = tabla[2,2] + tabla[1,1])
  min[y] =  tabla[1,2] #+ tabla[2,1] 
  max[y] =  tabla[1,1] #+ tabla[2,2] 
  cat(y," ")
}
matplot(1:10,cbind(min,max),pch=19,col=c("red","blue"),type="b",ylab="TP")
min
max

#comprobar
fit = ctree(TARGET ~.,data = train.n
            , controls = ctree_control(minsplit=30, minbucket=10, maxdepth=5))
predu = predict(fit, newdata = test.n)
gbm.pred=ifelse(predu >0.5,"1","0")
tabla1 = with(test.n, table(gbm.pred, TARGET));tabla1


nn.data =  read.csv('C:/Users/User/Desktop/AudJpy&Momen15.csv', header = TRUE)
n=nrow(nn.data); filas = (n-60); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 

LogitReg = glm(TARGET ~.,data = train.n, family = binomial(link = "logit"))

results.1 = predict(LogitReg, newdata = test.n, type = "response")
results.2 = ifelse(results.1 >0.5,"1","0");results.2
tabla2 = with(test.n, table(results.2, TARGET));tabla2


