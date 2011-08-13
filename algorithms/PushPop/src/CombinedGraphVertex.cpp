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

#include "xaifBooster/system/inc/ExpressionVertex.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraphVertex.hpp"

#include "xaifBooster/algorithms/PushPop/inc/CombinedGraphVertex.hpp"

namespace xaifBoosterPushPop {

  CombinedGraphVertex::CombinedGraphVertex(const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex& aLCGVertex) :
    myOrigin(aLCGVertex),
    myOriginType(ORIGINAL_VERTEX) {
  }

  CombinedGraphVertex::CombinedGraphVertex(const ExpressionVertex& aExpressionVertex) :
    myOrigin(aExpressionVertex),
    myOriginType(LINEARIZATION_VERTEX) {
  }

  CombinedGraphVertex::CombinedGraphVertex(const ExpressionEdge& aExpressionEdge) :
    myOrigin(aExpressionEdge),
    myOriginType(TRIVIAL_PARTIAL_EXPRESSION) {
  }

  CombinedGraphVertex::CombinedGraphVertex(const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& aAccumulationGraphVertex) :
    myOrigin(aAccumulationGraphVertex),
    myOriginType(ACCUMULATION_VERTEX) {
  }

  std::string
  CombinedGraphVertex::debug() const { 
    std::ostringstream out;
    out << "CombinedGraphVertex[" << Vertex::debug().c_str()
        << ",myOriginType=";
    switch (myOriginType) {
      case ORIGINAL_VERTEX: {
        out << "ORIGINAL_VERTEX"
            << ",myOriginalPLCGVertex_p=" << myOrigin.myOriginalPLCGVertex_p->debug().c_str();
        break;
      }
      case LINEARIZATION_VERTEX: {
        out << "LINEARIZATION_VERTEX"
            << ",myLinearizationExpressionVertex_p=" << myOrigin.myLinearizationExpressionVertex_p->debug().c_str();
        break;
      }
      case TRIVIAL_PARTIAL_EXPRESSION: {
        out << "TRIVIAL_PARTIAL_EXPRESSION"
            << ",myLinearizedExpressionEdge_p=" << myOrigin.myLinearizedExpressionEdge_p->debug().c_str();
        break;
      }
      case ACCUMULATION_VERTEX: {
        out << "ACCUMULATION_VERTEX"
            << ",myAccumulationGraphVertex_p=" << myOrigin.myAccumulationGraphVertex_p->debug().c_str();
        break;
      }
      default:
        THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::debug: invalid OriginType");
        break;
    }
    out << ",myLHSCVariablePSet={";
    for (CVariablePSet::const_iterator setI = myLHSCVariablePSet.begin(); setI != myLHSCVariablePSet.end(); ++setI)
      out << (*setI)->debug().c_str() << ",";
    out << "}";
    out << "]" << std::ends;
    return out.str();
  }

  CombinedGraphVertex::VertexOriginType_E
  CombinedGraphVertex::getOriginType() const {
    return myOriginType;
  }

  const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex&
  CombinedGraphVertex::getOriginalVertex() const {
    if (myOriginType != ORIGINAL_VERTEX)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getOriginalVertex: wrong type");
    if (!myOrigin.myOriginalPLCGVertex_p)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getOriginalVertex: not set");
    return *(myOrigin.myOriginalPLCGVertex_p);
  }

  const ExpressionVertex&
  CombinedGraphVertex::getLinearizationExpressionVertex() const {
    if (myOriginType != LINEARIZATION_VERTEX)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getLinearizationExpressionVertex: wrong type");
    if (!myOrigin.myLinearizationExpressionVertex_p)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getLinearizationExpressionVertex: not set");
    return *(myOrigin.myLinearizationExpressionVertex_p);
  }
 
  const ExpressionEdge&
  CombinedGraphVertex::getLinearizedExpressionEdge() const {
    if (myOriginType != TRIVIAL_PARTIAL_EXPRESSION)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getLinearizedExpressionEdge: wrong type");
    if (!myOrigin.myLinearizedExpressionEdge_p)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getLinearizedExpressionEdge: not set");
    return *(myOrigin.myLinearizedExpressionEdge_p);
  }
 
  const xaifBoosterCrossCountryInterface::AccumulationGraphVertex&
  CombinedGraphVertex::getAccumulationGraphVertex() const {
    if (myOriginType != ACCUMULATION_VERTEX)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getAccumulationGraphVertex: wrong type");
    if (!myOrigin.myAccumulationGraphVertex_p)
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::getAccumulationGraphVertex: not set");
    return *(myOrigin.myAccumulationGraphVertex_p);
  }

  void
  CombinedGraphVertex::addLHSVariable(const Variable& aVariable) {
    if (myLHSCVariablePSet.find(&aVariable) != myLHSCVariablePSet.end())
      THROW_LOGICEXCEPTION_MACRO("CombinedGraphVertex::addLHSVariable: "
                                 << aVariable.debug().c_str() << "already in set");
    myLHSCVariablePSet.insert(&aVariable);
  }

  const CVariablePSet&
  CombinedGraphVertex::getLHSCVariablePSet() const {
    return myLHSCVariablePSet;
  }

}

