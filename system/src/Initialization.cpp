#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/Initialization.hpp"

namespace xaifBooster { 

  const std::string Initialization::ourXAIFName("xaif:Initialization");

  Initialization::Initialization(bool theActiveFlag) : 
    myAssignment(theActiveFlag) { 
  } 

  void
  Initialization::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    myAssignment.printXMLHierarchyLHS(os);
    myAssignment.printXMLHierarchyRHS(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of Initialization::printXMLHierarchy

  std::string Initialization::debug () const { 
    std::ostringstream out;
    out << "Initialization[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Initialization::debug

  Assignment& Initialization::getAssignment() { 
    return myAssignment;
  } 

  const Assignment& Initialization::getAssignment() const { 
    return myAssignment;
  } 

} // end of namespace xaifBooster 
