// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphWriters.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {

  void
  RemainderGraph::show(const std::string& namePrefix) const {
    std::ostringstream nameStream;
    nameStream << namePrefix << this;
    GraphVizDisplay::show(*this,
                          nameStream.str(),
                          RemainderGraphVertexLabelWriter(*this),
                          RemainderGraphEdgeLabelWriter(*this),
                          RemainderGraphPropertiesWriter(*this));
  }

  void RemainderGraph::initFrom(const xaifBoosterCrossCountryInterface::Elimination& anElimination) {
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& aBaseRemainderGraph(anElimination.getRemainderLCG());
    // copy vertices
    std::map<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*,
             const RemainderGraphVertex*> theOld2NewVertexPMap; // local map to facilitate copy
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIteratorPair p(aBaseRemainderGraph.vertices());
    for(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstVertexIterator aLCGVi(p.first); aLCGVi != p.second; ++aLCGVi) {
      RemainderGraphVertex& theCopyRGV(*new RemainderGraphVertex(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(anElimination.rVertex2oVertex(*aLCGVi))));
      supplyAndAddVertexInstance(theCopyRGV);
      //theCopyRGV.setAccumulationGraphVertex(anElimination.rVertex2oVertex(*aLCGi));
      theOld2NewVertexPMap[&(*aLCGVi)] = &theCopyRGV;
    }
    // copy edges
    const xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap&
      theRemainderEdge2AccumulationVertexMap (anElimination.getRemainderEdge2AccumulationVertexMap()); 
    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair pe(aBaseRemainderGraph.edges());
    for(xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator aLCGEi(pe.first); aLCGEi != pe.second; ++aLCGEi) {
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge& theOldEdge(*aLCGEi);
      // find the corresp. AccumulationGraphVertex
      xaifBoosterCrossCountryInterface::Elimination::RemainderEdge2AccumulationVertexMap::const_iterator aMapIt(
       theRemainderEdge2AccumulationVertexMap.find(&theOldEdge)
      );
      if (aMapIt == theRemainderEdge2AccumulationVertexMap.end())
	THROW_LOGICEXCEPTION_MACRO("RemainderGraph::initFrom: couldn't find remainder edge in map");
      RemainderGraphEdge& theCopyRGE(*new RemainderGraphEdge(*(aMapIt->second)));
      // copy the edge
      supplyAndAddEdgeInstance(theCopyRGE,
                               *theOld2NewVertexPMap[&aBaseRemainderGraph.getSourceOf(theOldEdge)],
                               *theOld2NewVertexPMap[&aBaseRemainderGraph.getTargetOf(theOldEdge)]);
    } 
  }

}

