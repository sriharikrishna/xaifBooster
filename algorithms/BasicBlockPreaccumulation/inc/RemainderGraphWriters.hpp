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
      const RemainderGraphVertex& theRemainderGraphVertex(
       dynamic_cast<const RemainderGraphVertex&>(*boost::get(boost::get(BoostVertexContentType(),
                                                                                                                                                            myG.getInternalBoostGraph()),
                                                             v))
      );
      out << "["
          << "fontsize=7"
          << ",penwidth=3.0"
          << ",label=\"" << theRemainderGraphVertex.getLabelString().c_str() << "\""
          << ",tooltip=\"" << theRemainderGraphVertex.debug().c_str() << "\""
          << "]";
    }

    const RemainderGraph& myG;

  }; 

  class RemainderGraphEdgeLabelWriter {
  public:
    RemainderGraphEdgeLabelWriter(const RemainderGraph& g) : myG(g) {};

    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
      const RemainderGraphEdge& theRemainderGraphEdge(
       dynamic_cast<const RemainderGraphEdge&>(*boost::get(boost::get(BoostEdgeContentType(),
                                                                      myG.getInternalBoostGraph()),
                                               v))
      );
      out << "["
          << "fontsize=7"
          << ",penwidth=3.0"
          << ",color=" << theRemainderGraphEdge.getColorString().c_str()
          << ",tooltip=\"" << theRemainderGraphEdge.debug().c_str() << "\""
          << "]";
    }

    const RemainderGraph& myG;

  }; 

  class RemainderGraphPropertiesWriter {
  public:
    RemainderGraphPropertiesWriter(const RemainderGraph& g) : myG(g) {};

    void operator()(std::ostream& out) const {
      out << "rankdir=LR;" << std::endl;
    }

    const RemainderGraph& myG;

  }; 

}

#endif
