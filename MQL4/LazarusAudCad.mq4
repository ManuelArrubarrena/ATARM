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
//Nieveles de cierre... Por cada lote de 1: 10.5 positivo y -33 negativo. Variable "algo" multiplica el valor en base al numero de algoritmos corriendo

#include <mt4R.mqh>

extern string R_command = "C:\Program Files\R\R-3.5.1\bin\i386\Rterm.exe --no-save";
extern int R_debuglevel = 2;
double accountBalance; double VelaOpen; double VelaOpen2; double VelaOpen3; int Serre; double magic; int algoP = 2; int algoD = 1; 
double AccB = 0; double AccB1 = 0; double AccB2 = 0; double AccB3 = 0; double AccB4 = 0; double AccB5 = 0; double AccB6 = 0; double AccB7 = 0; double AccB8 = 0; double AccB9 = 0; double AccB10 = 0; double AccB11 = 0; double AccB12 = 0; double AccB13 = 0;
double Adios1 = (-19.5); double HolaBB1 = 11.5; double Adios2 = (-22.2); double HolaBB2 = 13; double Adios3 = (-25); double HolaBB3 = 14.5;

//PRO 1 
double accBala1A; double accBala1B; double accA = 1.1; double accB = 1.2;
double pond1 = ((accA+accB)/2); bool machoMenAuC1 = false; int PR1 = 0;
double Sal1 = (pond1*HolaBB3*algoP); double Pimi1 = (pond1*Adios3*algoP); 
//PRO 2
double accBala1C; double accBala1D; double accC = 1.3; double accD = 1.4;
double pond2 = ((accC+accD)/2); bool machoMenAuC2 = false; int PR2 = 0;
double Sal2 = (pond2*HolaBB3*algoP); double Pimi2 = (pond2*Adios3*algoP); 
//PRO 3
double accBala1E; double accBala1F; double accE = 1.5; double accF = 1.6;
double pond3 = ((accE+accF)/2); bool machoMenAuC3 = false; int PR3 = 0;
double Sal3 = (pond3*HolaBB3*algoP); double Pimi3 = (pond3*Adios3*algoP);
//PRO 4 
double accBala1G; double accBala1H; double accG = 1.7; double accH = 1.8;
double pond4 = ((accG+accH)/2); bool machoMenAuC4 = false; int PR4 = 0;
double Sal4 = (pond4*HolaBB3*algoP); double Pimi4 = (pond4*Adios3*algoP);
//PRO 5
double accBala1I; double accBala1J; double accI = 1.9; double accJ = 2.0;
double pond5 = ((accI+accJ)/2); bool machoMenAuC5 = false; int PR5 = 0;
double Sal5 = (pond5*HolaBB2*algoP); double Pimi5 = (pond5*Adios2*algoP);
//PRO 6 
double accBala1K; double accBala1L; double accK = 2.1; double accL = 2.2;
double pond6 = ((accK+accL)/2); bool machoMenAuC6 = false; int PR6 = 0;
double Sal6 = (pond6*HolaBB2*algoP); double Pimi6 = (pond6*Adios2*algoP); 
//DIVI 7
double accBala1M; double accM = 1; bool machoMenAuC7 = false;
double pond7 = accM; double Sal7 = (pond7*HolaBB1*algoD); double Pimi7 = (pond7*Adios1*algoD);
//DIVI 8 
double accBala1N; double accN = 0; bool machoMenAuC8 = false;
double pond8 = accN; double Sal8 = (pond8*HolaBB1*algoD); double Pimi8 = (pond8*Adios1*algoD);
//DIVI 9
double accBala1O; double accO = 0; bool machoMenAuC9 = false;
double pond9 = accO; double Sal9 = (pond9*HolaBB1*algoD); double Pimi9 = (pond9*Adios1*algoD); 
//DIVI 10
double accBala1P; double accP = 0; bool machoMenAuC10 = false;
double pond10 = accP; double Sal10 = (pond10*HolaBB2*algoD); double Pimi10 = (pond10*Adios2*algoD);
//DIVI 11
double accBala1Q; double accQ = 0; bool machoMenAuC11 = false;
double pond11 = accQ; double Sal11 = (pond11*HolaBB1*algoD); double Pimi11 = (pond11*Adios1*algoD); 
//DIVI 12
double accBala1R; double accR = 0; bool machoMenAuC12 = false;
double pond12 = accR; double Sal12 = (pond12*HolaBB1*algoD); double Pimi12 = (pond12*Adios1*algoD); 
//DIVI 13
double accBala1S; double accS = 0; bool machoMenAuC13 = false;
double pond13 = accS; double Sal13 = (pond13*HolaBB2*algoD); double Pimi13 = (pond13*Adios2*algoD);

double PricePromStdV = 0; double PriceProm2StdV = 0; double PriceProm3StdV = 0; double PriceProm4StdV = 0; double PriceProm5StdV = 0; double PriceProm6StdV = 0; double PriceProm7StdV = 0; double PriceProm8StdV = 0; double PriceProm9StdV = 0; double PriceProm10StdV = 0; double PriceProm11StdV = 0; double PriceProm12StdV = 0; double PriceProm13StdV = 0; double PriceProm14StdV = 0;double PriceProm15StdV = 0; double PriceProm16StdV = 0; double PriceProm17StdV = 0; double PriceProm18StdV = 0; double PriceProm19StdV = 0; double PriceProm20StdV = 0; double PriceProm21StdV = 0; double PriceProm22StdV = 0; double PriceProm23StdV = 0; double PriceProm24StdV = 0; double PriceProm25StdV = 0; 
double PriceStdV = 0; double Price1StdV = 0; double Price2StdV = 0; double Price3StdV = 0; double Price4StdV = 0; double Price5StdV = 0; double Price6StdV = 0; double Price7StdV = 0; double Price8StdV = 0; double Price9StdV = 0; double Price10StdV = 0; double Price11StdV = 0; double Price12StdV = 0; double Price13StdV = 0; double Price14StdV = 0; double Price15StdV = 0; double Price16StdV = 0; double Price17StdV = 0; double Price18StdV = 0; double Price19StdV = 0; double Price20StdV = 0; double Price21StdV = 0; double Price22StdV = 0; double Price23StdV = 0; double Price24StdV = 0; double Price25StdV = 0;
bool VeAl38 = true; bool calent = false; bool GapKids  = true; bool SPREAD = true; bool rubenAuC = true; bool Patitas1 = true; bool Patitas2 = true; bool Patotas = true; bool Velota = true; 
double Pend10 = 0;double Pend15 = 0; double Pend20 = 0; double Pend25 = 0; double VelaGrande = 0.0065;
double Comicha = 0; double Comicha1 = 0; double Comicha2 = 0; double Comicha3 = 0; double Comicha4 = 0; double Comicha5 = 0; double Comicha6 = 0; double Comicha7 = 0; double Comicha8 = 0; double Comicha9 = 0; double Comicha10 = 0; double Comicha11 = 0; double Comicha12 = 0; double Comicha13 = 0;
double AccE = 0; double AccE1 = 0; double AccE2 = 0; double AccE3 = 0; double AccE4 = 0; double AccE5 = 0; double AccE6 = 0; double AccE7 = 0; double AccE8 = 0; double AccE9 = 0; double AccE10 = 0; double AccE11 = 0; double AccE12 = 0; double AccE13 = 0;
double Inutil = 0; double Inutil1 = 0; double Inutil2 = 0; double Inutil3 = 0; double Inutil4 = 0; double Inutil5 = 0; double Inutil6 = 0; double Inutil7 = 0; double Inutil8 = 0; double Inutil9 = 0; double Inutil10 = 0; double Inutil11 = 0; double Inutil12 = 0; double Inutil13 = 0;
double tuti = 0; double tuti1 = 0; double tuti2 = 0; double tuti3 = 0; double tuti4 = 0; double tuti5 = 0; double tuti6 = 0; double tuti7 = 0; double tuti8 = 0; double tuti9 = 0; double tuti10 = 0; double tuti11 = 0; double tuti12 = 0; double tuti13 = 0;
double Cerrao = 0; double Cerrao1 = 0; double Cerrao2 = 0; double Cerrao3 = 0; double Cerrao4 = 0; double Cerrao5 = 0; double Cerrao6 = 0; double Cerrao7 = 0; double Cerrao8 = 0; double Cerrao9 = 0; double Cerrao10 = 0; double Cerrao11 = 0; double Cerrao12 = 0; double Cerrao13 = 0;
double PerMax = 0; double PerMax1 = 0; double PerMax2 = 0; double PerMax3 = 0; double PerMax4 = 0; double PerMax5 = 0; double PerMax6 = 0; double PerMax7 = 0; double PerMax8 = 0; double PerMax9 = 0; double PerMax10 = 0; double PerMax11 = 0; double PerMax12 = 0; double PerMax13 = 0;
double GanMax = 0; double GanMax1 = 0; double GanMax2 = 0; double GanMax3 = 0; double GanMax4 = 0; double GanMax5 = 0; double GanMax6 = 0; double GanMax7 = 0; double GanMax8 = 0; double GanMax9 = 0; double GanMax10 = 0; double GanMax11 = 0; double GanMax12 = 0; double GanMax13 = 0;
double MaxStd = 0; double MaxStd1 = 0; double MaxStd2 = 0; double MaxStd3 = 0; double MaxStd4 = 0; double SlopeA = 0; double InterA = 0; double DifCar = 0; 
double MinStd = 0; double MinStd1 = 0; double MinStd2 = 0; double MinStd3 = 0; double MinStd4 = 0; double SlopeB = 0; double InterB = 0; double DifCab = 0; 
double matAudcadC[1][10];
double matAudcadV[1][10];
string audcadV = "STDs/audcad&V1H.csv";
int fAudcadC;
int fAudcadV;
double prediV = 0; double PrediV = 0; double prediV1 = 0; double PrediV1 = 0; double prediPrice = 0; double prediPrice1 = 0; double DifMM = 0; double Difpred = 0;
double MatrixPr[1][5]; double PrediPr = 0; double prediRfA = 0; double prediCubV = 0; double prediCubC = 0; string Mercado; string MercadoCo; int Viernes = 0;
double MatrixCub[1][4]; double prediCubA = 0; double prediCubA2 = 0; double prediCubA3 = 0;
double Difpred1 = 0; double DifMM1 = 0;
int OnInit()
  {
//--- create timer
   EventSetTimer(60);
   checkStatus(); checkBalance(); readMatrix(); 
   Serre = RInit(R_command, R_debuglevel);
   RExecute(Serre,"library(RSNNS)");
   RExecute(Serre,"library(RDocumentation)");
   RExecute(Serre,"library(Cubist)");
   RExecute(Serre,"library(randomForest)");
   RExecute(Serre,"dataV = read.csv('C:/Users/Administrator/Desktop/Redes/audcad&dataV1H.csv', header = TRUE)");
   RExecute(Serre,"Neuronss = 20"); RExecute(Serre,"LEarNr = 0.0018"); RExecute(Serre,"maxiter = 3500");
   RExecute(Serre,"equisV = dataV[ , -6]");
   RExecute(Serre,"yeV = dataV[ , 6]"); 
   RExecute(Serre,"equisV = data.matrix(equisV)");
   RExecute(Serre,"yeV = data.matrix(yeV)");
   RExecute(Serre,"Rsnns1V = jordan(equisV, yeV, size = c(Neuronss), maxit = maxiter, initFunc = 'JE_Weights', initFuncParams = c(1, -1, 0.3, 1, 0.5), learnFunc = 'JE_BP', learnFuncParams = c(LEarNr), updateFunc = 'JE_Order', updateFuncParams = c(0), shufflePatterns = FALSE, linOut = TRUE, inputsTest = NULL, targetsTest = NULL)");
   Print("AUDCAD red Venta lista carnal");
   /*RExecute(Serre,"dataA = read.csv('C:/Users/Administrator/Desktop/AudCad/AudCad&RF1H.csv', header = TRUE)");
   RExecute(Serre,"RfA = randomForest(factor(TARGET) ~ .,dataA, mtry = 1, ntree = 5000)");
   Print("AUDCAD bosque listo carnal");
   RExecute(Serre,"dataCbA = read.csv('C:/Users/Administrator/Desktop/AudCad/AudCad&Cub1H.csv', header = TRUE)");
   RExecute(Serre,"XcubA = dataCbA[ , -5]");
   RExecute(Serre,"YcubA = dataCbA[ , 5]");
   RExecute(Serre,"CubA = cubist(x = XcubA, y = YcubA, committees = 30)");
   Print("AUDCAD cubist listo carnal");
   RExecute(Serre,"dataCbA2 = read.csv('C:/Users/Administrator/Desktop/AudCad/AudCad&Cub2vel1H.csv', header = TRUE)");
   RExecute(Serre,"XcubA2 = dataCbA2[ , -5]");
   RExecute(Serre,"YcubA2 = dataCbA2[ , 5]");
   RExecute(Serre,"CubA2 = cubist(x = XcubA2, y = YcubA2, committees = 30)");
   Print("AUDCAD cubist 2 velas listo carnal");
   RExecute(Serre,"dataCbA3 = read.csv('C:/Users/Administrator/Desktop/AudCad/AudCad&Cub3vel1H.csv', header = TRUE)");
   RExecute(Serre,"XcubA3 = dataCbA3[ , -5]");
   RExecute(Serre,"YcubA3 = dataCbA3[ , 5]");
   RExecute(Serre,"CubA3 = cubist(x = XcubA3, y = YcubA3, committees = 30)");
   Print("AUDCAD cubist 3 velas listo carnal");
   RExecute(Serre,"dataCA = read.csv('C:/Users/Administrator/Desktop/AudCad/AudCad&NivelC1H.csv', header = TRUE)");
   RExecute(Serre,"XcubCA = dataCA[ , -4]");
   RExecute(Serre,"YcubCA = dataCA[ , 4]");
   RExecute(Serre,"CubCA = cubist(x = XcubCA, y = YcubCA, committees = 30)");
   Print("AUDCAD cubistC listo carnal");
   RExecute(Serre,"dataVA = read.csv('C:/Users/Administrator/Desktop/AudCad/AudCad&NivelV1H.csv', header = TRUE)");
   RExecute(Serre,"XcubVA = dataVA[ , -4]");
   RExecute(Serre,"YcubVA = dataVA[ , 4]");
   RExecute(Serre,"CubVA = cubist(x = XcubVA, y = YcubVA, committees = 30)");
   Print("AUDCAD cubistV listo carnal");*/
   MatrixPr[0][0] = 0.054; MatrixPr[0][1] = 0.084; MatrixPr[0][2] = 0.057; MatrixPr[0][3] = 0.078; MatrixPr[0][4] = 0.065; 
   RAssignMatrix(Serre, "MatrixPr", MatrixPr, 1, 5);
   RExecute(Serre, "colnames(MatrixPr)<-c('MM','Volumen1Std', 'macdStd', 'ind1Std', 'PorFiboStd')");
   RExecute(Serre, "MatrixPr = data.frame(MatrixPr)");
   RExecute(Serre, "predPr = predict(Rsnns1V, MatrixPr)");
   RExecute(Serre, "predi = ifelse(predPr == 0, '-1', '1')");
   PrediPr = RGetDouble(Serre, "predi");
   Print("Prueba conex ", PrediPr);
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
      //PRO 1
      accBala1A = accA; // 1.1 Nivel venta, cierra con valores                                                 
      accBala1B = accB; // 1.2 Kaka san 3 velas     
      //PRO 2
      accBala1C = accC; // 1.3 Cubist, 3 velas      
      accBala1D = accD; // 1.4 Kaka san 3 velas 
      //PRO 3           
      accBala1E = accE; // 1.5 Cubist, 3 velas
      accBala1F = accF; // 1.6 Cubist + Goku, cierra a 1 vela o por valores                                                   
      //PRO 4
      accBala1G = accG; // 1.7 Cubist, 3 velas   
      accBala1H = accH; // 1.8 Goku Nivel, cierra por valores o 1 vela    
      //PRO 5 
      accBala1I = accI; // 1.9 Nivel venta, cierra con valores
      accBala1J = accJ; // 2.0 Goku Nivel, cierra por valores o 1 vela
      //PRO 6
      accBala1K = accK; // 2.1 Nivel venta, cierra con valores
      accBala1L = accL; // 2.2 Cubist + Goku, cierra a 1 vela o por valores 
      //DIVI 7
      accBala1M = accM; // 1 LAZARUS 
      //DIVI 8
      accBala1N = accN; // 2.4 Cubist Nivel, cierra por valores o 2 velas    
      //DIVI 9
      accBala1O = accO; // 2.5 Kaka san 3 velas  
      //DIVI 10
      accBala1P = accP; // 2.6 Nivel venta, cierra con valores
      //DIVI 11
      accBala1Q = accQ; // 2.7 Goku Nivel, cierra por valores o 1 vela
      //DIVI 12
      accBala1R = accR; // 2.8 Cubist + Goku, cierra a 1 vela o por valores
      //DIVI 13
      accBala1S = accS; // 2.9 Cubist, 3 velas
      Print("Balance ", accountBalance);
      Print("PRO 1: Adios1 ", Pimi1, " Hola1 ", Sal1, " accA ", accA, " accB ", accB);
      Print("PRO 2: Adios2 ", Pimi2, " Hola2 ", Sal2, " accC ", accC, " accD ", accD); 
      Print("PRO 3: Adios3 ", Pimi3, " Hola3 ", Sal3, " accE ", accE, " accF ", accF);
      Print("PRO 4: Adios4 ", Pimi4, " Hola4 ", Sal4, " accG ", accG, " accH ", accH);
      Print("PRO 5: Adios5 ", Pimi5, " Hola5 ", Sal5, " accI ", accI, " accJ ", accJ); 
      Print("PRO 6: Adios6 ", Pimi6, " Hola6 ", Sal6, " accK ", accK, " accL ", accL); 
      Print("DIVI 7: Adios7 ", Pimi7, " Hola7 ", Sal7, " accM ", accM);  
      Print("DIVI 8: Adios8 ", Pimi8, " Hola8 ", Sal8, " accN ", accN);  
      Print("DIVI 9: Adios9 ", Pimi9, " Hola9 ", Sal9, " accO ", accO);  
      Print("DIVI 10: Adios10 ", Pimi10, " Hola10 ", Sal10, " accP ", accP);  
      Print("DIVI 11: Adios11 ", Pimi11, " Hola11 ", Sal11, " accQ ", accQ);  
      Print("DIVI 12: Adios12 ", Pimi12, " Hola12 ", Sal12, " accR ", accR);  
      Print("DIVI 13: Adios13 ", Pimi13, " Hola13 ", Sal13, " accS ", accS); 
      Print("AccBala1A ", accBala1A, " AccBala1B ", accBala1B, " AccBala1C ", accBala1C, " AccBala1D ", accBala1D, " AccBala1E ", accBala1E, " accBala1F ", accBala1F);
      Print("AccBala1G ", accBala1G, " AccBala1H ", accBala1H, " AccBala1I ", accBala1I, " AccBala1J ", accBala1J, " AccBala1K ", accBala1K, " accBala1L ", accBala1L, " accBala1M ", accBala1M);
      Print("AccBala1N ", accBala1N, " AccBala1O ", accBala1O, " AccBala1P ", accBala1P, " AccBala1Q ", accBala1Q, " AccBala1R ", accBala1R, " AccBala1S ", accBala1S);
      VelaOpen = 0; VelaOpen2 = 0; VelaOpen3 = 0;
   }
}

