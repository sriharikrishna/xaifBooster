#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgFactory.hpp"

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
    myControlFlowGraphAlgBase_p=ControlFlowGraphAlgFactory::instance()->makeNewAlg(*this);
  } 

  ControlFlowGraph::~ControlFlowGraph() { 
    for (ArgumentList::iterator i=myArgumentList.begin();
	 i!=myArgumentList.end();
	 ++i) { 
      if (*i)
	delete *i;
    }
    if (myControlFlowGraphAlgBase_p) delete myControlFlowGraphAlgBase_p;
  } 

  void
  ControlFlowGraph::printXMLHierarchy(std::ostream& os) const { 
    if (myControlFlowGraphAlgBase_p)
      getControlFlowGraphAlgBase().printXMLHierarchy(os);
    else
      printXMLHierarchyImpl(os);
  } // end of ControlFlowGraph::printXMLHierarchy

  void
  ControlFlowGraph::printXMLHierarchyImpl(std::ostream& os) const { 
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
  } // end of ControlFlowGraph::printXMLHierarchyImpl

  

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

  InOutList& 
  ControlFlowGraph::getInOutList() { 
    return myInOutList;
  } 
  
  const InOutList& 
  ControlFlowGraph::getInOutList() const { 
    return myInOutList;
  } 

  ControlFlowGraphAlgBase&
  ControlFlowGraph::getControlFlowGraphAlgBase() {
    if (!myControlFlowGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getControlFlowGraphAlgBase: not set");
    return *myControlFlowGraphAlgBase_p;
  }
                                                                                
  const ControlFlowGraphAlgBase&
  ControlFlowGraph::getControlFlowGraphAlgBase() const {
    if (!myControlFlowGraphAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("ControlFlowGraph::getControlFlowGraphAlgBase: not set");
    return *myControlFlowGraphAlgBase_p;
  }

  void ControlFlowGraph::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    getControlFlowGraphAlgBase().genericTraversal(anAction_c);
  }
  
} // end of namespace xaifBooster 
