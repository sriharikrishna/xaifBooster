#include "utils/inc/LogicException.hpp"

namespace xaifBooster { 

  LogicException::LogicException(std::string aFileName,
				 int aLineNumber,
				 std::string what) { 
    std::ostringstream reason;
    reason << "(" 
	   << aFileName.c_str()
	   << ":"
	   << aLineNumber
	   << ")LogicException: " << what ;
    convertToOneLineReason(reason);
  } // end of LogicException::LogicException
  
} // end of namespace xaifBooster
                                                                     


