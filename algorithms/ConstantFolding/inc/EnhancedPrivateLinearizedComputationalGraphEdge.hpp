#ifndef _XAIFBOOSTERCONSTANTFOLDING_ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_
#define _XAIFBOOSTERCONSTANTFOLDING_ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGE_INCLUDE_

#include "xaifBooster/algorithms/ConstantFolding/inc/AssignmentAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"

using namespace xaifBooster; 

namespace xaifBoosterConstantFolding { 

  class  EnhancedPrivateLinearizedComputationalGraphEdge : public xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdge {

  public:

    EnhancedPrivateLinearizedComputationalGraphEdge();

    xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E  getConstantFoldedAssignmentPDK() {
      return myConstantFoldedAssignmentPDK;
    };
    void setConstantFoldedAssignmentPDK(xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E aPDK) {
      myConstantFoldedAssignmentPDK=aPDK;
    };
    Assignment* getConstantFoldedAssignment() const {
      return myConstantFoldedAssignment_p;
    };
    bool hasConstantFoldedAssignment() const {
      return containsConstantFoldedAssignment;
    };
    void setConstantFoldedAssignment(Assignment& anAssignment) {
      myConstantFoldedAssignment_p=&anAssignment;
      containsConstantFoldedAssignment=true;
    };
    //    virtual std::string debug() const;

    virtual Assignment& getAssignmentFromEdge() const;

  private:
    Assignment* myConstantFoldedAssignment_p;
    bool containsConstantFoldedAssignment;
    xaifBooster::PartialDerivativeKind::PartialDerivativeKind_E myConstantFoldedAssignmentPDK;
  };    
  
} 

#endif
