#include "utils/inc/LogicException.hpp"
#include "system/inc/PartialDerivativeKind.hpp"

namespace xaifBooster { 

  const std::string PartialDerivativeKind::our_attribute_XAIFName("kind");

  std::string 
  PartialDerivativeKind::toString(const PartialDerivativeKind_E& aKind)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aKind) {
    case PASSIVE:
      returnString="passive";
      break;
    case LINEAR_ONE: 
      returnString="linear_one";
      break;
    case LINEAR_MINUS_ONE: 
      returnString="linear_minus_one";
      break;
    case LINEAR: 
      returnString="linear";
      break;
    case NONLINEAR: 
      returnString="nonlinear";
      break;
    default: 
      throw PrintingIntException("PartialDerivativeKind::toString: unknown value",aKind);
      break;
    } // end switch
    return returnString;
  } // end of std::string PartialDerivativeKind::toString

  const PartialDerivativeKind::PartialDerivativeKind_E
  PartialDerivativeKind::fromString(const std::string& aName) { 
    PartialDerivativeKind_E returnValue;
    if (aName=="passive")
      returnValue=PASSIVE;
    else if (aName=="linear_one")
      returnValue=LINEAR_ONE;
    else if (aName=="linear_minus_one")
      returnValue=LINEAR_MINUS_ONE;
    else if (aName=="linear")
      returnValue=LINEAR;
    else if (aName=="nonlinear")
      returnValue=NONLINEAR;
    else  
      THROW_LOGICEXCEPTION_MACRO("PartialDerivativeKind::fromString: unknown value >"
				 << aName.c_str() << "<");
    return returnValue;
  } // end of std::string PartialDerivativeKind::fromString
  
} // end of namespace xaifBooster
