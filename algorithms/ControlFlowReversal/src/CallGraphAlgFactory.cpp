#include "xaifBooster/system/inc/CallGraphAlgBase.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphAlg.hpp"

namespace xaifBoosterControlFlowReversal {  

  ALG_FACTORY_DEF_MACRO(CallGraph,xaifBooster::CallGraphAlgBase,CallGraphAlg);

} // end of namespace 


