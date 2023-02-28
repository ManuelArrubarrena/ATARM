//+------------------------------------------------------------------+
//|                                                   CambioLote.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   CambioLote();
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   //CambioLote();
  }
//+------------------------------------------------------------------+
void CambioLote(){
   double LoteActual = 0.6; LoteActual = NormalizeDouble(LoteActual, 1);
   double LoteDeseado = 0.7; LoteDeseado = NormalizeDouble(LoteDeseado, 1);
   int TotalOrdenes = OrdersTotal()+1;
   double Price = 0;
   for(int a = 0; a < TotalOrdenes; a++){
      if(!OrderSelect(a, SELECT_BY_POS, MODE_TRADES)){
       continue;}
         if(OrderType() == OP_BUYLIMIT){
            Price = OrderOpenPrice(); Price = NormalizeDouble(Price, Digits);
            string Divisa = OrderSymbol();
            int ticket = OrderSend(Divisa,OP_BUYLIMIT,LoteDeseado,Price,3,0,0,"NULL",0,0,clrGreen);
            if(ticket<0){
               Print("OrderSend failed with error #",GetLastError());
            }else{
               Print("chido ");
            }
         }
         if(OrderType() == OP_SELLLIMIT){
            Price = OrderOpenPrice(); Price = NormalizeDouble(Price, Digits);
            string Divisa = OrderSymbol();
            int ticket = OrderSend(Divisa,OP_SELLLIMIT,LoteDeseado,Price,3,0,0,"NULL",0,0,clrGreen);
            if(ticket<0){
               Print("OrderSend failed with error #",GetLastError());
            }else{
               Print("chido ");
            }
         }
   }
   int TotalOrdenes2 = OrdersTotal()+1;
   for(int p = 0; p < TotalOrdenes2; p++){
      if(!OrderSelect(p, SELECT_BY_POS, MODE_TRADES)){
       continue;}
         string Divisa = OrderSymbol();
         if(OrderLots() == LoteActual){
            OrderDelete(OrderTicket());
            Print("Adeu ", Divisa);
            p = (p-1);  
         }   
   } 
}