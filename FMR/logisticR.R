
nn.data =  read.csv('C:/Users/user/Desktop/newrobo/audjpyNew.csv', header = TRUE)
Dati = 11
"n=nrow(nn.data); filas = (n-Dati); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
train.X= train.n[1:filas, -4]; train.Y = train.n[1:filas, 4];train.X = data.matrix(train.X);train.Y = data.matrix(train.Y)
test.X= test.n[1: nrow(test.n), -4]; test.Y = test.n[1: nrow(test.n), 4];test.X = data.matrix(test.X);test.Y = data.matrix(test.Y)
"
n=nrow(nn.data); filas = (n-Dati); train.n = nn.data[1:filas, ]; test.n = nn.data[(filas + 1): n, ] 
train.X= train.n[1:filas, -1]; train.Y = train.n[1:filas, 1];train.X = data.matrix(train.X);train.Y = data.matrix(train.Y)
test.X= test.n[1: nrow(test.n), -1]; test.Y = test.n[1: nrow(test.n), 1];test.X = data.matrix(test.X);test.Y = data.matrix(test.Y)
test.Y
test.X

Lr <- glm(P ~ ., data = train.n, family = "binomial")

summary(Lr)

glm.probs <- predict(Lr, type = "response", newdata = test.n)
glm.pred <- ifelse(glm.probs > 0.5, 1, 0)
table(glm.pred, test.Y)
