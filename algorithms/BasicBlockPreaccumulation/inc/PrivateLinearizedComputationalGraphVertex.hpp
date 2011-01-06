#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEX_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster; 

namespace xaifBoosterBasicBlockPreaccumulation { 
 
  /**
   * This class is no longer necessary
   */
  class PrivateLinearizedComputationalGraphVertex : public xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex {

  public:

    PrivateLinearizedComputationalGraphVertex();
    ~PrivateLinearizedComputationalGraphVertex(){};

    bool hasOriginalVariable() const;
    void setOriginalVariable(const Variable& aVariable,
			     const ObjectWithId::Id& aStatementId);
    const Variable& getOriginalVariable() const;

    const ObjectWithId::Id& getStatementId() const;

    std::string debug() const;

  private: 
    
    /**
     * Pointer to the variable that originally corresponds to this vertex, in the case where one exists.
     * The variable is not owned by this class.
     */
    const Variable* myOriginalVariable_p;

    /**
     * set to the respective statement id if myOriginalVariable_p is set
     */
    ObjectWithId::Id myStatementId;

  }; 
 
} 
                                                                     
#endif

