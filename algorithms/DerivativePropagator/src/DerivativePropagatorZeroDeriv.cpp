#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorZeroDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  const std::string DerivativePropagatorZeroDeriv::ourXAIFName("xaif:ZeroDeriv");

  DerivativePropagatorZeroDeriv::DerivativePropagatorZeroDeriv(const Variable& theTarget) { 
    theTarget.copyMyselfInto(myTarget);
    myTarget.setId(1);
    myTarget.setDerivFlag();
  }

  void
  DerivativePropagatorZeroDeriv::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << ourXAIFName
       << " "
       << Variable::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << myTarget.getDerivFlag()
       << "\""
       << ">" 
       << std::endl;
    myTarget.printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << ourXAIFName
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorZeroDeriv::printXMLHierarchy

  std::string DerivativePropagatorZeroDeriv::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagatorZeroDeriv[" << this 
	<< ", myTarget=" << myTarget.debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagatorZeroDeriv::debug

  void DerivativePropagatorZeroDeriv::getSources(VariablePList& theVariablePList) const { 
  }

  void  DerivativePropagatorZeroDeriv::getFactors(FactorList& theFactorList) const { 
    Factor aFactor;
    aFactor.setZero();
    theFactorList.push_back(aFactor);
  } 

  const Variable& DerivativePropagatorZeroDeriv::getTarget() const { 
    return myTarget;
  } 

} // end of namespace 