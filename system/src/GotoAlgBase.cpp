// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/system/inc/GotoAlgBase.hpp"
#include "xaifBooster/system/inc/Goto.hpp"

namespace xaifBooster {  
  
  GotoAlgBase::GotoAlgBase(const Goto& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  GotoAlgBase::~GotoAlgBase(){}

} 
