#include <sstream>

#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ArgumentAlg.hpp"

namespace xaifBoosterLinearization { 

  ArgumentAlg::ArgumentAlg(Argument& theContainingArgument) : 
    ArgumentAlgBase(theContainingArgument),
    ExpressionVertexAlg(theContainingArgument) {
  };

  ArgumentAlg::~ArgumentAlg() {};

  std::string ArgumentAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::ArgumentAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentAlg::debug

  void
  ArgumentAlg::printXMLHierarchy(std::ostream& os) const { 
    ArgumentAlgBase::getContaining().printXMLHierarchyImpl(os);
  }

  void ArgumentAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

}
