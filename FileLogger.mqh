//+------------------------------------------------------------------+
//|                                                   FileLogger.mqh |
//|                                                    Akimasa Ohara |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      "https://www.mql5.com"
#property version   "1.00"

#include "Logger.mqh"

// File操作用のログ
class FileLogger : public Logger
{
 protected:
   int FileHandle; // ファイルハンドラー

 public:
   FileLogger(int magicNum, int logLevel, int fileHandle, string className); //コンストラクタ 
   ~FileLogger(){}; //デストラクタ
   void fatal(int processID, bool timing, string process, string status);
   void error(int processID, bool timing, string process, string status);
   void warn(int processID, bool timing, string process, string status);
   void info(int processID, bool timing, string process, string status);
   void debug(int processID, bool timing, string process, string status);
   void trace(int processID, bool timing, string process, string status);
   string createString(string level, int processID, bool timing, string process, string status);
   void setFileHandle(int fileHandle) {FileHandle = fileHandle;};

 private:
   
};

//コンストラクタ
void FileLogger::FileLogger(int magicNum, int logLevel, int fileHandle, string className) : Logger(magicNum, logLevel, className){ 
     MagicNumber = magicNum;
     LogLevel = logLevel;
     FileHandle = fileHandle;
     ClassName = className;
}
 

void FileLogger::fatal(int processID, bool timing, string process, string status){    
   if(LogLevel <= 6){
      // 出力文の生成・出力
      string outputLog = createString("FATAL", processID, timing, process, status);
      Print(outputLog); 
   }   
}

void FileLogger::error(int processID, bool timing, string process, string status){    
   if(LogLevel <= 5){
      string outputLog = createString("ERROR", processID, timing, process, status);
      Print(outputLog);    
   }
}
   
void FileLogger::warn(int processID, bool timing, string process, string status){    
   if(LogLevel <= 4){
      string outputLog = createString("WARN", processID, timing, process, status);
      Print(outputLog);    
   }
}
   
void FileLogger::info(int processID, bool timing, string process, string status){    
   if(LogLevel <= 3){
      string outputLog = createString("INFO", processID, timing, process, status);
      Print(outputLog);    
   }
}
   
void FileLogger::debug(int processID, bool timing, string process, string status){    
   if(LogLevel <= 2){
      string outputLog = createString("DEBUG", processID, timing, process, status);
      Print(outputLog);    
   }
}

void FileLogger::trace(int processID, bool timing, string process, string status){    
   if(LogLevel <= 1){
      string outputLog = createString("TRACE", processID, timing, process, status);
      Print(outputLog);    
   }
}

string FileLogger::createString(string level, int processID, bool timing, string process, string status){
   // 現在時間の取得
   datetime current = TimeCurrent();
   string outputLog;
      
   if(timing == true){
      StringConcatenate(outputLog, IntegerToString(MagicNumber), ",", level, ",", current, ",", IntegerToString(processID), ",START,", ClassName, ",", process, ",", status, ",", IntegerToString(FileHandle));
   }else if(timing == false){
      StringConcatenate(outputLog, IntegerToString(MagicNumber), ",", level, ",", current, ",", IntegerToString(processID), ",END,", ClassName, ",", process, ",",status, ",", IntegerToString(FileHandle));
   }
      
   return outputLog;
}