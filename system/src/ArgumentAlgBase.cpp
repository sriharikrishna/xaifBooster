#include "xaifBooster/system/inc/ArgumentAlgBase.hpp"
#include "xaifBooster/system/inc/Argument.hpp"

namespace xaifBooster {  
  
  ArgumentAlgBase::ArgumentAlgBase(const Argument& theContaining) : 
    ExpressionVertexAlgBase(theContaining) { 
  }

  ArgumentAlgBase::~ArgumentAlgBase(){}

} 
