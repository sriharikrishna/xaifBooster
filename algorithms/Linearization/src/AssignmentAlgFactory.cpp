#include "xaifBooster/system/inc/AssignmentAlgBase.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlg.hpp"

namespace xaifBoosterLinearization {  

  ALG_FACTORY_DEF_MACRO(Assignment,xaifBooster::AssignmentAlgBase,AssignmentAlg);

} // end of namespace 
