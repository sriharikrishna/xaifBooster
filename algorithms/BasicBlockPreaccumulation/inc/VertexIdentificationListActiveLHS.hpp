#ifndef _VERTEXIDENTIFICATIONLISTACTIVELHS_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVELHS_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is for the identification fo active variables
   * RHS <-> LHS
   * in the presence of ud information
   */
  class VertexIdentificationListActiveLHS : public VertexIdentificationListActive {

  public:

    IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     */
    virtual void addElement(const Variable& theVariable,
			    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

  private: 

    class ListItem: public VertexIdentificationListActive::ListItem { 
      
    public: 

      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey,
	       PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p,
	       DuUdMap::StatementId aStatementId);

      /**
       * if set, it is the statement id of the assignment in which this 
       * vertex represents the LHS, i.e. this is usefull only in the 
       * presence of ud-chain information
       */
      DuUdMap::StatementId myStatementId;

    };
    
    /** 
     * just for convenience we keep a list of 
     * all statementIds in ListItem  for use with 
     * DuUdMap methods
     */
    DuUdMap::StatementIdList myStatementIdList;

  }; // end of class VertexIdentificationListActiveLHS  
   
} // end namespace 
                                                                  
#endif
