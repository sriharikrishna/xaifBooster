#ifndef _XAIFBOOSTERADDRESSARITHMETIC_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERADDRESSARITHMETIC_CALLGRAPHVERTEXALG_INCLUDE_

#include "xaifBooster/system/inc/Expression.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterAddressArithmetic {  

  /** 
   * class to implement algorithms relevant for the 
   * address arithmetic
   */
  class CallGraphVertexAlg : public xaifBoosterControlFlowReversal::CallGraphVertexAlg {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    ~CallGraphVertexAlg();

    /**
     * fix addresses
     * this is for now just applicable 
     * to explicit loop reversal
     * it modifies the control flow 
     * by storing additional integers 
     * occuring in index expressions
     */
    virtual void algorithm_action_5();
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

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
     * find variables used in anExpression that 
     * do not occur in theKnownVariables and 
     * put them in the theUnknownVariables
     */
    void findUnknownVariablesInExpression(const Expression& anExpression,
					  const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
					  xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables);

    /** 
     * find variables used in index expressions
     * occuring in the DerivativePropagator 
     * instances for a given BasicBlock
     */
    void findUnknownVariablesInDerivativePropagatorIndexExpressions(const BasicBlock& theOriginalBasicBlock,
								    const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
								    xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables);

    /** 
     * find variables used in aReversibleControlFlowGraphVertex 
     */
    void findUnknownVariablesInReversibleControlFlowGraphVertex(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& aReversibleControlFlowGraphVertex,
								const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
								xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables);

    /** 
     * push anUnknownVariable
     * with statement inserted into aBasicBlock_r
     */
    void pushUnknownVariable(const Variable& anUnknownVariable,
			     BasicBlock& aBasicBlock_r);

    /** 
     * push all theUnknownVariables
     * with statements inserted into aBasicBlock_r
     */
    void pushUnknownVariables(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables,
			      BasicBlock& aBasicBlock_r);

    /** 
     * there is aPushCall
     * that we use to create a pop 
     * inserted into aBasicBlock_r
     */
    void createPopFromPush(const xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& aPushCall,
			   BasicBlock& aBasicBlock_r);
    

  };  // end of class

} // end of namespace 
                                                                     
#endif
