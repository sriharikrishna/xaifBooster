/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * LinearizedComputationalGraphCopy.hpp          Last Updated: 03/11/04 13:24
 * Class to facilitate making copies of linearized computational graphs, which can be used to make
 * eliminations on.
 */

#ifndef _LINEARIZEDCOMPUTATIONALGRAPHCOPY_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPHCOPY_INCLUDE_

#include <list>
#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation { 

  class LinearizedComputationalGraphCopy : public GraphWrapper<xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex,
				       LinearizedComputationalGraphCopyEdge>{
  public:

    /**
     * each edge in an edge list has a direction associated with it, so an edge can be in the list twice, one for each direction
     * this allows the heuristics to be mroe efficient
     */
    enum edgeElimDirection {FRONT, BACK};
    struct edgeEntry{
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge* edge_p;
      edgeElimDirection direction;
    };

    typedef std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> ConstVertexPointerList;
    typedef std::list<xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> VertexPointerList;
    typedef std::list<edgeEntry> EdgePointerList;

    /**
     * these functions return the independent and dependent  lists associated with the graph
     */
    const ConstVertexPointerList& getIndependentList() const;
    const ConstVertexPointerList& getDependentList() const;

    /**
     * these functions return the number of independent and dependent vertices, respectively
     */
    const unsigned int numIndeps() const;
    const unsigned int numDeps() const;

    /**
     * these functions return the vertex and edge lists associated with the graph
     */
    VertexPointerList getVertexList() const;
    EdgePointerList getEdgeList() const;

    /**
     * these functions facilitate the population of the dependent and independent lists when the graph copy is made
     */
    void addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndepdentVertex);
    void addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDepdentVertex);

    /**
     * vertexlist is a topologically sorted list of all the vertices in the graph, the vertex list stays the same throughout
     * the elimination proce3ss, except that when a vertex is eliminated it is removed from the list.  the edgelist is
     * cleared and recreated based on the vertex list before every edge elimination decision is made.
     */
    void addToVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex);
    void addToEdgeList(LinearizedComputationalGraphCopy& theCopy,
		       LinearizedComputationalGraphCopyEdge& theEdge,
		       LinearizedComputationalGraphCopy::edgeElimDirection theDirection);
    void removeFromVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex);
    void clearEdgeList();

  private: 

    ConstVertexPointerList myIndependentList;
    ConstVertexPointerList myDependentList;
    VertexPointerList myVertexList;
    EdgePointerList myEdgeList;

  }; // end of class LinearizedComputationalGraphCopy 

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
