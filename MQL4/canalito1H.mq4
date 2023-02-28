//+------------------------------------------------------------------+
//|                                                        conct.mq4 |
//|                                                    Measured-risk |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Measured-risk"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

#include <mt4R.mqh>

extern string R_command = "C:\Program Files\R\R-3.5.1\bin\i386\Rterm.exe --no-save";
extern int R_debuglevel = 2;
int Serre; int magic; double VelaOpen; double accBala1h; double VelaOpen2; double accountBalance; double Adios = 0.01; double PricePromStdV = 0; double PriceProm2StdV = 0; double PriceProm3StdV = 0; double PriceProm4StdV = 0; double PriceProm5StdV = 0;
double PriceProm6StdV = 0; double PriceProm7StdV = 0; double PriceProm8StdV = 0; double PriceProm9StdV = 0; double PriceProm10StdV = 0; double PriceProm11StdV = 0; double PriceProm12StdV = 0; double PriceProm13StdV = 0; double PriceProm14StdV = 0;double PriceProm15StdV = 0; double PriceProm16StdV = 0;
double PriceProm17StdV = 0; double PriceProm18StdV = 0; double PriceProm19StdV = 0; double PriceProm20StdV = 0; double PriceProm21StdV = 0; double PriceProm22StdV = 0; double PriceProm23StdV = 0; double PriceProm24StdV = 0; double PriceProm25StdV = 0; 
double PriceStdV = 0; double Price1StdV = 0; double Price2StdV = 0; double Price3StdV = 0; double Price4StdV = 0; double Price5StdV = 0; double Price6StdV = 0; double Price7StdV = 0; double Price8StdV = 0; double Price9StdV = 0; double Price10StdV = 0; double Price11StdV = 0; double Price12StdV = 0; double Price13StdV = 0;
double Price14StdV = 0; double Price15StdV = 0; double Price16StdV = 0; double Price17StdV = 0; double Price18StdV = 0; double Price19StdV = 0; double Price20StdV = 0; double Price21StdV = 0; double Price22StdV = 0; double Price23StdV = 0; double Price24StdV = 0; double Price25StdV = 0;
bool CoInVel = true; bool VeInVel = true; bool CoAl38 = true; bool VeAl38 = true; bool PrintTV = false; bool PrintTC = false;
bool GapKids  = true; bool SPREAD = true; bool Patitas1 = true; bool Patitas2 = true; bool Patotas = true; bool Velota = true; bool REgre = true; double Pend10 = 0;double Pend15 = 0; double Pend20 = 0; double Pend25 = 0;
double MaxStd = 0; double MaxStd1 = 0; double MaxStd2 = 0; double MaxStd3 = 0; double MaxStd4 = 0; double SlopeA = 0; double InterA = 0; double DifCar = 0; double DifCarStd = 0;
double MinStd = 0; double MinStd1 = 0; double MinStd2 = 0; double MinStd3 = 0; double MinStd4 = 0; double SlopeB = 0; double InterB = 0; double DifCab = 0; double DifCabStd = 0;
double matAudjpyC[1][10];
double matAudjpyV[1][10];
double EstAudjpy[1][4];
string audjpyV = "audjpy&V1H.csv";
int fAudjpyC;
int fAudjpyV;
string Caudjpy = "audjpy&CanalV1H.csv";
int CanAudjpy;
string Mercado; string MercadoCo;
double prediV = 0; double PrediV = 0; double prediV1 = 0; double PrediV1 = 0; double prediPrice = 0; double prediPrice1 = 0;

