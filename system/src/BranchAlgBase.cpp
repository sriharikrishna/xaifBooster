#include "xaifBooster/system/inc/BranchAlgBase.hpp"
#include "xaifBooster/system/inc/Branch.hpp"

namespace xaifBooster {  
  
  BranchAlgBase::BranchAlgBase(const Branch& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  BranchAlgBase::~BranchAlgBase(){}

} 