void OneHour(bool canContinue){
   double macd; 
   macd = iMACD(Symbol(),60,10,18,5,PRICE_CLOSE,MODE_MAIN,0);
   double MOPen = iOpen(Symbol(),5,0); double MCLose = iClose(Symbol(),5,0); double Uopen = iOpen(Symbol(),1,0);
   double MOPen1 = iOpen(Symbol(),5,1); double MCLose1 = iClose(Symbol(),5,1);
   double MOPen2 = iOpen(Symbol(),5,2); double MCLose2 = iClose(Symbol(),5,2);
   double MHIgh = iHigh(Symbol(),5,0); double MHIgh1 = iHigh(Symbol(),5,1); double MHIgh2 = iHigh(Symbol(),5,2); double MHIgh3 = iHigh(Symbol(),5,3); double MHIgh4 = iHigh(Symbol(),5,4); double MHIgh5 = iHigh(Symbol(),5,5); double MHIgh6 = iHigh(Symbol(),5,6); double MHIgh7 = iHigh(Symbol(),5,7); double MHIgh8 = iHigh(Symbol(),5,8); double MHIgh9 = iHigh(Symbol(),5,9); double MHIgh10 = iHigh(Symbol(),5,10); double MHIgh11 = iHigh(Symbol(),5,11); double MHIgh12 = iHigh(Symbol(),5,12); double MHIgh13 = iHigh(Symbol(),5,13); double MHIgh14 = iHigh(Symbol(),5,14); double MHIgh15 = iHigh(Symbol(),5,15);  double MHIgh16 = iHigh(Symbol(),5,16); double MHIgh17 = iHigh(Symbol(),5,17); double MHIgh18 = iHigh(Symbol(),5,18); double MHIgh19 = iHigh(Symbol(),5,19); double MHIgh20 = iHigh(Symbol(),5,20); double MHIgh21 = iHigh(Symbol(),5,21); double MHIgh22 = iHigh(Symbol(),5,22); double MHIgh23 = iHigh(Symbol(),5,23);
   double MLOw = iLow(Symbol(),5,0); double MLOw1 = iLow(Symbol(),5,1); double MLOw2 = iLow(Symbol(),5,2); double MLOw3 = iLow(Symbol(),5,3); double MLOw4 = iLow(Symbol(),5,4); double MLOw5 = iLow(Symbol(),5,5); double MLOw6 = iLow(Symbol(),5,6); double MLOw7 = iLow(Symbol(),5,7); double MLOw8 = iLow(Symbol(),5,8); double MLOw9 = iLow(Symbol(),5,9); double MLOw10 = iLow(Symbol(),5,10); double MLOw11 = iLow(Symbol(),5,11); double MLOw12 = iLow(Symbol(),5,12); double MLOw13 = iLow(Symbol(),5,13); double MLOw14 = iLow(Symbol(),5,14); double MLOw15 = iLow(Symbol(),5,15); double MLOw16 = iLow(Symbol(),5,16); double MLOw17 = iLow(Symbol(),5,17); double MLOw18 = iLow(Symbol(),5,18); double MLOw19 = iLow(Symbol(),5,19); double MLOw20 = iLow(Symbol(),5,20); double MLOw21 = iLow(Symbol(),5,21); double MLOw22 = iLow(Symbol(),5,22); double MLOw23 = iLow(Symbol(),5,23);
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
   ind1 = (iSAR(Symbol(),60,0.06,0.4,1)-CLose1);
   int numberTotal = OrdersTotal(); int accountTotal = OrdersHistoryTotal();
   double Volumen1 = iVolume(Symbol(),PERIOD_H1,1);
   double volumeA = accBala1A; volumeA = NormalizeDouble(volumeA, 1);
   double volumeB = accBala1B; volumeB = NormalizeDouble(volumeB, 1);
   double volumeC = accBala1C; volumeC = NormalizeDouble(volumeC, 1);
   double volumeD = accBala1D; volumeD = NormalizeDouble(volumeD, 1);
   double volumeE = accBala1E; volumeE = NormalizeDouble(volumeE, 1);
   double volumeF = accBala1F; volumeF = NormalizeDouble(volumeF, 1);
   double volumeG = accBala1G; volumeG = NormalizeDouble(volumeG, 1);
   double volumeH = accBala1H; volumeH = NormalizeDouble(volumeH, 1);
   double volumeI = accBala1I; volumeI = NormalizeDouble(volumeI, 1);
   double volumeJ = accBala1J; volumeJ = NormalizeDouble(volumeJ, 1);
   double volumeK = accBala1K; volumeK = NormalizeDouble(volumeK, 1);
   double volumeL = accBala1L; volumeL = NormalizeDouble(volumeL, 1);
      double volumeM = accBala1M; volumeM = NormalizeDouble(volumeM, 1);
   double volumeN = accBala1N; volumeN = NormalizeDouble(volumeN, 1);
   double volumeO = accBala1O; volumeO = NormalizeDouble(volumeO, 1);
   double volumeP = accBala1P; volumeP = NormalizeDouble(volumeP, 1);
   double volumeQ = accBala1Q; volumeQ = NormalizeDouble(volumeQ, 1);
   double volumeR = accBala1R; volumeR = NormalizeDouble(volumeR, 1);
   double volumeS = accBala1S; volumeS = NormalizeDouble(volumeS, 1);
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
      magic = 1001; 
   }
   float OpenHour = TimeHour(TimeGMT()); float minute = TimeMinute(TimeGMT());
   minute = ((minute*50)/30)/100; 
   OpenHour += minute;
   double MatrixV[1][5]; double MatrixBos[1][3]; double MatrixBosQ[1][3];
   double MatrixR10[1][10]; double MatrixR15[1][15]; double MatrixR20[1][20]; double MatrixR25[1][5];
   double MatrixA10[1][4]; double MatrixB10[1][4]; 
   //VENTA
   double Volumen1StdV = 0; double macdStdV = 0; double ind1StdV = 0; double PorFiboStdV = 0; 
   //COMPRA
   double Volumen1StdC = 0; double macdStdC = 0; double ind1StdC = 0; double PorFiboStdC = 0; 
   bool resultCheckOrders = checkOrders(numberTotal, accountTotal);
   if(canContinue)
      if(resultCheckOrders){
         //ESTANDARIZAR   
         //VENTA
         PriceStdV = ((Bid - matAudcadV[0][5])/matAudcadV[0][0]); PriceStdV = NormalizeDouble(PriceStdV, 9); Price1StdV = ((CLose2 - matAudcadV[0][5])/matAudcadV[0][0]); Price1StdV = NormalizeDouble(Price1StdV, 9);
         Price2StdV = ((CLose3 - matAudcadV[0][5])/matAudcadV[0][0]); Price2StdV = NormalizeDouble(Price2StdV, 9); Price3StdV = ((CLose4 - matAudcadV[0][5])/matAudcadV[0][0]); Price3StdV = NormalizeDouble(Price3StdV, 9);
         Price4StdV = ((CLose5 - matAudcadV[0][5])/matAudcadV[0][0]); Price4StdV = NormalizeDouble(Price4StdV, 9); Price5StdV = ((CLose6 - matAudcadV[0][5])/matAudcadV[0][0]); Price5StdV = NormalizeDouble(Price5StdV, 9);
         Price6StdV = ((CLose7 - matAudcadV[0][5])/matAudcadV[0][0]); Price6StdV = NormalizeDouble(Price6StdV, 9); Price7StdV = ((CLose8 - matAudcadV[0][5])/matAudcadV[0][0]); Price7StdV = NormalizeDouble(Price7StdV, 9);
         Price8StdV = ((CLose9 - matAudcadV[0][5])/matAudcadV[0][0]); Price8StdV = NormalizeDouble(Price8StdV, 9); Price9StdV = ((CLose10 - matAudcadV[0][5])/matAudcadV[0][0]); Price9StdV = NormalizeDouble(Price9StdV, 9);
         Price10StdV = ((CLose11 - matAudcadV[0][5])/matAudcadV[0][0]); Price10StdV = NormalizeDouble(Price10StdV, 9); Price11StdV = ((CLose12 - matAudcadV[0][5])/matAudcadV[0][0]); Price11StdV = NormalizeDouble(Price11StdV, 9);
         Price12StdV = ((CLose13 - matAudcadV[0][5])/matAudcadV[0][0]); Price12StdV = NormalizeDouble(Price12StdV, 9); Price13StdV = ((CLose14 - matAudcadV[0][5])/matAudcadV[0][0]); Price13StdV = NormalizeDouble(Price13StdV, 9);
         Price14StdV = ((CLose15 - matAudcadV[0][5])/matAudcadV[0][0]); Price14StdV = NormalizeDouble(Price14StdV, 9); Price15StdV = ((CLose16 - matAudcadV[0][5])/matAudcadV[0][0]); Price15StdV = NormalizeDouble(Price15StdV, 9);
         Price16StdV = ((CLose17 - matAudcadV[0][5])/matAudcadV[0][0]); Price16StdV = NormalizeDouble(Price16StdV, 9); Price17StdV = ((CLose18 - matAudcadV[0][5])/matAudcadV[0][0]); Price17StdV = NormalizeDouble(Price17StdV, 9);
         Price18StdV = ((CLose19 - matAudcadV[0][5])/matAudcadV[0][0]); Price18StdV = NormalizeDouble(Price18StdV, 9); Price19StdV = ((CLose20 - matAudcadV[0][5])/matAudcadV[0][0]); Price19StdV = NormalizeDouble(Price19StdV, 9);
         Price20StdV = ((CLose21 - matAudcadV[0][5])/matAudcadV[0][0]); Price20StdV = NormalizeDouble(Price20StdV, 9); Price21StdV = ((CLose22 - matAudcadV[0][5])/matAudcadV[0][0]); Price21StdV = NormalizeDouble(Price21StdV, 9);
         Price22StdV = ((CLose23 - matAudcadV[0][5])/matAudcadV[0][0]); Price22StdV = NormalizeDouble(Price22StdV, 9); Price23StdV = ((CLose24 - matAudcadV[0][5])/matAudcadV[0][0]); Price23StdV = NormalizeDouble(Price23StdV, 9);
         Price24StdV = ((CLose25 - matAudcadV[0][5])/matAudcadV[0][0]); Price24StdV = NormalizeDouble(Price24StdV, 9); Price25StdV = ((CLose26 - matAudcadV[0][5])/matAudcadV[0][0]); Price25StdV = NormalizeDouble(Price25StdV, 9);
         PricePromStdV = ((PriceStdV+Price1StdV+Price2StdV)/3); PriceProm2StdV = ((Price1StdV+Price2StdV+Price3StdV)/3); PriceProm3StdV = ((Price2StdV+Price3StdV+Price4StdV)/3); PriceProm4StdV = ((Price3StdV+Price4StdV+Price5StdV)/3); PriceProm5StdV = ((Price4StdV+Price5StdV+Price6StdV)/3); PriceProm6StdV = ((Price5StdV+Price6StdV+Price7StdV)/3);
         PriceProm7StdV = ((Price6StdV+Price7StdV+Price8StdV)/3); PriceProm8StdV = ((Price7StdV+Price8StdV+Price9StdV)/3); PriceProm9StdV = ((Price8StdV+Price9StdV+Price10StdV)/3); PriceProm10StdV = ((Price9StdV+Price10StdV+Price11StdV)/3); PriceProm11StdV = ((Price10StdV+Price11StdV+Price12StdV)/3); PriceProm12StdV = ((Price11StdV+Price12StdV+Price13StdV)/3);
         PriceProm13StdV = ((Price12StdV+Price13StdV+Price14StdV)/3); PriceProm14StdV = ((Price13StdV+Price14StdV+Price15StdV)/3); PriceProm15StdV = ((Price14StdV+Price15StdV+Price16StdV)/3); PriceProm16StdV = ((Price15StdV+Price16StdV+Price17StdV)/3); PriceProm17StdV = ((Price16StdV+Price17StdV+Price18StdV)/3); PriceProm18StdV = ((Price17StdV+Price18StdV+Price19StdV)/3);
         PriceProm19StdV = ((Price18StdV+Price19StdV+Price20StdV)/3); PriceProm20StdV = ((Price19StdV+Price20StdV+Price21StdV)/3); PriceProm21StdV = ((Price20StdV+Price21StdV+Price22StdV)/3); PriceProm22StdV = ((Price21StdV+Price22StdV+Price23StdV)/3); PriceProm23StdV = ((Price22StdV+Price23StdV+Price24StdV)/3); PriceProm24StdV = ((Price23StdV+Price24StdV+Price25StdV)/3);
         Volumen1StdV = ((Volumen1 - matAudcadV[0][6])/matAudcadV[0][1]); Volumen1StdV = NormalizeDouble(Volumen1StdV, 9);
         macdStdV = ((macd - matAudcadV[0][7])/matAudcadV[0][2]); macdStdV = NormalizeDouble(macdStdV, 9);
         ind1StdV = ((ind1 - matAudcadV[0][8])/matAudcadV[0][3]); ind1StdV = NormalizeDouble(ind1StdV, 9);
         PorFiboStdV = ((PorFiboV - matAudcadV[0][9])/matAudcadV[0][4]); PorFiboStdV = NormalizeDouble(PorFiboStdV, 9);
         MaxStd1 = ((valorMaxCo1 - matAudcadV[0][5])/matAudcadV[0][0]); MaxStd1 = NormalizeDouble(MaxStd1, 9); MaxStd2 = ((valorMaxCo2 - matAudcadV[0][5])/matAudcadV[0][0]); MaxStd2 = NormalizeDouble(MaxStd2, 9); 
         MaxStd3 = ((valorMaxCo - matAudcadV[0][5])/matAudcadV[0][0]); MaxStd3 = NormalizeDouble(MaxStd3, 9); MaxStd4 = ((valorMaxCo3 - matAudcadV[0][5])/matAudcadV[0][0]); MaxStd4 = NormalizeDouble(MaxStd4, 9);
         MinStd1 = ((valorMinCo1 - matAudcadV[0][5])/matAudcadV[0][0]); MinStd1 = NormalizeDouble(MinStd1, 9); MinStd2 = ((valorMinCo2 - matAudcadV[0][5])/matAudcadV[0][0]); MinStd2 = NormalizeDouble(MinStd2, 9);
         MinStd3 = ((valorMinCo - matAudcadV[0][5])/matAudcadV[0][0]); MinStd3 = NormalizeDouble(MinStd3, 9); MinStd4 = ((valorMinCo3 - matAudcadV[0][5])/matAudcadV[0][0]); MinStd4 = NormalizeDouble(MinStd4, 9);
         //Asigna a Matrix
         MatrixV[0][0] = PricePromStdV; MatrixV[0][1] = Volumen1StdV; MatrixV[0][2] = macdStdV; MatrixV[0][3] = ind1StdV; MatrixV[0][4] = PorFiboStdV;
         MatrixR10[0][0] = PriceProm9StdV; MatrixR10[0][1] = PriceProm8StdV; MatrixR10[0][2] = PriceProm7StdV; MatrixR10[0][3] = PriceProm6StdV; MatrixR10[0][4] = PriceProm5StdV; MatrixR10[0][5] = PriceProm4StdV; MatrixR10[0][6] = PriceProm3StdV; MatrixR10[0][7] = PriceProm2StdV; MatrixR10[0][8] = PricePromStdV; 
         MatrixR15[0][0] = PriceProm14StdV; MatrixR15[0][1] = PriceProm13StdV; MatrixR15[0][2] = PriceProm12StdV; MatrixR15[0][3] = PriceProm11StdV; MatrixR15[0][4] = PriceProm10StdV; MatrixR15[0][5] = PriceProm9StdV; MatrixR15[0][6] = PriceProm8StdV; MatrixR15[0][7] = PriceProm7StdV; MatrixR15[0][8] = PriceProm6StdV; MatrixR15[0][9] = PriceProm5StdV; MatrixR15[0][10] = PriceProm4StdV; MatrixR15[0][11] = PriceProm3StdV; MatrixR15[0][12] = PriceProm2StdV; MatrixR15[0][13] = PricePromStdV;       
         MatrixR20[0][0] = PriceProm19StdV; MatrixR20[0][1] = PriceProm18StdV; MatrixR20[0][2] = PriceProm17StdV; MatrixR20[0][3] = PriceProm16StdV; MatrixR20[0][4] = PriceProm15StdV; MatrixR20[0][5] = PriceProm14StdV; MatrixR20[0][6] = PriceProm13StdV; MatrixR20[0][7] = PriceProm12StdV; MatrixR20[0][8] = PriceProm11StdV; MatrixR20[0][9] = PriceProm10StdV; MatrixR20[0][10] = PriceProm9StdV; MatrixR20[0][11] = PriceProm8StdV; MatrixR20[0][12] = PriceProm7StdV; MatrixR20[0][13] = PriceProm6StdV; MatrixR20[0][14] = PriceProm5StdV; MatrixR20[0][15] = PriceProm4StdV; MatrixR20[0][16] = PriceProm3StdV; MatrixR20[0][17] = PriceProm2StdV; MatrixR20[0][18] = PricePromStdV;
         MatrixR25[0][0] = PriceProm4StdV; MatrixR25[0][1] = PriceProm3StdV; MatrixR25[0][2] = PriceProm2StdV; MatrixR25[0][3] = PricePromStdV;
         MatrixA10[0][0] = MaxStd1; MatrixA10[0][1] = MaxStd2; MatrixA10[0][2] = MaxStd3; MatrixA10[0][3] = MaxStd4; 
         MatrixB10[0][0] = MinStd1; MatrixB10[0][1] = MinStd2; MatrixB10[0][2] = MinStd3; MatrixB10[0][3] = MinStd4;
         //Condicion Velota
         if((MHIgh - MLOw) >= VelaGrande || (MHIgh1 - MLOw1) >= VelaGrande || (MHIgh2 - MLOw2) >= VelaGrande || (MHIgh3 - MLOw3) >= VelaGrande || (MHIgh4 - MLOw4) >= VelaGrande || 
         (MHIgh5 - MLOw5) >= VelaGrande || (MHIgh6 - MLOw6) >= VelaGrande || (MHIgh7 - MLOw7) >= VelaGrande || (MHIgh8 - MLOw8) >= VelaGrande || (MHIgh9 - MLOw9) >= VelaGrande || 
         (MHIgh10 - MLOw10) >= VelaGrande || (MHIgh11 - MLOw11) >= VelaGrande || (MHIgh12 - MLOw12) >= VelaGrande || (MHIgh13 - MLOw13) >= VelaGrande || (MHIgh14 - MLOw14) >= VelaGrande || 
         (MHIgh15 - MLOw15) >= VelaGrande || (MHIgh16 - MLOw16) >= VelaGrande || (MHIgh17 - MLOw17) >= VelaGrande || (MHIgh18 - MLOw18) >= VelaGrande || (MHIgh19 - MLOw19) >= VelaGrande || 
         (MHIgh20 - MLOw20) >= VelaGrande || (MHIgh21 - MLOw21) >= VelaGrande || (MHIgh22 - MLOw22) >= VelaGrande || (MHIgh23 - MLOw23) >= VelaGrande){
            if(Velota)
             Print ("Hubo Velota ", Symbol());
            Velota = false;
         }else{Velota = true;}
         //Condicion GAP Kids
         if(DifVelas > (15*Point)){
            if(GapKids)
             Print("Hubo Gap Kids, DifVelas ", DifVelas, " ", Symbol());
            GapKids = false;
         }else{GapKids = true;}
         //Condicion SPREAD
         if(Spread > (30*Point)){
            if(SPREAD)
             Print("Spread ", Spread, " ", Symbol());
            SPREAD = false;
            VelaOpen = OPen;
         }else{}
         if(PriceStdV > 2 || PriceStdV < (-2) || Price1StdV > 2 || Price1StdV < (-2) || Price2StdV > 2 || Price2StdV < (-2)){
            if(rubenAuC)
             Print("Fuera de rango, BidStd ", PriceStdV, " BidStd2 ", Price1StdV, " BidStd3 ", Price2StdV);
            rubenAuC = false;
         }else{rubenAuC = true;}
         //Condicion PATOTAS
         if(MOPen1 >= MCLose1){
            if((MCLose1 - MLOw1) >= Cuerpo1 || (MHIgh1 - MOPen1) >= Cuerpo1){Patitas1 = false;} else{Patitas1 = true;}
         }else{if((MOPen1 - MLOw1) >= Cuerpo1 || (MHIgh1 - MCLose1) >= Cuerpo1){Patitas1 = false;} else{Patitas1 = true;}
         }if(MOPen2 >= MCLose2){
            if((MCLose2 - MLOw2) >= Cuerpo2 || (MHIgh2 - MOPen2) >= Cuerpo2){Patitas2 = false;} else{Patitas2 = true;}
         }else{if((MOPen2 - MLOw2) >= Cuerpo2 || (MHIgh2 - MCLose2) >= Cuerpo2){Patitas2 = false;} else{Patitas2 = true;}
         }if(!Patitas1 && !Patitas2){
            if(Patotas)
             //Print("Hay patotas ", Symbol());
            Patotas = false;
         }else{Patotas = true;}
         //Calentamiento
         if(OpenHour > 5 && OpenHour < 5.16){
            calent = false;
            if(VelaOpen3 != Uopen){
               RAssignMatrix(Serre, "MatrixV1", MatrixV, 1, 5);
               RExecute(Serre, "colnames(MatrixV1)<-c('MM','Volumen1Std', 'macdStd', 'ind1Std', 'PorFiboStd')");
               RExecute(Serre, "MatrixV1 = data.frame(MatrixV1)");
               RExecute(Serre, "predV1 = predict(Rsnns1V, MatrixV1)");
               prediV = RGetDouble(Serre, "predV1");
               VelaOpen3 = Uopen;
               Print("Not llet ", prediV);
            } 
         }else{calent = true;}
         if(calent == true){
            //CALCULO LINEA REGRESIVA (OPEN A CADA TIEMPO)
            //Cambios de Vela
            if(VelaOpen != OPen){
               prediV1 = prediV;
               RAssignMatrix(Serre, "MatrixV1", MatrixV, 1, 5);
               RExecute(Serre, "colnames(MatrixV1)<-c('MM','Volumen1Std', 'macdStd', 'ind1Std', 'PorFiboStd')");
               RExecute(Serre, "MatrixV1 = data.frame(MatrixV1)");
               RExecute(Serre, "predV1 = predict(Rsnns1V, MatrixV1)");
               prediV = RGetDouble(Serre, "predV1");
               Difpred1 = Difpred;
               Difpred = (prediV1-prediV);
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
               VelaOpen = OPen; VeAl38 = true; SPREAD = true;
               DifCar = MaxStd - PriceStdV;
               DifCab = PriceStdV - MinStd;
               DifMM1 = DifMM;
               DifMM = (PriceProm2StdV-PricePromStdV);
               RAssignDouble(Serre, "X1DifPred", Difpred);
               MatrixBosQ[0][0] = Difpred; MatrixBosQ[0][1] = (prediPrice1-prediPrice); MatrixBosQ[0][2] = (prediV-prediPrice);
               RAssignMatrix(Serre, "MatrixBos1", MatrixBosQ, 1, 3);
               RExecute(Serre, "colnames(MatrixBos1)<-c('X15DifPred', 'X15DifPrediPri', 'Predi.price')");
               RExecute(Serre, "MatrixBos1 = data.frame(MatrixBos1)");
               MatrixCub[0][0] = DifCar; MatrixCub[0][1] = PorFiboStdV; MatrixCub[0][2] = Pend25; MatrixCub[0][3] = (prediV1-prediV);
               RAssignMatrix(Serre, "MatrixCub1H", MatrixCub, 1, 4);
               RExecute(Serre, "colnames(MatrixCub1H)<-c('1DifMax','PorFiboStd', '1Pend5', '1DifPred')");
               RExecute(Serre, "MatrixCub1H = data.frame(MatrixCub1H)");
               MatrixBos[0][0] = Difpred; MatrixBos[0][1] = PorFiboStdV; MatrixBos[0][2] = DifCar;
               RAssignMatrix(Serre, "MatrixCubV1H", MatrixBos, 1, 3);
               RExecute(Serre, "colnames(MatrixCubV1H)<-c('DifPred','PorFiboStd','DifMax')");
               RExecute(Serre, "MatrixCubV1H = data.frame(MatrixCubV1H)");
               //CUBIST
           /*    RExecute(Serre, "predCubA = predict(CubA, MatrixCub1H, neighbors = 6)");
               prediCubA = RGetDouble(Serre, "ifelse(predCubA > 0.5, '1', '-1')");
               RExecute(Serre, "predCubA2 = predict(CubA2, MatrixCub1H, neighbors = 4)");
               prediCubA2 = RGetDouble(Serre, "ifelse(predCubA2 > 0.5, '1', '-1')");
               RExecute(Serre, "predCubA3 = predict(CubA3, MatrixCub1H, neighbors = 3)");
               prediCubA3 = RGetDouble(Serre, "ifelse(predCubA3 > 0.5, '1', '-1')");
               //BOSQUE
               RExecute(Serre, "PredRfA = predict(RfA, X1DifPred, type = 'response')");
               prediRfA = RGetInteger(Serre, "ifelse(PredRfA==0, '-1', '1')");
               //NIVELES
               RExecute(Serre, "predCubVA = predict(CubVA, MatrixCubV1H, neighbors = 2)");
               prediCubV = RGetDouble(Serre, "ifelse(predCubVA > 0.5, '1', '-1')");
               RExecute(Serre, "predCubCA = predict(CubCA, MatrixCubV1H, neighbors = 6)");
               prediCubC = RGetDouble(Serre, "ifelse(predCubCA > 0.5, '1', '-1')");
               Print("prediCubA: ", prediCubA, " prediCubA2: ", prediCubA2, " prediCubA3: ", prediCubA3, " prediCubV: ", prediCubV, " prediRfA: ", prediRfA, 
               " PredAtemp ", prediV, " Pred ", PrediV);
               
        */       
               
            }
            if(VelaOpen2 != MOPen){
               PrediV1 = PrediV; VelaOpen2 = MOPen;
               RAssignMatrix(Serre, "MatrixV1", MatrixV, 1, 5);
               RExecute(Serre, "colnames(MatrixV1)<-c('MM','Volumen1Std', 'macdStd', 'ind1Std', 'PorFiboStd')");
               RExecute(Serre, "MatrixV1 = data.frame(MatrixV1)");
               RExecute(Serre, "PredV1 = predict(Rsnns1V, MatrixV1)");
               PrediV = RGetDouble(Serre, "PredV1");
            }
            //NivelVenta(magic, OPen, #, volume, Comicha, prediCubV);
            //CubistYGoku(magic, OPen, #, volume, Comicha, prediRfA, prediCubA);
            //GokuNivel(magic, OPen, #, volume, Comicha, prediRfA, prediCubV, prediCubC);
            //CubistNivel(magic, OPen, #, volume, Comicha, prediCubA2, prediCubV, prediCubC);
            //Cubist2Velas(magic, OPen, #, volume, Comicha, prediCubA2);
            //Cubist3Velas(magic, OPen, #, volume, Comicha, prediCubA3);
            //Kksan3Velas(magic, OPen, #, volume, Comicha, DifCar, PrediV, prediV1, PricePromStdV, PriceProm2StdV); 
            //Lazarus(magic, OPen, 7, volumeM, Comicha7, Difpred1, DifMM, DifMM1);
            
            //VENTA 
            if(VeAl38 && Velota && Patotas && SPREAD && GapKids && rubenAuC){
               //PRO 1
               if(PR1 > 0 && !machoMenAuC1){
                  if(volumeA > 0)
                    NivelVenta(magic, OPen, 1, volumeA, Comicha1, prediCubV);
                  if(volumeB > 0)
                    Kksan3Velas(magic, OPen, 1, volumeB, Comicha1, DifCar, PrediV, prediV1, PricePromStdV, PriceProm2StdV);
               }//PRO 2
               if(PR2 > 0 && !machoMenAuC2){
                  if(volumeC > 0)
                    Cubist3Velas(magic, OPen, 2, volumeC, Comicha2, prediCubA3);
                  if(volumeD > 0)
                    Kksan3Velas(magic, OPen, 2, volumeD, Comicha2, DifCar, PrediV, prediV1, PricePromStdV, PriceProm2StdV);
               }//PRO 3
               if(PR3 > 0 && !machoMenAuC3){
                  if(volumeE > 0)
                    Cubist3Velas(magic, OPen, 3, volumeE, Comicha3, prediCubA3);
                  if(volumeF > 0)
                    CubistYGoku(magic, OPen, 3, volumeF, Comicha3, prediRfA, prediCubA);
               }//PRO 4
               if(PR4 > 0 && !machoMenAuC4){
                  if(volumeG > 0)
                    Cubist3Velas(magic, OPen, 4, volumeG, Comicha4, prediCubA3);
                  if(volumeH > 0)
                    GokuNivel(magic, OPen, 4, volumeH, Comicha4, prediRfA, prediCubV, prediCubC);
               }//PRO 5
               if(PR5 > 0 && !machoMenAuC5){
                  if(volumeI > 0)
                    NivelVenta(magic, OPen, 5, volumeI, Comicha5, prediCubV);
                  if(volumeJ > 0)
                    GokuNivel(magic, OPen, 5, volumeJ, Comicha5, prediRfA, prediCubV, prediCubC);
               }//PRO 6
               if(PR6 > 0 && !machoMenAuC6){
                  if(volumeK > 0)
                    NivelVenta(magic, OPen, 6, volumeK, Comicha6, prediCubV);
                  if(volumeL > 0)
                    CubistYGoku(magic, OPen, 6, volumeL, Comicha6, prediRfA, prediCubA);
               }
               //DIVI 7
               if(volumeM > 0 && !machoMenAuC7)
                 Lazarus(magic, OPen, 7, volumeM, Comicha7, Difpred1, DifMM, DifMM1);
               //DIVI 8
               if(volumeN > 0 && !machoMenAuC8)   
                 CubistNivel(magic, OPen, 8, volumeN, Comicha8, prediCubA2, prediCubV, prediCubC);
               //DIVI 9
               if(volumeO > 0 && !machoMenAuC9)
                 NivelVenta(magic, OPen, 9, volumeO, Comicha9, prediCubV);
               //DIVI 10
               if(volumeP > 0 && !machoMenAuC10)
                 Kksan3Velas(magic, OPen, 10, volumeP, Comicha10, DifCar, PrediV, prediV1, PricePromStdV, PriceProm2StdV); 
               //DIVI 11
               if(volumeQ > 0 && !machoMenAuC11)
                 GokuNivel(magic, OPen, 11, volumeQ, Comicha11, prediRfA, prediCubV, prediCubC);
               //DIVI 12
               if(volumeR > 0 && !machoMenAuC12)
                 CubistYGoku(magic, OPen, 12, volumeR, Comicha12, prediRfA, prediCubA);
               //DIVI 13
               if(volumeS > 0 && !machoMenAuC13)
                 Cubist3Velas(magic, OPen, 13, volumeS, Comicha13, prediCubA3);
            }else{}
         } 
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
  
   /*if(hour > 19){
      return false;
   }else*/
   
   if(symbol == "AUDCAD&"){
      if(hour>5 && hour<19){
         return true;
      }
   }
   return false;
  }
