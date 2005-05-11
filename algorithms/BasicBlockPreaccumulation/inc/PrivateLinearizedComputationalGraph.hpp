#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPH_INCLUDE_

#include "xaifBooster/utils/inc/HashTable.hpp"
#include "xaifBooster/system/inc/DuUdMapUseResult.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveLHS.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActiveRHS.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListPassive.hpp"

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

    VertexIdentificationListActiveRHS& getVertexIdentificationListActiveRHS() { 
      return myVertexIdentificationListActiveRHS;
    };    

    VertexIdentificationListActiveLHS& getVertexIdentificationListActiveLHS() { 
      return myVertexIdentificationListActiveLHS;
    };    

    VertexIdentificationListPassive& getVertexIdentificationListPassive() { 
      return myVertexIdentificationListPassive;
    };    

    void addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndependentVertex);

    void addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDependentVertex,
			    const ObjectWithId::Id& aStatementId);

    void removeFromIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndependentVertex);

    void removeFromDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDependentVertex);

    const DuUdMapUseResult::StatementIdLists getStatementIdLists()const;

    void addToPassiveStatementIdList(const ObjectWithId::Id& aStatementId);

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
     * myVertexIdentificationListActiveRHS and myVertexIdentificationListActiveLHS
     * are disjoint
     * RHS identification doesn't preclude 
     * aliased vertices in the list 
     * this list doesn't own any elements
     */
    VertexIdentificationListActiveRHS myVertexIdentificationListActiveRHS; 

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
    VertexIdentificationListActiveLHS myVertexIdentificationListActiveLHS; 

    /**
     * we need to track the set of 
     * passive vertices to do some
     * basic block level activity analysis
     * elements in this list are mutually exclusive 
     * with elements in the active lists.
     */
    VertexIdentificationListPassive myVertexIdentificationListPassive; 

    /** 
     * this is the list of statementIds for the active statements in which  
     * the resp. dependent is the right hand side
     * myDependentStatementIdList and myPassiveStatementIdList are supposed to be disjoint
     */
    DuUdMapDefinitionResult::StatementIdList myDependentStatementIdList;
    
    /** 
     * this is the list of statementIds for the passive statements 
     * we need this for determination of dependents with du chains
     * since a variable may be used in a statement determined to be passive
     * and therefore not show up in myDependentStatementIdList
     * myDependentStatementIdList and myPassiveStatementIdList are supposed to be disjoint
     */
    DuUdMapDefinitionResult::StatementIdList myPassiveStatementIdList;
    
  }; // end of class PrivateLinearizedComputationalGraph 

} 
                                                                     
#endif
