#include "utils/inc/PrintManager.hpp"
#include "utils/inc/LogicException.hpp"
#include "system/inc/BaseVariableReferenceVertex.hpp"

namespace xaifBooster { 

  void BaseVariableReferenceVertex::printXMLHierarchy(std::ostream& os) const {
  } // end if BaseVariableReferenceVertex::printXMLHierarchy
  
  std::string BaseVariableReferenceVertex::debug () const { 
    std::ostringstream out;
    out << "BaseVariableReferenceVertex[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of BaseVariableReferenceVertex::debug


  bool BaseVariableReferenceVertex::isSymbol() const { 
    return false;
  } 

} // end of namespace xaifBooster 
