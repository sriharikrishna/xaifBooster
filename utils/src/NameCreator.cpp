#include "xaifBooster/utils/inc/NameCreator.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include <sstream>

namespace xaifBooster { 
  
  NameCreator::NameCreator() : 
    myCounter(0) {
  }

  std::string 
  NameCreator::makeName() const { 
    if (!myBaseName.length())
      THROW_LOGICEXCEPTION_MACRO("NameCreator::makeName: not initialized");
    std::ostringstream oss;
    oss << myBaseName.c_str() << "_" << myCounter++ << std::ends;
    return (oss.str());
  } 
  
  void NameCreator::setBaseName(const std::string& aBaseName) { 
    if (myBaseName.length())
      THROW_LOGICEXCEPTION_MACRO("NameCreator::setBaseName: already set");
    myBaseName=aBaseName;
  } 

} 
