// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

namespace xaifBooster {  
  
  AssignmentAlgBase::AssignmentAlgBase(const Assignment& theContaining) : 
    BasicBlockElementAlgBase(theContaining) { 
  }

  AssignmentAlgBase::~AssignmentAlgBase(){}

  const Assignment& AssignmentAlgBase::getContainingAssignment() const { 
    return dynamic_cast<const Assignment&>(getContaining());
  }
} 
