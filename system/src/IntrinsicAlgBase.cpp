#include "xaifBooster/system/inc/IntrinsicAlgBase.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"

namespace xaifBooster {  
  
  IntrinsicAlgBase::IntrinsicAlgBase(const Intrinsic& theContaining) : 
    ExpressionVertexAlgBase(theContaining) { 
  }

  IntrinsicAlgBase::~IntrinsicAlgBase(){}

} 
