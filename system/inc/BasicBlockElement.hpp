#ifndef _BASICBLOCKELEMENT_INCLUDE_
#define _BASICBLOCKELEMENT_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"

namespace xaifBooster { 

  /**
   * base class for elements found in a Basic Block
   */
  class BasicBlockElement : public XMLPrintable,
			    public ObjectWithId,
			    public GenericTraverseInvoke {
  public:
    
    BasicBlockElement (){};

    ~BasicBlockElement(){};

    std::string debug() const ;

  }; // end of class BasicBlockElement
 
} // end of namespace xaifBooster
                                                                     
#endif

