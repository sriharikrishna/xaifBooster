#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_

#include "xaifBooster/utils/inc/HashTable.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * the default representation for PrivateLinearizedComputationalGraph
   * the edges/vertices will be instances of subclasses of 
   * LinearizedComputationalGraphVertex / LinearizedComputationalGraphEdge
   */
  class PrivateLinearizedComputationalGraph : public xaifBoosterCrossCountryInterface::LinearizedComputationalGraph,
					      public virtual Debuggable {

  public:
    
    /**
     * \todo JU implementation incomplete
     */
    std::string debug() const { return std::string("PrivateLinearizedComputationalGraph");};

    VertexIdentificationList& getVertexIdentificationList() { 
      return myVertexIdentificationList;
    };    

  private: 
    /**
     * we need to track the relation 
     * between Variables and 
     * vertices in the linearized graph
     * in particular to find the connection 
     * points for new Expressions to be added 
     * to the flattened graph. 
     * The Vertex for a given Variable
     * will change from v_old to v_new when the respective variable 
     * is overwritten by vertex v_new
     * this list doesn't own any elements
     */
    VertexIdentificationList myVertexIdentificationList; 

  }; // end of class PrivateLinearizedComputationalGraph 

} 
                                                                     
#endif
