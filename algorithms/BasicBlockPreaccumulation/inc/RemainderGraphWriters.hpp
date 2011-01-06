#ifndef _REMAINDERGRAPHWRITERS_INCLUDE_
#define _REMAINDERGRAPHWRITERS_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class RemainderGraphVertexLabelWriter {
  public:
    RemainderGraphVertexLabelWriter(const RemainderGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, 
		    const BoostIntenalVertexDescriptor& v) const {
      const RemainderGraphVertex* theLCGVertex_p =
	dynamic_cast<const RemainderGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
													  myG.getInternalBoostGraph()),
											       v));
      if (theLCGVertex_p->hasOriginalVariable())
	out << "[label=\"" << theLCGVertex_p->getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str() << "\"]";
    }
    const RemainderGraph& myG;
  }; 

  class RemainderGraphEdgeLabelWriter {
  public:
    RemainderGraphEdgeLabelWriter(const RemainderGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const RemainderGraphEdge* theLCGEdge_p =
	dynamic_cast<const RemainderGraphEdge*>(boost::get(boost::get(BoostEdgeContentType(),
													myG.getInternalBoostGraph()),
											     v));
      if (theLCGEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::UNIT_LABEL)
	out << "[color=\"red\"]";
      else if (theLCGEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::CONSTANT_LABEL)
	out << "[color=\"blue\"]";
    }
    const RemainderGraph& myG;
  }; 

  class RemainderGraphPropertiesWriter {
  public:
    RemainderGraphPropertiesWriter(const RemainderGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const RemainderGraph& myG;
  }; 

}

#endif
