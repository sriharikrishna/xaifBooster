#ifndef _XAIFBOOSTERLINEARIZATION_ASSIGNMENTALGFACTORY_INCLUDE_
#define _XAIFBOOSTERLINEARIZATION_ASSIGNMENTALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AlgFactoryManager.hpp"

namespace xaifBoosterLinearization {  

  DERIVED_ALG_FACTORY_DECL_MACRO(Assignment,xaifBooster::AssignmentAlgBase,xaifBooster::AssignmentAlgFactory);

} // end of namespace 

#endif
