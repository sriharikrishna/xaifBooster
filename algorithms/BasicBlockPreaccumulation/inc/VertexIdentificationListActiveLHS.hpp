#ifndef _VERTEXIDENTIFICATIONLISTACTIVELHS_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVELHS_INCLUDE_

#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is for the identification of active variables
   * RHS <-> preceding LHS
   * in the presence of alias or ud information
   */
  class VertexIdentificationListActiveLHS : public VertexIdentificationListActive {

  public:

    IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     */
    void addElement(const Variable& theVariable,
		    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p,
		    const ObjectWithId::Id& aStatementId);

    virtual void removeIfIdentifiable(const Variable& theVariable); 

    virtual std::string debug() const;

  private: 

    class ListItem: public VertexIdentificationListActive::ListItem { 
      
    public: 

      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey,
	       PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p,
	       const ObjectWithId::Id& aStatementId);

      virtual std::string debug() const;

      /**
       * this is the statement id of the assignment in which this 
       * vertex represents the LHS, i.e. it is the statementID of 
       * the single entry in the ud chain or alternatively the 
       * result of looking at the alias map,
       * this must be set or this ListItem instance is useless
       */
      const ObjectWithId::Id& myStatementId;

    };
    
    /** 
     * retrieve the list of statement IDs collected in myList
     */
    void getStatementIdList(DuUdMapDefinitionResult::StatementIdList& aStatementIdList)const;

  }; // end of class VertexIdentificationListActiveLHS  
   
} // end namespace 
                                                                  
#endif
