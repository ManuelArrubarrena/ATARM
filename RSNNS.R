#install RSNNS package
#install.packages("Metrics")
library(RSNNS)
library(Metrics)
library(RDocumentation)
library(forecast)

#DATA
nn.data =  read.csv('C:/Users/User/Desktop/redes/audjpy&dataV1h.csv', header = TRUE)
n=nrow(nn.data); filas = (n-20); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
train.X= train.n[1:filas, -6]; train.Y = train.n[1:filas, 6];train.X = data.matrix(train.X);train.Y = data.matrix(train.Y)
test.X= test.n[1: nrow(test.n), -6]; test.Y = test.n[1: nrow(test.n), 6];test.X = data.matrix(test.X);test.Y = data.matrix(test.Y)


### CORRECCION

Neuronss = 20
LEarNr = 0.0018
maxiter = 2800


NeuralRSNNS = jordan(train.X, train.Y, size = c(Neuronss), maxit = maxiter,
                     initFunc = "JE_Weights", initFuncParams = c(1, -1, 0.3, 1, 0.5),
                     learnFunc = "JE_BP", learnFuncParams = c(LEarNr), updateFunc = "JE_Order",
                     updateFuncParams = c(0), shufflePatterns = FALSE, linOut = TRUE,
                     inputsTest = NULL, targetsTest = NULL)

plotIterativeError(NeuralRSNNS)
plotRegressionError(train.Y, NeuralRSNNS$fitted.values)
#plotRegressionError(test.Y, NeuralRSNNS$fittedTestValues)
hist(NeuralRSNNS$fitted.values - train.Y, col="lightblue")

predicciones=predict(NeuralRSNNS,test.X)
emse=mse(predicciones, test.Y);emse
tablarnnp = cbind(predicciones, test.Y)
matplot(1:20,tablarnnp,pch=19,col=c("red","blue"),type="b",ylab="TP", xlab = "Lr--e10")



##CALIBRAR
Neuronss = 20
maxiter = 5500
LEarNr = 0.008
Yhatrsnn = double(70)
tablaRs = list(48)
MeanSq = double(48)
k=1

for(xi in seq(3000, maxiter, by=500)){
  for(xl in seq(0.001, LEarNr, by=0.001)){
    NeuralRSNNS = jordan(train.X, train.Y, size = c(Neuronss), maxit = xi,
                         initFunc = "JE_Weights", initFuncParams = c(1, -1, 0.3, 1, 0.5),
                         learnFunc = "JE_BP", learnFuncParams = c(xl), updateFunc = "JE_Order",
                         updateFuncParams = c(0), shufflePatterns = FALSE, linOut = TRUE,
                         inputsTest = NULL, targetsTest = NULL)
    predicciones = predict(NeuralRSNNS,test.X)
    for(i in 1:70){
      Yhatrsnn[i] = predicciones[i] 
    }
    tablaRs[[k]] = cbind(predicciones, test.Y)
    k=k+1
  }
}
tablaRs[[1]]
matplot(1:80,tablaRs[[2]],pch=19,col=c("red","blue"),type="b",ylab="price", xlab = "time")
for(j in 1:48){
  MeanSq[j] = mse(test.Y, tablaRs[[j]][,1])
}
matplot(1:16,MeanSq[1:16],pch=19,col=c("red","blue"),type="b",ylab="mse", xlab = "num")
matplot(1:48,MeanSq,pch=19,col=c("red","blue"),type="b",ylab="mse", xlab = "num")
MeanSq[37]

##PF VS PRICE
pricepr = cbind(test.X[,1],test.Y)
matplot(1:200,pricepr,pch=19,col=c("red","blue"),type="b",ylab="price", xlab = "time")


##PROBAR con error
tiempo= matrix(1:70)
lms = cbind(tiempo, test.Y)
dim(tiempo)
linear = lm(test.Y ~ tiempo)
pp = data.frame(2:71)
?predict
summ=coef(linear);summ
predi = predict(linear, pp);predi
linea = abline(linear)
slope = coef(linear)[2];slope

matplot(1:70,test.Y,pch=19,col=c("red","blue"),type="b",ylab="TP", xlab = "Lr--e10")
linea = abline(linear)

comblin
linear
plot(lms)

times= tslm(PROFIT ~ MM, train.n)



prediccionescor = double(70)
errorprom = double(70)
errip = 0

