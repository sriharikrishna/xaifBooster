#ifndef _CONTROLFLOWGRAPHBASE_INCLUDE_
#define _CONTROLFLOWGRAPHBASE_INCLUDE_

#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"

namespace xaifBooster { 

  class ControlFlowGraphBase : public GraphWrapperTraversable<ControlFlowGraphVertex, ControlFlowGraphEdge> {  
  }; 

} // end of namespace xaifBooster
                                                                     
#endif
