#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"
#include "xaifBooster/system/inc/IfStatementAlgFactory.hpp"

namespace xaifBooster { 

  const std::string IfStatement::ourXAIFName("xaif:If");
  const std::string IfStatement::our_myId_XAIFName("vertex_id");

  IfStatement::IfStatement() {
    myIfStatementAlgBase_p=IfStatementAlgFactory::instance()->makeNewAlg(*this);
  }

  IfStatement::~IfStatement() {
    delete myIfStatementAlgBase_p;
  }


  void
  IfStatement::printXMLHierarchy(std::ostream& os) const { 
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
  } // end of IfStatement::printXMLHierarchy

  std::string IfStatement::debug () const { 
    std::ostringstream out;
    out << "IfStatement[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of IfStatement::debug

  Condition& IfStatement::getCondition() { 
    return myCondition;
  } 

  const Condition& IfStatement::getCondition() const { 
    return myCondition;
  } 

  IfStatementAlgBase&
  IfStatement::getIfStatementAlgBase() {
    if (!myIfStatementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("IfStatement::getIfStatementAlgBase: not set");
    return *myIfStatementAlgBase_p;
  }
                                                                                 
  const IfStatementAlgBase&
  IfStatement::getIfStatementAlgBase() const {
    if (!myIfStatementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("IfStatement::getIfStatementAlgBase: not set");
    return *myIfStatementAlgBase_p;
  }
 

} // end of namespace xaifBooster 
