#include "xaifBooster/system/inc/ForLoopAlgBase.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"

namespace xaifBooster {  
  
  ForLoopAlgBase::ForLoopAlgBase(const ForLoop& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  ForLoopAlgBase::~ForLoopAlgBase(){}

} 