for(i in 1:70){
    kki=test.X[i ,]
    kkt = data.frame(t(kki))
    errorprom[i]= predict(NeuralRSNNS,kkt)
    erri= abs((test.Y[i] - errorprom[i]))
    errip = errip + erri
  }

errpo = errip / 70



##TANTEO, promedio y DE
prediccionescor = double(70)
#Msecor = double(8)
#tablacor = list(8)

  for(i in 1:70){
    
    if(i==1){
      kki=test.X[i ,]
      kkt = data.frame(t(kki))
      prediccionescor[i]= predict(NeuralRSNNS,kkt)
    }
    
    if(i>1){
    kkc=test.X[(i-1) ,]
    kktc = data.frame(t(kkc))
    prediccionescor[i]=predict(NeuralRSNNS,kktc)
    err= (test.Y[i-1] - prediccionescor[i])
      if(abs(err)>errpo){
        if(err > 0){
          kkc=test.X[i ,]
          kktc = data.frame(t(kkc))
            if(kktc[1]>1.6){
              prediccionescor[i]=(predict(NeuralRSNNS,kktc) + (errpo/3))
            }else{
              prediccionescor[i]=(predict(NeuralRSNNS,kktc) + (errpo/10)) 
            }
        }
        if(err < 0){
          kkc=test.X[i ,]
          kktc = data.frame(t(kkc))
            if(kktc[1]<(-1.6)){
              prediccionescor[i]=(predict(NeuralRSNNS,kktc) - (errpo/3))
            }else{
              prediccionescor[i]=(predict(NeuralRSNNS,kktc) - (errpo/10)) 
            }
        }
      }
      if(abs(err)<errpo){
        kkc=test.X[i ,]
        kktc = data.frame(t(kkc))
        prediccionescor[i]=(predict(NeuralRSNNS,kktc) + (err/3))
      }
    }
  }
 
  tablarnn1 = cbind(prediccionescor, test.Y)
  matplot(1:70,tablarnn1,pch=19,col=c("red","blue"),type="b",ylab="TP", xlab = "Lr--e10")
  

  Yhatrsnn= double (200)
  for(i in 1:200){
    Yhatrsnn[i]= predicciones[i] 
  }

tablarnn = cbind(Yhatrsnn, test.Y)
matplot(1:200,tablarnn,pch=19,col=c("red","blue"),type="b",ylab="TP", xlab = "Lr--e10")

test.Y[,1]
test.X[190 ,]

##SIMPLE PROMEDIO
prediccionescor = double(200)
for(i in 1:200){
  
  if(i==1){
    kki=test.X[i ,]
    kkt = data.frame(t(kki))
    prediccionescor[i]= predict(NeuralRSNNS,kkt)
  }
  
  if(i>1){
    kkc=test.X[(i-1) ,]
    kktc = data.frame(t(kkc))
    prediccionescor[i]=predict(NeuralRSNNS,kktc)
    if((test.Y[i-1] - prediccionescor[i])>0){
      #err= (test.Y[i-1] - prediccionescor[i])/5
      kkc=test.X[i ,]
      kktc = data.frame(t(kkc))
      prediccionescor[i]=(predict(NeuralRSNNS,kktc) + errpo)
    }
    if((test.Y[i-1] - prediccionescor[i])<0){
      #err= (test.Y[i-1] - prediccionescor[i])/5
      kkc=test.X[i ,]
      kktc = data.frame(t(kkc))
      prediccionescor[i]=(predict(NeuralRSNNS,kktc) - errpo)
    }
  }
}

tablarnn1 = cbind(prediccionescor, test.Y)
matplot(1:200,tablarnn1,pch=19,col=c("red","blue"),type="b",ylab="TP", xlab = "Lr--e10")


#MOVER PROFIT SI CAMBIAN CANTIDAD DE VARIABLES
#PROFIT = test.n[1:200 nrow(test.n), 6];tabla = with(test.n, table(Yhatrsnn, PROFIT));tabla
testi.X = double(20)
testi.X[1] = test.X[30]
for(i in 2:20){
  predicciones=predict(NeuralRSNNS,testi.X[i-1])
  testi.X[i]= predicciones 
}

tablarnew = cbind(testi.X, test.Y[30:49])
matplot(1:200,test.Y,pch=19,col=c("red","blue"),type="b",ylab="TP", xlab = "Lr--e10")


