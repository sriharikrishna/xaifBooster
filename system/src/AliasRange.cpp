#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/AliasRange.hpp"

namespace xaifBooster { 
  
  const std::string AliasRange::ourXAIFName("xaif:AliasRange");
  
  const std::string AliasRange::our_myLowerAddress_XAIFName("from_virtual_address");
  const std::string AliasRange::our_myUpperAddress_XAIFName("to_virtual_address");

  AliasRange::AliasRange(unsigned int lower,
			 unsigned int upper): 
    myLowerAddress(lower),
    myUpperAddress(upper) {
    // JU: fix this, don't like excception in ctor
    if (lower>upper)
      THROW_LOGICEXCEPTION_MACRO("AliasRange::AliasRange: lower larger than upper");
  } 
 
  std::string AliasRange::debug() const {
    std::ostringstream out;
    out << "AliasRange[" << this 
	<< ", myLowerAddress=" << myLowerAddress
	<< ", myUpperAddress=" << myUpperAddress
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasRange::debug
  
  void AliasRange::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << " " 
       << our_myLowerAddress_XAIFName
       << "=\""
       << myLowerAddress
       << "\" " 
       << our_myUpperAddress_XAIFName
       << "=\""
       << myUpperAddress
       << "\"/>" 
       << std::endl;
    pm.releaseInstance();
  } 


  unsigned int AliasRange::max() const { 
    return myUpperAddress;
  }

  unsigned int AliasRange::min() const {
    return myLowerAddress;
  }

  void AliasRange::max(unsigned int newUpper) { 
    if (newUpper<myUpperAddress)
      THROW_LOGICEXCEPTION_MACRO("AliasRange::max: lowering of max not permitted");
    myUpperAddress=newUpper;
  }

  void AliasRange::min(unsigned int newLower) {
    if (newLower>myLowerAddress)
      THROW_LOGICEXCEPTION_MACRO("AliasRange::min: raising of min not permitted");
    myLowerAddress=newLower;
  }

}
