#include "xaifBooster/system/inc/LabelAlgBase.hpp"
#include "xaifBooster/system/inc/Label.hpp"

namespace xaifBooster {  
  
  LabelAlgBase::LabelAlgBase(const Label& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  LabelAlgBase::~LabelAlgBase(){}

} 
