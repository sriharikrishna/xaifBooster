#ifndef _CONTROLFLOWGRAPH_INCLUDE_
#define _CONTROLFLOWGRAPH_INCLUDE_

#include "xaifBooster/system/inc/InOutList.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphCommonAttributes.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"


namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ControlFlowGraph : public ControlFlowGraphCommonAttributes,
			   public ControlFlowGraphBase {

  public:

    ControlFlowGraph(const Symbol& theSymbol,
		     const Scope& theScope,
		     const Scope& theCFGScope,
		     const bool activeFlag);

    ~ControlFlowGraph();

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;
    
    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

    InOutList& getInOutList();
    const InOutList& getInOutList() const;

    /**
     * get algorithm
     */
    ControlFlowGraphAlgBase& getControlFlowGraphAlgBase();

    /**
     * get algorithm
     */
    const ControlFlowGraphAlgBase& getControlFlowGraphAlgBase() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    const bool& getActiveFlag() const;

    ArgumentList& getArgumentList();

    const ArgumentList& getArgumentList() const;

    /** 
     * this is the scope of the ArgumentList
     * \todo returning a non-const Scope is a hack, fix this
     */ 
    Scope& getScope() const; 

    /** 
     * this is the scope of the ArgumentList
     * \todo reintroduce this when the above problem is fixed
     */ 
    // Scope& getScope(); 

  private: 
    
    /** 
     * no def
     */
    ControlFlowGraph();

    /**
     * IN/OUT sets
     */
    InOutList myInOutList;

    /**
     * the flag indicating that this subroutine is active or passive
     */
    const bool myActiveFlag;

    /**
     * this will be set to point a dynamically instance
     * during construction and deleted during
     * destruction
     */
    ControlFlowGraphAlgBase* myControlFlowGraphAlgBase_p;
                                                                                
    /**
     * a list of arguments 
     * these are owned by this instance and 
     * will be deleted in the dtor 
     * of ControlFlowGraph
     */
    ArgumentList myArgumentList;

  }; // end of class ControlFlowGraph

} // end of namespace xaifBooster
                                                                     
#endif
