#ifndef _VERTEXIDENTIFICATIONLISTACTIVERHS_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVERHS_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/DuUdMapDefinitionResult.hpp"
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
     * in case of duud information present we keep adding 
     * variables, 
     * in case of duud information absent we have to maintain 
     * uniqueness, i.e. 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     */
    virtual void addElement(const Variable& theVariable,
			    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p,
			    const DuUdMapDefinitionResult::StatementIdList& theKnownAssignmentsList);
    
  }; // end of class VertexIdentificationListActiveRHS  
   
} // end namespace 
                                                                  
#endif
