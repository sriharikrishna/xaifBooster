#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  void
  GenericTraverseInvoke::genericTraversal(const GenericAction::GenericAction_E anAction_c) {
    genericInvocation(anAction_c); 
    traverseToChildren(anAction_c);
  } // end of GenericTraverseInvoke::genericTraversal

  void
  GenericTraverseInvoke::genericInvocation(const GenericAction::GenericAction_E anAction_c) { 
    switch(anAction_c) { 
    case GenericAction::ALGORITHM_INIT :
      algorithm_init();
      break; 
    case GenericAction::ALGORITHM_ACTION_1 :
      algorithm_action_1();
      break; 
    case GenericAction::ALGORITHM_ACTION_2 :
      algorithm_action_2();
      break; 
    case GenericAction::ALGORITHM_ACTION_3 :
      algorithm_action_3();
      break; 
    default:
      THROW_LOGICEXCEPTION_MACRO("GenericTraverseInvoke::genericInvocation: unknown action");
      break; 
    } // end switch 
  } // end of GenericTraverseInvoke::genericInvocation

}

