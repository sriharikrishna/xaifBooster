#ifndef _XAIFBOOSTERDERIVATIVEPROPAGATORINCDERIV_INCLUDE_
#define _XAIFBOOSTERDERIVATIVEPROPAGATORINCDERIV_INCLUDE_

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator {

  class DerivativePropagatorIncDeriv : public DerivativePropagatorEntry {
  public:

    DerivativePropagatorIncDeriv(const Variable& theTarget,
                                 const Variable& theSource);

    ~DerivativePropagatorIncDeriv(){};

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
    DerivativePropagatorIncDeriv();

    /// no def
    DerivativePropagatorIncDeriv(const DerivativePropagatorIncDeriv&);

    /// no def
    DerivativePropagatorIncDeriv operator=(const DerivativePropagatorIncDeriv&);

    /// this version only has a single source
    Variable mySource;

  }; // end class DerivativePropagatorIncDeriv
 
} // end namespace xaifBoosterDerivativePropagator

#endif

