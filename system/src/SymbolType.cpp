#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"

namespace xaifBooster { 
  
  const std::string SymbolType::our_attribute_XAIFName("type");

  std::string SymbolType::toString(const SymbolType_E& aType)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aType) {
    case VOID_STYPE:
      returnString="void";
      break;
    case INTEGER_STYPE: 
      returnString="integer";
      break;
    case REAL_STYPE: 
      returnString="real";
      break;
    case COMPLEX_STYPE:
      returnString="complex";
      break;
    case BOOL_STYPE: 
      returnString="bool";
      break;
    case CHAR_STYPE:
      returnString="char";
      break;
    case STRING_STYPE: 
      returnString="string";
      break;
    case OPAQUE_STYPE: 
      returnString="opaque";
      break;
    default: 
      throw PrintingIntException("SymbolType::toString: unknown value",aType);
      break;
    } // end switch
    return returnString;
  } // end of std::string SymbolType::toString

  const SymbolType::SymbolType_E
  SymbolType::fromString(const std::string& aName) { 
    SymbolType_E returnValue;
    if (aName=="void")
      returnValue=VOID_STYPE;
    else if (aName=="integer")
      returnValue=INTEGER_STYPE;
    else if (aName=="real")
      returnValue=REAL_STYPE;
    else if (aName=="complex")
      returnValue=COMPLEX_STYPE;
    else if (aName=="bool")
      returnValue=BOOL_STYPE;
    else if (aName=="char")
      returnValue=CHAR_STYPE;
    else if (aName=="string")
      returnValue=STRING_STYPE;
    else if (aName=="opaque")
      returnValue=OPAQUE_STYPE;
    else  
      THROW_LOGICEXCEPTION_MACRO("SymbolType::fromString: unknown value >"
				 << aName.c_str() << "<");
    return returnValue;
  } // end of std::string SymbolType::fromString
  
} // end of namespace xaifBooster
