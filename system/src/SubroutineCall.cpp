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

  SubroutineCall::SubroutineCall (const Symbol& theSymbol,
				  const Scope& theScope,
				  const ActiveUseType::ActiveUseType_E activeUse,
				  bool makeAlgorithm) :
    mySymbolReference(theSymbol,theScope),
    myActiveUse(activeUse),
    myActiveUseSetFlag(false){ 
    if (makeAlgorithm)
      myBasicBlockElementAlgBase_p=SubroutineCallAlgFactory::instance()->makeNewAlg(*this); 
  } 

  SubroutineCall::~SubroutineCall() { 
    for (ConcreteArgumentPList::iterator i=myConcreteArgumentPList.begin();
	 i!=myConcreteArgumentPList.end();
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
       << ActiveUseType::our_attribute_XAIFName.c_str() 
       << "=\"" 
       << ActiveUseType::toString(myActiveUse).c_str()
       << "\">" 
       << std::endl;
    for (ConcreteArgumentPList::const_iterator i=myConcreteArgumentPList.begin();
	 i!=myConcreteArgumentPList.end();
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
	<< "myActiveUse"
	<< "="
	<< ActiveUseType::toString(myActiveUse).c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of SubroutineCall::debug

  void SubroutineCall::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getSubroutineCallAlgBase().genericTraversal(anAction_c);
  } 

  SubroutineCall::ConcreteArgumentPList& 
  SubroutineCall::getConcreteArgumentPList() { 
    return myConcreteArgumentPList;
  } 
  
  const SubroutineCall::ConcreteArgumentPList& 
  SubroutineCall::getConcreteArgumentPList() const { 
    return myConcreteArgumentPList;
  } 
  
  const SymbolReference& 
  SubroutineCall::getSymbolReference() const { 
    return mySymbolReference;
  } 

  bool SubroutineCall::getActiveType() const { 
    return mySymbolReference.getSymbol().getActiveTypeFlag();
  }

  bool SubroutineCall::getActiveFlag() const { 
    bool theAnswer(true);
    switch (myActiveUse) {
    case ActiveUseType::ACTIVEUSE: 
      theAnswer=true;
      break;
    case ActiveUseType::PASSIVEUSE:
      theAnswer=false;
      break;
    case ActiveUseType::UNDEFINEDUSE:
      { 
	if (theAnswer=getActiveType())
	  myActiveUse=ActiveUseType::ACTIVEUSE;
	else 
	  myActiveUse=ActiveUseType::PASSIVEUSE;
	myActiveUseSetFlag=true;
	break;
      }
    default: 
      THROW_LOGICEXCEPTION_MACRO("SubroutineCall::getActiveFlag: unknown value of myActiveUse:"
				 << myActiveUse);
      break;
    }
    return theAnswer;
  } 

  void SubroutineCall::setActiveUse(ActiveUseType::ActiveUseType_E anActiveUse) { 
    if (myActiveUseSetFlag)
      THROW_LOGICEXCEPTION_MACRO("SubroutineCall::setActiveUseType: already set, cannot reset");
    myActiveUse=anActiveUse;
    myActiveUseSetFlag=true;
  } 

  ActiveUseType::ActiveUseType_E SubroutineCall::getActiveUse() const { 
    return myActiveUse;
  } 
  
} // end of namespace xaifBooster 
