#ifndef _JACOBIANACCUMULATIONEXPRESSIONCOPY_INCLUDE_
#define _JACOBIANACCUMULATIONEXPRESSIONCOPY_INCLUDE_

#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpression.hpp"

using namespace xaifBoosterCrossCountryInterface;

namespace MemOpsTradeoffPreaccumulation {

  class JacobianAccumulationExpressionCopy {
  
  public:

    JacobianAccumulationExpressionCopy(JacobianAccumulationExpression& theNewExpression): myExpression(theNewExpression){};
    
    void setMaximal(const JacobianAccumulationExpressionVertex& theMaximal);

    JacobianAccumulationExpressionVertex& getMaximal() const;

    JacobianAccumulationExpression& myExpression;

  private: 

    JacobianAccumulationExpressionVertex* myMaximal;

  }; // end of class JacobianAccumulationExpressionCopy

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
