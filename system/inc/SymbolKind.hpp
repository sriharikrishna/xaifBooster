#ifndef _SYMBOLKIND_INCLUDE_
#define _SYMBOLKIND_INCLUDE_

#include <string>
#include "utils/inc/PrintingIntException.hpp"

namespace xaifBooster { 
  class SymbolKind { 
public:
    enum SymbolKind_E {VARIABLE,
		       SUBROUTINE};
    static std::string toString(const SymbolKind_E& aKind) throw (PrintingIntException);

    static const SymbolKind_E fromString(const std::string& aName);
    
    static const std::string our_attribute_XAIFName;

  }; // end of class SymbolKind

} // end of namespace xaifBooster
                                                                     
#endif
