#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

namespace xaifBooster {  
  
  BasicBlockAlgBase::BasicBlockAlgBase(const BasicBlock& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  BasicBlockAlgBase::~BasicBlockAlgBase(){}

} 
