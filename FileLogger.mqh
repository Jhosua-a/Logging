//+------------------------------------------------------------------+
//|                                                   FileLogger.mqh |
//|                                                    Akimasa Ohara |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      "https://www.mql5.com"

#include "Logger.mqh"

// File操作用のログ
class FileLogger : public Logger
{
 public:
   FileLogger(int magicNum, string logLevel, int fileHnadle); //コンストラクタ
   ~FileLogger(){}; //デストラクタ
   void fatal(int processID, string process, string status);
   void error(int processID, string process, string status);
   void warn(int processID, string process, string status);
   void info(int processID, string process, string status);
   void debug(int processID, string process, string status);
   void trace(int processID, string process, string status);
   string createString(string level, int processID, string process, string status);
 
 private:
   
   int MagicNumber; // システムID
   int LogLevel; // ログレベル
   int FileHandle; // ファイルハンドラー
   
};

//コンストラクタ
void FileLogger::FileLogger(int magicNum, string logLevel, int fileHandle) : Logger(magicNum, logLevel){ 
   FileHandle = fileHandle;   
}
 

void FileLogger::fatal(int processID, string process, string status){    
   if(LogLevel <= 6){
      // 出力文の生成・出力
      string outputLog = createString("FATAL", processID, process, status);
      Print(outputLog); 
   }   
}
   
void FileLogger::error(int processID, string process, string status){    
   if(LogLevel <= 5){
      string outputLog = createString("ERROR", processID, process, status);
      Print(outputLog);    
   }
}
   
void FileLogger::warn(int processID, string process, string status){    
   if(LogLevel <= 4){
      string outputLog = createString("WARN", processID, process, status);
      Print(outputLog);    
   }
}
   
void FileLogger::info(int processID, string process, string status){    
   if(LogLevel <= 3){
      string outputLog = createString("INFO", processID, process, status);
      Print(outputLog);    
   }
}
   
void FileLogger::debug(int processID, string process, string status){    
   if(LogLevel <= 2){
      string outputLog = createString("DEBUG", processID, process, status);
      Print(outputLog);    
   }
}

void FileLogger::trace(int processID, string process, string status){    
   if(LogLevel <= 1){
      string outputLog = createString("TRACE", processID, process, status);
      Print(outputLog);    
   }
}

string FileLogger::createString(string level, int processID, string process, string status){
   // 現在時間の取得
   datetime current = TimeCurrent();
   string outputLog;
      
   StringConcatenate(outputLog, IntegerToString(MagicNumber), ", ", level, ", ", current, ", ", IntegerToString(processID), ", ", IntegerToString(FileHandle), ", ", process, ", ",status);
      
   return outputLog;
}