#ifndef _LABELALGFACTORY_INCLUDE_
#define _LABELALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AlgFactory.hpp"
#include "xaifBooster/system/inc/LabelAlgBase.hpp"

namespace xaifBooster {  

  class Label;

  BASE_ALG_FACTORY_DECL_MACRO(Label,LabelAlgBase);

} // end of namespace 

#endif