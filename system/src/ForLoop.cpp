#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ForLoop.hpp"

namespace xaifBooster { 

  const std::string ForLoop::ourXAIFName("xaif:ForLoop");

  const std::string ForLoop::our_myId_XAIFName("vertex_id");

  ForLoop::ForLoop() : 
    myInitialization(true),
    myUpdate(true) { 
  } 

  void
  ForLoop::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\">" 
       << std::endl;
    myInitialization.printXMLHierarchy(os);
    myCondition.printXMLHierarchy(os);
    myUpdate.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of ForLoop::printXMLHierarchy

  std::string ForLoop::debug () const { 
    std::ostringstream out;
    out << "ForLoop[" << this 
	<< ControlFlowGraphVertex::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of ForLoop::debug

  Initialization& ForLoop::getInitialization() { 
    return myInitialization;
  } 

  const Initialization& ForLoop::getInitialization() const { 
    return myInitialization;
  } 

  Condition& ForLoop::getCondition() { 
    return myCondition;
  } 

  const Condition& ForLoop::getCondition() const { 
    return myCondition;
  } 

  Update& ForLoop::getUpdate() { 
    return myUpdate;
  } 

  const Update& ForLoop::getUpdate() const { 
    return myUpdate;
  } 

} // end of namespace xaifBooster 
