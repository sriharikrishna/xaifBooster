#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/CallGraphEdge.hpp"
#include "system/inc/CallGraph.hpp"

namespace xaifBooster { 

  const std::string CallGraphEdge::ourXAIFName("xaif:CallGraphEdge");
  const std::string CallGraphEdge::our_myId_XAIFName("edge_id");
  const std::string CallGraphEdge::our_source_XAIFName("source");
  const std::string CallGraphEdge::our_target_XAIFName("target");

  void
  CallGraphEdge::printXMLHierarchy(std::ostream& os,
				   const CallGraph& theGraph) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName 
       << " " 
       << our_myId_XAIFName 
       << "=\"" 
       << getId().c_str()
       << "\" " 
       << our_source_XAIFName 
       << "=\"" 
       << theGraph.getSourceOf(*this).getControlFlowGraph().getId().c_str()
       << "\" " 
       << our_target_XAIFName 
       << "=\"" 
       << theGraph.getTargetOf(*this).getControlFlowGraph().getId().c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end of CallGraphEdge::printXMLHierarchy

  std::string CallGraphEdge::debug () const { 
    std::ostringstream out;
    out << "CallGraphEdge[" << this 
	<< Edge::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of CallGraphEdge::debug

} // end of namespace xaifBooster 
