#ifndef _BASICBLOCKALGPARAMETER_INCLUDE_
#define _BASICBLOCKALGPARAMETER_INCLUDE_

#include "xaifBooster/utils/inc/SingletonParameterPerThread.hpp"
#include "xaifBooster/utils/inc/TemplateImpl/SingletonParameterPerThread.cpp"

#include "xaifBooster/system/inc/BasicBlockAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterAngelInterfaceAlgorithms {  

  template class SingletonParameterPerThread<BasicBlockAlg>;

} // end of namespace 

#endif
