#include "xaifBooster/system/inc/PreLoopAlgBase.hpp"
#include "xaifBooster/system/inc/PreLoop.hpp"

namespace xaifBooster {  
  
  PreLoopAlgBase::PreLoopAlgBase(const PreLoop& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  PreLoopAlgBase::~PreLoopAlgBase(){}

} 
