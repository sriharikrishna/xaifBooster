#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/ControlFlowGraphEdge.hpp"
#include "system/inc/ControlFlowGraph.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraphEdge::ourXAIFName("xaif:ControlFlowEdge");
  const std::string ControlFlowGraphEdge::our_myId_XAIFName("edge_id");
  const std::string ControlFlowGraphEdge::our_source_XAIFName("source");
  const std::string ControlFlowGraphEdge::our_target_XAIFName("target");

  void
  ControlFlowGraphEdge::printXMLHierarchy(std::ostream& os,
					  const ControlFlowGraph& theGraph) const { 
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
       << theGraph.getSourceOf(*this).getId().c_str()
       << "\" " 
       << our_target_XAIFName 
       << "=\"" 
       << theGraph.getTargetOf(*this).getId().c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end of ControlFlowGraphEdge::printXMLHierarchy

  std::string ControlFlowGraphEdge::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraphEdge[" << this 
	<< Edge::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraphEdge::debug

} // end of namespace xaifBooster 
