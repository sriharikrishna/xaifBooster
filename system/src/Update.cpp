#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/Update.hpp"

namespace xaifBooster { 

  const std::string Update::ourXAIFName("xaif:Update");

  Update::Update(bool theActiveFlag) : 
    myAssignment(theActiveFlag) { 
  } 

  void
  Update::printXMLHierarchy(std::ostream& os) const { 
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
  } // end of Update::printXMLHierarchy

  std::string Update::debug () const { 
    std::ostringstream out;
    out << "Update[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Update::debug

  Assignment& Update::getAssignment() { 
    return myAssignment;
  } 

  const Assignment& Update::getAssignment() const { 
    return myAssignment;
  } 

} // end of namespace xaifBooster 
