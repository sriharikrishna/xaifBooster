#include <sstream>

#include "xaifBooster/system/inc/Constant.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ConstantAlg.hpp"

namespace xaifBoosterLinearization { 

  ConstantAlg::ConstantAlg(Constant& theContainingConstant) : 
    ConstantAlgBase(theContainingConstant),
    ExpressionVertexAlg(theContainingConstant) {
  };

  ConstantAlg::~ConstantAlg() {};

  std::string 
  ConstantAlg::debug() const { 
    return std::string("ConstantAlg");
  }

  void
  ConstantAlg::printXMLHierarchy(std::ostream& os) const { 
    ConstantAlgBase::getContaining().printXMLHierarchyImpl(os);
  }

  void ConstantAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

}
