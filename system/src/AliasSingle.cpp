#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/AliasSingle.hpp"

namespace xaifBooster { 
  
  const std::string AliasSingle::ourXAIFName("xaif:Alias");
  
  const std::string AliasSingle::our_myAddress_XAIFName("virtual_address");

  std::string AliasSingle::debug() const {
    std::ostringstream out;
    out << "AliasSingle[" << this 
	<< ", myAddress=" << myAddress
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasSingle::debug
  
  void AliasSingle::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << " " 
       << our_myAddress_XAIFName
       << "=\""
       << myAddress
       << "\"/>" 
       << std::endl;
    pm.releaseInstance();
  } 


  unsigned int AliasSingle::max() const { 
    return myAddress;
  }

  unsigned int AliasSingle::min() const {
    return myAddress;
  }

  void AliasSingle::max(unsigned int) { 
    THROW_LOGICEXCEPTION_MACRO("AliasSingle::max: not permitted");
  }

  void AliasSingle::min(unsigned int) {
    THROW_LOGICEXCEPTION_MACRO("AliasSingle::min: not permitted");
  }

}
