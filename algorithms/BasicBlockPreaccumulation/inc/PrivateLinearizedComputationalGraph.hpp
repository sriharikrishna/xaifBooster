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

    PrivateLinearizedComputationalGraph(); 

    virtual ~PrivateLinearizedComputationalGraph(){};
    
    /**
     * \todo JU implementation incomplete
     */
    std::string debug() const { return std::string("PrivateLinearizedComputationalGraph");};

    VertexIdentificationList& getVertexRHSIdentificationList() { 
      return myVertexRHSIdentificationList;
    };    

    VertexIdentificationList& getVertexLHSIdentificationList() { 
      return myVertexLHSIdentificationList;
    };    

  private: 

    /**
     * we need to track the relation 
     * between Variables and 
     * vertices in the linearized graph
     * in particular to find the connection 
     * points for new Expressions to be added 
     * to the flattened graph. 
     * RHS identification serves the purpose 
     * of identifying RHSs within or accross RHSs
     * myVertexRHSIdentificationList and myVertexLHSIdentificationList
     * are disjoint
     * RHS identification doesn't preclude 
     * aliased vertices in the list 
     * this list doesn't own any elements
     */
    VertexIdentificationList myVertexRHSIdentificationList; 

    /**
     * we need to track the relation 
     * between Variables and 
     * vertices in the linearized graph
     * in particular to find the connection 
     * points for new Expressions to be added 
     * to the flattened graph. 
     * LHS identification serves the purpose 
     * of identifying a RHS vertex with a preceding LHS
     * The Vertex for a given Variable
     * will change from v_old to v_new when the respective variable 
     * is overwritten by vertex v_new
     * LHS identification does not allow aliased vertices in the list
     * this list doesn't own any elements
     */
    VertexIdentificationList myVertexLHSIdentificationList; 

  }; // end of class PrivateLinearizedComputationalGraph 

} 
                                                                     
#endif
