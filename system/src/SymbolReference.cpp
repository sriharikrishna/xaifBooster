#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "utils/inc/LogicException.hpp"
#include "system/inc/SymbolReference.hpp"

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

} // end of namespace xaifBooster 
