#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"

namespace xaifBooster { 

  const std::string ArgumentList::our_scopeId_XAIFName("scope_id");
  const std::string ArgumentList::ourXAIFName("xaif:ArgumentList");

  ArgumentList::ArgumentList () :
    myScope_p(0) { 
  } 

  ArgumentList::~ArgumentList() { 
    for (ArgumentSymbolReferencePList::iterator i=myArgumentSymbolReferencePList.begin();
	 i!=myArgumentSymbolReferencePList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
  } 

  void
  ArgumentList::printXMLHierarchy(std::ostream& os) const { 
    if (!myArgumentSymbolReferencePList.size()) // nothing to print
      return;
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str()
       << ">" 
       << std::endl;
    for(ArgumentSymbolReferencePList::const_iterator i=myArgumentSymbolReferencePList.begin();
	i!=myArgumentSymbolReferencePList.end();
	++i) { 
      (*i)->printXMLHierarchy(os);
    } // end for 
    os << pm.indent()
       << "</"
       << ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ArgumentList::printXMLHierarchy

  std::string ArgumentList::debug () const { 
    std::ostringstream out;
    out << "ArgumentList[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentList::debug

  ArgumentList::ArgumentSymbolReferencePList& 
  ArgumentList::getArgumentSymbolReferencePList() { 
    return myArgumentSymbolReferencePList;
  } 
  
  const ArgumentList::ArgumentSymbolReferencePList& 
  ArgumentList::getArgumentSymbolReferencePList() const { 
    return myArgumentSymbolReferencePList;
  } 

  Scope& ArgumentList::getScope() const { 
    if (!myScope_p) 
      // trying to set it: 
      if (!myArgumentSymbolReferencePList.empty()) 
	// this const_cast is a hack to be removed once we have a scope algorithm object
	myScope_p=&(const_cast<Scope&>((*(myArgumentSymbolReferencePList.begin()))->getScope()));
    if (!myScope_p) 
      THROW_LOGICEXCEPTION_MACRO("ArgumentList::getScope: not set");
    // this const_cast is a hack to be removed once we have a scope algorithm object
    return const_cast<Scope&>(*myScope_p);
  }

  void ArgumentList::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    for (ArgumentSymbolReferencePList::iterator i=myArgumentSymbolReferencePList.begin();
	 i!=myArgumentSymbolReferencePList.end();
	 ++i) { 
       (*i)->genericTraversal(anAction_c);
    }
  } 

} // end of namespace xaifBooster 
