#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_BASICBLOCKALGFACTORY_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_BASICBLOCKALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgFactoryManager.hpp"


  DERIVED_ALG_FACTORY_DECL_MACRO(BasicBlock,
				 xaifBoosterControlFlowReversal::BasicBlockAlgFactory,
				 xaifBoosterBasicBlockPreaccumulationReverse)


#endif
