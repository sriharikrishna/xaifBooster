#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_ASSIGNMENTALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_ASSIGNMENTALG_INCLUDE_
// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockElementAlg.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class Assignment;
}

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  /** 
   * class to implement reversal of BasicBlockElements
   */
  class AssignmentAlg : public xaifBoosterBasicBlockPreaccumulation::AssignmentAlg,
			public BasicBlockElementAlg {

  public:
    
    AssignmentAlg(Assignment& theContainingAssignment);

    virtual ~AssignmentAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /** 
     * no def
     */
    AssignmentAlg();

    /** 
     * no def
     */
    AssignmentAlg(const AssignmentAlg&);

    /** 
     * no def
     */
    AssignmentAlg& operator=(const AssignmentAlg&);

  }; // end of class AssignmentAlg
 
} 
                                                                     
#endif
