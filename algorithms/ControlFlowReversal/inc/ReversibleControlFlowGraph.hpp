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

    ReversibleControlFlowGraphVertex& getEntry(); 
    ReversibleControlFlowGraphVertex& getExit(); 

    void topologicalSort();
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

    /** 
     * set myVisitedFlag of all vertices to false
     */
    void initVisit(); 

    /** 
     * bottom-up handling of points where the control flow merges
     */
    void augmentControlFlowGraphRecursively(ReversibleControlFlowGraphVertex&);

    /** 
     * top down topological sort
     */
    void topologicalSortRecursively(ReversibleControlFlowGraphVertex&, int&); 

    /** 
     * reference to original cfg
     */
    const ControlFlowGraph& myOriginalGraph_r;

  };  // end of class

} // end of namespace 
                                                                     
#endif
