#ifndef _BASEVARIABLESYMBOLREFERENCE_INCLUDE_
#define _BASEVARIABLESYMBOLREFERENCE_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/BaseVariableReferenceVertex.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"

namespace xaifBooster { 

  class BaseVariableSymbolReference : public BaseVariableReferenceVertex,
				      public SymbolReference {
  public:

    BaseVariableSymbolReference (const Symbol& theSymbol,
				 const Scope& theScope);

    ~BaseVariableSymbolReference(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    static const std::string ourXAIFName;

    static const std::string our_scopeId_XAIFName;

    static const std::string our_myId_XAIFName;

    virtual std::string equivalenceSignature() const;

    virtual BaseVariableReferenceVertex& createCopyOfMyself() const ;

    virtual bool isSymbol() const;

  private:
    
    /**
     * no def
     */
    BaseVariableSymbolReference();

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
