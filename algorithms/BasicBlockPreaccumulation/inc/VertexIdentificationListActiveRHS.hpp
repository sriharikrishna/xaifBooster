#ifndef _VERTEXIDENTIFICATIONLISTACTIVERHS_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVERHS_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationListActive.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is for the identification fo active variables
   * RHS <-> RHS
   * in the presence of ud information
   */
  class VertexIdentificationListActiveRHS : public VertexIdentificationListActive {

  public:

    IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     */
    virtual void addElement(const Variable& theVariable,
			    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);
    
  }; // end of class VertexIdentificationListActiveRHS  
   
} // end namespace 
                                                                  
#endif
