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
