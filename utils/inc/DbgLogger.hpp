#ifndef _DBGLOGGER_INCLUDE_
#define _DBGLOGGER_INCLUDE_

#include "utils/inc/BaseLogger.hpp"

namespace xaifBooster { 

  /** 
   * class used by DbgLoggerManager
   */
  class DbgLogger :public BaseLogger { 

  public: 
 
    DbgLogger(std::ostream& anOstream_r);

    virtual void logMessage(std::ostringstream& aMessage_r); 

    virtual ~DbgLogger();

  }; // end of class DbgLogger

}

#endif









