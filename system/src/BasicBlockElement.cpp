#include <sstream>
#include "utils/inc/PrintManager.hpp"
#include "system/inc/BasicBlockElement.hpp"

namespace xaifBooster { 

  std::string BasicBlockElement::debug () const { 
    std::ostringstream out;
    out << "BasicBlockElement[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockElement::debug

} // end of namespace xaifBooster 
