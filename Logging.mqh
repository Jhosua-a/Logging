//+------------------------------------------------------------------+
//|                                                      Logging.mqh |
//|                                                    Akimasa Ohara |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Akimasa Ohara"
#property link      "https://www.mql5.com"
#property version   "1.00"

class  Logging{

public:
   virtual void fatal(int processID, bool timing, string process, string status) = NULL;
   virtual void error(int processID, bool timing, string process, string status) = NULL;
   virtual void warn(int processID, bool timing, string process, string status) = NULL;
   virtual void info(int processID, bool timing, string process, string status) = NULL;
   virtual void debug(int processID, bool timing, string process, string status) = NULL;
   virtual void trace(int processID, bool timing, string process, string status) = NULL;
   virtual string createString(string level, int processID, bool timing, string process, string status) = NULL;
   
private:
   int MagicNumber; // 処理ID
   int LogLevel; // ログレベル
   string ClassName; // 呼び出し元のクラス名
};