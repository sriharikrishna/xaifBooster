#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"

namespace xaifBooster { 

  CallGraphVertex::CallGraphVertex(const Symbol& theSymbol,
				   const Scope& theScope,
				   const bool activeFlag) : 
    myControlFlowGraph(theSymbol, theScope, activeFlag) { 
  }

  void
  CallGraphVertex::printXMLHierarchy(std::ostream& os) const { 
    myControlFlowGraph.printXMLHierarchy(os);
  } // end of CallGraphVertex::printXMLHierarchy

  std::string CallGraphVertex::debug () const { 
    std::ostringstream out;
    out << "CallGraphVertex[" << this 
	<< Vertex::debug()
	<< ",myControlFlowGraph=" << myControlFlowGraph.debug()
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
    myControlFlowGraph.genericTraversal(anAction_c);
  } 

} // end of namespace xaifBooster 
