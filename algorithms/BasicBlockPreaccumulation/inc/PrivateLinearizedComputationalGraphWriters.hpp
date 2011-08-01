#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHWRITERS_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHWRITERS_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {

  class PrivateLinearizedComputationalGraphVertexLabelWriter {
  public:
    PrivateLinearizedComputationalGraphVertexLabelWriter(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, 
		    const BoostIntenalVertexDescriptor& v) const {
      const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p=
        dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(boost::get(boost::get(BoostVertexContentType(),
                                                                                             myG.getInternalBoostGraph()),
                                                                                  v));
      std::string theVertexShape("ellipse");
      std::string theVertexGroupname("intermediates");
      std::string vertexFixedSize("false");
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theDepVertexPList(myG.getDependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aDepVertexPListI(theDepVertexPList.begin());
           aDepVertexPListI!=theDepVertexPList.end();
           ++aDepVertexPListI) { 
        if (thePrivateLinearizedComputationalGraphVertex_p==*(aDepVertexPListI)) {
          theVertexShape = "invtriangle";
          theVertexGroupname = "dependents";
          vertexFixedSize = "true";
          break;
        }
      }
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& theIndepVertexPList(myG.getIndependentList());
      for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator aIndepVertexPListI(theIndepVertexPList.begin());
           aIndepVertexPListI!=theIndepVertexPList.end();
           ++aIndepVertexPListI) { 
        if (thePrivateLinearizedComputationalGraphVertex_p==*(aIndepVertexPListI)) {
          theVertexShape = "triangle";
          theVertexGroupname = "independents";
          vertexFixedSize = "true";
          break;
        }
      }

      // set label
      std::string theVertexKind("");
      std::ostringstream oss;
      if (thePrivateLinearizedComputationalGraphVertex_p->hasOriginalVariable()) {
        oss << thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getVariableSymbolReference().getSymbol().getId().c_str();
        if (thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getDuUdMapKey().getKind() == InfoMapKey::SET)
          oss  << " k=" << thePrivateLinearizedComputationalGraphVertex_p->getOriginalVariable().getDuUdMapKey().getKey();
        theVertexKind = oss.str();
      }

      out << "["
          << "fixedsize=" << vertexFixedSize.c_str() << ","
          << "fontsize=8,"
          << "group=\"" << theVertexGroupname.c_str() << "\","
          << "shape=" << theVertexShape.c_str() << ","
          << "label=\"" << theVertexKind.c_str() << "\""
          << "]";
    }
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& myG;
  };

  class PrivateLinearizedComputationalGraphEdgeLabelWriter {
  public:
    PrivateLinearizedComputationalGraphEdgeLabelWriter(const PrivateLinearizedComputationalGraph& g) : myG(g) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const PrivateLinearizedComputationalGraphEdge* thePrivateLinearizedComputationalGraphEdge_p=
	dynamic_cast<const PrivateLinearizedComputationalGraphEdge*>(boost::get(boost::get(BoostEdgeContentType(),
                                                                                           myG.getInternalBoostGraph()),
                                                                                v));
      std::string theColor ("");
      if (thePrivateLinearizedComputationalGraphEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::UNIT_LABEL)
        theColor = "red";
      else if (thePrivateLinearizedComputationalGraphEdge_p->getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::CONSTANT_LABEL)
        theColor = "blue";
      else
        theColor = "black";

      out << "["
          << "color=" << theColor.c_str()
          << ",fontsize=8"
          << ",labelfloat=false"
          << ",label=\"" << thePrivateLinearizedComputationalGraphEdge_p << "\""
          << "]";
    }
    const PrivateLinearizedComputationalGraph& myG;
  };

  class PrivateLinearizedComputationalGraphPropertiesWriter {
  public:
    PrivateLinearizedComputationalGraphPropertiesWriter(const PrivateLinearizedComputationalGraph& g) : myG(g) {};
    void operator()(std::ostream& out) const {
      out << "rankdir=BT;" << std::endl;
    }
    const PrivateLinearizedComputationalGraph& myG;
  };

}

#endif
