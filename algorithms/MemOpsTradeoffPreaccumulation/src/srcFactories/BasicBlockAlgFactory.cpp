#include "xaifBooster/system/inc/BasicBlockAlgFactory.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"

namespace xaifBooster {  

  ALG_FACTORY_DEF_MACRO(BasicBlock,BasicBlockAlgBase,xaifBoosterMemOpsTradeoffPreaccumulation::BasicBlockAlg);

} // end of namespace 


