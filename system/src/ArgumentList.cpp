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

  void ArgumentList::setScope(Scope& aScope) { 
    if (myScope_p)
      THROW_LOGICEXCEPTION_MACRO("ArgumentList::setScope: cannot reset");
    myScope_p=&aScope;
  } 

  Scope& ArgumentList::getScope() const { 
    return *myScope_p;
  }

/* UN: want this later on
  Scope& ArgumentList::getScope() { 
    return *myScope_p;
  }

  const Scope& ArgumentList::getScope() const { 
    return *myScope_p;
  }
*/

} // end of namespace xaifBooster 
