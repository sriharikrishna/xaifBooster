#include <sstream>

#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/algorithms/Linearization/inc/IntrinsicAlg.hpp"

namespace xaifBoosterLinearization { 

  IntrinsicAlg::IntrinsicAlg(Intrinsic& theContainingIntrinsic) : 
    IntrinsicAlgBase(theContainingIntrinsic),
    ExpressionVertexAlg(theContainingIntrinsic) {
  };

  IntrinsicAlg::~IntrinsicAlg() {};

  std::string IntrinsicAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::IntrinsicAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of IntrinsicAlg::debug

  void
  IntrinsicAlg::printXMLHierarchy(std::ostream& os) const { 
    IntrinsicAlgBase::getContaining().printXMLHierarchyImpl(os);
  }

  void IntrinsicAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

}
