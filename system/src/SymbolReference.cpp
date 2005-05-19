#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"

namespace xaifBooster { 

  SymbolReference::SymbolReference (const Symbol& theSymbol,
				    const Scope& theScope) :
    mySymbol_r(theSymbol) ,
    myScope_r(theScope){
  }

  const Symbol& 
  SymbolReference::getSymbol() const { 
    return mySymbol_r;
  } // end of SymbolReference::getSymbol

  const Scope& 
  SymbolReference::getScope() const { 
    return myScope_r;
  } // end of SymbolReference::getScope

  std::string SymbolReference::debug () const { 
    std::ostringstream out;
    out << "SymbolReference[" << this 
	<< ",mySymbol_r=" << mySymbol_r.debug().c_str()
	<< ",myScope_r=" << myScope_r.debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of Symbol::debug

} // end of namespace xaifBooster 
