#ifndef _CALLGRAPHVERTEX_INCLUDE_
#define _CALLGRAPHVERTEX_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include "system/inc/VertexTraversable.hpp"
#include "system/inc/ControlFlowGraph.hpp"

namespace xaifBooster { 

  /** 
   * A CallGraphVertex represents the target of a call 
   * in a code represented by XAIF. 
   * One can think of subroutines as being represented 
   * as vertices in the call graph. 
   */
  class CallGraphVertex : public VertexTraversable, 
			  public XMLPrintable{
  public:

    CallGraphVertex (const Symbol& theSymbol,
		     const Scope& theScope,
		     const bool activeFlag);

    ~CallGraphVertex(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * returns a reference to the ControlFlowGraph
     */
    ControlFlowGraph& getControlFlowGraph();

    /**
     * returns a reference to the ControlFlowGraph
     */
    const ControlFlowGraph& getControlFlowGraph() const;

    /**
     * override default behavior
     */
    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c); 

  private: 

    /**
     * no def
     */
    CallGraphVertex ();

    /** each call graph has a control flow 
     * graph 
     * @see ControlFlowGraph
     */
    ControlFlowGraph myControlFlowGraph;

  }; // end of class CallGraphVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
