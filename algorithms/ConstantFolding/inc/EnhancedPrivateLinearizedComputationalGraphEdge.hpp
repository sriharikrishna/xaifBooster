#ifndef _XAIFBOOSTERCONSTANTFOLDING_ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
#define _XAIFBOOSTERCONSTANTFOLDING_ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster; 

namespace xaifBoosterConstantFolding { 

  class  EnhancedPrivateLinearizedComputationalGraphEdge: public xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdge {

  public:
    Expression* getConstantFoldedExpression() {
      return myConstantFoldedExpression_p;
    };
    void setConstantFoldedExpression(Expression& anExpression) {
      myConstantFoldedExpression_p=&anExpression;
    };
    
  private:
    Expression* myConstantFoldedExpression_p;
  };    
  
} 

#endif
