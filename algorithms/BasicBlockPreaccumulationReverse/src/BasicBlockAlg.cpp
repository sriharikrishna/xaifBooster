#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/ConceptuallyStaticInstances.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBooster::BasicBlockAlgBase::BasicBlockAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining),
    xaifBoosterControlFlowReversal::BasicBlockAlg(theContaining),
    xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg(theContaining),
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg(theContaining){ 
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    switch(xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->getPrintVersion()) { 
    case xaifBoosterCodeReplacement::PrintVersion::ORIGINAL: 
      xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::getContaining().printXMLHierarchyImpl(os);
      break;
    case xaifBoosterCodeReplacement::PrintVersion::AUGMENTED: 
      xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::printXMLHierarchy(os);
      break;
    case xaifBoosterCodeReplacement::PrintVersion::ADJOINT: 
      xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::printXMLHierarchy(os);
      break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::printXMLHierarchy: cannot handle PrintVersion "
				 << xaifBoosterCodeReplacement::PrintVersion::toString(xaifBoosterCodeReplacement::ConceptuallyStaticInstances::instance()->
							   getPrintVersion()).c_str());
      break;
    } // end switch
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void BasicBlockAlg::algorithm_action_2() { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_2();
  }

  void BasicBlockAlg::algorithm_action_3() { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3();
  }

  void BasicBlockAlg::algorithm_action_4() { 
    xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_4();
  }

} // end of namespace
