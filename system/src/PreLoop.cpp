#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/PreLoop.hpp"

namespace xaifBooster { 

  const std::string PreLoop::ourXAIFName("xaif:PreLoop");
  const std::string PreLoop::our_myId_XAIFName("vertex_id");

  void
  PreLoop::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\">" 
       << std::endl;
    myCondition.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of PreLoop::printXMLHierarchy

  std::string PreLoop::debug () const { 
    std::ostringstream out;
    out << "PreLoop[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of PreLoop::debug

  Condition& PreLoop::getCondition() { 
    return myCondition;
  } 

  const Condition& PreLoop::getCondition() const { 
    return myCondition;
  } 

} // end of namespace xaifBooster 
