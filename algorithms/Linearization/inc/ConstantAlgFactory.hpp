#ifndef _XAIFBOOSTERLINEARIZATION_CONSTANTALGFACTORY_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_CONSTANTALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/ConstantAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AlgFactoryManager.hpp"

namespace xaifBoosterLinearization {  

  DERIVED_ALG_FACTORY_DECL_MACRO(Constant,xaifBooster::ConstantAlgBase,xaifBooster::ConstantAlgFactory);

} // end of namespace 

#endif
