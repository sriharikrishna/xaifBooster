#include <sstream>
#include "utils/inc/DbgLoggerManager.hpp"
#include "utils/inc/PrintManager.hpp"
#include "system/inc/PlainAssignment.hpp"
#include "system/inc/Variable.hpp"

namespace xaifBooster { 

  const std::string PlainAssignment::our_myLhs_XAIFName("xaif:AssignmentLHS");
  const std::string PlainAssignment::our_myRhs_XAIFName("xaif:AssignmentRHS");
  const std::string PlainAssignment::ourXAIFName("xaif:Assignment");
  const std::string PlainAssignment::our_myId_XAIFName("statement_id");
  const std::string PlainAssignment::our_myActiveFlag_XAIFName("active");

  PlainAssignment::PlainAssignment(bool theActiveFlag) : 
    myActiveFlag(theActiveFlag),
    myPassivationFlag(false) {
  } 

  PlainAssignment::~PlainAssignment() {
  } 

  void PlainAssignment::printXMLHierarchy(std::ostream& os) const {
    printXMLHierarchyImpl(os);
  } 

  void
  PlainAssignment::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId()
       << "\">" 
       << std::endl;
    printXMLHierarchyLHS(os);
    printXMLHierarchyRHS(os);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of PlainAssignment::printXMLHierarchyImpl
  
  void 
  PlainAssignment::printXMLHierarchyLHS(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myLhs_XAIFName;
    if (getLHS().getAliasActivityMapKey().getKind()==AliasActivityMapKey::SET) { 
      os << " "
	 << BaseVariableReference::our_myKey_XAIFName
	 << "=\""
	 << getLHS().getAliasActivityMapKey().getKey()
	 << "\"";
    }
    os << " " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myActiveFlag
       << "\""
       << " "
       << BaseVariableReference::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << getLHS().getDerivFlag()
       << "\""
       << ">" 
       << std::endl;
    getLHS().printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << our_myLhs_XAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of PlainAssignment::printXMLHierarchyLHS

  void 
  PlainAssignment::printXMLHierarchyRHS(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myRhs_XAIFName
       << ">"
       << std::endl;
    getRHS().printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << our_myRhs_XAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of PlainAssignment::printXMLHierarchyRHS

  std::string PlainAssignment::debug () const { 
    std::ostringstream out;
    out << "PlainAssignment[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of PlainAssignment::debug

  void PlainAssignment::passivate() { 
    if (myActiveFlag)
      myPassivationFlag=true;
    myActiveFlag=false;
  }

  bool PlainAssignment::isActive() const { 
    return myActiveFlag;
  }  

  bool PlainAssignment::isPassivated() const { 
    return myPassivationFlag;
  }  

} // end of namespace xaifBooster 
