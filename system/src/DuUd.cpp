#include "xaifBooster/system/inc/DuUd.hpp"

namespace xaifBooster { 

  const std::string DuUd::our_myDuUdReference_XAIFName("du_ud");

  DuUd::DuUd() : 
    myDuUdReference(0) {
  }

  void DuUd::setReference(int aReference) {  
    myDuUdReference=aReference; 
  }

  int DuUd::getReference() const {  
    return myDuUdReference; 
  }

} 
