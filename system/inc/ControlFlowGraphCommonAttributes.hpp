#ifndef _CONTROLFLOWGRAPHCOMMONATTRIBUTES_INCLUDE_
#define _CONTROLFLOWGRAPHCOMMONATTRIBUTES_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"

namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ControlFlowGraphCommonAttributes : public XMLPrintable,
					   public ObjectWithId,
					   public ObjectWithAnnotation {
  public:

    ControlFlowGraphCommonAttributes(const Symbol& theSymbol,
				     const Scope& theScope);

    ~ControlFlowGraphCommonAttributes();

    void printAttributes(std::ostream& os) const;

    std::string debug() const ;
    
    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
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

    ArgumentList& getArgumentList();
    const ArgumentList& getArgumentList() const;

    /** 
     * this is the subroutine name
     */
    const SymbolReference& getSymbolReference() const;

    /** 
     * this is the scope of the ArgumentList
     * \todo revisit the whole scoping business
     */ 
    // const Scope& getScope() const; 
    Scope& getScope() const; 

    /** 
     * this is the scope of the ArgumentList
     */ 
    // Scope& getScope(); 

  protected: 
    
    /** 
     * no def
     */
    ControlFlowGraphCommonAttributes();

    /**
     * a list of arguments 
     * these are owned by this instance and 
     * will be deleted in the dtor 
     * of ControlFlowGraph
     */
    ArgumentList myArgumentList;

    /**
     * the reference to the subroutine symbol 
     */
    const SymbolReference mySymbolReference;

  }; // end of class ControlFlowGraphCommonAttributes

} // end of namespace xaifBooster
                                                                     
#endif
