#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CONTROLFLOWGRAPHALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CONTROLFLOWGRAPHALG_INCLUDE_

#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement algorithms relevant for the 
   * reversal of the control flow
   */
  class ControlFlowGraphAlg : public ControlFlowGraphAlgBase {
  public:
    
    ControlFlowGraphAlg(ControlFlowGraph& theContaining);
                                                                                
    virtual ~ControlFlowGraphAlg() {};

    /**
     * control flow reversal
     */
    virtual void algorithm_action_4();
                                                                                
    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    typedef GraphWrapperTraversable<ReversibleControlFlowGraphVertex,EdgeTraversable> AugmentedControlFlowGraphType;

    void initTransformedControlFlowGraph();
    AugmentedControlFlowGraphType& getTransformedControlFlowGraph();
    const AugmentedControlFlowGraphType& getTransformedControlFlowGraph() const;

    const ControlFlowGraphVertex& getOriginalEntry() const;
    const ControlFlowGraphVertex& getOriginalExit() const;

  private:
    
    /** 
     * no def
     */
    ControlFlowGraphAlg();

    /** 
     * no def
     */
    ControlFlowGraphAlg(const ControlFlowGraphAlg&);

    /** 
     * no def
     */
    ControlFlowGraphAlg operator=(const ControlFlowGraphAlg&);

    /**
     * transformed copy of the control flow graph
     */
    AugmentedControlFlowGraphType myTransformedControlFlowGraph;

  };  // end of class

} // end of namespace 
                                                                     
#endif
