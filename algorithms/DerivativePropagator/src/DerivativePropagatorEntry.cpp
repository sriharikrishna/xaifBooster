#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorEntry.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  void  DerivativePropagatorEntry::getSources(VariablePList&) const { 
    // do nothing
  }

  void DerivativePropagatorEntry::Factor::setZero() { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setZero: already set");
    myFactorKind=ZERO_FACTOR;
  }  

  void DerivativePropagatorEntry::Factor::setUnit() { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setUnit: already set");
    myFactorKind=UNIT_FACTOR;
  }  

  void DerivativePropagatorEntry::Factor::setConstant(const Constant& theConstant) { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setConstant: already set");
    myFactorKind=CONSTANT_FACTOR;
    myFactor.myConstant_p=&theConstant;
  }  

  const Constant& DerivativePropagatorEntry::Factor::getConstant() const { 
    if (myFactorKind!=CONSTANT_FACTOR)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::getConstant: not CONSTANT_FACTOR");
    return *myFactor.myConstant_p;
  }  

  void DerivativePropagatorEntry::Factor::setVariable(const Variable& theVariable) { 
    if (myFactorKind!=NOT_SET)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::setVariable: already set");
    myFactorKind=VARIABLE_FACTOR;
    myFactor.myVariable_p=&theVariable;
  }  

  const Variable& DerivativePropagatorEntry::Factor::getVariable() const { 
    if (myFactorKind!=VARIABLE_FACTOR)
      THROW_LOGICEXCEPTION_MACRO("DerivativePropagatorEntry::Factor::getVariable: not VARIABLE_FACTOR");
    return *myFactor.myVariable_p;
  }  

  DerivativePropagatorEntry::Factor::FactorKind_E 
  DerivativePropagatorEntry::Factor::getKind() const { 
    return myFactorKind;
  }

} // end of namespace
