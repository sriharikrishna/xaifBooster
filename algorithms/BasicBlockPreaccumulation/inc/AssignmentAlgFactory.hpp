#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ASSIGNMENTALGFACTORY_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_ASSIGNMENTALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {  

  DERIVED_ALG_FACTORY_DECL_MACRO(Assignment,xaifBooster::AssignmentAlgBase,xaifBoosterLinearization::AssignmentAlgFactory);

} // end of namespace 

#endif
