#ifndef _CONTROLFLOWGRAPH_INCLUDE_
#define _CONTROLFLOWGRAPH_INCLUDE_

#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"
#include "xaifBooster/system/inc/InOutList.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphCommonAttributes.hpp"

#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"

namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ControlFlowGraph : public GraphWrapperTraversable<ControlFlowGraphVertex, ControlFlowGraphEdge> , 
			   public ControlFlowGraphCommonAttributes {
  public:

    ControlFlowGraph(const Symbol& theSymbol,
		     const Scope& theScope,
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
                                                                                
  }; // end of class ControlFlowGraph

} // end of namespace xaifBooster
                                                                     
#endif
