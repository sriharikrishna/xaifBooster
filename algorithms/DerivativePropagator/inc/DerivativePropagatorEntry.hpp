#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATORENTRY_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATORENTRY_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 
  class Variable; 
}

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  class DerivativePropagatorEntry : public XMLPrintable {
  public:

    DerivativePropagatorEntry(){};
    ~DerivativePropagatorEntry(){};

    typedef std::list<const Variable*> VariablePList;

    /**
     * the Variable pointers returned in the VariablePList 
     * are owned by the DerivativePropagatorSaxpy
     * and are therefore not to be deleted by the caller
     */
    virtual void getVariables(VariablePList& theVariablePList) const ; 

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
 
} // end of namespace
                                                                     
#endif
