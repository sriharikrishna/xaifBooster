#include "utils/inc/LogicException.hpp"
#include "system/inc/BooleanOperationType.hpp"

namespace xaifBooster { 
  
  std::string BooleanOperationType::toString(const BooleanOperationType_E& aType)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aType) {
    case LESS_THAN_OTYPE:
      returnString="less_than";
      break;
    case LESS_OR_EQUAL_OTYPE: 
      returnString="less_or_equal";
      break;
    case GREATER_THAN_OTYPE:
      returnString="greater_than";
      break;
    case GREATER_OR_EQUAL_OTYPE: 
      returnString="greater_or_equal";
      break;
    case EQUAL_OTYPE: 
      returnString="equal";
      break;
    case NOT_EQUAL_OTYPE:
      returnString="not_equal";
      break;
    default: 
      throw PrintingIntException("BooleanOperationType::toString: unknown value",aType);
      break;
    } // end switch
    return returnString;
  } // end of std::string BooleanOperationType::toString

  const BooleanOperationType::BooleanOperationType_E
  BooleanOperationType::fromString(const std::string& aName) { 
    BooleanOperationType_E returnValue;
    if (aName=="less_than")
      returnValue=LESS_THAN_OTYPE;
    else if (aName=="less_or_equal")
      returnValue=LESS_OR_EQUAL_OTYPE;
    else if (aName=="greater_than")
      returnValue=GREATER_THAN_OTYPE;
    else if (aName=="greater_or_equal")
      returnValue=GREATER_OR_EQUAL_OTYPE;
    else if (aName=="equal")
      returnValue=EQUAL_OTYPE;
    else if (aName=="not_equal")
      returnValue=NOT_EQUAL_OTYPE;
    else  
      THROW_LOGICEXCEPTION_MACRO("BooleanOperationType::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string BooleanOperationType::fromString
  
} // end of namespace xaifBooster
