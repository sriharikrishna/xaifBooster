#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphCommonAttributes.hpp"

namespace xaifBooster { 

  const std::string ControlFlowGraphCommonAttributes::our_symbolId_XAIFName("symbol_id");
  const std::string ControlFlowGraphCommonAttributes::our_scopeId_XAIFName("scope_id");
  const std::string ControlFlowGraphCommonAttributes::our_myId_XAIFName("vertex_id");

  ControlFlowGraphCommonAttributes::ControlFlowGraphCommonAttributes (const Symbol& theSymbol,
								      const Scope& theScope) :
    mySymbolReference(theSymbol,theScope) { 
  } 

  ControlFlowGraphCommonAttributes::~ControlFlowGraphCommonAttributes() { 
  } 

  void
  ControlFlowGraphCommonAttributes::printAttributes(std::ostream& os) const { 
    os << our_myId_XAIFName.c_str() 
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
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getAnnotation().c_str()
       << "\""; 
  } // end of ControlFlowGraphCommonAttributes::printXMLHierarchyImpl

  std::string ControlFlowGraphCommonAttributes::debug () const { 
    std::ostringstream out;
    out << "ControlFlowGraphCommonAttributes[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ControlFlowGraphCommonAttributes::debug

  const SymbolReference& 
  ControlFlowGraphCommonAttributes::getSymbolReference() const { 
    return mySymbolReference;
  } 

} // end of namespace xaifBooster 
