#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/PushPop/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop { 

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    CallGraphVertexAlgBase(theContaining),
    xaifBoosterAddressArithmetic::CallGraphVertexAlg(theContaining) {
  } // end CallGraphVertexAlg::CallGraphVertexAlg()

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  } // end CallGraphVertexAlg::~CallGraphVertexAlg()

  std::string
  CallGraphVertexAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterPushPop::CallGraphVertexAlg[" << this
        << ",myContaining=" << getContaining().debug().c_str()
        << "]" << std::ends;
    return out.str();
  } // end CallGraphVertexAlg::debug()

  void CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end CallGraphVertexAlg::traverseToChildren()

  void CallGraphVertexAlg::algorithm_action_6() {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterPushPop::CallGraphVertexAlg::algorithm_action_6(place pushes and pops) called for: " << debug().c_str());
    std::cout << "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" << std::endl
              << xaifBoosterPushPop::CallGraphVertexAlg::debug().c_str() << std::endl
              << "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" << std::endl;

/*
    // iterate over required variables
    for (std::list<RequiredValue*>::const_iterator reqValI = myRequiredValuesPList.begin(); reqValI != myRequiredValuesPList.end(); ++reqValI) {
      std::cout << (*reqValI)->debug() << std::endl;

      const ExpressionVertex& theValueEV ((*reqValI)->getValueEV());
      const ObjectWithId::Id& theValueStatementId ((*reqValI)->getValueStatementId());

      const ExpressionVertex& theLocationEV ((*reqValI)->getLocationEV());
      const ObjectWithId::Id& theLocationStatementId ((*reqValI)->getLocationStatementId());

      const ControlFlowGraphVertex& theCFGVertex ((*reqValI)->getControlFlowGraphVertex());

      // determine the type of the CFGVertex in which the variable occurs
      switch (theCFGVertex.getKind()) {
	case ControlFlowGraphVertexKind::BASICBLOCK_VKIND:
	  std::cout << "The CFGVertex is a basic block" << std::endl;
	  break;
	default:
	  std::cout << "The CFGVertex is type " << ControlFlowGraphVertexKind::toString(theCFGVertex.getKind()) << ", which is not currently covered" << std::endl;
	  break;
      } // end switch on CFGVertex kind

      // - Must find some way to determine the type. for example, if it's an ArrayElementReference index, we can conclude that it's an integer
      // - Some things might have already been pushed by TypeChange
      //if (theBasicBlock.getReversalType()==ForLoopReversalType::EXPLICIT)
      //if (theOriginalVariable.hasArrayAccess())

      // make the subroutine call:
      //if (integer) {
	// PUSH
        xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* thePushCall_p (new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
        thePushCall_p->setId("inline_push_i");
	//someVariable.copyMyselfInto(thePushCall_p->addConcreteArgument(1).getArgument().getVariable());

	// POP
	xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* thePopCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_i"));
	thePopCall_p->setId("inline_pop_i");
	//someVariable.copyMyselfInto(thePopCall_p->addConcreteArgument(1).getArgument().getVariable());
      //}
    } // end iterate over required variables
*/
  } // end CallGraphVertexAlg::algorithm_action_6()

} // end namespace xaifBoosterPushPop

