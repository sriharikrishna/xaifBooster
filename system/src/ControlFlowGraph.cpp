#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/ControlFlowGraph.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraph::ourXAIFName("xaif:ControlFlowGraph");
  const std::string ControlFlowGraph::our_myId_XAIFName("vertex_id");
  const std::string ControlFlowGraph::our_symbolId_XAIFName("symbol_id");
  const std::string ControlFlowGraph::our_scopeId_XAIFName("scope_id");
  const std::string ControlFlowGraph::our_myActiveFlag_XAIFName("active");
  const std::string ControlFlowGraph::our_myArgumentList_XAIFName("xaif:ArgumentList");

  ControlFlowGraph::ControlFlowGraph (const Symbol& theSymbol,
				      const Scope& theScope,
				      const bool activeFlag) :
    mySymbolReference(theSymbol,theScope),
    myActiveFlag(activeFlag) { 
  } 

  ControlFlowGraph::~ControlFlowGraph() { 
    for (ArgumentList::iterator i=myArgumentList.begin();
	 i!=myArgumentList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
  } 

  void
  ControlFlowGraph::printXMLHierarchy(std::ostream& os) const { 
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
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\">" 
       << std::endl;
    printXMLHierarchyArgumentList(os);
    ControlFlowGraph::ConstVertexIteratorPair p(vertices());
    ControlFlowGraph::ConstVertexIterator beginIt(p.first),endIt(p.second);
    for (;beginIt!=endIt ;++beginIt)
      (*beginIt).printXMLHierarchy(os);
    ControlFlowGraph::ConstEdgeIteratorPair pe=edges();
    ControlFlowGraph::ConstEdgeIterator beginIte(pe.first),endIte(pe.second);
    for (;beginIte!=endIte ;++beginIte)
      (*beginIte).printXMLHierarchy(os,
				    *this);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ControlFlowGraph::printXMLHierarchy

  void
  ControlFlowGraph::printXMLHierarchyArgumentList(std::ostream& os) const { 
    if (!myArgumentList.size()) // nothing to print
      return;
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << our_myArgumentList_XAIFName.c_str()
       << ">" 
       << std::endl;
    for(ArgumentList::const_iterator i=myArgumentList.begin();
	i!=myArgumentList.end();
	++i) { 
      (*i)->printXMLHierarchy(os);
    } // end for 
    os << pm.indent()
       << "</"
       << our_myArgumentList_XAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of ControlFlowGraph::printXMLHierarchyArgumentList

  std::string ControlFlowGraph::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraph[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraph::debug

  ControlFlowGraph::ArgumentList& 
  ControlFlowGraph::getArgumentList() { 
    return myArgumentList;
  } 
  
  const ControlFlowGraph::ArgumentList& 
  ControlFlowGraph::getArgumentList() const { 
    return myArgumentList;
  } 
  
} // end of namespace xaifBooster 
