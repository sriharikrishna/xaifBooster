#ifndef         _scarce_include_
#define         _scarce_include_

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"

namespace xaifBoosterCrossCountryInterface {

struct VertexCorrelationEntry {
  const LinearizedComputationalGraphVertex* lcgVert;
  LinearizedComputationalGraphVertex* rv;
};

enum RemainderEdgeType {LCG_EDGE, JAE_VERT};

union EdgeCorrelationEntry {
  const LinearizedComputationalGraphEdge* lcgEdge;
  JacobianAccumulationExpressionVertex* jaeVert;
  RemainderEdgeType type;
  LinearizedComputationalGraphEdge* re;
};

typedef std::list<VertexCorrelationEntry> VertexCorrelationList;
typedef std::list<EdgeCorrelationEntry> EdgeCorrelationList;

} // namespace xaifBoosterCrossCountryInterface

#endif  // _scarce_include
_

