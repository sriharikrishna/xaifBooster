#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ConcreteArgument.hpp"

namespace xaifBooster { 

  const std::string ConcreteArgument::ourXAIFName("xaif:Argument");
  const std::string ConcreteArgument::our_myPosition_XAIFName("position");

  ConcreteArgument::ConcreteArgument (unsigned int thePosition) :
    myPosition(thePosition) {
  }

  void ConcreteArgument::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " "
       << our_myPosition_XAIFName.c_str()
       << "=\""
       << myPosition
       << "\">" 
       << std::endl; 
    myBaseVariableReference.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end if ConcreteArgument::printXMLHierarchy
  
  std::string ConcreteArgument::debug () const { 
    std::ostringstream out;
    out << "ConcreteArgument[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ConcreteArgument::debug

  unsigned int ConcreteArgument::getPosition() const { 
    return myPosition;
  } 
    
  BaseVariableReference& 
  ConcreteArgument::getBaseVariableReference() { 
    return myBaseVariableReference;
  } 

  const BaseVariableReference& 
  ConcreteArgument::getBaseVariableReference() const { 
    return myBaseVariableReference;
  } 

} // end of namespace xaifBooster 
