#include "utils/inc/LogicException.hpp"
#include "system/inc/InlinableIntrinsicsConstant.hpp"
#include "system/inc/Constant.hpp"

namespace xaifBooster { 

  const std::string InlinableIntrinsicsConstant::ourXAIFName("xaif:Constant");
  const std::string InlinableIntrinsicsConstant::our_myType_XAIFName("type");
  const std::string InlinableIntrinsicsConstant::our_myValue_XAIFName("value");
  const std::string InlinableIntrinsicsConstant::our_myId_XAIFName("vertex_id");

  ExpressionVertex& 
  InlinableIntrinsicsConstant::createCopyOfMyself() const {
    Constant* aNewConstant_p=new Constant(myType);
    switch(myType) { 
    case SymbolType::INTEGER_STYPE : 
	aNewConstant_p->setint(getint());
	break;
    case SymbolType::REAL_STYPE : 
	aNewConstant_p->setfloat(getfloat());
	break;
    default: 
      THROW_LOGICEXCEPTION_MACRO("InlinableIntrinsicsConstant::createCopyOfMyself: cannot handle " <<
				 SymbolType::toString(myType).c_str());
      break;
    } // end switch
    return *aNewConstant_p;
  } 

} 
