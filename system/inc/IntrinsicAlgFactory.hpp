#ifndef _EXPRESSIONEDGEALGFACTORY_INCLUDE_
#define _EXPRESSIONEDGEALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AlgFactory.hpp"
#include "xaifBooster/system/inc/IntrinsicAlgBase.hpp"

namespace xaifBooster {  

  class Intrinsic;

  ALG_FACTORY_DECL_MACRO(Intrinsic,IntrinsicAlgBase,IntrinsicAlgBase);

} // end of namespace 

#endif