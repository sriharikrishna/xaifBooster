#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorZeroDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  const std::string DerivativePropagatorZeroDeriv::ourXAIFName("xaif:ZeroDeriv");

  DerivativePropagatorZeroDeriv::DerivativePropagatorZeroDeriv(const Variable& theTarget) : DerivativePropagatorEntry(theTarget) { 
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
	<< DerivativePropagatorEntry::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagatorZeroDeriv::debug

  void  DerivativePropagatorZeroDeriv::getFactors(FactorList& theFactorList) const { 
    Factor aFactor;
    aFactor.setZero();
    theFactorList.push_back(aFactor);
  } 

} // end of namespace 
