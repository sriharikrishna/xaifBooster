#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/SymbolShape.hpp"

namespace xaifBooster { 
  
  const std::string SymbolShape::our_attribute_XAIFName("shape");

  std::string SymbolShape::toString(const SymbolShape_E& aShape)
    throw (PrintingIntException) { 
    std::string returnString;
    switch(aShape) {
    case SCALAR:
      returnString="scalar";
      break;
    case VECTOR:
      returnString="vector";
      break;
    case MATRIX:
      returnString="matrix";
      break;
    default: 
      throw PrintingIntException("SymbolShape::toString: unknown value",aShape);
      break;
    } // end switch
    return returnString;
  } // end of std::string SymbolShape::toString

  const SymbolShape::SymbolShape_E
  SymbolShape::fromString(const std::string& aName) { 
    SymbolShape_E returnValue;
    if (aName=="scalar")
      returnValue=SCALAR;
    else if (aName=="vector")
      returnValue=VECTOR;
    else if (aName=="matrix")
      returnValue=MATRIX;
    else  
      THROW_LOGICEXCEPTION_MACRO("SymbolShape::fromString: unknown value >"
			   << aName.c_str() << "<");
    return returnValue;
  } // end of std::string SymbolShape::fromString
  
} // end of namespace xaifBooster
