#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALGFACTORY_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONTAPEADJOINT_BASICBLOCKALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/AlgFactoryManager.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  DERIVED_ALG_FACTORY_DECL_MACRO(BasicBlock,xaifBooster::BasicBlockAlgBase,xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlgFactory);

} // end of namespace 

#endif
