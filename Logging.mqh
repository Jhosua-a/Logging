//+------------------------------------------------------------------+
//|                                                      Logging.mqh |
//|                                                    Akimasa Ohara |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      "https://www.mql5.com"
#property version   "0.01"

class  Logging{

public:
   virtual void fatal(int processID, string process, string status) = NULL;
   virtual void error(int processID, string process, string status) = NULL;
   virtual void warn(int processID, string process, string status) = NULL;
   virtual void info(int processID, string process, string status) = NULL;
   virtual void debug(int processID, string process, string status) = NULL;
   virtual void trace(int processID, string process, string status) = NULL;
   virtual string createString(string level, int processID, string process, string status) = NULL;
   
private:
   int MagicNumber; // 処理ID
   int LogLevel; // ログレベル
};