#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/JacobianAccumulationExpressionCopy.hpp"

namespace MemOpsTradeoffPreaccumulation {

  void JacobianAccumulationExpressionCopy::setMaximal(const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theMaximal){
    myMaximal = const_cast<xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex*>(&theMaximal);
  }

  xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& JacobianAccumulationExpressionCopy::getMaximal() const{
    return *myMaximal;
  } 

}//end of namespace MemOpsTradeoffPreaccumulation
