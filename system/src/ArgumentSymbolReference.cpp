#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReference.hpp"

namespace xaifBooster { 

  const std::string ArgumentSymbolReference::ourXAIFName("xaif:ArgumentSymbolReference");
  const std::string ArgumentSymbolReference::our_myPosition_XAIFName("position");
  const std::string ArgumentSymbolReference::our_symbolId_XAIFName("symbol_id");
  const std::string ArgumentSymbolReference::our_scopeId_XAIFName("scope_id");
  const std::string ArgumentSymbolReference::our_myActiveFlag_XAIFName("active");
  const std::string ArgumentSymbolReference::our_myIntent_XAIFName("intent");

  ArgumentSymbolReference::ArgumentSymbolReference (const Symbol& theSymbol,
						    const Scope& theScope,
						    unsigned int thePosition,
						    bool theActiveFlag,
						    IntentType::IntentType_E theIntent) :
    SymbolReference(theSymbol,theScope),
    myPosition(thePosition),
    myActiveFlag(theActiveFlag),
    myIntent(theIntent) {
  }

  void ArgumentSymbolReference::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName.c_str() 
       << " "
       << our_myPosition_XAIFName.c_str()
       << "=\""
       << myPosition
       << "\" " 
       << our_symbolId_XAIFName.c_str()
       << "=\"" 
       << mySymbol_r.getId().c_str()
       << "\" " 
       << our_scopeId_XAIFName.c_str() 
       << "=\"" 
       << myScope_r.getId().c_str()
       << "\" " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myActiveFlag
       << "\" " 
       << our_myIntent_XAIFName.c_str() 
       << "=\"" 
       << IntentType::toString(myIntent).c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end if ArgumentSymbolReference::printXMLHierarchy
  
  std::string ArgumentSymbolReference::debug () const { 
    std::ostringstream out;
    out << "ArgumentSymbolReference[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of ArgumentSymbolReference::debug

} // end of namespace xaifBooster 
