#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/PostLoop.hpp"

namespace xaifBooster { 

  const std::string PostLoop::ourXAIFName("xaif:PostLoop");

  const std::string PostLoop::our_myId_XAIFName("vertex_id");

  void
  PostLoop::printXMLHierarchy(std::ostream& os) const { 
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
  } // end of PostLoop::printXMLHierarchy

  std::string PostLoop::debug () const { 
    std::ostringstream out;
    out << "PostLoop[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of PostLoop::debug

  Condition& PostLoop::getCondition() { 
    return myCondition;
  } 

  const Condition& PostLoop::getCondition() const { 
    return myCondition;
  } 

} // end of namespace xaifBooster 
