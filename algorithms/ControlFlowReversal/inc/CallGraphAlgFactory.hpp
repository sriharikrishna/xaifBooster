#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHALGFACTORY_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/CallGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/AlgFactoryManager.hpp"

namespace xaifBoosterControlFlowReversal {  

  DERIVED_ALG_FACTORY_DECL_MACRO(CallGraph,xaifBooster::CallGraphAlgBase,xaifBooster::CallGraphAlgFactory);

} // end of namespace 

#endif
