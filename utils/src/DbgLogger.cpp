#include "xaifBooster/utils/inc/DbgLogger.hpp"

namespace xaifBooster { 

  DbgLogger::DbgLogger(std::ostream& anOstream_r) :
    BaseLogger(anOstream_r) {
  } // end of DbgLogger::DbgLogger

  void
  DbgLogger::logMessage(std::ostringstream& aMessage_r) { 
    intLogMessage(aMessage_r);
  } // end of DbgLogger::log

  DbgLogger::~DbgLogger() {
  } // end of DbgLogger::~DbgLogger

}
