#include "xaifBooster/utils/inc/DbgGroup.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  std::string 
  DbgGroup::toString(const DbgGroup_E& aGroup)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aGroup) {
    case ERROR:
      returnString="ERROR";
      break;
    case WARNING:
      returnString="WARNING";
      break;
    case CALLSTACK: 
      returnString="CALLSTACK";
      break;
    case DATA: 
      returnString="DATA";
      break;
    case GRAPHICS: 
      returnString="GRAPHICS";
      break;
    case TIMING: 
      returnString="TIMING";
      break;
    case TEMPORARY: 
      returnString="TEMPORARY";
      break;
    case WARNING:
      returnString="WARNING";
      break;
    default: 
      throw PrintingIntException("DbgGroup::toString: unknown value",aGroup);
      break;
    } // end switch
    return returnString;
  } // end of std::string DbgGroup::toString

  std::string 
  DbgGroup::printAll() throw (PrintingIntException) {
    return std::string("ERROR=0, WARNING=1. CALLSTACK=2, DATA=4, GRAPHICS=8, TIMING=16, TEMPORARY=32");
  }

} // end of namespace xaifBooster
