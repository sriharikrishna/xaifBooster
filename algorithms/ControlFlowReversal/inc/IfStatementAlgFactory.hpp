#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_IFSTATEMENTALGFACTORY_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_IFSTATEMENTALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/IfStatementAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/AlgFactoryManager.hpp"

namespace xaifBoosterControlFlowReversal {  

  DERIVED_ALG_FACTORY_DECL_MACRO(IfStatement,xaifBooster::IfStatementAlgBase,xaifBooster::IfStatementAlgFactory);

} // end of namespace 

#endif