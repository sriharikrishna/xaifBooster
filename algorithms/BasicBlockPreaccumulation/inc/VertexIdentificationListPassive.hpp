#ifndef _VERTEXIDENTIFICATIONLISTPASSIVE_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTPASSIVE_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is for the identification of passive variables   
   * in difference to active identification we allow here 
   * a set of variables that can alias each other
   */
  class VertexIdentificationListPassive : public VertexIdentificationList {

  public:

    VertexIdentificationListPassive();

    ~VertexIdentificationListPassive(){};

    virtual std::string debug() const;

    virtual IdentificationResult_E canIdentify(const Variable& theVariable) const;

    /** 
     * \todo JU incomplete, no handling for du info
     */
    void addElement(const Variable& theVariable);

    void removeIfIdentifiable(const Variable& theVariable); 

  }; // end of class VertexIdentificationListPassive  
   
} // end namespace 
                                                                  
#endif
