#ifndef _CALLGRAPHALGFACTORY_INCLUDE_
#define _CALLGRAPHALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AlgFactory.hpp"
#include "xaifBooster/system/inc/CallGraphAlgBase.hpp"

namespace xaifBooster {  

  class CallGraph;

  BASE_ALG_FACTORY_DECL_MACRO(CallGraph,CallGraphAlgBase);

} // end of namespace 

#endif
