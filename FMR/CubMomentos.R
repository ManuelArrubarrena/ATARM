library(Cubist)

#C:/Users/User/Desktop/5minR2.csv

nn.data =  read.csv('C:/Users/user/Desktop/Audjpy&Momenkk30.csv', header = TRUE)#Audjp&momen15Momen15.csv
Dati = 35
n=nrow(nn.data); filas = (n-Dati); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
train.X= train.n[1:filas, -4]; train.Y = train.n[1:filas, 4];train.X = data.matrix(train.X);train.Y = data.matrix(train.Y)
test.X= test.n[1: nrow(test.n), -4]; test.Y = test.n[1: nrow(test.n), 4];test.X = data.matrix(test.X);test.Y = data.matrix(test.Y)

model_tree <- cubist(x = train.X, y = train.Y, committees = 30)
model_tree
summary(model_tree)

Dat = 9
oob.err = double(Dat);test.err = double(Dat);min = double(Dat);max = double(Dat);tabla = matrix(2,2)
for(mtry in 1:Dat){
  pred=predict(model_tree, test.X, neighbors = mtry)
  #oob.err[mtry] = mean(fit$err.rate[,1])
  Yhatrsnnc = double(Dati)
  for(i in 1:Dati){
    Yhatrsnnc[i] = ifelse(pred[i] > 0.5, "1","0")
  }
  tabla = with(test.n, table(Yhatrsnnc, TARGET))
  #test.err[mtry] = sum(fit$confusion[,3])
  #tabla = with(test.n, table(pred, TARGET))
  min[mtry] = tabla[2,1] + tabla[1,2]
  max[mtry] = tabla[2,2] + tabla[1,1]
  cat(mtry," ")
}
#matplot(1:mtry,cbind(test.err,oob.err),pch=19,col=c("red","blue"),type="b",ylab="Mean Squared Error");legend("topright",legend=c("Test","OOB"),pch=19,col=c("red","blue"))
matplot(1:mtry,cbind(min,max),pch=19,col=c("red","blue"),type="b",ylab="TP")


###PROBAR

model_tree_pred <- predict(model_tree, test.X, neighbors = 6)

Yhatrsnnc = double(Dati)
for(i in 1:Dati){
  Yhatrsnnc[i] = ifelse(model_tree_pred[i] > 0.5, "1","0")
}
Yhatrsnnc
model_tree_pred
tablon2.1 = with(test.n, table(Yhatrsnnc, TARGET));tablon2.1
