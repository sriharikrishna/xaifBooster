#include "DerivativePropagatorZeroDeriv.hpp"
#include "PrintManager.hpp"
#include "Variable.hpp"
#include <sstream>

namespace xaifBooster { 

  const std::string DerivativePropagatorZeroDeriv::ourXAIFName("xaif:ZeroDeriv");

  DerivativePropagatorZeroDeriv::DerivativePropagatorZeroDeriv(const BaseVariableReference& theTarget) { 
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
       << BaseVariableReference::our_myDerivFlag_XAIFName.c_str()
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

} // end of namespace xaifBooster 
