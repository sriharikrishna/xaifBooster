#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPH_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPH_INCLUDE_

#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement a reversible control flow graph
   */
  class ReversibleControlFlowGraph : public GraphWrapperTraversable<ReversibleControlFlowGraphVertex,ReversibleControlFlowGraphEdge> {

  public:
    
    ReversibleControlFlowGraph(const ControlFlowGraph&);

    void storeControlFlow();
 
    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private:

    /** 
     * no def
     */
    ReversibleControlFlowGraph();

    /** 
     * no def
     */
    ReversibleControlFlowGraph(const ReversibleControlFlowGraph&);

    /** 
     * no def
     */
    ReversibleControlFlowGraph operator=(const ReversibleControlFlowGraph&);

  };  // end of class

} // end of namespace 
                                                                     
#endif
