#ifndef _VERTEXIDENTIFICATIONLISTPASSIVE_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTPASSIVE_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is for the identification (RHS to preceeding LHS) 
   * of passive variables   
   * in difference to active identification we allow here 
   * a set of variables that can alias each other
   */
  class VertexIdentificationListPassive : public VertexIdentificationList {

  public:

    VertexIdentificationListPassive();

    ~VertexIdentificationListPassive(){};

    virtual std::string debug() const;

    /** 
     * Note, that here the question is merely is it passive or ambiguous 
     * or we don't know.
     * therefore passive is signified by  UNIQELY_IDENTIFIED and this doesn't 
     * mean we need to know exactly what it is identified with 
     */
    virtual IdentificationResult_E canIdentify(const Variable& theVariable) const;

    void addElement(const Variable& theVariable,
		    const ObjectWithId::Id& aStatementId);

    void VertexIdentificationListPassive::removeIfIdentifiable(const Variable& theVariable); 

  }; // end of class VertexIdentificationListPassive  
   
} // end namespace 
                                                                  
#endif
