#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_BASICBLOCKALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_BASICBLOCKALG_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse {  

  /** 
   * class to pull together 
   * the taping and the adjoining 
   * view per basic block 
   * and the augmented and reversed call graph
   * we just need to reimplement printing
   */
  class BasicBlockAlg : public xaifBoosterControlFlowReversal::BasicBlockAlg, 
			public xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg,
			public xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg {

  public:
    
    BasicBlockAlg(BasicBlock& theContaining);

    virtual ~BasicBlockAlg() {};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * refering to xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_2
     */
    virtual void algorithm_action_2();

    /**
     * refering to xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3
     */
    virtual void algorithm_action_3();

    /**
     * refering to xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_4
     */
    virtual void algorithm_action_4();

    virtual ForLoopReversalType::ForLoopReversalType_E getReversalType() const;

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

  };
 
} // end of namespace 
                                                                     
#endif
