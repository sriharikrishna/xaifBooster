#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {  

  ALG_FACTORY_DEF_MACRO(Assignment,xaifBooster::AssignmentAlgBase,AssignmentAlg);

} // end of namespace 


