#include "xaifBooster/utils/inc/NameCreator.hpp"
#include <sstream>

namespace xaifBooster { 
  
  NameCreator::NameCreator(const std::string& aBaseName) : 
    myCounter(0),
    myBaseName(aBaseName) {
  }

  std::string 
  NameCreator::makeName() { 
    std::ostringstream oss;
    oss << myBaseName.c_str() << "_" << myCounter++ << std::ends;
    return (oss.str());
  } 
  
} 
