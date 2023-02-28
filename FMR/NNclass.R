library(deepnet)

nn.data =  read.csv('C:/Users/user/Desktop/newrobo/audjpyNew.csv', header = TRUE)
Dati = 21
n=nrow(nn.data); filas = (n-Dati); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
train.X= train.n[1:filas, -1]; train.Y = train.n[1:filas, 1];train.X = data.matrix(train.X);train.Y = data.matrix(train.Y)
test.X= test.n[1: nrow(test.n), -1]; test.Y = test.n[1: nrow(test.n), 1];test.X = data.matrix(test.X);test.Y = data.matrix(test.Y)
test.Y
test.X
"n=nrow(nn.data); filas = (n-Dati); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
train.X= train.n[1:filas, -5]; train.Y = train.n[1:filas, 5];train.X = data.matrix(train.X);train.Y = data.matrix(train.Y)
test.X= test.n[1: nrow(test.n), -5]; test.Y = test.n[1: nrow(test.n), 5];test.X = data.matrix(test.X);test.Y = data.matrix(test.Y)
"

neurons = 10

nn <- nn.train(train.X, train.Y, hidden = c(neurons))
yy <- nn.predict(nn, test.X)               
Yhatrsnnc = double(Dati)
for(i in 1:Dati){
  Yhatrsnnc[i] = ifelse(yy[i] > 0.5, "1","0")
}
tabla = with(test.n, table(Yhatrsnnc, P)); tabla

err <- nn.test(nn, test.X, test.Y, t=0.5); err
