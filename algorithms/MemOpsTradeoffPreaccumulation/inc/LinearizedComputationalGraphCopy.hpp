#ifndef _LINEARIZEDCOMPUTATIONALGRAPHCOPY_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPHCOPY_INCLUDE_

#include <list>

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"

using namespace xaifBooster;

namespace MemOpsTradeoffPreaccumulation { 

  class LinearizedComputationalGraphCopy : public GraphWrapper<xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex,
				       LinearizedComputationalGraphCopyEdge>{
  public:
    
    typedef std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> ConstVertexPointerList;
    typedef std::list<xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> VertexPointerList;
    const ConstVertexPointerList& getIndependentList() const;
    const ConstVertexPointerList& getDependentList() const;
    VertexPointerList& getIntermediateList();
    void addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndepdentVertex);
    void addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDepdentVertex);
    void addToIntermediateList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theInterVertex);
    void removeFromIntermediateList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theInterVertex);

  private: 

    ConstVertexPointerList myIndependentList;
    ConstVertexPointerList myDependentList;
    VertexPointerList myIntermediateList;

  }; // end of class LinearizedComputationalGraphCopy 

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
