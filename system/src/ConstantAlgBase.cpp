#include "xaifBooster/system/inc/ConstantAlgBase.hpp"
#include "xaifBooster/system/inc/Constant.hpp"

namespace xaifBooster {  
  
  ConstantAlgBase::ConstantAlgBase(const Constant& theContaining) : 
    ExpressionVertexAlgBase(theContaining) { 
  }

  ConstantAlgBase::~ConstantAlgBase(){}

} 
