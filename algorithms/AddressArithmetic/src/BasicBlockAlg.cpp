// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/AddressArithmetic/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterAddressArithmetic { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    BasicBlockAlgBase(theContaining),
    xaifBoosterControlFlowReversal::BasicBlockAlg(theContaining),
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg(theContaining){ 
  }

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterAddressArithmetic::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchy(os);
  } 

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void BasicBlockAlg::algorithm_action_2() { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_2();
  }

  void BasicBlockAlg::algorithm_action_3() { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3();
  }

  void BasicBlockAlg::algorithm_action_4() { 
    xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::algorithm_action_4();
  } 

  void BasicBlockAlg::algorithm_action_5() { 
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5();
  }
  
} // end namespace xaifBoosterAddressArithmetic

