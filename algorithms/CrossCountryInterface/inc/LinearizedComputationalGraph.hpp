#ifndef _LINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_

#include <list>

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterCrossCountryInterface { 

  /**
   * the default representation for LinearizedComputationalGraph
   */
  class LinearizedComputationalGraph : public GraphWrapper<LinearizedComputationalGraphVertex,
				       LinearizedComputationalGraphEdge>{
  public:
    
    typedef std::list<const LinearizedComputationalGraphVertex*> VertexPointerList;
    const VertexPointerList& getIndependentList() const;
    const VertexPointerList& getDependentList() const;
    void addToIndependentList(const LinearizedComputationalGraphVertex& theIndepdentVertex);
    void addToDependentList(const LinearizedComputationalGraphVertex& theDepdentVertex);

  private: 

    VertexPointerList myIndependentList;
    VertexPointerList myDependentList;

  }; // end of class LinearizedComputationalGraph 

} 
                                                                     
#endif
