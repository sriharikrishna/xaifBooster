#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphEdge.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraphEdge::ourXAIFName("xaif:ControlFlowEdge");
  const std::string ControlFlowGraphEdge::our_myId_XAIFName("edge_id");
  const std::string ControlFlowGraphEdge::our_source_XAIFName("source");
  const std::string ControlFlowGraphEdge::our_target_XAIFName("target");
  const std::string ControlFlowGraphEdge::our_has_condition_value_XAIFName("has_condition_value");
  const std::string ControlFlowGraphEdge::our_condition_value_XAIFName("condition_value");

  bool ControlFlowGraphEdge::has_condition_value() const {
    return my_has_condition_value;
  }
  void ControlFlowGraphEdge::set_has_condition_value(bool hcv) {
    my_has_condition_value=hcv;
  }
                                                                                
  void ControlFlowGraphEdge::set_condition_value(int cv) {
    my_condition_value=cv;
  }
  const int& ControlFlowGraphEdge::get_condition_value() const {
    return my_condition_value;
  }

  void
  ControlFlowGraphEdge::printXMLHierarchy(std::ostream& os,
					  const ControlFlowGraphBase& theGraph) const { 
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
       << "\" " 
       << our_has_condition_value_XAIFName 
       << "=\"" 
       << has_condition_value()
       << "\" " 
       << our_condition_value_XAIFName 
       << "=\"" 
       << get_condition_value()
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
