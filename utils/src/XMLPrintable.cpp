#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include <iostream>

namespace xaifBooster { 
  
  void
  XMLPrintable::dumpAsXML()  const { 
    printXMLHierarchy(std::cout);
  } 
  
} 
