#ifndef _SUBROUTINECALL_INCLUDE_
#define _SUBROUTINECALL_INCLUDE_

#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"
#include "xaifBooster/system/inc/ConcreteArgument.hpp"

namespace xaifBooster { 

  /**
   * class SubroutineCall describes a SubroutineCall within a 
   * ControlFlowGraph
   */
  class SubroutineCall : public BasicBlockElement {
  public:
    
    SubroutineCall (const Symbol& theSymbol,
		    const Scope& theScope,
		    const bool activeFlag);

    ~SubroutineCall();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_symbolId_XAIFName;

    /**
     * name for scope id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_scopeId_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

    typedef std::list<ConcreteArgument*> ArgumentList;

    ArgumentList& getArgumentList();

    const ArgumentList& getArgumentList() const;

  private: 
    
    /**
     * no def
     */
    SubroutineCall();

    /**
     * the reference to the subroutine symbol 
     */
    const SymbolReference mySymbolReference;

    /**
     * the flag indicating that this statement is active or passive
     */
    const bool myActiveFlag;

    /** 
     * the list of concrete arguments for this call
     * these are owned by this instance and 
     * will be deleted in the dtor 
     * of SubroutineCall
     */
    ArgumentList myArgumentList;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
