#ifndef _CONTROLFLOWGRAPH_INCLUDE_
#define _CONTROLFLOWGRAPH_INCLUDE_

#include <list>

#include "utils/inc/XMLPrintable.hpp"
#include "utils/inc/ObjectWithId.hpp"

#include "system/inc/ObjectWithAnnotation.hpp"
#include "system/inc/GraphWrapperTraversable.hpp"
#include "system/inc/ControlFlowGraphVertex.hpp"
#include "system/inc/ControlFlowGraphEdge.hpp"
#include "system/inc/ArgumentSymbolReference.hpp"

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
     * the reference to the subroutine symbol 
     */
    const SymbolReference mySymbolReference;

    /**
     * the flag indicating that this subroutine is active or passive
     */
    const bool myActiveFlag;

  }; // end of class ControlFlowGraph

} // end of namespace xaifBooster
                                                                     
#endif
