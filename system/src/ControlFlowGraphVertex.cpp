#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster { 

  void
  ControlFlowGraphVertex::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() << "WHATEVER" << std::endl;
    pm.releaseInstance();
  } // end of ControlFlowGraphVertex::printXMLHierarchy

  std::string ControlFlowGraphVertex::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraphVertex[" << this 
	<< Vertex::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraphVertex::debug

} // end of namespace xaifBooster 
