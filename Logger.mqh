//+------------------------------------------------------------------+
//|                                                       Logger.mqh |
//|                                                    Akimasa Ohara |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "Logging.mqh"

class Logger : public Logging
{
 protected:
   int MagicNumber; // システムID
   int LogLevel; // ログレベル 
   string ClassName; // 呼び出し元のクラス名
   
 public:
   
   Logger(int magicNum, int logLevel, string className); //コンストラクタ
   ~Logger(){}; //デストラクタ
   virtual void fatal(int processID, bool timing, string process, string status);
   virtual void error(int processID, bool timing, string process, string status);
   virtual void warn(int processID, bool timing, string process, string status);
   virtual void info(int processID, bool timing, string process, string status);
   virtual void debug(int processID, bool timing, string process, string status);
   virtual void trace(int processID, bool timing, string process, string status);
   virtual string createString(string level, int processID, bool timing, string process, string status);
 
 private:
   
   
   
};

void Logger::Logger(int magicNum, int logLevel, string className){
   MagicNumber = magicNum;
   LogLevel = logLevel;
   ClassName = className;
/*      
   // level数値割り振り
   if(logLevel=="FATAL") LogLevel = 6;
   else if(logLevel=="ERROR") LogLevel = 5;  
   else if(logLevel=="WARN") LogLevel = 4;
   else if(logLevel=="INFO") LogLevel = 3;
   else if(logLevel=="DEBUG") LogLevel = 2;
   else if(logLevel=="TRACE") LogLevel = 1;
   else LogLevel = 7;
*/
       
}
 
void Logger::fatal(int processID, bool timing, string process, string status){
   if(LogLevel <= 6){
      // 出力文の生成・出力
      string outputLog = createString("FATAL", processID, timing, process, status);
      Print(outputLog);    
   } 
}
   
void Logger::error(int processID, bool timing, string process, string status){
   if(LogLevel <= 5){
      string outputLog = createString("ERROR", processID, timing, process, status);
      Print(outputLog);  
   }
}
   
void Logger::warn(int processID, bool timing, string process, string status){  
   if(LogLevel <= 4){
      string outputLog = createString("WARN", processID, timing, process, status);
      Print(outputLog);  
   }      
}
   
void Logger::info(int processID, bool timing, string process, string status){ 
   if(LogLevel <= 3){  
      string outputLog = createString("INFO", processID, timing, process, status);
      Print(outputLog);       
   }
}
   
void Logger::debug(int processID, bool timing, string process, string status){   
  if(LogLevel <= 2){
      string outputLog = createString("DEBUG", processID, timing, process, status);
      Print(outputLog);        
   }
}
   
void Logger::trace(int processID, bool timing, string process, string status){      
   if(LogLevel <= 1){
      string outputLog = createString("TRACE", processID, timing, process, status);
      Print(outputLog);  
   }    
}
   
string Logger::createString(string level, int processID, bool timing, string process, string status){
   // 現在時間の取得
   datetime current = TimeCurrent();
   string outputLog;
      
   if(timing == true){
      StringConcatenate(outputLog, IntegerToString(MagicNumber), ",", level, ",", current, ",", IntegerToString(processID), ",START,", ClassName, ",", process, ",",status);
   }else if(timing == false){
      StringConcatenate(outputLog, IntegerToString(MagicNumber), ",", level, ",", current, ",", IntegerToString(processID), ",END,", ClassName, ",", process, ",",status);
   }   
   
   return outputLog;
}
 

