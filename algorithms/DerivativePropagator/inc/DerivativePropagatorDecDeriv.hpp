#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATORDECDERIV_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATORDECDERIV_INCLUDE_

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator {

  class DerivativePropagatorDecDeriv : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorDecDeriv(const Variable& theTarget,
                                 const Variable& theSource);

    ~DerivativePropagatorDecDeriv(){};

    void printXMLHierarchy(std::ostream& os) const;

    void printMemberXMLHierarchy(const Variable& theVariable,
                                 const std::string& aName,
                                 std::ostream& os) const;

    std::string debug() const;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    static const std::string our_myTarget_XAIFName;

    static const std::string our_mySource_XAIFName;

    virtual void  getFactors(FactorList& theFactorList) const ; 

    virtual bool isIncremental() const;

  private:

    /// no def
    DerivativePropagatorDecDeriv();

    /// no def
    DerivativePropagatorDecDeriv(const DerivativePropagatorDecDeriv&);

    /// no def
    DerivativePropagatorDecDeriv& operator=(const DerivativePropagatorDecDeriv&);

    /// this version only has a single source
    Variable mySource;

  }; // end class DerivativePropagatorDecDeriv
 
} // end namespace xaifBoosterDerivativePropagator

#endif

