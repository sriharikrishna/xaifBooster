#ifndef _BASELOGGER_INCLUDE_
#define _BASELOGGER_INCLUDE_

#include <iostream>
#include <sstream>
#include "utils/inc/Mutex.hpp"

namespace xaifBooster { 

  /** 
   * the base class for all loggers
   * which writes a single line (!) message 
   * given as an ostringstream to 
   * an ostream and has 
   * mutex protection
   */
  class BaseLogger { 

  public: 

    BaseLogger(std::ostream& anOstream_r);

    /**
     * class implements this method using the intLogMessage
     * method. Has to format the stream or takes already formatted 
     * stream
     */
    virtual void logMessage(std::ostringstream& aMessage_r) =0; 

    virtual ~BaseLogger();

  protected:

    /**
     * intLog writes the formatted message
     * called by log
     */
    void intLogMessage(std::ostringstream& aMessage_r);

  private: 

    /** 
     * the stream we are writing to
     */
    std::ostream& myOstream_r;

    /**
     * the mutex to protect the log call
     */
    static Mutex ourMutex;

  }; // end of class BaseLogger

}

#endif
