#include "utils/inc/LogicException.hpp"
#include "system/inc/SymbolKind.hpp"

namespace xaifBooster { 

  const std::string SymbolKind::our_attribute_XAIFName("kind");

  std::string 
  SymbolKind::toString(const SymbolKind_E& aKind)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aKind) {
    case VARIABLE:
      returnString="variable";
      break;
    case SUBROUTINE: 
      returnString="subroutine";
      break;
    default: 
      throw PrintingIntException("SymbolKind::toString: unknown value",aKind);
      break;
    } // end switch
    return returnString;
  } // end of std::string SymbolKind::toString

  const SymbolKind::SymbolKind_E
  SymbolKind::fromString(const std::string& aName) { 
    SymbolKind_E returnValue;
    if (aName=="variable")
      returnValue=VARIABLE;
    else if (aName=="subroutine")
      returnValue=SUBROUTINE;
    else  
      THROW_LOGICEXCEPTION_MACRO("SymbolKind::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string SymbolKind::fromString
  
} // end of namespace xaifBooster
