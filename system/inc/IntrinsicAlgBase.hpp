#ifndef _INTRINSICALGBASE_INCLUDE_
#define _INTRINSICALGBASE_INCLUDE_

#include "system/inc/AlgBaseGraphElement.hpp"

namespace xaifBooster {  
  
  class Expression;
  class Intrinsic;
  
  typedef AlgBaseGraphElement<Intrinsic,Expression> IntrinsicAlgBase;

} // end of namespace 

#endif
