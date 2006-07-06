#include "xaifBooster/system/inc/UndefinedSubroutineException.hpp"

namespace xaifBooster { 

  UndefinedSubroutineException::UndefinedSubroutineException(std::string aFileName,
							     int aLineNumber,
							     std::string what) :
    LogicException(aFileName,aLineNumber,what) { 
  } // end of UndefinedSubroutineException::UndefinedSubroutineException
  
} // end of namespace xaifBooster
                                                                     
