#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/SubroutineCall.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/SubroutineCallAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    SubroutineCallAlgBase(theContainingSubroutineCall),
    BasicBlockElementAlg(theContainingSubroutineCall) { 
  }

  void SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    SubroutineCallAlgBase::printXMLHierarchy(os);
  }

  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 
  
} // end of namespace 
