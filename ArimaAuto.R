library(RDocumentation)
library(ggplot2)
library(forecast)
library(plot3Drgl)


##LAZARUS
nn.data =  read.csv('C:/Users/User/Desktop/redes/audjpy&dataV1h.csv', header = TRUE)

plot(nn.data$MM)

scatter3Drgl(x = nn.data$MMOpen, y = nn.data$PorFiboStd, z = nn.data$BIEN)

##ARMIA


#nn.data =  read.csv('C:/Users/user/Desktop/PRONO/gbpauds.csv', header = TRUE)
y = data.matrix(nn.data$MM); colnames(y) = c("TARGET")
auto.arima(y, seasonal = TRUE)

fit<-auto.arima(y)
tsdisplay(residuals(fit), lag.max=45, main='(0,0,0) Model Residuals')


#fcast = forecast(fit, h = 3); fcast
#plot(fcast)

##AJUSTAR A LAS PATAS!!!
##2, 5, 8

model = arima(y
              , order = c(0,0,3)
              )

fcast2 = forecast(model, h = 2); fcast2
plot(fcast2)

