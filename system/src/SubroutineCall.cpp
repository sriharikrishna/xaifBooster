#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/SubroutineCallAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  const std::string SubroutineCall::ourXAIFName("xaif:SubroutineCall");
  const std::string SubroutineCall::our_myId_XAIFName("statement_id");
  const std::string SubroutineCall::our_symbolId_XAIFName("symbol_id");
  const std::string SubroutineCall::our_scopeId_XAIFName("scope_id");
  const std::string SubroutineCall::our_myActiveFlag_XAIFName("active");

  SubroutineCall::SubroutineCall (const Symbol& theSymbol,
				  const Scope& theScope,
				  const bool activeFlag,
				  bool makeAlgorithm) :
    mySymbolReference(theSymbol,theScope),
    myActiveFlag(activeFlag) { 
    if (makeAlgorithm)
      myBasicBlockElementAlgBase_p=SubroutineCallAlgFactory::instance()->makeNewAlg(*this); 
  } 

  SubroutineCall::~SubroutineCall() { 
    for (ArgumentList::iterator i=myArgumentList.begin();
	 i!=myArgumentList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
  } 

  SubroutineCallAlgBase& 
  SubroutineCall::getSubroutineCallAlgBase() const { 
    if (!myBasicBlockElementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("SubroutineCall::getSubroutineCallAlgBase: not set");
    return dynamic_cast<SubroutineCallAlgBase&>(*myBasicBlockElementAlgBase_p);
  }

  void
  SubroutineCall::printXMLHierarchy(std::ostream& os) const { 
    if (myBasicBlockElementAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getSubroutineCallAlgBase().printXMLHierarchy(os);
    else 
      printXMLHierarchyImpl(os);
  }

  void
  SubroutineCall::printXMLHierarchyImpl(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " " 
       << our_myId_XAIFName.c_str() 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_symbolId_XAIFName.c_str() 
       << "=\"" 
       << mySymbolReference.getSymbol().getId().c_str()
       << "\" " 
       << our_scopeId_XAIFName.c_str() 
       << "=\"" 
       << mySymbolReference.getScope().getId().c_str()
       << "\" " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myActiveFlag
       << "\">" 
       << std::endl;
    for (ArgumentList::const_iterator i=myArgumentList.begin();
	 i!=myArgumentList.end();
	 ++i)
      (*i)->printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } 

  std::string SubroutineCall::debug () const { 
    std::ostringstream out;
    out << "SubroutineCall[" 
	<< this 
	<< BasicBlockElement::debug().c_str()
	<< "myActiveFlag"
	<< "="
	<< myActiveFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of SubroutineCall::debug

  void SubroutineCall::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getSubroutineCallAlgBase().genericTraversal(anAction_c);
  } 

  SubroutineCall::ArgumentList& 
  SubroutineCall::getArgumentList() { 
    return myArgumentList;
  } 
  
  const SubroutineCall::ArgumentList& 
  SubroutineCall::getArgumentList() const { 
    return myArgumentList;
  } 
  
} // end of namespace xaifBooster 
