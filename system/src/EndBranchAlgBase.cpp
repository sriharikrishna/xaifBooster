#include "xaifBooster/system/inc/EndBranchAlgBase.hpp"
#include "xaifBooster/system/inc/EndBranch.hpp"

namespace xaifBooster {  
  
  EndBranchAlgBase::EndBranchAlgBase(const EndBranch& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  EndBranchAlgBase::~EndBranchAlgBase(){}

} 
