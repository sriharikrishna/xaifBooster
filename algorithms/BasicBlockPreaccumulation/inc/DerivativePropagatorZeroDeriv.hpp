#ifndef _DERIVATIVEPROPAGATORZERODERIV_INCLUDE_
#define _DERIVATIVEPROPAGATORZERODERIV_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorEntry.hpp"

namespace xaifBooster { 

  /**
   * an active Variable
   * whose deriv component is to be set to zero
   */

  class DerivativePropagatorZeroDeriv : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorZeroDeriv(const Variable& theTarget);

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

    Variable myTarget;

  }; // end of class DerivativePropagatorZeroDeriv
 
} // end of namespace xaifBooster
                                                                     
#endif
