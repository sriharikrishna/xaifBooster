#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  ControlFlowGraphVertexAlg::ControlFlowGraphVertexAlg(ControlFlowGraphVertex& theContaining) : ControlFlowGraphVertexAlgBase(theContaining) {}
  ControlFlowGraphVertexAlg::~ControlFlowGraphVertexAlg() {}

  std::string
  ControlFlowGraphVertexAlg::kindToString() const {
    switch(getKind()) {
      case ENTRY : { return std::string("ENTRY"); }
      case EXIT : { return std::string("EXIT"); }
      case BASICBLOCK : { return std::string("BASICBLOCK"); }
      case ENDBRANCH : { return std::string("ENDBRANCH"); }
      case ENDLOOP : { return std::string("ENDLOOP"); }
      case IF : { return std::string("IF"); }
      case PRELOOP : { return std::string("PRELOOP"); }
      case FORLOOP : { return std::string("FORLOOP"); }
      default : { break; }
    }
    return std::string("UNDEF"); 
  }

} // end of namespace

