/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * DualGraph.hpp          Last Updated: 03/24/04 13:36
 */

#ifndef _DUALGRAPH_INCLUDE_
#define _DUALGRAPH_INCLUDE_

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphEdge.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphVertex.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphPath.hpp"


using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation { 

  class DualGraph : public GraphWrapper<DualGraphVertex, DualGraphEdge>{

  public:

    DualGraph(){};
    ~DualGraph();

    typedef std::list<DualGraphEdge*> FacePointerList;
    typedef std::list<DualGraphVertex*> VertexPointerList;
    typedef std::list<DualGraphPath*> PathList;  

    const DualGraphVertex& getDualVertex(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge& theEdge) const;
    
    void populatePathList();
    void clearPathList();
    void copyPath(const DualGraphPath& thePath);
    const PathList& getPathList() const;
    
    //returns true if the list has elements and they are all complete
    //returns false if any elements are incomplete or if the size is zero
    bool allComplete() const;

    unsigned int checkSequence(DualGraphVertex& theFirst, DualGraphVertex& theSecond);

  private: 

    PathList myPathList;

  }; // end of class DualGraph 

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
