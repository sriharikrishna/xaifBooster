#ifndef _BASICBLOCKALGPARAMETER_INCLUDE_
#define _BASICBLOCKALGPARAMETER_INCLUDE_

#include "xaifBooster/utils/inc/SingletonParameterPerThread.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterAngelInterfaceAlgorithms {  
  
  typedef SingletonParameterPerThread<BasicBlockAlg> BasicBlockAlgParameter;

} // end of namespace 

#endif
