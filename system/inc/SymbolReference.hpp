#ifndef _SYMBOLREFERENCE_INCLUDE_
#define _SYMBOLREFERENCE_INCLUDE_

#include "system/inc/Symbol.hpp"
#include "system/inc/Scope.hpp"

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
