#include <sstream>

#include "xaifBooster/system/inc/BooleanOperation.hpp"
#include "xaifBooster/algorithms/Linearization/inc/BooleanOperationAlg.hpp"

namespace xaifBoosterLinearization { 

  BooleanOperationAlg::BooleanOperationAlg(BooleanOperation& theContainingBooleanOperation) : 
    BooleanOperationAlgBase(theContainingBooleanOperation),
    ExpressionVertexAlg(theContainingBooleanOperation) {
  }

  BooleanOperationAlg::~BooleanOperationAlg() {}

  std::string 
  BooleanOperationAlg::debug() const { 
    return std::string("BooleanOperationAlg");
  }

  void
  BooleanOperationAlg::printXMLHierarchy(std::ostream& os) const { 
    BooleanOperationAlgBase::getContaining().printXMLHierarchyImpl(os);
  }

  void BooleanOperationAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

}
