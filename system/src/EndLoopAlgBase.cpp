#include "xaifBooster/system/inc/EndLoopAlgBase.hpp"
#include "xaifBooster/system/inc/EndLoop.hpp"

namespace xaifBooster {  
  
  EndLoopAlgBase::EndLoopAlgBase(const EndLoop& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  EndLoopAlgBase::~EndLoopAlgBase(){}

} 
