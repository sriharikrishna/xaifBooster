#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/AliasActivityMap.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

namespace xaifBooster { 

  const std::string Assignment::our_myLHS_XAIFName("xaif:AssignmentLHS");
  const std::string Assignment::our_myRHS_XAIFName("xaif:AssignmentRHS");
  const std::string Assignment::ourXAIFName("xaif:Assignment");
  const std::string Assignment::our_myId_XAIFName("statement_id");
  const std::string Assignment::our_myActiveFlag_XAIFName("active");

  Assignment::Assignment(bool theActiveFlag,
			 bool makeAlgorithm) : 
    myActiveFlag(theActiveFlag) {
    if (makeAlgorithm)
      myAssignmentAlgBase_p=AssignmentAlgFactory::instance()->makeNewAlg(*this); 
  } 

  Assignment::~Assignment() {
    if (myAssignmentAlgBase_p)
      delete myAssignmentAlgBase_p;
  } 

  AssignmentAlgBase& 
  Assignment::getAssignmentAlgBase() const { 
    if (!myAssignmentAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Assignment::getAssignmentAlgBase: not set");
    return *myAssignmentAlgBase_p;
  }

  void
  Assignment::printXMLHierarchy(std::ostream& os) const { 
    getAssignmentAlgBase().printXMLHierarchy(os);
  }

  void
  Assignment::printXMLHierarchyImpl(std::ostream& os) const { 
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
  }

  void 
  Assignment::printXMLHierarchyLHS(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myLHS_XAIFName;
    if (myLHS.getAliasActivityMapKey().getKind()==AliasActivityMapKey::SET) { 
      os << " "
	 << Variable::our_myKey_XAIFName
	 << "=\""
	 << myLHS.getAliasActivityMapKey().getKey()
	 << "\"";
    }
    os << " " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myLHSActiveFlag
       << "\""
       << " "
       << Variable::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << myLHS.getDerivFlag()
       << "\""
       << ">" 
       << std::endl;
    myLHS.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << our_myLHS_XAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Assignment::printXMLHierarchyLHS

  void 
  Assignment::printXMLHierarchyRHS(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myRHS_XAIFName
       << ">"
       << std::endl;
    myRHS.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << our_myRHS_XAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Assignment::printXMLHierarchyRHS

  Variable& 
  Assignment::getLHS() { 
    return myLHS;
  }

  Expression& 
  Assignment::getRHS() {
    return myRHS;
  }

  const Variable& 
  Assignment::getLHS() const { 
    return myLHS;
  }

  const Expression& 
  Assignment::getRHS() const { 
    return myRHS;
  }

  std::string Assignment::debug () const { 
    std::ostringstream out;
    out << "Assignment[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Assignment::debug

  void Assignment::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getAssignmentAlgBase().genericTraversal(anAction_c);
    myRHS.genericTraversal(anAction_c);
    myLHS.genericTraversal(anAction_c);
  } 

  void Assignment::setLHSActiveFlag(bool anActiveFlag) { 
    myLHSActiveFlag=anActiveFlag;
  }

} // end of namespace xaifBooster 
