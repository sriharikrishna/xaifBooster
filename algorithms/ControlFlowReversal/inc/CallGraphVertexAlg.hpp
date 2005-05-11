#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHVERTEXALG_INCLUDE_

#include "xaifBooster/system/inc/CallGraphVertexAlgBase.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement algorithms relevant for the 
   * reversal of the control flow
   */
  class CallGraphVertexAlg : public CallGraphVertexAlgBase {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    ~CallGraphVertexAlg();

    /**
     * control flow reversal
     */
    virtual void algorithm_action_4();
                                                                                
    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    bool hasTapingControlFlowGraph() const;
    ReversibleControlFlowGraph& getTapingControlFlowGraph();
    const ReversibleControlFlowGraph& getTapingControlFlowGraph() const;
 
    bool hasAdjointControlFlowGraph() const;
    ReversibleControlFlowGraph& getAdjointControlFlowGraph();
    const ReversibleControlFlowGraph& getAdjointControlFlowGraph() const;

  private:
    
    /** 
     * no def
     */
    CallGraphVertexAlg();

    /** 
     * no def
     */
    CallGraphVertexAlg(const CallGraphVertexAlg&);

    /** 
     * no def
     */
    CallGraphVertexAlg operator=(const CallGraphVertexAlg&);

    /**
     * transformed copy of the control flow graph
     */
    ReversibleControlFlowGraph* myTapingControlFlowGraph_p;
    ReversibleControlFlowGraph* myAdjointControlFlowGraph_p;


  };  // end of class

} // end of namespace 
                                                                     
#endif
