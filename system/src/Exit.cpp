#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/Exit.hpp"

namespace xaifBooster { 

  const std::string Exit::ourXAIFName("xaif:Exit");

  const std::string Exit::our_myId_XAIFName("vertex_id");

  void
  Exit::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\"/>" 
       << std::endl;
    pm.releaseInstance();
  } // end of Exit::printXMLHierarchy

  std::string Exit::debug () const { 
    std::ostringstream out;
    out << "Exit[" << this 
	<< ControlFlowGraphVertex::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of Exit::debug

} // end of namespace xaifBooster 
