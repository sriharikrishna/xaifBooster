#ifndef _LINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_

#include "GraphWrapper.hpp"
#include "LinearizedComputationalGraphVertex.hpp"
#include "LinearizedComputationalGraphEdge.hpp"
#include <list>

namespace xaifBooster { 

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

} // end of namespace xaifBooster
                                                                     
#endif
