#ifndef _CONTROLFLOWGRAPH_INCLUDE_
#define _CONTROLFLOWGRAPH_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReference.hpp"
#include "xaifBooster/system/inc/InOutList.hpp"

#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"

namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ControlFlowGraph : public GraphWrapperTraversable<ControlFlowGraphVertex, ControlFlowGraphEdge> , 
			   public XMLPrintable,
			   public ObjectWithId,
			   public ObjectWithAnnotation {
  public:

    ControlFlowGraph(const Symbol& theSymbol,
		     const Scope& theScope,
		     const bool activeFlag);

    ~ControlFlowGraph();

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;

    void printXMLHierarchyArgumentList(std::ostream& os) const;

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
     * name for member myArgumentList as represented in XAIF schema
     */
    static const std::string our_myArgumentList_XAIFName;

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

    typedef std::list<ArgumentSymbolReference*> ArgumentList;

    ArgumentList& getArgumentList();
    const ArgumentList& getArgumentList() const;

    InOutList& getInOutList();
    const InOutList& getInOutList() const;

    /**
     * get algorithm
     */
    ControlFlowGraphAlgBase& getControlFlowGraphAlgBase();
    const ControlFlowGraphAlgBase& getControlFlowGraphAlgBase() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 
    
    /** 
     * no def
     */
    ControlFlowGraph();

    /**
     * a list of arguments 
     * these are owned by this instance and 
     * will be deleted in the dtor 
     * of ControlFlowGraph
     */
    ArgumentList myArgumentList;

    /**
     * IN/OUT sets
     */
    InOutList myInOutList;

    /**
     * the reference to the subroutine symbol 
     */
    const SymbolReference mySymbolReference;

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
