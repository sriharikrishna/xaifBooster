#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/Scopes.hpp"

namespace xaifBooster { 

  const std::string Scopes::ourXAIFName("xaif:ScopeHierarchy");

  Scopes::Scopes() : myGlobalScope_p(0) {
  } 

  void
  Scopes::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName
       << ">"
       << std::endl;
    Scopes::ConstVertexIteratorPair p(vertices());
    Scopes::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    Scopes::ConstEdgeIteratorPair pe=edges();
    Scopes::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte) 
      (*beginIte).printXMLHierarchy(os,*this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of Scopes::printXMLHierarchy

  std::string Scopes::debug () const { 
    std::ostringstream out;
    out << "Scopes[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of Scopes::debug

  Scope& 
  Scopes::getGlobalScope() { 
    if (!myGlobalScope_p) 
      findGlobalScope();
    return *myGlobalScope_p;
  } 

  const Scope& 
  Scopes::getGlobalScope() const { 
    if (!myGlobalScope_p) 
      const_cast<Scopes*>(this)->findGlobalScope();
    return *myGlobalScope_p;
  } 

  void
  Scopes::findGlobalScope() { 
    if (myGlobalScope_p) 
      THROW_LOGICEXCEPTION_MACRO("Scopes::findGlobalScope: already found");
    VertexIteratorPair p=vertices();
    VertexIterator beginIt(p.first),endIt(p.second);
    for (; beginIt!=endIt ;++beginIt) { 
      if (!numOutEdgesOf(*beginIt)) { 
	myGlobalScope_p=&(*beginIt);
	  break;
      }
    } // end for 
    if (beginIt==endIt)
      THROW_LOGICEXCEPTION_MACRO("Scopes::findGlobalScope: cannot find the root of the scope tree");
  } 

  Scope& 
  Scopes::getScopeById(const std::string& theScopeId) { 
    VertexIteratorPair p=vertices();
    VertexIterator beginIt(p.first),endIt(p.second);
    for (; beginIt!=endIt ;++beginIt) { 
      if ((*(beginIt)).getId()==theScopeId)
	break;
    } // end for 
    if (beginIt==endIt)
      THROW_LOGICEXCEPTION_MACRO("Scopes::getScopeById: scope id >" 
				 << theScopeId.c_str()
				 << "< not found");
    return *(beginIt);
  } 

  const Scope& 
  Scopes::getScopeById(const std::string& theScopeId) const { 
    ConstVertexIteratorPair p=vertices();
    ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (; beginIt!=endIt ;++beginIt) { 
      if ((*(beginIt)).getId()==theScopeId)
	break;
    } // end for 
    if (beginIt==endIt)
      THROW_LOGICEXCEPTION_MACRO("Scopes::getScopeById: scope id >" 
				 << theScopeId.c_str()
				 << "< not found");
    return *(beginIt);
  } 

} // end of namespace xaifBooster 
