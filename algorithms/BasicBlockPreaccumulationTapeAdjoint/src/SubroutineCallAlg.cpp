#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterLinearization::SubroutineCallAlg(theContainingSubroutineCall),
    BasicBlockElementAlg(theContainingSubroutineCall) { 
  }

  void SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    SubroutineCallAlgBase::printXMLHierarchy(os);
  }

  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::insertYourself(const BasicBlock& theBasicBlock) { 
    BasicBlockAlg& theBasicBlockAlg(dynamic_cast<BasicBlockAlg&>(theBasicBlock.getBasicBlockAlgBase()));
//    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theRevModeCall(theBasicBlockAlg.addInlinableSubroutineCall("adjoint_mode"));
//    theRevModeCall.setId("inline_adjoint_mode");
    SubroutineCall& theNewSubroutineCall(theBasicBlockAlg.addSubroutineCall(getContainingSubroutineCall().getSymbolReference().getSymbol(),
									    getContainingSubroutineCall().getSymbolReference().getScope(),
									    getContainingSubroutineCall().getActiveUse(),
									    theBasicBlockAlg.getReversalType()));
    const SubroutineCall::ConcreteArgumentPList& theOldConcreteArgumentPList(getContainingSubroutineCall().getConcreteArgumentPList());
    SubroutineCall::ConcreteArgumentPList& theNewConcreteArgumentPList(theNewSubroutineCall.getConcreteArgumentPList());
    for (SubroutineCall::ConcreteArgumentPList::const_iterator theOldConcreteArgumentPListI=theOldConcreteArgumentPList.begin();
	 theOldConcreteArgumentPListI!=theOldConcreteArgumentPList.end();
	 ++theOldConcreteArgumentPListI) { 
      ConcreteArgument* theNewConcreteArgument_p(new ConcreteArgument((*theOldConcreteArgumentPListI)->getPosition()));
      theNewConcreteArgumentPList.push_back(theNewConcreteArgument_p);
      (*theOldConcreteArgumentPListI)->getVariable().copyMyselfInto(theNewConcreteArgument_p->getVariable());
    } // end for
    // reapply any argument conversions we may need
    dynamic_cast<xaifBoosterLinearization::SubroutineCallAlg&>(theNewSubroutineCall.getSubroutineCallAlgBase()).xaifBoosterLinearization::SubroutineCallAlg::algorithm_action_1();
//    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& theRestoreModeCall(theBasicBlockAlg.addInlinableSubroutineCall("restore_mode"));
//    theRestoreModeCall.setId("inline_restore_mode");
  } 
  
} // end of namespace 
