#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATORZERODERIV_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATORZERODERIV_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

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

    virtual void  getFactors(FactorList& theFactorList) const ; 

    const Variable& getTarget() const;

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
 
} // end of namespace 
                                                                     
#endif
