#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class Assignment;
  class BaseConstant;
  class SubroutineCall;
  class Symbol;
}

namespace xaifBoosterInlinableXMLRepresentation { 
  class InlinableSubroutineCall;
}

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  /** 
   * class to implement a reinterpretation of 
   * the DerivativePropagator instances as 
   * taping operations
   */
  class BasicBlockAlg : virtual public xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg {
  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);
    
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& addInlinableSubroutineCall(const std::string& aSubroutineName,
											       const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    SubroutineCall& addSubroutineCall(const Symbol& aSubroutineNameSymbol,
				      const Scope& aSubroutineNameScope,
				      ActiveUseType::ActiveUseType_E anActiveUse,
				      const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    virtual void algorithm_action_4();

    /** 
     * this implementation always returns ANONYMOUS. 
     * EXPLICIT reversal only makes sense after we ran the 
     * ControlFlowReversal which overwrites this implementation
     */
    virtual ForLoopReversalType::ForLoopReversalType_E getReversalType() const;

    const PlainBasicBlock::BasicBlockElementList& getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType) const; 
    
  private:

    /** 
     * no def
     */
    BasicBlockAlg();

    /** 
     * no def
     */
    BasicBlockAlg(const BasicBlockAlg&);

    /** 
     * no def
     */
    BasicBlockAlg operator=(const BasicBlockAlg&);

    /** 
     * the elements that make up the adjoint code
     * which assumes an anonymous reversal (no knowledge about the original 
     * loop variables)
     */
    PlainBasicBlock::BasicBlockElementList myBasicBlockElementListAnonymousReversal;

    /** 
     * the elements that make up the adjoint code
     * under an explicit reversal (loop constructs are reversed explicitly
     * and we assume all index expressions can be recalculated explcitly 
     * at reversal time from explicitly reversed loops)
     */
    PlainBasicBlock::BasicBlockElementList myBasicBlockElementListExplicitReversal;
    
    /** 
     * popping array index values if we pushed any
     * based on the reversal type (see also ControlFlowReversal)
     */
    void reinterpretArrayAccess(const Variable& theOriginalVariable,
				Variable& theActualVariable,
				const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * based on the reversal type (see also ControlFlowReversal)
     */
    void reinterpretDerivativePropagatorEntry(const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry);

    PlainBasicBlock::BasicBlockElementList& getBasicBlockElementList(const ForLoopReversalType::ForLoopReversalType_E& aReversalType); 

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    void addZeroDeriv(Variable& theTarget,
		      const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    void addUnitFactor(Variable& theSource,
		       Variable& theTarget,
		       const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    const Variable& addFactorPop(const Symbol& aTemporarySymbol,
				 const Scope& theScopeOfTheTemporarySymbol,
				 const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the call to the proper BasicBlockElementList based on aReversalType
     */
    void addSaxpy(const Variable& theSource,
		  const Variable& theTarget,
		  const Variable& theFactor,
		  const xaifBoosterDerivativePropagator::DerivativePropagatorEntry& aDerivativePropagatorEntry,
		  const ForLoopReversalType::ForLoopReversalType_E& aReversalType);

    /** 
     * add the assignment to the proper BasicBlockElementList based on aReversalType
     */
    const Assignment& addConstantAssignment(const BaseConstant& theConstant,
					    const Symbol& aTemporarySymbol,
					    const Scope& theScopeOfTheTemporarySymbol,
					    const ForLoopReversalType::ForLoopReversalType_E& aReversalType);


  };
 
} // end of namespace 
                                                                     
#endif
