#include "xaifBooster/system/inc/EntryAlgBase.hpp"
#include "xaifBooster/system/inc/Entry.hpp"

namespace xaifBooster {  
  
  EntryAlgBase::EntryAlgBase(const Entry& theContaining) : 
    ControlFlowGraphVertexAlgBase(theContaining) { 
  }

  EntryAlgBase::~EntryAlgBase(){}

} 
