// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AssignmentAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    xaifBoosterBasicBlockPreaccumulation::AssignmentAlg(theContainingAssignment),
    BasicBlockElementAlg(theContainingAssignment) { 
  }

  void AssignmentAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::printXMLHierarchy(os);
  }

  std::string 
  AssignmentAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::AssignmentAlg["
	<< this 
	<< ","
 	<< xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void AssignmentAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 
  
} // end namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint

