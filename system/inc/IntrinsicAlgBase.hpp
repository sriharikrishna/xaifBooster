#ifndef _INTRINSICALGBASE_INCLUDE_
#define _INTRINSICALGBASE_INCLUDE_

#include "xaifBooster/system/inc/AlgBaseGraphElement.hpp"

namespace xaifBooster {  
  
  class Expression;
  class Intrinsic;
  
  typedef AlgBaseGraphElement<Intrinsic,Expression> IntrinsicAlgBase;

} // end of namespace 

#endif
