#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"

namespace xaifBooster {  

  ALG_FACTORY_DEF_MACRO(Assignment,AssignmentAlgBase,xaifBoosterBasicBlockPreaccumulation::AssignmentAlg);

} // end of namespace 


