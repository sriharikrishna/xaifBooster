#include "utils/inc/LogicException.hpp"
#include "utils/inc/PrintManager.hpp"
#include "system/inc/AliasActivity.hpp"

namespace xaifBooster { 

  const std::string AliasActivity::ourXAIFName("xaif:AliasSet");
  const std::string AliasActivity::our_myKey_XAIFName("key");
  const std::string AliasActivity::our_myActiveFlag_XAIFName("active");
  

  std::string AliasActivity::debug() const {
    std::ostringstream out;
    out << "AliasActivity[" << this 
	<< ", myAliasSet=" << myAliasSet.debug().c_str()
	<< ", myActiveFlag=" << myActiveFlag
	<< "]" << std::ends; 
    return out.str();
  }; // end of AliasActivity::debug
  
  void AliasActivity::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << " " 
       << our_myKey_XAIFName
       << "=\""
       << myKey
       << "\" " 
       << our_myActiveFlag_XAIFName.c_str() 
       << "=\"" 
       << myActiveFlag
       << "\">" 
       << std::endl;
    myAliasSet.printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  }; 

  const AliasSet& AliasActivity::getAliasSet() const { 
    return myAliasSet;
  }

  AliasSet& AliasActivity::getAliasSet() { 
    return myAliasSet;
  }

  bool AliasActivity::getActivity() const { 
    return myActiveFlag;
  } // end of AliasActivity::getActivity

} 
