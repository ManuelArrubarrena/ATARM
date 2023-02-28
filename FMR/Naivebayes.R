library(e1071)

nn.data =  read.csv('C:/Users/User/Desktop/newrobo/audjpyNew.csv', header = TRUE)
n=nrow(nn.data); filas = (n-1); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
model = naiveBayes(factor(P) ~ ., data = train.n)
model

preds <- predict(model, newdata = test.n)

preds
tablon = with(test.n, table(preds, P));tablon


############PRICE ACTION######################

nn.data =  read.csv('C:/Users/User/Desktop/newrobo/usdmxnpav.csv', header = TRUE)
n=nrow(nn.data); filas = (n-120); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
model = naiveBayes(factor(P) ~ ., data = train.n)
model

preds <- predict(model, newdata = test.n)

preds
tablon = with(test.n, table(preds, P));tablon
