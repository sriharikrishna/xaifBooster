#ifndef _SYMBOLREFERENCE_INCLUDE_
#define _SYMBOLREFERENCE_INCLUDE_

#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/Scope.hpp"

namespace xaifBooster { 

  class SymbolReference {
  public:

    SymbolReference (const Symbol& theSymbol,
		     const Scope& theScope);

    virtual ~SymbolReference(){};

    const Symbol& getSymbol() const;

    const Scope& getScope() const;

  protected:
    
    /**
     * no def
     */
    SymbolReference ();

    const Symbol& mySymbol_r;

    const Scope& myScope_r;
    
  };
 
} // end of namespace xaifBooster
                                                                     
#endif
