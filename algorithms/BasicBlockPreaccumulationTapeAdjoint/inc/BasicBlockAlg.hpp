#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class Assignment;
  class BaseConstant;
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

    virtual ~BasicBlockAlg() {};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);
    
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& addInlinableSubroutineCall(const std::string& aSubroutineName);

    const Assignment& addConstantAssignment(const BaseConstant& aConstant);

    virtual void algorithm_action_4();

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
     * this should be replaced once we tie 
     * this stuff together with ControlFlowReversal
     * \todo fix the temporary thingy. 
     */
    PlainBasicBlock::BasicBlockElementList myBasicBlockElementList;
    
    /** 
     * popping array index values if we pushed any
     */
    void reinterpretArrayAccess(const Variable& theOriginalVariable,
				Variable& theActualalVariable);

  };
 
} // end of namespace 
                                                                     
#endif
