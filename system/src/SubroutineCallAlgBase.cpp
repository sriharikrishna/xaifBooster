#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"

namespace xaifBooster {  
  
  SubroutineCallAlgBase::SubroutineCallAlgBase(const SubroutineCall& theContaining) : 
    BasicBlockElementAlgBase(theContaining) { 
  }

  SubroutineCallAlgBase::~SubroutineCallAlgBase(){}

} 
