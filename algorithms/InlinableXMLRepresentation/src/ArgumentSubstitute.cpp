#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

namespace xaifBooster { 

  const std::string ArgumentSubstitute::ourXAIFName("xaif:ArgumentSubstitute");
  const std::string ArgumentSubstitute::our_myPosition_XAIFName("position");

  ArgumentSubstitute::ArgumentSubstitute (unsigned aPosition) : 
    myPosition(aPosition) { 
  } 

  ArgumentSubstitute::~ArgumentSubstitute(){
  }

  void
  ArgumentSubstitute::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << " "
       << our_myPosition_XAIFName.c_str() 
       << "=\"" 
       << myPosition
       << "\""
       << " "; 
    myVariable.printVariableReferenceXMLAttributes(os);
    os << ">" 
       << std::endl;
    myVariable.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ArgumentSubstitute::printXMLHierarchy

  std::string ArgumentSubstitute::debug () const { 
    std::ostringstream out;
    out << "ArgumentSubstitute[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentSubstitute::debug

  Variable& ArgumentSubstitute::getVariable() { 
    return myVariable; 
  } 

  const unsigned int ArgumentSubstitute::getPosition() const {
    return myPosition; 
  }

} 
