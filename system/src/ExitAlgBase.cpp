#include "xaifBooster/system/inc/ExitAlgBase.hpp"
#include "xaifBooster/system/inc/Exit.hpp"

namespace xaifBooster {  
  
  ExitAlgBase::ExitAlgBase(const Exit& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  ExitAlgBase::~ExitAlgBase(){}

} 
