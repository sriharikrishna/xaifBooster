#ifndef _ARGUMENTSYMBOLREFERENCE_INCLUDE_
#define _ARGUMENTSYMBOLREFERENCE_INCLUDE_

#include "system/inc/SymbolReference.hpp"
#include "utils/inc/XMLPrintable.hpp"
#include "system/inc/IntentType.hpp"

namespace xaifBooster { 
  class ArgumentSymbolReference: public SymbolReference, XMLPrintable { 
  public:
    
    ArgumentSymbolReference (const Symbol& theSymbol,
			     const Scope& theScope,
			     unsigned int thePosition,
			     bool theActiveFlag,
			     IntentType::IntentType_E theIntent);

    ~ArgumentSymbolReference(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myPosition as represented in XAIF schema
     */
    static const std::string our_myPosition_XAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_symbolId_XAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_scopeId_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

    /**
     * name for member myIntent as represented in XAIF schema
     */
    static const std::string our_myIntent_XAIFName;

  private:
    
    /**
     * no def
     */
    ArgumentSymbolReference();

    /**
     * position of this argument in the argument list of 
     * a subroutine
     */
    unsigned int myPosition;

    /**
     * the flag indicating that this argument is active of passive
     */
    const bool myActiveFlag;

    /**
     * the flag indicating the intent of this argument
     */
    const IntentType::IntentType_E myIntent;

  }; // end of class ArgumentSymbolReference

} // end of namespace xaifBooster
                                                                     
#endif
