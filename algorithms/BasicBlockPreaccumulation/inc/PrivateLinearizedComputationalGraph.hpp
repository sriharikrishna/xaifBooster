#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_

#include "LinearizedComputationalGraph.hpp"
#include "HashTable.hpp"

namespace xaifBooster { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * the default representation for PrivateLinearizedComputationalGraph
   * the edges/vertices will be instances of subclasses of 
   * LinearizedComputationalGraphVertex / LinearizedComputationalGraphEdge
   */
  class PrivateLinearizedComputationalGraph : public LinearizedComputationalGraph,
					      public virtual Debuggable {
  public:
    
    
    /**
     * \todo JU implementation incomplete
     */
    std::string debug() const { return std::string("PrivateLinearizedComputationalGraph");};

    HashTable<PrivateLinearizedComputationalGraphVertex*>& getVariableReferenceTrackList() { return myVariableReferenceTrackList;};    

  private: 
    /**
     * we need to track the relation 
     * between VariableReferences and 
     * vertices in the linearized graph
     * in particular to find the connection 
     * points for new Expressions to be added 
     * to the flattened graph. 
     * The Vertex for a given BaseVariableReference
     * will change from v_old to v_new when the respective variable 
     * is overwritten by vertex v_new
     * Key is the equivalenceSignature of BaseVariableReference
     * this list doesn't own any elements
     */
    HashTable<PrivateLinearizedComputationalGraphVertex*> myVariableReferenceTrackList; 


  }; // end of class PrivateLinearizedComputationalGraph 

} // end of namespace xaifBooster
                                                                     
#endif
