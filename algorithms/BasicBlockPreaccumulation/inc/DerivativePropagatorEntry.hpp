#ifndef _DERIVATIVEPROPAGATORENTRY_INCLUDE_
#define _DERIVATIVEPROPAGATORENTRY_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  class DerivativePropagatorEntry : public XMLPrintable {
  public:

    DerivativePropagatorEntry(){};
    ~DerivativePropagatorEntry(){};

  private:

    /**
     * no def
     */
    DerivativePropagatorEntry (const DerivativePropagatorEntry&);

    /**
     * no def
     */
    DerivativePropagatorEntry operator=(const DerivativePropagatorEntry&);

  }; // end of class DerivativePropagatorEntry
 
} // end of namespace xaifBooster
                                                                     
#endif
