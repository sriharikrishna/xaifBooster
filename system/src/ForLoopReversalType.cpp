#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

namespace xaifBooster { 
  
  const std::string ForLoopReversalType::our_attribute_XAIFName("reversal");

  std::string ForLoopReversalType::toString(const ForLoopReversalType_E& aType)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aType) {
    case EXPLICIT:
      returnString="explicit";
      break;
    case ANONYMOUS: 
      returnString="anonymous";
      break;
    default: 
      throw PrintingIntException("ForLoopReversalType::toString: unknown value",aType);
      break;
    } // end switch
    return returnString;
  } // end of std::string ForLoopReversalType::toString

  const ForLoopReversalType::ForLoopReversalType_E
  ForLoopReversalType::fromString(const std::string& aName) { 
    ForLoopReversalType_E returnValue;
    if (aName=="explicit")
      returnValue=EXPLICIT;
    else if (aName=="anonymous")
      returnValue=ANONYMOUS;
    else  
      THROW_LOGICEXCEPTION_MACRO("ForLoopReversalType::fromString: unknown value >"
				 << aName.c_str() << "<");
    return returnValue;
  } // end of std::string ForLoopReversalType::fromString
  
} // end of namespace xaifBooster
