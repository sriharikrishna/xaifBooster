#ifndef _CONTROLFLOWGRAPHALGFACTORY_INCLUDE_
#define _CONTROLFLOWGRAPHALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AlgFactory.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"

namespace xaifBooster {  

  class ControlFlowGraph;

  BASE_ALG_FACTORY_DECL_MACRO(ControlFlowGraph,ControlFlowGraphAlgBase);

} // end of namespace 

#endif
