#ifndef _SYMBOLSHAPE_INCLUDE_
#define _SYMBOLSHAPE_INCLUDE_

#include <string>
#include "xaifBooster/utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class SymbolShape { 
public:
    enum SymbolShape_E {
	    SCALAR,
	    VECTOR,
	    MATRIX,
	    THREE_TENSOR,
	    FOUR_TENSOR};
    
    static std::string toString(const SymbolShape_E& aShape) throw (PrintingIntException);

    static const SymbolShape_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class SymbolShape
} // end of namespace xaifBooster
                                                                     
#endif
