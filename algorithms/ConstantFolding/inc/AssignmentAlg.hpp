#ifndef _XAIFBOOSTERCONSTANTFOLDING_ASSIGNMENTALG_INCLUDE_
#define _XAIFBOOSTERCONSTANTFOLDING_ASSIGNMENTALG_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

using namespace xaifBooster; 

namespace xaifBoosterConstantFolding { 

  /**
   * class to implement ConstantFolding steps
   * AssignmentAlgBase
   */
  class AssignmentAlg : public xaifBoosterBasicBlockPreaccumulation::AssignmentAlg {

  public:
    AssignmentAlg(Assignment& theContainingAssignment);
    void AssignmentAlg::algorithm_action_3();
 
  private: 
 
  }; // end of class Assignment
 
} 
                                                                     
#endif
