#include "xaifBooster/system/inc/MarkerAlgBase.hpp"
#include "xaifBooster/system/inc/Marker.hpp"

namespace xaifBooster {  
  
  MarkerAlgBase::MarkerAlgBase(const Marker& theContaining) : 
    BasicBlockElementAlgBase(theContaining) { 
  }

  MarkerAlgBase::~MarkerAlgBase(){}

} 
