#ifndef _SYMBOLTYPE_INCLUDE_
#define _SYMBOLTYPE_INCLUDE_

#include <string>
#include "utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class SymbolType { 
public:
    enum SymbolType_E {VOID_STYPE,
		       INTEGER_STYPE,
		       REAL_STYPE,
		       COMPLEX_STYPE,
		       BOOL_STYPE,
		       CHAR_STYPE,
		       STRING_STYPE};
    static std::string toString(const SymbolType_E& aType) throw (PrintingIntException);

    static const SymbolType_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class SymbolType

} // end of namespace xaifBooster
                                                                     
#endif
