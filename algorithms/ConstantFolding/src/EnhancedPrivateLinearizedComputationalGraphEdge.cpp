#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterConstantFolding {

  EnhancedPrivateLinearizedComputationalGraphEdge::EnhancedPrivateLinearizedComputationalGraphEdge () {
    myConstantFoldedAssignment_p=0;
    containsConstantFoldedAssignment=false;
    myConstantFoldedAssignmentPDK=xaifBooster::PartialDerivativeKind::NONLINEAR;
  }
  Assignment& EnhancedPrivateLinearizedComputationalGraphEdge::getAssignmentFromEdge() const {
    if(hasConstantFoldedAssignment())    
	return *(myConstantFoldedAssignment_p);
    return dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(getLinearizedExpressionEdge().getExpressionEdgeAlgBase()).getConcretePartialAssignment();
  }
}

