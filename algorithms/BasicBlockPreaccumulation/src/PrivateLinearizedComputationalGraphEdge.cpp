#include <sstream>

#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"

namespace xaifBooster { 

  std::string PrivateLinearizedComputationalGraphEdge::debug() const { 
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphEdge[" << this 
	<< "]" << std::ends;  
    return out.str();
  } 

  void PrivateLinearizedComputationalGraphEdge::setLinearizedExpressionEdge(ExpressionEdge& anExpressionEdge) {
    if (myLinearizedExpressionEdge_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::setLinearizedExpressionEdge: already set");
    myLinearizedExpressionEdge_p=&anExpressionEdge;
  }

  const ExpressionEdge& 
  PrivateLinearizedComputationalGraphEdge::getLinearizedExpressionEdge() const { 
    if (!myLinearizedExpressionEdge_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::getLinearizedExpressionEdge: not set");
    return *myLinearizedExpressionEdge_p;
  } 

} 
