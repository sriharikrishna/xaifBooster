#ifndef _DERIVATIVEPROPAGATORZERODERIV_INCLUDE_
#define _DERIVATIVEPROPAGATORZERODERIV_INCLUDE_

#include "system/inc/DerivativePropagatorEntry.hpp"
#include "system/inc/BaseVariableReference.hpp"

namespace xaifBooster { 

  /**
   * an active BaseVariableReference
   * whose deriv component is to be set to zero
   */

  class DerivativePropagatorZeroDeriv : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorZeroDeriv(const BaseVariableReference& theTarget);

    ~DerivativePropagatorZeroDeriv(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

  private:

    /**
     * no def
     */
    DerivativePropagatorZeroDeriv ();

    /**
     * no def
     */
    DerivativePropagatorZeroDeriv (const DerivativePropagatorZeroDeriv&);

    /**
     * no def
     */
    DerivativePropagatorZeroDeriv operator=(const DerivativePropagatorZeroDeriv&);

    BaseVariableReference myTarget;

  }; // end of class DerivativePropagatorZeroDeriv
 
} // end of namespace xaifBooster
                                                                     
#endif
