#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_

#include <list>
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphEdge.hpp"

namespace xaifBooster { 
  class ExpressionEdge;
}

using namespace xaifBooster; 

namespace xaifBoosterBasicBlockPreaccumulation { 
  
  class PrivateLinearizedComputationalGraphEdge : 
    public xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge {

  public:

    PrivateLinearizedComputationalGraphEdge();

    ~PrivateLinearizedComputationalGraphEdge(){};
 
    void setLinearizedExpressionEdge(ExpressionEdge& anExpressionEdge);

    void setUnitExpressionEdge();

    bool isUnitExpressionEdge() const;

    const ExpressionEdge& getLinearizedExpressionEdge() const;

    std::string debug() const ;

    typedef std::list<ExpressionEdge*> ExpressionEdgePList;
    
    void addParallel(ExpressionEdge&);

    const ExpressionEdgePList& getParallels() const;

  private:
    
    /**
     * this refers to an edge in the  
     * right hand side of an assignment in a 
     * basic block
     * I.e. this is a reference to a local partial 
     * derivative
     * this class doesn't own the ExpressionEdge pointed 
     * to by myPrivateLinearizedExpressionEdge
     * the edge we point to is not owned by this class
     */
    ExpressionEdge* myLinearizedExpressionEdge_p;

    /** 
     * we keep all references to edges parallel 
     * to the one referenced in myLinearizedExpressionEdge_p
     * in here such that the we have only one placeholder 
     * in here. This implies that all parallel edges are 
     * added before any reference to this edge
     * none of the edges are owned by this class
     */
    ExpressionEdgePList myParallelEdges;

    /** 
     * this is a special purpose edge 
     * that needs to represent an assignment t1=t2, 
     * i.e. something for which we don't have an edge in the 
     * Expression
     */
    bool myUnitExpressionEdgeFlag;

  }; // end of class LinearizedComputationalGraphEdge
 
} 
                                                                     
#endif
