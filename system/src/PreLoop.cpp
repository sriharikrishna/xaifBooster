#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/PreLoop.hpp"
#include "xaifBooster/system/inc/PreLoopAlgFactory.hpp"

namespace xaifBooster { 

  const std::string PreLoop::ourXAIFName("xaif:PreLoop");
  const std::string PreLoop::our_myId_XAIFName("vertex_id");

  PreLoop::PreLoop() {
    myPreLoopAlgBase_p=PreLoopAlgFactory::instance()->makeNewAlg(*this);
  }
 
  PreLoop::~PreLoop() {
    delete myPreLoopAlgBase_p;
  }

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

  PreLoopAlgBase&
  PreLoop::getPreLoopAlgBase() {
    if (!myPreLoopAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("PreLoop::getPreLoopAlgBase: not set");
    return *myPreLoopAlgBase_p;
  }
                                                                                 
  const PreLoopAlgBase&
  PreLoop::getPreLoopAlgBase() const {
    if (!myPreLoopAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("PreLoop::getPreLoopAlgBase: not set");
    return *myPreLoopAlgBase_p;
  }
 

} // end of namespace xaifBooster 
