#include "xaifBooster/utils/inc/GenericAction.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 
  
  const std::string GenericAction::our_attribute_XAIFName("shape");

  std::string GenericAction::toString(const GenericAction_E& anAction)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(anAction) {
    case ALGORITHM_INIT:
      returnString="algorithm_init";
      break;
    case ALGORITHM_ACTION_1:
      returnString="algorithm_action_1";
      break;
    case ALGORITHM_ACTION_2:
      returnString="algorithm_action_2";
      break;
    default: 
      throw PrintingIntException("GenericAction::toString: unknown value",anAction);
      break;
    } // end switch
    return returnString;
  } // end of std::string GenericAction::toString

  const GenericAction::GenericAction_E
  GenericAction::fromString(const std::string& aName) { 
    GenericAction_E returnValue;
    if (aName=="algorithm_action_1")
      returnValue=ALGORITHM_INIT;
    else if (aName=="algorithm_init")
      returnValue=ALGORITHM_ACTION_1;
    else if (aName=="algorithm_action_2")
      returnValue=ALGORITHM_ACTION_2;
    else  
      THROW_LOGICEXCEPTION_MACRO("GenericAction::fromString: unknown value >" << aName.c_str() << "<");
    return returnValue;
  } // end of std::string GenericAction::fromString
  
} // end of namespace xaifBooster
