#include "xaifBooster/system/inc/GotoAlgBase.hpp"
#include "xaifBooster/system/inc/Goto.hpp"

namespace xaifBooster {  
  
  GotoAlgBase::GotoAlgBase(const Goto& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  GotoAlgBase::~GotoAlgBase(){}

} 