bool checkOrders(int numberTotal, int accountTotal){
   bool stopScript = false; long vol = iVolume(Symbol(),PERIOD_M1,0); int Magic = (numberTotal+accountTotal+2);
   for(int i = 0; i < numberTotal; i++){
     if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
      continue;}
     int diferenceTime = (TimeCurrent() - OrderOpenTime()); float hour = TimeHour(TimeGMT()); float minute = TimeMinute(TimeGMT());  minute = ((minute*50)/30)/100;
     hour += minute; AccE = 0; AccE1 = 0; AccE2 = 0; AccE3 = 0; AccE4 = 0; AccE5 = 0; AccE6 = 0; AccE7 = 0; AccE8 = 0; AccE9 = 0; AccE10 = 0; AccE11 = 0; AccE12 = 0; AccE13 = 0;
     double volume = OrderLots(); volume = NormalizeDouble(volume, 1); double NumPro = 0;
     if(Symbol() == OrderSymbol())
      if(volume == accBala1A || volume == accBala1B || volume == accBala1C || volume == accBala1D || volume == accBala1E || volume == accBala1F || volume == accBala1G 
      || volume == accBala1H || volume == accBala1I || volume == accBala1J || volume == accBala1K || volume == accBala1L || volume == accBala1M || volume == accBala1N
      || volume == accBala1O || volume == accBala1P || volume == accBala1Q || volume == accBala1R || volume == accBala1S){
         //ESPEJOTO 1
         if(volume == accBala1A || volume == accBala1B){
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(Symbol() == OrderSymbol())
               if(volumek == accBala1A || volumek == accBala1B){
                  AccE1 = (AccE1+OrderProfit()); AccE1 = NormalizeDouble(AccE1, 2);
               }
           }if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;}
           Cerrao1 = AccB1; Inutil1 = (AccE1+AccB1); tuti1 = (AccB1+AccE1-Comicha1);
           if(tuti1 > GanMax1)
            GanMax1 = tuti1;
           if(tuti1 < PerMax1)
            PerMax1 = tuti1;
           if(PerMax1 <= Pimi1 || GanMax1 >= Sal1)
            machoMenAuC1 = true;
           //Adeu Macho   
           if(tuti1 >= Sal1){
              Print("Todos MIOS AuC1 ", tuti1, " >= ", Sal1, " orden #", OrderTicket(), " Inutil1 ", Inutil1, " Cerrao1 ", Cerrao1, " GanMax1 ", GanMax1, 
              " PerMax1 ", PerMax1, " Com1 ", Comicha1, " tuti1 ", tuti1, " Abierto1 ", AccE1);
              if(OrderType() == OP_BUY){
                 AccB1 = (AccB1+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB1 = (AccB1+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC1 = true;
           }if(tuti1 <= Pimi1){
              Print("Adios BAI AuC1 ", tuti1, " >= ", Pimi1, " orden #", OrderTicket(), " Inutil1 ", Inutil1, " Cerrao1 ", Cerrao1, " GanMax1 ", GanMax1, 
              " PerMax1 ", PerMax1, " Com1 ", Comicha1, " tuti1 ", tuti1, " Abierto1 ", AccE1);
              if(OrderType() == OP_BUY){
                 AccB1 = (AccB1+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB1 = (AccB1+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC1 = true;
           }if(machoMenAuC1){
              Print("Adeu machoMen 1, cierro la pta orden #", OrderTicket(), " utilidad1 ", Inutil1, " Cerrao1 ", Cerrao1, " GanMax1 ", GanMax1, " PerMax1 ", PerMax1, 
              " Com1 ", Comicha1, " tuti1 ", tuti1, " Abierto1 ", AccE1);
              if(OrderType() == OP_BUY){
                 AccB1 = (AccB1+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB1 = (AccB1+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC1 = true;
           } NumPro = 1;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreCubist2Velas(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB1, Inutil1, Cerrao1, GanMax1, PerMax1, Comicha1, tuti1, AccE1);
         }//ESPEJOTO 2
         if(volume == accBala1C || volume == accBala1D){
           for(int k = 0; k < numberTotal; k++){
             if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
              continue;}
             double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
             if(Symbol() == OrderSymbol())
              if(volumek == accBala1C || volumek == accBala1D){
                 AccE2 = (AccE2+OrderProfit()); AccE2 = NormalizeDouble(AccE2, 2);
              }
           }if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;}
           Cerrao2 = AccB2; Inutil2 = (AccE2+AccB2); tuti2 = (AccB2+AccE2-Comicha2);
           if(tuti2 > GanMax2)
            GanMax2 = tuti2;
           if(tuti2 < PerMax2)
            PerMax2 = tuti2;
           if(PerMax2 <= Pimi2 || GanMax2 >= Sal2)
            machoMenAuC2 = true;
           //Adeu Macho   
           if(tuti2 >= Sal2){
              Print("Todos MIOS AuC2 ", tuti2, " >= ", Sal2, " orden #", OrderTicket(), " Inutil2 ", Inutil2, " Cerrao2 ", Cerrao2, " GanMax2 ", GanMax2, 
              " PerMax2 ", PerMax2, " Com2 ", Comicha2, " tuti2 ", tuti2, " Abierto2 ", AccE2);
              if(OrderType() == OP_BUY){
                 AccB2 = (AccB2+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB2 = (AccB2+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC2 = true;
           }if(tuti2 <= Pimi2){
              Print("Adios BAI AuC2 ", tuti2, " >= ", Pimi2, " orden #", OrderTicket(), " Inutil2 ", Inutil2, " Cerrao2 ", Cerrao2, " GanMax2 ", GanMax2, 
              " PerMax2 ", PerMax2, " Com2 ", Comicha2, " tuti2 ", tuti2, " Abierto2 ", AccE2);
              if(OrderType() == OP_BUY){
                 AccB2 = (AccB2+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB2 = (AccB2+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC2 = true;
           }if(machoMenAuC2){
              Print("Adeu machoMen 2, cierro la pta orden #", OrderTicket(), " utilidad2 ", Inutil2, " Cerrao2 ", Cerrao2, " GanMax2 ", GanMax2, " PerMax2 ", PerMax2, 
              " Com2 ", Comicha2, " tuti2 ", tuti2, " Abierto2 ", AccE2);
              if(OrderType() == OP_BUY){
                 AccB2 = (AccB2+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB2 = (AccB2+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC2 = true;
           } NumPro = 2;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreCubist2Velas(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB2, Inutil2, Cerrao2, GanMax2, PerMax2, Comicha2, tuti2, AccE2);
         }//ESPEJOTO 3
         if(volume == accBala1E || volume == accBala1F){
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(Symbol() == OrderSymbol())
               if(volumek == accBala1E || volumek == accBala1F){
                  AccE3 = (AccE3+OrderProfit()); AccE3 = NormalizeDouble(AccE3, 2);
               }
           }if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;}
           Cerrao3 = AccB3; Inutil3 = (AccE3+AccB3); tuti3 = (AccB3+AccE3-Comicha3);
           if(tuti3 > GanMax3)
            GanMax3 = tuti3;
           if(tuti3 < PerMax3)
            PerMax3 = tuti3;
           if(PerMax3 <= Pimi3 || GanMax3 >= Sal3)
            machoMenAuC3 = true;
           //Adeu Macho   
           if(tuti3 >= Sal3){
              Print("Todos MIOS AuC3 ", tuti3, " >= ", Sal3, " orden #", OrderTicket(), " Inutil3 ", Inutil3, " Cerrao3 ", Cerrao3, " GanMax3 ", GanMax3, 
              " PerMax3 ", PerMax3, " Com3 ", Comicha3, " tuti3 ", tuti3, " Abierto3 ", AccE3);
              if(OrderType() == OP_BUY){
                 AccB3 = (AccB3+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB3 = (AccB3+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC3 = true;
           }if(tuti3 <= Pimi3){
              Print("Adios BAI AuC3 ", tuti3, " >= ", Pimi3, " orden #", OrderTicket(), " Inutil3 ", Inutil3, " Cerrao3 ", Cerrao3, " GanMax3 ", GanMax3, 
              " PerMax3 ", PerMax3, " Com3 ", Comicha3, " tuti3 ", tuti3, " Abierto3 ", AccE3);
              if(OrderType() == OP_BUY){
                 AccB3 = (AccB3+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB3 = (AccB3+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC3 = true;
           }if(machoMenAuC3){
              Print("Adeu machoMen 3, cierro la pta orden #", OrderTicket(), " utilidad3 ", Inutil3, " Cerrao3 ", Cerrao3, " GanMax3 ", GanMax3, " PerMax3 ", PerMax3, 
              " Com3 ", Comicha3, " tuti3 ", tuti3, " Abierto3 ", AccE3);
              if(OrderType() == OP_BUY){
                 AccB3 = (AccB3+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB3 = (AccB3+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC3 = true;
           } NumPro = 3;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreCubist2Velas(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB3, Inutil3, Cerrao3, GanMax3, PerMax3, Comicha3, tuti3, AccE3);
         }//ESPEJOTO 4
         if(volume == accBala1G || volume == accBala1H){
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(Symbol() == OrderSymbol())
               if(volumek == accBala1G || volumek == accBala1H){
                  AccE4 = (AccE4+OrderProfit()); AccE4 = NormalizeDouble(AccE4, 2);
               }
           }if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;}
           Cerrao4 = AccB4; Inutil4 = (AccE4+AccB4); tuti4 = (AccB4+AccE4-Comicha4);
           if(tuti4 > GanMax4)
            GanMax4 = tuti4;
           if(tuti4 < PerMax4)
            PerMax4 = tuti4;
           if(PerMax4 <= Pimi4 || GanMax4 >= Sal4)
            machoMenAuC4 = true;
           //Adeu Macho   
           if(tuti4 >= Sal4){
              Print("Todos MIOS AuC4 ", tuti4, " >= ", Sal4, " orden #", OrderTicket(), " Inutil4 ", Inutil4, " Cerrao4 ", Cerrao4, " GanMax4 ", GanMax4, 
              " PerMax4 ", PerMax4, " Com4 ", Comicha4, " tuti4 ", tuti4, " Abierto4 ", AccE4);
              if(OrderType() == OP_BUY){
                 AccB4 = (AccB4+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB4 = (AccB4+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC4 = true;
           }if(tuti4 <= Pimi4){
              Print("Adios BAI AuC4 ", tuti4, " >= ", Pimi4, " orden #", OrderTicket(), " Inutil4 ", Inutil4, " Cerrao4 ", Cerrao4, " GanMax4 ", GanMax4, 
              " PerMax4 ", PerMax4, " Com4 ", Comicha4, " tuti4 ", tuti4, " Abierto4 ", AccE4);
              if(OrderType() == OP_BUY){
                 AccB4 = (AccB4+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB4 = (AccB4+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC4 = true;
           }if(machoMenAuC4){
              Print("Adeu machoMen 4, cierro la pta orden #", OrderTicket(), " utilidad4 ", Inutil4, " Cerrao4 ", Cerrao4, " GanMax4 ", GanMax4, " PerMax4 ", PerMax4, 
              " Com4 ", Comicha4, " tuti4 ", tuti4, " Abierto4 ", AccE4);
              if(OrderType() == OP_BUY){
                 AccB4 = (AccB4+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB4 = (AccB4+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC4 = true;
           } NumPro = 4;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreCubist2Velas(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB4, Inutil4, Cerrao4, GanMax4, PerMax4, Comicha4, tuti4, AccE4);
         }//ESPEJOTO 5
         if(volume == accBala1I || volume == accBala1J){
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(Symbol() == OrderSymbol())
               if(volumek == accBala1I || volumek == accBala1J){
                  AccE5 = (AccE5+OrderProfit()); AccE5 = NormalizeDouble(AccE5, 2);
               }
           }if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;}
           Cerrao5 = AccB5; Inutil5 = (AccE5+AccB5); tuti5 = (AccB5+AccE5-Comicha5);
           if(tuti5 > GanMax5)
            GanMax5 = tuti5;
           if(tuti5 < PerMax5)
            PerMax5 = tuti5;
           if(PerMax5 <= Pimi5 || GanMax5 >= Sal5)
            machoMenAuC5 = true;
           //Adeu Macho   
           if(tuti5 >= Sal5){
              Print("Todos MIOS AuC5 ", tuti5, " >= ", Sal5, " orden #", OrderTicket(), " Inutil5 ", Inutil5, " Cerrao5 ", Cerrao5, " GanMax5 ", GanMax5, 
              " PerMax5 ", PerMax5, " Com5 ", Comicha5, " tuti5 ", tuti5, " Abierto5 ", AccE5);
              if(OrderType() == OP_BUY){
                 AccB5 = (AccB5+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB5 = (AccB5+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC5 = true;
           }if(tuti5 <= Pimi5){
              Print("Adios BAI AuC5 ", tuti5, " >= ", Pimi5, " orden #", OrderTicket(), " Inutil5 ", Inutil5, " Cerrao5 ", Cerrao5, " GanMax5 ", GanMax5, 
              " PerMax5 ", PerMax5, " Com5 ", Comicha5, " tuti5 ", tuti5, " Abierto5 ", AccE5);
              if(OrderType() == OP_BUY){
                 AccB5 = (AccB5+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB5 = (AccB5+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC5 = true;
           }if(machoMenAuC5){
              Print("Adeu machoMen 5, cierro la pta orden #", OrderTicket(), " utilidad5 ", Inutil5, " Cerrao5 ", Cerrao5, " GanMax5 ", GanMax5, " PerMax5 ", PerMax5, 
              " Com5 ", Comicha5, " tuti5 ", tuti5, " Abierto5 ", AccE5);
              if(OrderType() == OP_BUY){
                 AccB5 = (AccB5+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB5 = (AccB5+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC5 = true;
           } NumPro = 5;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreCubist2Velas(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB5, Inutil5, Cerrao5, GanMax5, PerMax5, Comicha5, tuti5, AccE5);
         }//ESPEJOTO 6
         if(volume == accBala1K || volume == accBala1L){
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(Symbol() == OrderSymbol())
               if(volumek == accBala1K || volumek == accBala1L){
                  AccE6 = (AccE6+OrderProfit()); AccE6 = NormalizeDouble(AccE6, 2);
               }
           }if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;}
           Cerrao6 = AccB6; Inutil6 = (AccE6+AccB6); tuti6 = (AccB6+AccE6-Comicha6);
           if(tuti6 > GanMax6)
            GanMax6 = tuti6;
           if(tuti6 < PerMax6)
            PerMax6 = tuti6;
           if(PerMax6 <= Pimi6 || GanMax6 >= Sal6)
            machoMenAuC6 = true;
           //Adeu Macho   
           if(tuti6 >= Sal6){
              Print("Todos MIOS AuC6 ", tuti6, " >= ", Sal6, " orden #", OrderTicket(), " Inutil6 ", Inutil6, " Cerrao6 ", Cerrao6, " GanMax6 ", GanMax6, 
              " PerMax6 ", PerMax6, " Com6 ", Comicha6, " tuti6 ", tuti6, " Abierto6 ", AccE6);
              if(OrderType() == OP_BUY){
                 AccB6 = (AccB6+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB6 = (AccB6+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC6 = true;
           }if(tuti6 <= Pimi6){
              Print("Adios BAI AuC6 ", tuti6, " >= ", Pimi6, " orden #", OrderTicket(), " Inutil6 ", Inutil6, " Cerrao6 ", Cerrao6, " GanMax6 ", GanMax6, 
              " PerMax6 ", PerMax6, " Com6 ", Comicha6, " tuti6 ", tuti6, " Abierto6 ", AccE6);
              if(OrderType() == OP_BUY){
                 AccB6 = (AccB6+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB6 = (AccB6+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC6 = true;
           }if(machoMenAuC6){
              Print("Adeu machoMen 6, cierro la pta orden #", OrderTicket(), " utilidad6 ", Inutil6, " Cerrao6 ", Cerrao6, " GanMax6 ", GanMax6, " PerMax6 ", PerMax6, 
              " Com6 ", Comicha6, " tuti6 ", tuti6, " Abierto6 ", AccE6);
              if(OrderType() == OP_BUY){
                 AccB6 = (AccB6+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB6 = (AccB6+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC6 = true;
           } NumPro = 6;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreCubist2Velas(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB6, Inutil6, Cerrao6, GanMax6, PerMax6, Comicha6, tuti6, AccE6);
         }
         
         //DIVIS
         if(volume == accBala1M && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1M && Symbol() == OrderSymbol())
               AccE7 = (AccE7+OrderProfit()); AccE7 = NormalizeDouble(AccE7, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao7 = AccB7; Inutil7 = (AccE7+AccB7); tuti7 = (AccB7+AccE7-Comicha7);
           if(tuti7 > GanMax7)
            GanMax7 = tuti7;
           if(tuti7 < PerMax7)
            PerMax7 = tuti7;
           if(PerMax7 <= Pimi7 || GanMax7 >= Sal7){
            if(!machoMenAuC7)
             Print("Yo fui, PerMax7 ", PerMax7, " GanMax7 ", GanMax7);
            machoMenAuC7 = true;}
           //Adeu Macho
           if(tuti7 >= Sal7){
              Print("Todos MIOS 7 ", tuti7, " >= ", Sal7, " orden #", OrderTicket(), " Inutil7 ", Inutil7, " Cerrao7 ", Cerrao7, " GanMax7 ", GanMax7, 
              " PerMax7 ", PerMax7, " Com7 ", Comicha7, " tuti7 ", tuti7," TodoAbiertoA ", AccE7);
              if(OrderType() == OP_BUY){
                 AccB7 = (AccB7+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB7 = (AccB7+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC7 = true;
           }if(tuti7 <= Pimi7){
              Print("Adios BAI 7 ", tuti7, " <= ", Pimi7, " orden #", OrderTicket(), " Inutil7 ", Inutil7, " Cerrao7 ", Cerrao7, " GanMax7 ", GanMax7, 
              " PerMax7 ", PerMax7, " Com7 ", Comicha7, " tuti7 ", tuti7," TodoAbiertoA ", AccE7);
              if(OrderType() == OP_BUY){
                 AccB7 = (AccB7+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB7 = (AccB7+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC7 = true;
           }if(machoMenAuC7){
              Print("Adeu machoMen 7, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil7, " Cerrao7 ", Cerrao7, " GanMax7 ", GanMax7, " PerMax7 ", PerMax7, 
              " Com7 ", Comicha7, " tuti7 ", tuti7," TodoAbiertoA ", AccE7);
              if(OrderType() == OP_BUY){
                 AccB7 = (AccB7+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB7 = (AccB7+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC7 = true;
           } NumPro = 7;
           CierreLAZARUS(diferenceTime, volume, NumPro, AccB7, Inutil7, Cerrao7, GanMax7, PerMax7, Comicha7, tuti7, AccE7);
         }if(volume == accBala1N && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1N && Symbol() == OrderSymbol())
               AccE8 = (AccE8+OrderProfit()); AccE8 = NormalizeDouble(AccE8, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao8 = AccB8; Inutil8 = (AccE8+AccB8); tuti8 = (AccB8+AccE8-Comicha8);
           if(tuti8 > GanMax8)
            GanMax8 = tuti8;
           if(tuti8 < PerMax8)
            PerMax8 = tuti8;
           if(PerMax8 <= Pimi8 || GanMax8 >= Sal8){
            if(!machoMenAuC8)
             Print("Yo fui, PerMax8 ", PerMax8, " GanMax8 ", GanMax8);
            machoMenAuC8 = true;}
           //Adeu Macho
           if(tuti8 >= Sal8){
              Print("Todos MIOS 8 ", tuti8, " >= ", Sal8, " orden #", OrderTicket(), " Inutil8 ", Inutil8, " Cerrao8 ", Cerrao8, " GanMax8 ", GanMax8, 
              " PerMax8 ", PerMax8, " Com8 ", Comicha8, " tuti8 ", tuti8," TodoAbiertoA ", AccE8);
              if(OrderType() == OP_BUY){
                 AccB8 = (AccB8+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB8 = (AccB8+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC8 = true;
           }if(tuti8 <= Pimi8){
              Print("Adios BAI 8 ", tuti8, " <= ", Pimi8, " orden #", OrderTicket(), " Inutil8 ", Inutil8, " Cerrao8 ", Cerrao8, " GanMax8 ", GanMax8, 
              " PerMax8 ", PerMax8, " Com8 ", Comicha8, " tuti8 ", tuti8," TodoAbiertoA ", AccE8);
              if(OrderType() == OP_BUY){
                 AccB8 = (AccB8+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB8 = (AccB8+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC8 = true;
           }if(machoMenAuC8){
              Print("Adeu machoMen 8, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil8, " Cerrao8 ", Cerrao8, " GanMax8 ", GanMax8, " PerMax8 ", PerMax8, 
              " Com8 ", Comicha8, " tuti8 ", tuti8," TodoAbiertoA ", AccE8);
              if(OrderType() == OP_BUY){
                 AccB8 = (AccB8+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB8 = (AccB8+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC8 = true;
           } NumPro = 8;
           CierreCubistNivel(diferenceTime, volume, NumPro, AccB8, Inutil8, Cerrao8, GanMax8, PerMax8, Comicha8, tuti8, AccE8);
         }if(volume == accBala1O && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1O && Symbol() == OrderSymbol())
               AccE9 = (AccE9+OrderProfit()); AccE9 = NormalizeDouble(AccE9, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao9 = AccB9; Inutil9 = (AccE9+AccB9); tuti9 = (AccB9+AccE9-Comicha9);
           if(tuti9 > GanMax9)
            GanMax9 = tuti9;
           if(tuti9 < PerMax9)
            PerMax9 = tuti9;
           if(PerMax9 <= Pimi9 || GanMax9 >= Sal9){
            if(!machoMenAuC9)
             Print("Yo fui, PerMax9 ", PerMax9, " GanMax9 ", GanMax9);
            machoMenAuC9 = true;}
           //Adeu Macho
           if(tuti9 >= Sal9){
              Print("Todos MIOS 9 ", tuti9, " >= ", Sal9, " orden #", OrderTicket(), " Inutil9 ", Inutil9, " Cerrao9 ", Cerrao9, " GanMax9 ", GanMax9, 
              " PerMax9 ", PerMax9, " Com9 ", Comicha9, " tuti9 ", tuti9," TodoAbiertoA ", AccE9);
              if(OrderType() == OP_BUY){
                 AccB9 = (AccB9+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB9 = (AccB9+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC9 = true;
           }if(tuti9 <= Pimi9){
              Print("Adios BAI 9 ", tuti9, " <= ", Pimi9, " orden #", OrderTicket(), " Inutil9 ", Inutil9, " Cerrao9 ", Cerrao9, " GanMax9 ", GanMax9, 
              " PerMax9 ", PerMax9, " Com9 ", Comicha9, " tuti9 ", tuti9," TodoAbiertoA ", AccE9);
              if(OrderType() == OP_BUY){
                 AccB9 = (AccB9+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB9 = (AccB9+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC9 = true;
           }if(machoMenAuC9){
              Print("Adeu machoMen 9, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil9, " Cerrao9 ", Cerrao9, " GanMax9 ", GanMax9, " PerMax9 ", PerMax9, 
              " Com9 ", Comicha9, " tuti9 ", tuti9," TodoAbiertoA ", AccE9);
              if(OrderType() == OP_BUY){
                 AccB9 = (AccB9+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB9 = (AccB9+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC9 = true;
           } NumPro = 9;
           CierreNivelVenta(diferenceTime, volume, NumPro, AccB9, Inutil9, Cerrao9, GanMax9, PerMax9, Comicha9, tuti9, AccE9);
         }if(volume == accBala1P && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1P && Symbol() == OrderSymbol())
               AccE10 = (AccE10+OrderProfit()); AccE10 = NormalizeDouble(AccE10, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao10 = AccB10; Inutil10 = (AccE10+AccB10); tuti10 = (AccB10+AccE10-Comicha10);
           if(tuti10 > GanMax10)
            GanMax10 = tuti10;
           if(tuti10 < PerMax10)
            PerMax10 = tuti10;
           if(PerMax10 <= Pimi10 || GanMax10 >= Sal10){
            if(!machoMenAuC10)
             Print("Yo fui, PerMax10 ", PerMax10, " GanMax10 ", GanMax10);
            machoMenAuC10 = true;}
           //Adeu Macho
           if(tuti10 >= Sal10){
              Print("Todos MIOS 10 ", tuti10, " >= ", Sal10, " orden #", OrderTicket(), " Inutil10 ", Inutil10, " Cerrao10 ", Cerrao10, " GanMax10 ", GanMax10, 
              " PerMax10 ", PerMax10, " Com10 ", Comicha10, " tuti10 ", tuti10," TodoAbiertoA ", AccE10);
              if(OrderType() == OP_BUY){
                 AccB10 = (AccB10+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB10 = (AccB10+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC10 = true;
           }if(tuti10 <= Pimi10){
              Print("Adios BAI 10 ", tuti10, " <= ", Pimi10, " orden #", OrderTicket(), " Inutil10 ", Inutil10, " Cerrao10 ", Cerrao10, " GanMax10 ", GanMax10, 
              " PerMax10 ", PerMax10, " Com10 ", Comicha10, " tuti10 ", tuti10," TodoAbiertoA ", AccE10);
              if(OrderType() == OP_BUY){
                 AccB10 = (AccB10+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB10 = (AccB10+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC10 = true;
           }if(machoMenAuC10){
              Print("Adeu machoMen 10, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil10, " Cerrao10 ", Cerrao10, " GanMax10 ", GanMax10, " PerMax10 ", PerMax10, 
              " Com10 ", Comicha10, " tuti10 ", tuti10," TodoAbiertoA ", AccE10);
              if(OrderType() == OP_BUY){
                 AccB10 = (AccB10+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB10 = (AccB10+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC10 = true;
           } NumPro = 10;
           CierreKksan3Velas(diferenceTime, volume, NumPro, AccB10, Inutil10, Cerrao10, GanMax10, PerMax10, Comicha10, tuti10, AccE10);
         }if(volume == accBala1Q && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1Q && Symbol() == OrderSymbol())
               AccE11 = (AccE11+OrderProfit()); AccE11 = NormalizeDouble(AccE11, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao11 = AccB11; Inutil11 = (AccE11+AccB11); tuti11 = (AccB11+AccE11-Comicha11);
           if(tuti11 > GanMax11)
            GanMax11 = tuti11;
           if(tuti11 < PerMax11)
            PerMax11 = tuti11;
           if(PerMax11 <= Pimi11 || GanMax11 >= Sal11){
            if(!machoMenAuC11)
             Print("Yo fui, PerMax11 ", PerMax11, " GanMax11 ", GanMax11);
            machoMenAuC11 = true;}
           //Adeu Macho
           if(tuti11 >= Sal11){
              Print("Todos MIOS 11 ", tuti11, " >= ", Sal11, " orden #", OrderTicket(), " Inutil11 ", Inutil11, " Cerrao11 ", Cerrao11, " GanMax11 ", GanMax11, 
              " PerMax11 ", PerMax11, " Com11 ", Comicha11, " tuti11 ", tuti11," TodoAbiertoA ", AccE11);
              if(OrderType() == OP_BUY){
                 AccB11 = (AccB11+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB11 = (AccB11+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC11 = true;
           }if(tuti11 <= Pimi11){
              Print("Adios BAI 11 ", tuti11, " <= ", Pimi11, " orden #", OrderTicket(), " Inutil11 ", Inutil11, " Cerrao11 ", Cerrao11, " GanMax11 ", GanMax11, 
              " PerMax11 ", PerMax11, " Com11 ", Comicha11, " tuti11 ", tuti11," TodoAbiertoA ", AccE11);
              if(OrderType() == OP_BUY){
                 AccB11 = (AccB11+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB11 = (AccB11+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC11 = true;
           }if(machoMenAuC11){
              Print("Adeu machoMen 11, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil11, " Cerrao11 ", Cerrao11, " GanMax11 ", GanMax11, " PerMax11 ", PerMax11, 
              " Com11 ", Comicha11, " tuti11 ", tuti11," TodoAbiertoA ", AccE11);
              if(OrderType() == OP_BUY){
                 AccB11 = (AccB11+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB11 = (AccB11+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC11 = true;
           } NumPro = 11;
           CierreGokuNivel(diferenceTime, volume, NumPro, AccB11, Inutil11, Cerrao11, GanMax11, PerMax11, Comicha11, tuti11, AccE11);
         }if(volume == accBala1R && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1R && Symbol() == OrderSymbol())
               AccE12 = (AccE12+OrderProfit()); AccE12 = NormalizeDouble(AccE12, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao12 = AccB12; Inutil12 = (AccE12+AccB12); tuti12 = (AccB12+AccE12-Comicha12);
           if(tuti12 > GanMax12)
            GanMax12 = tuti12;
           if(tuti12 < PerMax12)
            PerMax12 = tuti12;
           if(PerMax12 <= Pimi12 || GanMax12 >= Sal12){
            if(!machoMenAuC12)
             Print("Yo fui, PerMax12 ", PerMax12, " GanMax12 ", GanMax12);
            machoMenAuC12 = true;}
           //Adeu Macho
           if(tuti12 >= Sal12){
              Print("Todos MIOS 12 ", tuti12, " >= ", Sal12, " orden #", OrderTicket(), " Inutil12 ", Inutil12, " Cerrao12 ", Cerrao12, " GanMax12 ", GanMax12, 
              " PerMax12 ", PerMax12, " Com12 ", Comicha12, " tuti12 ", tuti12," TodoAbiertoA ", AccE12);
              if(OrderType() == OP_BUY){
                 AccB12 = (AccB12+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB12 = (AccB12+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC12 = true;
           }if(tuti12 <= Pimi12){
              Print("Adios BAI 12 ", tuti12, " <= ", Pimi12, " orden #", OrderTicket(), " Inutil12 ", Inutil12, " Cerrao12 ", Cerrao12, " GanMax12 ", GanMax12, 
              " PerMax12 ", PerMax12, " Com12 ", Comicha12, " tuti12 ", tuti12," TodoAbiertoA ", AccE12);
              if(OrderType() == OP_BUY){
                 AccB12 = (AccB12+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB12 = (AccB12+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC12 = true;
           }if(machoMenAuC12){
              Print("Adeu machoMen 12, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil12, " Cerrao12 ", Cerrao12, " GanMax12 ", GanMax12, " PerMax12 ", PerMax12, 
              " Com12 ", Comicha12, " tuti12 ", tuti12," TodoAbiertoA ", AccE12);
              if(OrderType() == OP_BUY){
                 AccB12 = (AccB12+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB12 = (AccB12+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC12 = true;
           } NumPro = 12;
           CierreCubistYGoku(diferenceTime, volume, NumPro, AccB12, Inutil12, Cerrao12, GanMax12, PerMax12, Comicha12, tuti12, AccE12);
         }if(volume == accBala1S && Symbol() == OrderSymbol()){  
           for(int k = 0; k < numberTotal; k++){
              if(!OrderSelect(k, SELECT_BY_POS, MODE_TRADES)){
               continue;}
              double volumek = OrderLots(); volumek = NormalizeDouble(volumek, 1); 
              if(volumek == accBala1S && Symbol() == OrderSymbol())
               AccE13 = (AccE13+OrderProfit()); AccE13 = NormalizeDouble(AccE13, 2);
           }
           if(!OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
            continue;} 
           Cerrao13 = AccB13; Inutil13 = (AccE13+AccB13); tuti13 = (AccB13+AccE13-Comicha13);
           if(tuti13 > GanMax13)
            GanMax13 = tuti13;
           if(tuti13 < PerMax13)
            PerMax13 = tuti13;
           if(PerMax13 <= Pimi13 || GanMax13 >= Sal13){
            if(!machoMenAuC13)
             Print("Yo fui, PerMax13 ", PerMax13, " GanMax13 ", GanMax13);
            machoMenAuC13 = true;}
           //Adeu Macho
           if(tuti13 >= Sal13){
              Print("Todos MIOS 13 ", tuti13, " >= ", Sal13, " orden #", OrderTicket(), " Inutil13 ", Inutil13, " Cerrao13 ", Cerrao13, " GanMax13 ", GanMax13, 
              " PerMax13 ", PerMax13, " Com13 ", Comicha13, " tuti13 ", tuti13," TodoAbiertoA ", AccE13);
              if(OrderType() == OP_BUY){
                 AccB13 = (AccB13+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB13 = (AccB13+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC13 = true;
           }if(tuti13 <= Pimi13){
              Print("Adios BAI 13 ", tuti13, " <= ", Pimi13, " orden #", OrderTicket(), " Inutil13 ", Inutil13, " Cerrao13 ", Cerrao13, " GanMax13 ", GanMax13, 
              " PerMax13 ", PerMax13, " Com13 ", Comicha13, " tuti13 ", tuti13," TodoAbiertoA ", AccE13);
              if(OrderType() == OP_BUY){
                 AccB13 = (AccB13+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB13 = (AccB13+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC13 = true;
           }if(machoMenAuC13){
              Print("Adeu machoMen 13, cierro la pta orden #", OrderTicket(), " utilidadA ", Inutil13, " Cerrao13 ", Cerrao13, " GanMax13 ", GanMax13, " PerMax13 ", PerMax13, 
              " Com13 ", Comicha13, " tuti13 ", tuti13," TodoAbiertoA ", AccE13);
              if(OrderType() == OP_BUY){
                 AccB13 = (AccB13+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
              }else if(OrderType() == OP_SELL){
                 AccB13 = (AccB13+OrderProfit());
                 OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
              }machoMenAuC13 = true;
           } NumPro = 13;
           CierreCubist3Velas(diferenceTime, volume, NumPro, AccB13, Inutil13, Cerrao13, GanMax13, PerMax13, Comicha13, tuti13, AccE13);
         }
      }
     //GUERRA
     /*if(OrderType() == OP_BUY){
        OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
     }else if(OrderType() == OP_SELL){
        OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
     }ExpertRemove();*/
     if(checkHoursSymbol(OrderSymbol())){
      if(volume == accBala1A || volume == accBala1B){
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax1 ", GanMax1, " PerMax1 ", PerMax1, " Com1 ", Comicha1); AccB1 = (AccB1+OrderProfit());} 
      if(volume == accBala1C || volume == accBala1D){
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax2 ", GanMax2, " PerMax2 ", PerMax2, " Com2 ", Comicha2); AccB2 = (AccB2+OrderProfit());}
      if(volume == accBala1E || volume == accBala1F){
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax3 ", GanMax3, " PerMax3 ", PerMax3, " Com3 ", Comicha3); AccB3 = (AccB3+OrderProfit());}
      if(volume == accBala1G || volume == accBala1H){
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax4 ", GanMax4, " PerMax4 ", PerMax4, " Com4 ", Comicha4); AccB4 = (AccB4+OrderProfit());} 
      if(volume == accBala1I || volume == accBala1J){
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax5 ", GanMax5, " PerMax5 ", PerMax5, " Com5 ", Comicha5); AccB5 = (AccB5+OrderProfit());}
      if(volume == accBala1K || volume == accBala1L){
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax6 ", GanMax6, " PerMax6 ", PerMax6, " Com6 ", Comicha6); AccB6 = (AccB6+OrderProfit());} 
      if(volume == accBala1M)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax7 ", GanMax7, " PerMax7 ", PerMax7, " Com7 ", Comicha7); AccB7 = (AccB7+OrderProfit());  
      if(volume == accBala1N)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax8 ", GanMax8, " PerMax8 ", PerMax8, " Com8 ", Comicha8); AccB8 = (AccB8+OrderProfit());  
      if(volume == accBala1O)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax9 ", GanMax9, " PerMax9 ", PerMax9, " Com9 ", Comicha9); AccB9 = (AccB9+OrderProfit());  
      if(volume == accBala1P)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax10 ", GanMax10, " PerMax10 ", PerMax10, " Com10 ", Comicha10); AccB10 = (AccB10+OrderProfit());  
      if(volume == accBala1Q)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax11 ", GanMax11, " PerMax11 ", PerMax11, " Com11 ", Comicha11); AccB11 = (AccB11+OrderProfit());  
      if(volume == accBala1R)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax12 ", GanMax12, " PerMax12 ", PerMax12, " Com12 ", Comicha12); AccB12 = (AccB12+OrderProfit());  
      if(volume == accBala1S)
        Print("Cierro por el horario - orden #", OrderTicket(), " GanMax13 ", GanMax13, " PerMax13 ", PerMax13, " Com13 ", Comicha13); AccB13 = (AccB13+OrderProfit());  
      if(OrderType() == OP_BUY){
         OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
      }else if(OrderType() == OP_SELL){
         OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
      }
     }Viernes = 0; //Para activar condicionante, dar valor de 1
     if(Viernes > 0 && hour >= 20){
      if(volume == accBala1A || volume == accBala1B){
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax1 ", GanMax1, " PerMax1 ", PerMax1, " Com1 ", Comicha1); AccB1 = (AccB1+OrderProfit());} 
      if(volume == accBala1C || volume == accBala1D){
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax2 ", GanMax2, " PerMax2 ", PerMax2, " Com2 ", Comicha2); AccB2 = (AccB2+OrderProfit());}
      if(volume == accBala1E || volume == accBala1F){
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax3 ", GanMax3, " PerMax3 ", PerMax3, " Com3 ", Comicha3); AccB3 = (AccB3+OrderProfit());}
      if(volume == accBala1G || volume == accBala1H){
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax4 ", GanMax4, " PerMax4 ", PerMax4, " Com4 ", Comicha4); AccB4 = (AccB4+OrderProfit());} 
      if(volume == accBala1I || volume == accBala1J){
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax5 ", GanMax5, " PerMax5 ", PerMax5, " Com5 ", Comicha5); AccB5 = (AccB5+OrderProfit());}
      if(volume == accBala1K || volume == accBala1L){
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax6 ", GanMax6, " PerMax6 ", PerMax6, " Com6 ", Comicha6); AccB6 = (AccB6+OrderProfit());} 
      if(volume == accBala1M)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax7 ", GanMax7, " PerMax7 ", PerMax7, " Com7 ", Comicha7); AccB7 = (AccB7+OrderProfit());  
      if(volume == accBala1N)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax8 ", GanMax8, " PerMax8 ", PerMax8, " Com8 ", Comicha8); AccB8 = (AccB8+OrderProfit());  
      if(volume == accBala1O)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax9 ", GanMax9, " PerMax9 ", PerMax9, " Com9 ", Comicha9); AccB9 = (AccB9+OrderProfit());  
      if(volume == accBala1P)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax10 ", GanMax10, " PerMax10 ", PerMax10, " Com10 ", Comicha10); AccB10 = (AccB10+OrderProfit());  
      if(volume == accBala1Q)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax11 ", GanMax11, " PerMax11 ", PerMax11, " Com11 ", Comicha11); AccB11 = (AccB11+OrderProfit());  
      if(volume == accBala1R)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax12 ", GanMax12, " PerMax12 ", PerMax12, " Com12 ", Comicha12); AccB12 = (AccB12+OrderProfit());  
      if(volume == accBala1S)
        Print("Despues de las 8 viernes cierro orden #", OrderTicket(), " GanMax13 ", GanMax13, " PerMax13 ", PerMax13, " Com13 ", Comicha13); AccB13 = (AccB13+OrderProfit());  
      if(OrderType() == OP_BUY){
         OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
      }else if(OrderType() == OP_SELL){
         OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
      }
     }else if(hour >= 20.8){
      if(volume == accBala1A || volume == accBala1B){
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax1 ", GanMax1, " PerMax1 ", PerMax1, " Com1 ", Comicha1); AccB1 = (AccB1+OrderProfit());} 
      if(volume == accBala1C || volume == accBala1D){
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax2 ", GanMax2, " PerMax2 ", PerMax2, " Com2 ", Comicha2); AccB2 = (AccB2+OrderProfit());}
      if(volume == accBala1E || volume == accBala1F){
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax3 ", GanMax3, " PerMax3 ", PerMax3, " Com3 ", Comicha3); AccB3 = (AccB3+OrderProfit());}
      if(volume == accBala1G || volume == accBala1H){
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax4 ", GanMax4, " PerMax4 ", PerMax4, " Com4 ", Comicha4); AccB4 = (AccB4+OrderProfit());} 
      if(volume == accBala1I || volume == accBala1J){
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax5 ", GanMax5, " PerMax5 ", PerMax5, " Com5 ", Comicha5); AccB5 = (AccB5+OrderProfit());}
      if(volume == accBala1K || volume == accBala1L){
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax6 ", GanMax6, " PerMax6 ", PerMax6, " Com6 ", Comicha6); AccB6 = (AccB6+OrderProfit());} 
      if(volume == accBala1M)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax7 ", GanMax7, " PerMax7 ", PerMax7, " Com7 ", Comicha7); AccB7 = (AccB7+OrderProfit());  
      if(volume == accBala1N)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax8 ", GanMax8, " PerMax8 ", PerMax8, " Com8 ", Comicha8); AccB8 = (AccB8+OrderProfit());  
      if(volume == accBala1O)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax9 ", GanMax9, " PerMax9 ", PerMax9, " Com9 ", Comicha9); AccB9 = (AccB9+OrderProfit());  
      if(volume == accBala1P)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax10 ", GanMax10, " PerMax10 ", PerMax10, " Com10 ", Comicha10); AccB10 = (AccB10+OrderProfit());  
      if(volume == accBala1Q)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax11 ", GanMax11, " PerMax11 ", PerMax11, " Com11 ", Comicha11); AccB11 = (AccB11+OrderProfit());  
      if(volume == accBala1R)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax12 ", GanMax12, " PerMax12 ", PerMax12, " Com12 ", Comicha12); AccB12 = (AccB12+OrderProfit());  
      if(volume == accBala1S)
        Print("Despues de las 20:50 cierro orden #", OrderTicket(), " GanMax13 ", GanMax13, " PerMax13 ", PerMax13, " Com13 ", Comicha13); AccB13 = (AccB13+OrderProfit());  
      if(OrderType() == OP_BUY){
         OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
      }else if(OrderType() == OP_SELL){
         OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
      }
     }else{}
   }if(vol > 320){return false;}
   return true;
}

bool checkHoursSymbol(string symbol){
   float hour = TimeHour(TimeGMT()); float minute = TimeMinute(TimeGMT()); minute = ((minute*50)/30)/100; hour += minute;
   if(symbol == "AUDCAD&"){if(hour<5 || hour>=21.8){return true;}}else{}
   return false;
}

void readMatrix(){
   ResetLastError();
   fAudcadV = FileOpen(audcadV,FILE_READ|FILE_CSV|FILE_ANSI,",");
   if(fAudcadV<0){Print("Failed to open the file by the absolute path ",fAudcadV);Print("Error code ",GetLastError());}
   else{double value; int xi = 0;
      while(!FileIsEnding(fAudcadV)){value=FileReadNumber(fAudcadV); matAudcadV[0][xi] = value; xi++;}     
      FileClose(fAudcadV);} 
}

void NivelVenta(double &magic, double OPen, double NumPro, double volume, double &Comicha, double prediCubV){ 
//NivelVenta(magic, OPen, #, volume, Comicha, prediCubV);
   if(prediCubV > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"NIVELVENTA",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende Nivel Venta. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1; 
      }
   }if(prediCubV < 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"NIVELVENTA",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra Nivel Venta. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1; 
      }
   }
}
void CubistYGoku(double &magic, double OPen, double NumPro, double volume, double &Comicha, double prediRfA, double prediCubA){ 
//CubistYGoku(magic, OPen, #, volume, Comicha, prediRfA, prediCubA);
   if(prediRfA < 0 && prediCubA < 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"CUBISTGOKU",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende Cubist & Goku. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(prediRfA > 0 && prediCubA > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"CUBISTGOKU",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra Cubist & Goku. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}
void GokuNivel(double &magic, double OPen, double NumPro, double volume, double &Comicha, double prediRfA, double prediCubV, double prediCubC){ 
//GokuNivel(magic, OPen, #, volume, Comicha, prediRfA, prediCubV, prediCubC);
   if(prediRfA < 0 && prediCubV > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"GOKUNIVEL",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende Goku Nivel. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(prediRfA > 0 && prediCubC > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"GOKUNIVEL",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra Goku Nivel. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}
void CubistNivel(double &magic, double OPen, double NumPro, double volume, double &Comicha, double prediCubA2, double prediCubV, double prediCubC){ 
//CubistNivel(magic, OPen, #, volume, Comicha, prediCubA2, prediCubV, prediCubC);
   if(prediCubA2 < 0 && prediCubV > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"CUBISTNIVEL",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende Cubist Nivel. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(prediCubA2 > 0 && prediCubC > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"CUBISTNIVEL",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra Cubist Nivel. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}
void Lazarus(double &magic, double OPen, double NumPro, double volume, double &Comicha, double Difpred1, double DifMM, double DifMM1){ 
//Lazarus(magic, OPen, 7, volumeM, Comicha7, Difpred1, DifMM);
   if(DifMM > 0 && Difpred1 < 0 && DifMM1 < 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"LAZARUS",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende LAZARUS ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(DifMM < 0 && Difpred1 > 0 && DifMM1 > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"LAZARUS",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra LAZARUS ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}
void Cubist2Velas(double &magic, double OPen, double NumPro, double volume, double &Comicha, double prediCubA2){ 
//Cubist2Velas(magic, OPen, #, volume, Comicha, prediCubA2);
   if(prediCubA2 < 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"CUB2VELAS",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende cubist 2 velas. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(prediCubA2 > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"CUB2VELAS",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra cubist 2 velas. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}
void Cubist3Velas(double &magic, double OPen, double NumPro, double volume, double &Comicha, double prediCubA3){ 
//Cubist3Velas(magic, OPen, #, volume, Comicha, prediCubA3);
   if(prediCubA3 < 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"CUB3VELAS",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende cubist 3 velas. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(prediCubA3 > 0){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"CUB3VELAS",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra cubist 3 velas. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}
void Kksan3Velas(double &magic, double OPen, double NumPro, double volume, double &Comicha, double DifCar, double PrediV, double prediV1, double PricePromStdV, 
double PriceProm2StdV){ 
//Kksan3Velas(magic, OPen, #, volume, Comicha, DifCar, PrediV, prediV1, PricePromStdV, PriceProm2StdV);
   if(DifCar > 0 && PrediV > prediV1 && PricePromStdV > PriceProm2StdV){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Bid;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_SELL,volume,price,3,stoploss,takeprofit,"KKSAN3VELAS",magic,0,clrGreen);
      if(ticket<0){
         Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Vende Kksan 3v. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }if(DifCab > 0 && PrediV < prediV1 && PricePromStdV < PriceProm2StdV){
      double minstoplevel=MarketInfo(Symbol(),MODE_STOPLEVEL);
      double price = Ask;
      double stoploss=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_LOWER,0);
      stoploss = NormalizeDouble(stoploss, Digits);
      double takeprofit=iEnvelopes(Symbol(),60,4,MODE_SMA,0,PRICE_CLOSE,0.4,MODE_UPPER,0);
      takeprofit = NormalizeDouble(takeprofit, Digits);
      int ticket = OrderSend(Symbol(),OP_BUY,volume,price,3,stoploss,takeprofit,"KKSAN3VELAS",magic,0,clrGreen);
      if(ticket<0){
        Print("OrderSend failed with error #",GetLastError());
      }else{
        Print("Compra Kksan 3v. Pro ", NumPro, " magic ", magic);
        VeAl38 = false; VelaOpen = OPen; Comicha = (Comicha+volume); Print("Com ", Comicha);
        magic = OrdersTotal() + OrdersHistoryTotal() + 1;
      }
   }
}

//CIERRES
void CierreLAZARUS(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "LAZARUS" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(diferenceTime >= 10800){
             Print("Se acabo el tiempo, cierra orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, " GanMax ", GanMax, " PerMax ", PerMax, 
             " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " LAZARUS");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " LAZARUS");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-15))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-15))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " LAZARUS");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreNivelVenta(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "NIVELVENTA" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " NivelVenta");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-20))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-20))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " NivelVenta");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreCubistYGoku(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "CUBISTGOKU" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(diferenceTime >= 3600){
             Print("Se acabo el tiempo, cierra orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, " GanMax ", GanMax, " PerMax ", PerMax, 
             " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " CubistYGoku");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " CubistYGoku");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-16))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-16))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " CubistYGoku");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreGokuNivel(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "GOKUNIVEL" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(diferenceTime >= 3600){
             Print("Se acabo el tiempo, cierra orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, " GanMax ", GanMax, " PerMax ", PerMax, 
             " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " GokuNivel");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " GokuNivel");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-16))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-16))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " GokuNivel");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreCubistNivel(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "CUBISTNIVEL" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " CubistNivel");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-16))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-16))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " CubistNivel");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreCubist2Velas(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "CUB2VELAS" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(diferenceTime >= 7200){
             Print("Se acabo el tiempo, cierra orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, " GanMax ", GanMax, " PerMax ", PerMax, 
             " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Cub2velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Cub2velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-20))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-20))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Cub2velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreCubist3Velas(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "CUB3VELAS" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(diferenceTime >= 10800){
             Print("Se acabo el tiempo, cierra orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, " GanMax ", GanMax, " PerMax ", PerMax, 
             " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Cub3Velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Cub3Velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-25))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-25))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Cub3Velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}
void CierreKksan3Velas(double diferenceTime, double volume, double NumPro, double &AccB, double Inutil, double Cerrao, double GanMax, double PerMax, double Comicha, 
double tuti, double AccE){
   if(OrderComment() == "KKSAN3VELAS" && Symbol() == OrderSymbol()){
     for(int j = 0; j < 1009; j++){
        if(Symbol() == OrderSymbol() && j == OrderMagicNumber()){
          if(diferenceTime >= 10800){
             Print("Se acabo el tiempo, cierra orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, " GanMax ", GanMax, " PerMax ", PerMax, 
             " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Kksan3Velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }if(OrderProfit() >= (volume*8)){
             Print("Ganaste, profit: ", OrderProfit(), " >= ", (volume*8)," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Kksan3Velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }else if(OrderProfit() <= (volume*(-25))){
             Print("Perdiste, profit: ", OrderProfit(), " <= ", (volume*(-25))," orden #", OrderTicket(), " utilidad ", Inutil, " Cerrao ", Cerrao, 
             " GanMax ", GanMax, " PerMax ", PerMax, " Com ", Comicha, " tuti ", tuti, " Abierto ", AccE, " Pro ", NumPro, " Kksan3Velas");
             if(OrderType() == OP_BUY){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Bid, Digits), 3, Red);
             }else if(OrderType() == OP_SELL){
                AccB = (AccB+OrderProfit());
                OrderClose(OrderTicket(),volume, NormalizeDouble(Ask, Digits), 3, Red);
             }
          }
        }
     }
   }
}


