#ifndef _BASICBLOCKALGFACTORY_INCLUDE_
#define _BASICBLOCKALGFACTORY_INCLUDE_

#include "system/inc/AlgFactory.hpp"
#include "system/inc/BasicBlockAlgBase.hpp"

namespace xaifBooster {  

  class BasicBlock;

  ALG_FACTORY_DECL_MACRO(BasicBlock,BasicBlockAlgBase,BasicBlockAlgBase);

} // end of namespace 

#endif
