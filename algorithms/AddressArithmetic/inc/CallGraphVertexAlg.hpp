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
     * information on the unknown variables
     */
    struct UnknownVarInfo { 
      /** 
       * the unknown variable, 
       * just a reference, do not delete
       */
      const Variable * myVariable_p;
      /** 
       * the control flow vertex in which we refer to myVariable_p, 
       * just a reference, do not delete
       */
      const ControlFlowGraphVertex * myContainingVertex_p;
      /** 
       * is the reference to myVariable_p control flow related
       */
      bool myCFDecisionFlag;
      /** 
       * how many references have we encountered
       */
      unsigned int myRefCount;

      UnknownVarInfo() : 
	myVariable_p(0),
	myContainingVertex_p(0),
	myCFDecisionFlag(false),
	myRefCount(0) { };
      UnknownVarInfo(const Variable& theVariable,
		     const ControlFlowGraphVertex& theContainingVertex,
		     bool theCFDecisionFlag) : 
	myVariable_p(&theVariable),
	myContainingVertex_p(&theContainingVertex),
	myCFDecisionFlag(theCFDecisionFlag),
	myRefCount(0) { };

    }; 

    typedef std::list<UnknownVarInfo> UnknownVarInfoList;

    /** 
     * FIND variables used in anExpression that 
     * do not occur in theKnownVariables and 
     * put them in the theUnknownVariables
     */
    void findUnknownVariablesInExpression(const Expression& anExpression,
					  const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
					  UnknownVarInfoList& theUnknownVariables,
					  bool thisIsCF,
					  const ControlFlowGraphVertex& theContainingVertex,
					  const ControlFlowGraphVertex& theTopExplicitLoop);

    /** 
     * find variables used in index expressions
     * occuring in the DerivativePropagator 
     * instances for a given BasicBlock
     */
    void findUnknownVariablesInDerivativePropagatorIndexExpressions(const BasicBlock& theOriginalBasicBlock,
								    const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
								    UnknownVarInfoList& theUnknownVariables,
								    const ControlFlowGraphVertex& aTopLevelLoop);

    /** 
     * find variables used in aReversibleControlFlowGraphVertex 
     */
    void findUnknownVariablesInReversibleControlFlowGraphVertex( xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex& aReversibleControlFlowGraphVertex,
								const xaifBoosterControlFlowReversal::ReversibleControlFlowGraphVertex::VariablePList& theKnownVariables,
								UnknownVarInfoList& theUnknownVariables);

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
    void pushUnknownVariables(const UnknownVarInfoList& theUnknownVariables,
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

    /**
     * check if the variable is quasi-constant
     */
    bool isQuasiConstant(const Variable& theVariable); 

    /** 
     * how often is theVariable defined within this CF subtree with theControlFlowGraphVertex as root
     */
    int definesUnderControlFlowGraphVertex(const Variable& theVariable,
					   const ControlFlowGraphVertex& theControlFlowGraphVertex);

  };  // end of class

} // end of namespace 
                                                                     
#endif