int OnInit()
  {
//--- create timer
   EventSetTimer(60);
   checkStatus(); checkBalance(); readMatrix(); 
   Serre = RInit(R_command, R_debuglevel);
   RExecute(Serre,"library(RSNNS)");
   RExecute(Serre,"library(RDocumentation)");
   RExecute(Serre,"library(forecast)");
   RExecute(Serre,"dataV = read.csv('C:/Users/Administrator/Desktop/audjpy&dataV1H.csv', header = TRUE)");
   RExecute(Serre,"Neuronss = 30"); RExecute(Serre,"LEarNr = 0.0015"); RExecute(Serre,"maxiter = 3000");
   RExecute(Serre,"equisV = dataV[ , -6]");
   RExecute(Serre,"yeV = dataV[ , 6]"); 
   RExecute(Serre,"equisV = data.matrix(equisV)");
   RExecute(Serre,"yeV = data.matrix(yeV)");
   RExecute(Serre,"Rsnns1V = jordan(equisV, yeV, size = c(Neuronss), maxit = maxiter, initFunc = 'JE_Weights', initFuncParams = c(1, -1, 0.3, 1, 0.5), learnFunc = 'JE_BP', learnFuncParams = c(LEarNr), updateFunc = 'JE_Order', updateFuncParams = c(0), shufflePatterns = FALSE, linOut = TRUE, inputsTest = NULL, targetsTest = NULL)");
   Print("AUDJPY red Venta lista carnal");
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   RDeinit(Serre);
   EventKillTimer();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   long volume = iVolume(Symbol(),PERIOD_M1,0);
   long volume2 = iVolume(Symbol(),PERIOD_M1,1);
   if(volume < 315 && volume2 < 315){//checa que el volumen sea menor a 300
      bool canContinue = checkStatus();//checa los horarios
      OneHour(canContinue);}
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
   
void checkBalance(){
   float hour = TimeHour(TimeGMT());
   float minute = TimeMinute(TimeGMT());
   minute = ((minute*50)/30)/100;
   hour += minute;
   if(hour < 1.5 || hour > 22){
      accountBalance = AccountBalance();
      Print("Balance ", accountBalance);
      VelaOpen = 0; VelaOpen2 = 0;
      accBala1h = 0.4;
      //accBala = NormalizeDouble(accBala,1);
      Print("AccBala1h ", accBala1h);
   }
}

void OneHour(bool canContinue){
   double macd; 
   macd = iMACD(Symbol(),60,10,18,5,PRICE_CLOSE,MODE_MAIN,0);
   double MOPen = iOpen(Symbol(),5,0); double MCLose = iClose(Symbol(),5,0);
   double MOPen1 = iOpen(Symbol(),5,1); double MCLose1 = iClose(Symbol(),5,1);
   double MOPen2 = iOpen(Symbol(),5,2); double MCLose2 = iClose(Symbol(),5,2);
   double MHIgh2 = iHigh(Symbol(),5,2); double MLOw2 = iLow(Symbol(),5,2); double MHIgh3 = iHigh(Symbol(),5,3); double MLOw3 = iLow(Symbol(),5,3);
   double MHIgh = iHigh(Symbol(),5,0); double MLOw = iLow(Symbol(),5,0);
   double MHIgh1 = iHigh(Symbol(),5,1); double MLOw1 = iLow(Symbol(),5,1);
   double Cuerpo1 = MathAbs(MOPen1 - MCLose1);
   double Cuerpo2 = MathAbs(MOPen2 - MCLose2);
   double OPen = iOpen(Symbol(),60,0); double CLose = iClose(Symbol(),60,0);
   double OPen1 = iOpen(Symbol(),60,1); double CLose1 = iClose(Symbol(),60,1);
   double OPen2 = iOpen(Symbol(),60,2); double CLose2 = iClose(Symbol(),60,2);
   double CLose3 = iClose(Symbol(),60,3); double CLose4 = iClose(Symbol(),60,4) ;double CLose5 = iClose(Symbol(),60,5); double CLose6 = iClose(Symbol(),60,6); double CLose7 = iClose(Symbol(),60,7); double CLose8 = iClose(Symbol(),60,8);
   double CLose9 = iClose(Symbol(),60,9); double CLose10 = iClose(Symbol(),60,10);double CLose11 = iClose(Symbol(),60,11); double CLose12 = iClose(Symbol(),60,12); double CLose13 = iClose(Symbol(),60,13); double CLose14 = iClose(Symbol(),60,14);
   double CLose15 = iClose(Symbol(),60,15); double CLose16 = iClose(Symbol(),60,16); double CLose17 = iClose(Symbol(),60,17); double CLose18 = iClose(Symbol(),60,18); double CLose19 = iClose(Symbol(),60,19); double CLose20 = iClose(Symbol(),60,20);
   double CLose21 = iClose(Symbol(),60,21); double CLose22 = iClose(Symbol(),60,22); double CLose23 = iClose(Symbol(),60,23); double CLose24 = iClose(Symbol(),60,24); double CLose25 = iClose(Symbol(),60,25); double CLose26 = iClose(Symbol(),60,26);
   double HIgh2 = iHigh(Symbol(),60,2); double LOw2 = iLow(Symbol(),60,2); double HIgh3 = iHigh(Symbol(),60,3); double LOw3 = iLow(Symbol(),60,3);
   double DifVelas = MathAbs(CLose1 - OPen);
   double Spread = MathAbs(Bid - Ask);
   double ind1;
   ind1 = (iSAR(Symbol(),60,0.06,0.25,1)-CLose1);
   int numberTotal = OrdersTotal(); int accountTotal = OrdersHistoryTotal();
   double Volumen1 = iVolume(Symbol(),PERIOD_H1,1);
   double volume = accBala1h;
   volume = NormalizeDouble(volume, 1);
   double VelaGrande = 1000; double VelaCanal = 1000;
   int ShiftMin = iLowest(Symbol(),60,MODE_LOW,50,0);
   double valorMin = Low[ShiftMin];
   int ShiftMax = iHighest(Symbol(),60,MODE_HIGH,50,0);
   double valorMax = High[ShiftMax];
   int ShiftMinCo = iLowest(Symbol(),60,MODE_LOW,30,20);
   double valorMinCo = Low[ShiftMinCo];
   int ShiftMaxCo = iHighest(Symbol(),60,MODE_HIGH,30,20);
   double valorMaxCo = High[ShiftMaxCo];
   int ShiftMinCo2 = iLowest(Symbol(),60,MODE_LOW,20,10);
   double valorMinCo2 = Low[ShiftMinCo2];
   int ShiftMaxCo2 = iHighest(Symbol(),60,MODE_HIGH,20,10);
   double valorMaxCo2 = High[ShiftMaxCo2];
   int ShiftMinCo1 = iLowest(Symbol(),60,MODE_LOW,10,0);
   double valorMinCo1 = Low[ShiftMinCo1];
   int ShiftMaxCo1 = iHighest(Symbol(),60,MODE_HIGH,10,0);
   double valorMaxCo1 = High[ShiftMaxCo1];
   int ShiftMinCo3 = iLowest(Symbol(),60,MODE_LOW,40,30);
   double valorMinCo3 = Low[ShiftMinCo3];
   int ShiftMaxCo3 = iHighest(Symbol(),60,MODE_HIGH,40,30);
   double valorMaxCo3 = High[ShiftMaxCo3];
   double DifFibo = valorMax-valorMin;
   double PrValMinV = Bid - valorMin;
   double PorFiboV = (PrValMinV/DifFibo)*100;
   if(ShiftMax > ShiftMin){
      Mercado= "Abajo";
   }else{
      Mercado= "Arriba";
   }if(ShiftMaxCo > ShiftMinCo){
      MercadoCo= "Abajo";
   }else{
      MercadoCo= "Arriba";
   }
   if(magic == 0){
      magic = 904; 
   }
   double DifTiempo;
   float OpenHour = TimeHour(TimeGMT()); float minute = TimeMinute(TimeGMT());
   minute = ((minute*50)/30)/100; 
   OpenHour += minute;
   if(minute<=0.01&&minute>0.003){DifTiempo=0.01;} else if(minute>0.01 && minute<0.0835){DifTiempo=minute;} else if(minute>=0.0835 && minute<0.167){DifTiempo=(minute-0.0835);}
   else if(minute>=0.167 && minute<0.25){DifTiempo=(minute-0.167);} else if(minute>=0.25 && minute<0.3335){DifTiempo=(minute-0.25);}
   else if(minute>=0.3335 && minute<0.4167){DifTiempo=(minute-0.3335);} else if(minute>=0.4167 && minute<0.5){DifTiempo=(minute-0.4167);}
   else if(minute>0.5 && minute<0.584){DifTiempo=(minute-0.5);} else if(minute>=0.584 && minute<0.667){DifTiempo=(minute-0.584);}
   else if(minute>=0.667 && minute<0.75){DifTiempo=(minute-0.667);} else if(minute>=0.75 && minute<0.8334){DifTiempo=(minute-0.75);}
   else if(minute>=0.8334 && minute<0.917){DifTiempo=(minute-0.8334);} else if(minute>=0.917 && minute<0.999){DifTiempo=(minute-0.917);}else{}
   if(DifTiempo < 0.01)
    DifTiempo = 0.01;
   DifTiempo = NormalizeDouble(DifTiempo,9); 
   double MatrixV[1][5]; 
   double MatrixR10[1][10]; double MatrixR15[1][15]; double MatrixR20[1][20]; double MatrixR25[1][5];
   double MatrixA10[1][4]; double MatrixB10[1][4]; 
   //VENTA
   double Volumen1StdV = 0; double macdStdV = 0; double ind1StdV = 0; double PorFiboStdV = 0; 
   //COMPRA
   double Volumen1StdC = 0; double macdStdC = 0; double ind1StdC = 0; double PorFiboStdC = 0; 
   bool resultCheckOrders = checkOrders(numberTotal, accountTotal, PricePromStdV);
   if(canContinue)
      if(resultCheckOrders){
         //ESTANDARIZAR   
         //VENTA
         PriceStdV = ((Bid - matAudjpyV[0][5])/matAudjpyV[0][0]); PriceStdV = NormalizeDouble(PriceStdV, 9); Price1StdV = ((CLose2 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price1StdV = NormalizeDouble(Price1StdV, 9);
         Price2StdV = ((CLose3 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price2StdV = NormalizeDouble(Price2StdV, 9); Price3StdV = ((CLose4 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price3StdV = NormalizeDouble(Price3StdV, 9);
         Price4StdV = ((CLose5 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price4StdV = NormalizeDouble(Price4StdV, 9); Price5StdV = ((CLose6 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price5StdV = NormalizeDouble(Price5StdV, 9);
         Price6StdV = ((CLose7 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price6StdV = NormalizeDouble(Price6StdV, 9); Price7StdV = ((CLose8 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price7StdV = NormalizeDouble(Price7StdV, 9);
         Price8StdV = ((CLose9 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price8StdV = NormalizeDouble(Price8StdV, 9); Price9StdV = ((CLose10 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price9StdV = NormalizeDouble(Price9StdV, 9);
         Price10StdV = ((CLose11 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price10StdV = NormalizeDouble(Price10StdV, 9); Price11StdV = ((CLose12 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price11StdV = NormalizeDouble(Price11StdV, 9);
         Price12StdV = ((CLose13 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price12StdV = NormalizeDouble(Price12StdV, 9); Price13StdV = ((CLose14 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price13StdV = NormalizeDouble(Price13StdV, 9);
         Price14StdV = ((CLose15 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price14StdV = NormalizeDouble(Price14StdV, 9); Price15StdV = ((CLose16 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price15StdV = NormalizeDouble(Price15StdV, 9);
         Price16StdV = ((CLose17 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price16StdV = NormalizeDouble(Price16StdV, 9); Price17StdV = ((CLose18 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price17StdV = NormalizeDouble(Price17StdV, 9);
         Price18StdV = ((CLose19 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price18StdV = NormalizeDouble(Price18StdV, 9); Price19StdV = ((CLose20 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price19StdV = NormalizeDouble(Price19StdV, 9);
         Price20StdV = ((CLose21 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price20StdV = NormalizeDouble(Price20StdV, 9); Price21StdV = ((CLose22 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price21StdV = NormalizeDouble(Price21StdV, 9);
         Price22StdV = ((CLose23 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price22StdV = NormalizeDouble(Price22StdV, 9); Price23StdV = ((CLose24 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price23StdV = NormalizeDouble(Price23StdV, 9);
         Price24StdV = ((CLose25 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price24StdV = NormalizeDouble(Price24StdV, 9); Price25StdV = ((CLose26 - matAudjpyV[0][5])/matAudjpyV[0][0]); Price25StdV = NormalizeDouble(Price25StdV, 9);
         PricePromStdV = ((PriceStdV+Price1StdV+Price2StdV)/3); PriceProm2StdV = ((Price1StdV+Price2StdV+Price3StdV)/3); PriceProm3StdV = ((Price2StdV+Price3StdV+Price4StdV)/3); PriceProm4StdV = ((Price3StdV+Price4StdV+Price5StdV)/3); PriceProm5StdV = ((Price4StdV+Price5StdV+Price6StdV)/3); PriceProm6StdV = ((Price5StdV+Price6StdV+Price7StdV)/3);
         PriceProm7StdV = ((Price6StdV+Price7StdV+Price8StdV)/3); PriceProm8StdV = ((Price7StdV+Price8StdV+Price9StdV)/3); PriceProm9StdV = ((Price8StdV+Price9StdV+Price10StdV)/3); PriceProm10StdV = ((Price9StdV+Price10StdV+Price11StdV)/3); PriceProm11StdV = ((Price10StdV+Price11StdV+Price12StdV)/3); PriceProm12StdV = ((Price11StdV+Price12StdV+Price13StdV)/3);
         PriceProm13StdV = ((Price12StdV+Price13StdV+Price14StdV)/3); PriceProm14StdV = ((Price13StdV+Price14StdV+Price15StdV)/3); PriceProm15StdV = ((Price14StdV+Price15StdV+Price16StdV)/3); PriceProm16StdV = ((Price15StdV+Price16StdV+Price17StdV)/3); PriceProm17StdV = ((Price16StdV+Price17StdV+Price18StdV)/3); PriceProm18StdV = ((Price17StdV+Price18StdV+Price19StdV)/3);
         PriceProm19StdV = ((Price18StdV+Price19StdV+Price20StdV)/3); PriceProm20StdV = ((Price19StdV+Price20StdV+Price21StdV)/3); PriceProm21StdV = ((Price20StdV+Price21StdV+Price22StdV)/3); PriceProm22StdV = ((Price21StdV+Price22StdV+Price23StdV)/3); PriceProm23StdV = ((Price22StdV+Price23StdV+Price24StdV)/3); PriceProm24StdV = ((Price23StdV+Price24StdV+Price25StdV)/3);
         Volumen1StdV = ((Volumen1 - matAudjpyV[0][6])/matAudjpyV[0][1]); Volumen1StdV = NormalizeDouble(Volumen1StdV, 9);
         macdStdV = ((macd - matAudjpyV[0][7])/matAudjpyV[0][2]); macdStdV = NormalizeDouble(macdStdV, 9);
         ind1StdV = ((ind1 - matAudjpyV[0][8])/matAudjpyV[0][3]); ind1StdV = NormalizeDouble(ind1StdV, 9);
         PorFiboStdV = ((PorFiboV - matAudjpyV[0][9])/matAudjpyV[0][4]); PorFiboStdV = NormalizeDouble(PorFiboStdV, 9);
         MaxStd1 = ((valorMaxCo1 - matAudjpyV[0][5])/matAudjpyV[0][0]); MaxStd1 = NormalizeDouble(MaxStd1, 9); MaxStd2 = ((valorMaxCo2 - matAudjpyV[0][5])/matAudjpyV[0][0]); MaxStd2 = NormalizeDouble(MaxStd2, 9); 
         MaxStd3 = ((valorMaxCo - matAudjpyV[0][5])/matAudjpyV[0][0]); MaxStd3 = NormalizeDouble(MaxStd3, 9); MaxStd4 = ((valorMaxCo3 - matAudjpyV[0][5])/matAudjpyV[0][0]); MaxStd4 = NormalizeDouble(MaxStd4, 9);
         MinStd1 = ((valorMinCo1 - matAudjpyV[0][5])/matAudjpyV[0][0]); MinStd1 = NormalizeDouble(MinStd1, 9); MinStd2 = ((valorMinCo2 - matAudjpyV[0][5])/matAudjpyV[0][0]); MinStd2 = NormalizeDouble(MinStd2, 9);
         MinStd3 = ((valorMinCo - matAudjpyV[0][5])/matAudjpyV[0][0]); MinStd3 = NormalizeDouble(MinStd3, 9); MinStd4 = ((valorMinCo3 - matAudjpyV[0][5])/matAudjpyV[0][0]); MinStd4 = NormalizeDouble(MinStd4, 9);
         //Asigna a Matrix
         MatrixV[0][0] = PricePromStdV; MatrixV[0][1] = Volumen1StdV; MatrixV[0][2] = macdStdV; MatrixV[0][3] = ind1StdV; MatrixV[0][4] = PorFiboStdV;
         MatrixR10[0][0] = PriceProm9StdV; MatrixR10[0][1] = PriceProm8StdV; MatrixR10[0][2] = PriceProm7StdV; MatrixR10[0][3] = PriceProm6StdV; MatrixR10[0][4] = PriceProm5StdV; MatrixR10[0][5] = PriceProm4StdV; MatrixR10[0][6] = PriceProm3StdV; MatrixR10[0][7] = PriceProm2StdV; MatrixR10[0][8] = PricePromStdV; 
         MatrixR15[0][0] = PriceProm14StdV; MatrixR15[0][1] = PriceProm13StdV; MatrixR15[0][2] = PriceProm12StdV; MatrixR15[0][3] = PriceProm11StdV; MatrixR15[0][4] = PriceProm10StdV; MatrixR15[0][5] = PriceProm9StdV; MatrixR15[0][6] = PriceProm8StdV; MatrixR15[0][7] = PriceProm7StdV; MatrixR15[0][8] = PriceProm6StdV; MatrixR15[0][9] = PriceProm5StdV; MatrixR15[0][10] = PriceProm4StdV; MatrixR15[0][11] = PriceProm3StdV; MatrixR15[0][12] = PriceProm2StdV; MatrixR15[0][13] = PricePromStdV;       
         MatrixR20[0][0] = PriceProm19StdV; MatrixR20[0][1] = PriceProm18StdV; MatrixR20[0][2] = PriceProm17StdV; MatrixR20[0][3] = PriceProm16StdV; MatrixR20[0][4] = PriceProm15StdV; MatrixR20[0][5] = PriceProm14StdV; MatrixR20[0][6] = PriceProm13StdV; MatrixR20[0][7] = PriceProm12StdV; MatrixR20[0][8] = PriceProm11StdV; MatrixR20[0][9] = PriceProm10StdV; MatrixR20[0][10] = PriceProm9StdV; MatrixR20[0][11] = PriceProm8StdV; MatrixR20[0][12] = PriceProm7StdV; MatrixR20[0][13] = PriceProm6StdV; MatrixR20[0][14] = PriceProm5StdV; MatrixR20[0][15] = PriceProm4StdV; MatrixR20[0][16] = PriceProm3StdV; MatrixR20[0][17] = PriceProm2StdV; MatrixR20[0][18] = PricePromStdV;
         MatrixR25[0][0] = PriceProm4StdV; MatrixR25[0][1] = PriceProm3StdV; MatrixR25[0][2] = PriceProm2StdV; MatrixR25[0][3] = PricePromStdV;
         MatrixA10[0][0] = MaxStd1; MatrixA10[0][1] = MaxStd2; MatrixA10[0][2] = MaxStd3; MatrixA10[0][3] = MaxStd4; 
         MatrixB10[0][0] = MinStd1; MatrixB10[0][1] = MinStd2; MatrixB10[0][2] = MinStd3; MatrixB10[0][3] = MinStd4;
         //Condicion Velota
         if((MHIgh2 - MLOw2) >= VelaGrande || (MHIgh1 - MLOw1) >= VelaGrande || (MLOw - MHIgh) >= VelaGrande){Velota = false;} else{Velota = true;}
         //Condicion GAP Kids
         if(DifVelas > (15*Point)){
            if(GapKids)
             Print ("Hubo Gap Kids ", Symbol());
            GapKids = false;
         }else{GapKids = true;}
         //Condicion SPREAD
         if(Spread > (80*Point)){
            if(SPREAD)
             SPREAD = false;
         }else{SPREAD = true;}
         //Condicion PATOTAS
         if(MOPen1 >= MCLose1){
            if((MCLose1 - MLOw1) >= Cuerpo1 || (MHIgh1 - MOPen1) >= Cuerpo1){Patitas1 = false;} else{Patitas1 = true;}
         }else{if((MOPen1 - MLOw1) >= Cuerpo1 || (MHIgh1 - MCLose1) >= Cuerpo1){Patitas1 = false;} else{Patitas1 = true;}
         }if(MOPen2 >= MCLose2){
            if((MCLose2 - MLOw2) >= Cuerpo2 || (MHIgh2 - MOPen2) >= Cuerpo2){Patitas2 = false;} else{Patitas2 = true;}
         }else{if((MOPen2 - MLOw2) >= Cuerpo2 || (MHIgh2 - MCLose2) >= Cuerpo2){Patitas2 = false;} else{Patitas2 = true;}
         }if(!Patitas1 && !Patitas2){
            if(Patotas)
             Print("Hay patotas ", Symbol());
            Patotas = false;
         }else{Patotas = true;}
         
         //CALCULO LINEA REGRESIVA (OPEN A CADA TIEMPO)
         //Cambios de Vela
         if(VelaOpen != OPen){
            prediV1 = prediV;
            RAssignMatrix(Serre, "MatrixV1", MatrixV, 1, 5);
            RExecute(Serre, "colnames(MatrixV1)<-c('MM','Volumen1Std', 'macdStd', 'ind1Std', 'PorFiboStd')");
            RExecute(Serre, "MatrixV1 = data.frame(MatrixV1)");
            RExecute(Serre, "predV1 = predict(Rsnns1V, MatrixV1)");
            prediV = RGetDouble(Serre, "predV1");
            //10
            MatrixR10[0][9] = prediV;
            RAssignMatrix(Serre, "Data101", MatrixR10, 10, 1);
            RExecute(Serre, "Tiempo10 = matrix(1:10)");
            RExecute(Serre, "Rlin101 = lm(Data101 ~ Tiempo10)");
            RExecute(Serre, "Slope101 = coef(Rlin101)[2]");
            Pend10 = RGetDouble(Serre, "Slope101");
            //15
            MatrixR15[0][14] = prediV;
            RAssignMatrix(Serre, "Data151", MatrixR15, 15, 1);
            RExecute(Serre, "Tiempo15 = matrix(1:15)");
            RExecute(Serre, "Rlin151 = lm(Data151 ~ Tiempo15)");
            RExecute(Serre, "Slope151 = coef(Rlin151)[2]");
            Pend15 = RGetDouble(Serre, "Slope151");
            //20
            MatrixR20[0][19] = prediV;
            RAssignMatrix(Serre, "Data201", MatrixR20, 20, 1);
            RExecute(Serre, "Tiempo20 = matrix(1:20)");
            RExecute(Serre, "Rlin201 = lm(Data201 ~ Tiempo20)");
            RExecute(Serre, "Slope201 = coef(Rlin201)[2]");
            Pend20 = RGetDouble(Serre, "Slope201");
            //25
            MatrixR25[0][4] = prediV;
            RAssignMatrix(Serre, "Data251", MatrixR25, 5, 1);
            RExecute(Serre, "Tiempo25 = matrix(1:5)");
            RExecute(Serre, "Rlin251 = lm(Data251 ~ Tiempo25)");
            RExecute(Serre, "Slope251 = coef(Rlin251)[2]");
            Pend25 = RGetDouble(Serre, "Slope251");
            //CANAL ARRIBA
            RAssignMatrix(Serre, "DataA1", MatrixA10, 4, 1);
            RExecute(Serre, "TiempoA = matrix(1:4)");
            RExecute(Serre, "RlinA1 = lm(DataA1 ~ TiempoA)");
            RExecute(Serre, "SlopeA1 = coef(RlinA1)[2]");
            RExecute(Serre, "InterA1 = coef(RlinA1)[1]");
            SlopeA = RGetDouble(Serre, "SlopeA1");
            InterA = RGetDouble(Serre, "InterA1");
            MaxStd = (5*SlopeA) + InterA;           
            //CANAL ABAJO
            RAssignMatrix(Serre, "DataB1", MatrixB10, 4, 1);
            RExecute(Serre, "TiempoB = matrix(1:4)");
            RExecute(Serre, "RlinB1 = lm(DataB1 ~ TiempoB)");
            RExecute(Serre, "SlopeB1 = coef(RlinB1)[2]");
            RExecute(Serre, "InterB1 = coef(RlinB1)[1]");
            SlopeB = RGetDouble(Serre, "SlopeB1");
            InterB = RGetDouble(Serre, "InterB1");
            MinStd = (5*SlopeB) + InterB; 
            prediPrice1 = prediPrice;            
            prediPrice = (3*prediV) - PriceStdV - Price1StdV;
            DifCar = MaxStd - PriceStdV;
            DifCab = PriceStdV - MinStd;
            DifCarStd = ((DifCar - EstAudjpy[0][1])/EstAudjpy[0][0]); DifCarStd = NormalizeDouble(DifCarStd, 9);
            DifCabStd = ((DifCab - EstAudjpy[0][3])/EstAudjpy[0][1]); DifCabStd = NormalizeDouble(DifCabStd, 9);
            Print("DifCarStd ", DifCarStd);
            Print("DifCabStd ", DifCabStd);
            VelaOpen = OPen; VeAl38 = true;
            
            Print("MMAtemp ", PricePromStdV, " DifMM ", (PriceProm2StdV-PricePromStdV), " Predi ", prediV, " DifPred ", (prediV1-prediV), " PrediPrice ", prediPrice, " DifPrediPrice ", (prediPrice1-prediPrice));
            Print("Pend5 ", Pend25, " Pend10 ", Pend10, " DifMax ", DifCar, " DifMin ", DifCab, " DifMax2 ", (DifCar*DifCar), " DifMin2 ", (DifCab*DifCab));
         }
         
         //VENTA 
         if(VeAl38 && Velota && SPREAD && GapKids){
         //Vende al 50% de vela
            if(PrintTV){
               PrintTV = false; VelaOpen2 = MOPen;
               /*Print("PriceBid ", Bid, " PriceAsk ", Ask, " PriceBid1 ", OPen1, " PriceBid2 ", OPen2, " Mercado largo ", Mercado, " Mercado corto ", MercadoCo, " Volumen1 ", Volumen1, " Macd ", macd, " Ind1 ", ind1, " PorFibo ", PorFiboV);
               Print("MMBidStdAp ", PricePromStdV, " DifMM ", (PriceProm2StdV-PricePromStdV), " BidStdAp ", PriceStdV, " Bid1StdAp ", Price1StdV, " Bid2StdAp ", Price2StdV, " Volumen1StdV ", Volumen1StdV, " macdStdV ", macdStdV, " ind1StdV ", ind1StdV, " PorFiboStdV ", PorFiboStdV);
               Print("PrediMMBid1H ", prediV, " PrediMMBid5 ", PrediV, " PrediMMBid1hA ", prediV1, " PrediMMBid5A ", PrediV1, " PrediPrice ", prediPrice, " Pend10 ", Pend10, " Pend15 ", Pend15, " Pend20 ", Pend20, " Pend25 ", Pend25);
               Print("DifMax ", DifCar, " DifMin ", DifCab, " DifMax2 ", (DifCar*DifCar), " DifMin2 ", (DifCab*DifCab), " DifPred ", (prediV1-prediV));*/
            }
            if(prediV1 > prediV && DifCarStd < -0.5){
               double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
               double price = Bid;
               double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.5,MODE_UPPER,0);
               stoploss = NormalizeDouble(stoploss, Digits);
               double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.5,MODE_LOWER,0);
               takeprofit = NormalizeDouble(takeprofit, Digits);
               int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"My order SELL",magic,0,clrGreen);
               if(ticket<0){
                  Print("OrderSend failed with error #",GetLastError());
                  PrintTV = false;
               }else{
                 Print("Vende ", "PrediPrice1 ", prediPrice1, " > ", prediPrice, " PrediPrice");
                 Print("Macd ", macd, " PriceAsk ", Ask, " PriceBid ", Bid, " Mercado largo ", Mercado, " Mercado corto ", MercadoCo, " Volumen1 ", Volumen1, " Ind1 ", ind1, " PorFibo ", PorFiboV);
                 VeAl38 = false; VelaOpen2 = MOPen; 
                 magic = OrdersTotal() + OrdersHistoryTotal() + 1;
               }
            }else if(prediV1 < prediV && DifCabStd < -0.5){
               double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
               double price = Ask;
               double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.5,MODE_LOWER,0);
               stoploss = NormalizeDouble(stoploss, Digits);
               double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.5,MODE_UPPER,0);
               takeprofit = NormalizeDouble(takeprofit, Digits);
               int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"My order BUY ",magic,0,clrGreen);
               if(ticket<0){
                 Print("OrderSend failed with error #",GetLastError());
                 PrintTC = false;
               }else{
                 Print("Compra ", "PrediPrice1 ", prediPrice1, " < ", prediPrice, " PrediPrice");
                 Print("Macd ", macd, " PriceAsk ", Ask, " PriceBid ", Bid, " Mercado largo ", Mercado, " Mercado corto ", MercadoCo, " Volumen1 ", Volumen1, " Ind1 ", ind1, " PorFibo ", PorFiboV);
                 VeAl38 = false; VelaOpen2 = MOPen;
                 magic = OrdersTotal() + OrdersHistoryTotal() + 1;
               }
            }
         }else{}
        }        
}   
bool checkStatus()
  {
   float hour = TimeHour(TimeGMT());
   float minute = TimeMinute(TimeGMT());
   minute = ((minute*50)/30)/100;
   hour += minute;
   string symbol = Symbol();
   //return false; 
  
   /*if (hour > 19){
      return false;
   }else*/
   
   if(symbol == "AUDJPY&"){
      if(hour>1.5 && hour<19){
         return true;
      }
   }
   return false;
  }
bool checkOrders(int numberTotal, int accountTotal, double PricePromStdV){
   bool stopScript = false; long vol = iVolume(Symbol(),PERIOD_M1,0); int Magic = (numberTotal+accountTotal+2);
   for(int i = 0; i < numberTotal; i++){
     if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){ 
      Print("No las seleciona, el error: ",GetLastError());
      continue;}
     int diferenceTime = (TimeCurrent() - OrderOpenTime()); float hour = TimeHour(TimeGMT()); float minute = TimeMinute(TimeGMT()); minute = ((minute*50)/30)/100;
     hour += minute;
     double volume = OrderLots();
     //GUERRA
     /*if(OrderType() == OP_BUY){
        OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
     }else if(OrderType() == OP_SELL){
        OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
     }ExpertRemove();*/
     
     /*if(hour >= 20){
         Print("Despues de las 8 GMT en viernes - orden ", OrderTicket());
         if(OrderType() == OP_BUY){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
         }else if(OrderType() == OP_SELL){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
         }
     }else */if(hour >= 21.8){
         Print("Despues de las 20:50 de GMT - orden ", OrderTicket());
         if(OrderType() == OP_BUY){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
         }else if(OrderType() == OP_SELL){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
         }
     }else if(checkHoursSymbol(OrderSymbol())){
         Print("Por el horario - orden ", OrderTicket());
         if(OrderType() == OP_BUY){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
         }else if(OrderType() == OP_SELL){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
         }
     }else /*if((accountBalance - AccountEquity()) >= (accountBalance*Adios)){
         Print("Por el account profit ", (accountBalance-AccountEquity()), " >= ", (accountBalance*Adios));
         if(OrderType() == OP_BUY){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
         }else if(OrderType() == OP_SELL){
            OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
         }
     }else*/{} 
     if(OrderLots() == accBala1h){
        for(int j = 0; j < 906; j++){
          if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
             if(diferenceTime >= 3600){
                Print("Se acabo el tiempo");
                if(OrderType() == OP_BUY){
                   OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
                   Print("Cierra compra al Bid ", Bid, " Ask ", Ask, " Profit ", OrderProfit());
                }else if(OrderType() == OP_SELL){
                   OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
                   Print("Cierra venta al Ask ", Ask, " Bid ", Bid, " Profit ", OrderProfit());
                }
             }
          }
        }
     }
   }if(vol > 320){return false;}
   //if((accountBalance - AccountEquity()) >= (accountBalance*Adios)){stopScript = true;}
   if(stopScript){
      Print("Adios ", Symbol());
      ExpertRemove(); 
   }
   return true;
}

bool checkHoursSymbol(string symbol){
   float hour = TimeHour(TimeGMT()); float minute = TimeMinute(TimeGMT()); minute = ((minute*50)/30)/100; hour += minute;
   if(symbol == "AUDJPY&"){if(hour<1.5 || hour>=21.8){return true;}}else{}
   return false;
}

void readMatrix(){
   /*ResetLastError();
   fAudjpyC = FileOpen(audjpyC,FILE_READ|FILE_CSV|FILE_ANSI,",");
   if(fAudjpyC<0){Print("Failed to open the file by the absolute path ",fAudjpyC);Print("Error code ",GetLastError());}
   else{double value; int xi = 0;
      while(!FileIsEnding(fAudjpyC)){value=FileReadNumber(fAudjpyC); matAudjpyC[0][xi] = value; xi++;}     
      FileClose(fAudjpyC);}*/
   ResetLastError();
   fAudjpyV = FileOpen(audjpyV,FILE_READ|FILE_CSV|FILE_ANSI,",");
   if(fAudjpyV<0){Print("Failed to open the file by the absolute path ",fAudjpyV);Print("Error code ",GetLastError());}
   else{double value; int xi = 0;
      while(!FileIsEnding(fAudjpyV)){value=FileReadNumber(fAudjpyV); matAudjpyV[0][xi] = value; xi++;}     
      FileClose(fAudjpyV);}     
    ResetLastError();
   CanAudjpy = FileOpen(Caudjpy,FILE_READ|FILE_CSV|FILE_ANSI,",");
   if(CanAudjpy<0){Print("Failed to open the file by the absolute path ",CanAudjpy);Print("Error code ",GetLastError());}
   else{double value; int xi = 0;
      while(!FileIsEnding(CanAudjpy)){value=FileReadNumber(CanAudjpy); EstAudjpy[0][xi] = value; xi++;}     
      FileClose(CanAudjpy);}
}  