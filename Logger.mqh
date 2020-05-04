//+------------------------------------------------------------------+
//|                                                       Logger.mqh |
//|                                                    Akimasa Ohara |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      "https://www.mql5.com"

#include "Logging.mqh"

class Logger : public Logging
{
 public:
   
   Logger(int magicNum, string logLevel); //コンストラクタ
   ~Logger(){}; //デストラクタ
   virtual void fatal(int processID, string process, string status);
   virtual void error(int processID, string process, string status);
   virtual void warn(int processID, string process, string status);
   virtual void info(int processID, string process, string status);
   virtual void debug(int processID, string process, string status);
   virtual void trace(int processID, string process, string status);
   virtual string createString(string level, int processID, string process, string status);
 
 private:
   
   int MagicNumber; // 処理ID
   int LogLevel; // ログレベル
   
};

void Logger::Logger(int magicNum, string logLevel){
   MagicNumber = magicNum;
      
   // level数値割り振り
   if(logLevel=="FATAL") LogLevel = 6;
   else if(logLevel=="ERROR") LogLevel = 5;  
   else if(logLevel=="WARN") LogLevel = 4;
   else if(logLevel=="INFO") LogLevel = 3;
   else if(logLevel=="DEBUG") LogLevel = 2;
   else if(logLevel=="TRACE") LogLevel = 1;
   else LogLevel = 7;
       
}
 
void Logger::fatal(int processID, string process, string status){
   if(LogLevel <= 6){
      // 出力文の生成・出力
      string outputLog = createString("FATAL", processID, process, status);
      Print(outputLog);    
   } 
}
   
void Logger::error(int processID, string process, string status){
   if(LogLevel <= 5){
      string outputLog = createString("ERROR", processID, process, status);
      Print(outputLog);  
   }
}
   
void Logger::warn(int processID, string process, string status){  
   if(LogLevel <= 4){
      string outputLog = createString("WARN", processID, process, status);
      Print(outputLog);  
   }      
}
   
void Logger::info(int processID, string process, string status){ 
   if(LogLevel <= 3){  
      string outputLog = createString("INFO", processID, process, status);
      Print(outputLog);       
   }
}
   
void Logger::debug(int processID, string process, string status){   
  if(LogLevel <= 2){
      string outputLog = createString("DEBUG", processID, process, status);
      Print(outputLog);        
   }
}
   
void Logger::trace(int processID, string process, string status){      
   if(LogLevel <= 1){
      string outputLog = createString("TRACE", processID, process, status);
      Print(outputLog);  
   }    
}
   
string Logger::createString(string level, int processID, string process, string status){
   // 現在時間の取得
   datetime current = TimeCurrent();
   string outputLog;
      
   StringConcatenate(outputLog, IntegerToString(MagicNumber), ", ", level, ", ", current, ", ", IntegerToString(processID), ", ", process, ", ",status);
      
   return outputLog;
}
 

