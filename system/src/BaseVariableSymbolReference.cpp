#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/BaseVariableSymbolReference.hpp"

namespace xaifBooster { 

  const std::string BaseVariableSymbolReference::ourXAIFName("xaif:SymbolReference");

  const std::string BaseVariableSymbolReference::our_scopeId_XAIFName("scope_id");

  const std::string BaseVariableSymbolReference::our_myId_XAIFName("vertex_id");

  BaseVariableSymbolReference::BaseVariableSymbolReference (const Symbol& theSymbol,
							    const Scope& theScope) :
    SymbolReference(theSymbol,theScope){
  }

  BaseVariableReferenceVertex& 
  BaseVariableSymbolReference::createCopyOfMyself() const { 
    BaseVariableSymbolReference* aNewBaseVariableSymbolReference_p=new BaseVariableSymbolReference(mySymbol_r,
												   myScope_r);
    aNewBaseVariableSymbolReference_p->setId(getId());
    return *aNewBaseVariableSymbolReference_p;
  }

  std::string BaseVariableSymbolReference::equivalenceSignature() const { 
    std::ostringstream oss;
    oss << "BaseVariableSymbolReference::" 
	<< &mySymbol_r 
	<< "_" 
	<< mySymbol_r.getId().c_str()
	<< "_"
	<< myScope_r.getId().c_str()
	<< std::ends;
    return std::string(oss.str());
  } 

  void BaseVariableSymbolReference::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName 
       << " "
       << our_myId_XAIFName
       << "=\""
       << getId().c_str()
       << "\" " 
       << Symbol::our_myId_XAIFName
       << "=\"" 
       << mySymbol_r.getId().c_str()
       << "\" " 
       << our_scopeId_XAIFName 
       << "=\"" 
       << myScope_r.getId().c_str()
       << "\"/>" 
       << std::endl; 
    pm.releaseInstance();
  } // end if BaseVariableSymbolReference::printXMLHierarchy
  
  std::string BaseVariableSymbolReference::debug () const { 
    std::ostringstream out;
    out << "BaseVariableSymbolReference[" << this 
	<< " mySymbol=" << mySymbol_r.getId().c_str()
	<< " mySope=" << myScope_r.getId().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of BaseVariableSymbolReference::debug

  bool BaseVariableSymbolReference::isSymbol() const { 
    return true;
  } 

} // end of namespace xaifBooster 
