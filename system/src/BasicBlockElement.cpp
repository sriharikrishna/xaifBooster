#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"

namespace xaifBooster { 

  BasicBlockElement::BasicBlockElement() : 
    myBasicBlockElementAlgBase_p(0)  {} 

  BasicBlockElement::~BasicBlockElement(){
    if (myBasicBlockElementAlgBase_p) delete myBasicBlockElementAlgBase_p;
  };
  
  BasicBlockElementAlgBase&
  BasicBlockElement::getBasicBlockElementAlgBase() const {
    if (!myBasicBlockElementAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockElement::getBasicBlockElementAlgBase: not set");
    return *myBasicBlockElementAlgBase_p;
  } // end getBasicBlockElementAlgBase

  std::string BasicBlockElement::debug () const { 
    std::ostringstream out;
    out << "BasicBlockElement[" 
	<< this 
	<< ObjectWithId::debug().c_str()
	<< "myBasicBlockElementAlgBase_p"
	<< "="
	<< myBasicBlockElementAlgBase_p
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockElement::debug

} // end of namespace xaifBooster 
