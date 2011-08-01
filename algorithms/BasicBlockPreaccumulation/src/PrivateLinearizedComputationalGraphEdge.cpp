// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include <sstream>

#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  PrivateLinearizedComputationalGraphEdge::PrivateLinearizedComputationalGraphEdge() : 
    myLinearizedExpressionEdge_p(0),
    myDirectCopyEdgeFlag(false) {
  }

  std::string PrivateLinearizedComputationalGraphEdge::debug() const {
    std::ostringstream out;
    out << "PrivateLinearizedComputationalGraphEdge[" << Edge::debug().c_str()
        << ",myDirectCopyEdgeFlag=" << myDirectCopyEdgeFlag
        << ",myLinearizedExpressionEdge_p=" << myLinearizedExpressionEdge_p
        << ",myParallelEdges.size()=" << myParallelEdges.size()
        << "]" << std::ends;
    return out.str();
  } 

  void PrivateLinearizedComputationalGraphEdge::setLinearizedExpressionEdge(const ExpressionEdge& anExpressionEdge) {
    if (myLinearizedExpressionEdge_p || myDirectCopyEdgeFlag) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::setLinearizedExpressionEdge: already set");
    myLinearizedExpressionEdge_p=&anExpressionEdge;
  }

  void PrivateLinearizedComputationalGraphEdge::setDirectCopyEdge() {
    if (myLinearizedExpressionEdge_p || myDirectCopyEdgeFlag) 
      THROW_LOGICEXCEPTION_MACRO("PrivateLinearizedComputationalGraphEdge::setDirectCopyEdge: already set");
    myDirectCopyEdgeFlag=true;
    setEdgeLabelType(UNIT_LABEL);
  }

  bool PrivateLinearizedComputationalGraphEdge::isDirectCopyEdge() const {
    return myDirectCopyEdgeFlag;
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

  void PrivateLinearizedComputationalGraphEdge::addParallel(const ExpressionEdge& theParallelEdge) {
    myParallelEdges.push_back(&theParallelEdge);
  } 

  const PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList& 
  PrivateLinearizedComputationalGraphEdge::getParallels() const { 
    return myParallelEdges;
  } 

} 
