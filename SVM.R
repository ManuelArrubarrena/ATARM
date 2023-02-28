require(e1071)

nn.data =  read.csv('C:/Users/user/Desktop/newrobo/audjpyNew.csv', header = TRUE)
n=nrow(nn.data); filas = (n-17); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 

tune.out = tune(svm, factor(P) ~ ., data = train.n, kernel = "radial", ranges = list(cost=c(0.1,0.3,0.5,0.8,1,1.5,1.8), gamma=c(0.2,0.5,0.8,1,1.2,1.8)))
tune.out

svmfit = svm(factor(P) ~ ., data = train.n, kernel = "radial", gamma = 0.2, cost = 0.1 
             # , type = 'C-classification'
             )
svmfit

predSVM = predict(svmfit, newdata = test.n)
tabla = with(test.n, table(predSVM, P));tabla

#tabla = with(audjpyPredVePr, table(pred, PROFIT))
#table(true = audjpyPredVePr$PROFIT, predSVM = predict(svmfit, newdata = audjpyPredVePr))






##SEASONS
ts.audcad = (audjpy5m.V$OpenHourStd)
plot(ts.audcad, ylab="Price", type= "o", pch= "20")

class(ts.audcad)
str(ts.audcad)
start(ts.audcad); end(ts.audcad); frequency(ts.audcad)
ts.decompose = decompose(ts.audcad, type = "multiplicative")
