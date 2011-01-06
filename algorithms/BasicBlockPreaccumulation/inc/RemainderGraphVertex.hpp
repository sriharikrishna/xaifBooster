#ifndef _REMAINDERGRAPHVERTEX_INCLUDE_
#define _REMAINDERGRAPHVERTEX_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/boostWrapper/inc/Vertex.hpp"

#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {

  class Sequence;
  
  class RemainderGraphVertex : public PrivateLinearizedComputationalGraphVertex {
  public:

    RemainderGraphVertex();
    ~RemainderGraphVertex();

    std::string debug() const;

    /**
     * Used to replace the original variable in the case where we have an independent that may alias with some non-independent.
     * In this case, we use this new variable for propagation exclusively. (see BasicBlockAlg::makePropagationVariables())
     */
    void replacePropagationVariable(Sequence& theSequence);

    /**
     * Used in the case of a vertex that has no original variable (rather, it is associated with some temporary)
     */
    void createNewPropagationVariable(Sequence& theSequence, const Variable& variableToMatch);

    const Variable& getPropagationVariable() const;

  private:

    /**
     * Pointer to the variable that will be used for propagation in case there is no original variable,
     * or the original variable for an independent had to be replaced because of possible aliasing issues.
     * This variable is owned by this class, and is deleted in the dtor.
     */
    Variable* myPropagationVariable_p;

  }; 
 
} 
                                                                     
#endif

