#ifndef _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALGFACTORY_INCLUDE_
#define _XAIFBOOSTERMEMOPSTRADEOFFPREACCUMULATION_BASICBLOCKALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/AlgFactoryManager.hpp"

namespace xaifBoosterMemOpsTradeoffPreaccumulation {  

  DERIVED_ALG_FACTORY_DECL_MACRO(BasicBlock,xaifBooster::BasicBlockAlgBase,xaifBoosterBasicBlockPreaccumulation::BasicBlockAlgFactory);

} // end of namespace 

#endif
