#include <sstream>

#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  PrivateLinearizedComputationalGraphEdge::PrivateLinearizedComputationalGraphEdge() : 
    myLinearizedExpressionEdge_p(0),
    myUnitExpressionEdgeFlag(false) {
  }

  std::string PrivateLinearizedComputationalGraphEdge::debug() const { 
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphEdge[" 
	<< this 
	<< ","
	<< "myLinearizedExpressionEdge_p"
	<< "="
	<< myLinearizedExpressionEdge_p
	<< ","
	<< "myParallelEdges.size()"
	<< "="
	<< myParallelEdges.size()
	<< "]" << std::ends;  
    return out.str();
  } 

  void PrivateLinearizedComputationalGraphEdge::setLinearizedExpressionEdge(ExpressionEdge& anExpressionEdge) {
    if (myLinearizedExpressionEdge_p || myUnitExpressionEdgeFlag) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::setLinearizedExpressionEdge: already set");
    myLinearizedExpressionEdge_p=&anExpressionEdge;
  }

  void PrivateLinearizedComputationalGraphEdge::setUnitExpressionEdge() {
    if (myLinearizedExpressionEdge_p || myUnitExpressionEdgeFlag) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::setUnitExpressionEdge: already set");
    myUnitExpressionEdgeFlag=true;
  }

  bool PrivateLinearizedComputationalGraphEdge::isUnitExpressionEdge() const {
    return myUnitExpressionEdgeFlag;
  }

  const ExpressionEdge& 
  PrivateLinearizedComputationalGraphEdge::getLinearizedExpressionEdge() const { 
    if (!myLinearizedExpressionEdge_p) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::getLinearizedExpressionEdge: not set");
    return *myLinearizedExpressionEdge_p;
  } 

  bool
  PrivateLinearizedComputationalGraphEdge::hasLinearizedExpressionEdge() const { 
    if (!myLinearizedExpressionEdge_p) return false;
    return true;
  } 

  void PrivateLinearizedComputationalGraphEdge::addParallel(ExpressionEdge& theParallelEdge ) { 
    myParallelEdges.push_back(&theParallelEdge);
  } 

  const PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList& 
  PrivateLinearizedComputationalGraphEdge::getParallels() const { 
    return myParallelEdges;
  } 

} 
