#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/BaseVariableReferenceVertex.hpp"

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
