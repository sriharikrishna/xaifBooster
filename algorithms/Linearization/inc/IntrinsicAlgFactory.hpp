#ifndef _XAIFBOOSTERLINEARIZATION_INTRINSICALGFACTORY_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_INTRINSICALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/IntrinsicAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AlgFactoryManager.hpp"

namespace xaifBoosterLinearization {  

  DERIVED_ALG_FACTORY_DECL_MACRO(Intrinsic,xaifBooster::IntrinsicAlgBase,xaifBooster::IntrinsicAlgFactory);

} // end of namespace 

#endif