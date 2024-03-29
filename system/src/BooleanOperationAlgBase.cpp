// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/system/inc/BooleanOperationAlgBase.hpp"
#include "xaifBooster/system/inc/BooleanOperation.hpp"

namespace xaifBooster {  
  
  BooleanOperationAlgBase::BooleanOperationAlgBase(const BooleanOperation& theContaining) : 
    ExpressionVertexAlgBase(theContaining) { 
  }

  BooleanOperationAlgBase::~BooleanOperationAlgBase(){}

} 
