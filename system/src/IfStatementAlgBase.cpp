#include "xaifBooster/system/inc/IfStatementAlgBase.hpp"
#include "xaifBooster/system/inc/IfStatement.hpp"

namespace xaifBooster {  
  
  IfStatementAlgBase::IfStatementAlgBase(const IfStatement& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  IfStatementAlgBase::~IfStatementAlgBase(){}

} 
