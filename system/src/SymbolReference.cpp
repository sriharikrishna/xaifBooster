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

} // end of namespace xaifBooster 
