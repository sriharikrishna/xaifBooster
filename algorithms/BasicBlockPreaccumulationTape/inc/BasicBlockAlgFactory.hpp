#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALGFACTORY_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPE_BASICBLOCKALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  DERIVED_ALG_FACTORY_DECL_MACRO(BasicBlock,xaifBooster::BasicBlockAlgBase,xaifBoosterBasicBlockPreaccumulation::BasicBlockAlgFactory);

} // end of namespace 

#endif