#include "xaifBooster/system/inc/BooleanOperationAlgBase.hpp"
#include "xaifBooster/system/inc/BooleanOperation.hpp"

namespace xaifBooster {  
  
  BooleanOperationAlgBase::BooleanOperationAlgBase(const BooleanOperation& theContaining) : 
    ExpressionVertexAlgBase(theContaining) { 
  }

  BooleanOperationAlgBase::~BooleanOperationAlgBase(){}

} 
