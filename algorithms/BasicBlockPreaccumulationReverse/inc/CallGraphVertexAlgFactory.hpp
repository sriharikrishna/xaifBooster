#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALGFACTORY_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/ControlFlowReversal/inc/CallGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/CallGraphVertexAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationReverse/inc/AlgFactoryManager.hpp"


  DERIVED_ALG_FACTORY_DECL_MACRO(CallGraphVertex,
				 xaifBoosterControlFlowReversal::CallGraphVertexAlgFactory,
				 xaifBoosterBasicBlockPreaccumulationReverse);


#endif
