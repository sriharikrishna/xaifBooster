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
    
    static void setUserDecides();
    
    static void setIgnorance();

    static void setTopLevelRoutine(const std::string& theName);

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
			     BasicBlock& aBasicBlock_r,
			     const ForLoop& aTopLevelForLoop);

    /** 
     * push all theUnknownVariables
     * with statements inserted into aBasicBlock_r
     */
    void pushUnknownVariables(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theUnknownVariables,
			      BasicBlock& aBasicBlock_r,
			      const ForLoop& aTopLevelForLoop);

    /** 
     * there is aPushCall
     * that we use to create a pop 
     * inserted into aBasicBlock_r
     */
    void createPopFromPush(const xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& aPushCall,
			   BasicBlock& aBasicBlock_r);
    
    /** 
     * let the user decide individually, default false
     */
    static bool ourUserDecidesFlag;

    /** 
     * force ignorance (nothing gets pushed), default false
     */
    static bool ourIgnoranceFlag;

    /** 
     * the name of the top level routine 
     * which we refer to to test for quasi-constness of 
     * variables used in simple loop constructs
     */
    static std::string ourTopLevelRoutineName;

    /**
     * has ourTopLevelRoutineName been set
     */ 
    bool static haveTopLevelRoutineName();

    /**
     * defined in getTopLevelRoutine ;
     * we don't own the instance pointed to by
     * this attribute
     */
    static const CallGraphVertex* ourTopLevelRoutine_p;

    /** 
     * have we shown that this routine is called 
     * only under the top level routine
     */
    bool myOnlyUnderTopLevelRoutineFlag;

    /** 
     * determines if a this routine is called 
     * only under the top level routine
     */
    bool isOnlyUnderTopLevelRoutine(); 

    /**
     * gets the routine associated with ourTopLevelRoutineName
     */
    static const CallGraphVertex& getTopLevelRoutine();  


  };  // end of class

} // end of namespace 
                                                                     
#endif
