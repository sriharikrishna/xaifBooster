#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/CallGraphVertexAlgFactory.hpp"

namespace xaifBooster { 

  CallGraphVertex::CallGraphVertex(const Symbol& theSymbol,
				   const Scope& theScope,
				   const Scope& theCFGScope,
				   const bool activeFlag,
				   bool makeAlgorithm) : 
    myControlFlowGraph(theSymbol, theScope, theCFGScope, activeFlag),
    myCallGraphVertexAlgBase_p(0) { 
    if (makeAlgorithm)
      myCallGraphVertexAlgBase_p=CallGraphVertexAlgFactory::instance()->makeNewAlg(*this); 
  }

  CallGraphVertex::~CallGraphVertex() {
    if (myCallGraphVertexAlgBase_p)
      delete myCallGraphVertexAlgBase_p;
  } 

  const std::string&
  CallGraphVertex::getSubroutineName() const { 
    return myControlFlowGraph.getSymbolReference().getSymbol().getId(); 
  }

  CallGraphVertexAlgBase& 
  CallGraphVertex::getCallGraphVertexAlgBase() const { 
    if (!myCallGraphVertexAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("CallGraphVertex::getCallGraphVertexAlgBase: not set");
    return *myCallGraphVertexAlgBase_p;
  }

  void
  CallGraphVertex::printXMLHierarchy(std::ostream& os) const { 
    if (myCallGraphVertexAlgBase_p
	&& 
	! ConceptuallyStaticInstances::instance()->getPrintVersion()==PrintVersion::SYSTEM_ONLY)
      getCallGraphVertexAlgBase().printXMLHierarchy(os);
    else 
      myControlFlowGraph.printXMLHierarchy(os);
  } // end of CallGraphVertex::printXMLHierarchy

  void
  CallGraphVertex::printXMLHierarchyImpl(std::ostream& os) const { 
    myControlFlowGraph.printXMLHierarchy(os);
  } // end of CallGraphVertex::printXMLHierarchyImpl

  std::string CallGraphVertex::debug () const { 
    std::ostringstream out;
    out << "CallGraphVertex[" << this 
	<< Vertex::debug()
	<< ",myControlFlowGraph=" << myControlFlowGraph.debug()
	<< ","
	<< "myCallGraphVertexAlgBase_p"
	<< "="
	<< myCallGraphVertexAlgBase_p
	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphVertex::debug

  ControlFlowGraph&
  CallGraphVertex::getControlFlowGraph() { 
    return myControlFlowGraph;
  } // end of CallGraphVertex::getControlFlowGraph

  const ControlFlowGraph&
  CallGraphVertex::getControlFlowGraph() const { 
    return myControlFlowGraph;
  } // end of CallGraphVertex::getControlFlowGraph

  void CallGraphVertex::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getCallGraphVertexAlgBase().genericTraversal(anAction_c);
    myControlFlowGraph.genericTraversal(anAction_c);
  } 

} // end of namespace xaifBooster 
