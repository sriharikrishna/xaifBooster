#include "xaifBooster/utils/inc/PrintManager.hpp"

namespace xaifBooster { 

  PrintManager* PrintManager::ourPrintManagerInstance_p;
  const unsigned int PrintManager::ourDefaultIndentation=2;
  
  PrintManager&
  PrintManager::getInstance() { 
    if (!ourPrintManagerInstance_p)
      ourPrintManagerInstance_p=new PrintManager();
    ourPrintManagerInstance_p->my_indentation+=ourDefaultIndentation;
    return *ourPrintManagerInstance_p;
  } // end of PrintManager::getInstance

  PrintManager::PrintManager() :
    my_indentation(0){
  }
  
  void PrintManager::releaseInstance() { 
    my_indentation-=ourDefaultIndentation;
  } // end of PrintManager::releaseInstance

  std::string 
  PrintManager::indent() { 
    return std::string(my_indentation,' ');
  } // end of indent

  std::string 
  PrintManager::indent(unsigned int additionalIndent) { 
    return std::string(my_indentation+additionalIndent,' ');
  } // end of indent

} // end of namespace 
