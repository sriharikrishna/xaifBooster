#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphPath.hpp"

namespace MemOpsTradeoffPreaccumulation {

  DualGraphPath::DualGraphPath() {
    complete = false;
  }

  void DualGraphPath::setComplete(){
    complete = true;
  }

  bool DualGraphPath::isComplete() const {
    return complete;
  }

} 
