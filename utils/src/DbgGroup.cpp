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
    return std::string("ERROR=0, CALLSTACK=1, DATA=2, GRAPHICS=4, TIMING=8, TEMPORARY=16, WARNING=32");
  }

} // end of namespace xaifBooster
