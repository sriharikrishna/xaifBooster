#include "DerivativePropagatorSetDeriv.hpp"
#include "PrintManager.hpp"
#include "Variable.hpp"
#include <sstream>

namespace xaifBooster { 

  const std::string DerivativePropagatorSetDeriv::ourXAIFName("xaif:SetDeriv");
  const std::string DerivativePropagatorSetDeriv::our_myTarget_XAIFName("xaif:Tgt");
  const std::string DerivativePropagatorSetDeriv::our_mySource_XAIFName("xaif:Src");

  DerivativePropagatorSetDeriv::DerivativePropagatorSetDeriv(const BaseVariableReference& theTarget,
							     const BaseVariableReference& theSource) { 
    theTarget.copyMyselfInto(myTarget);
    myTarget.setId(1);
    myTarget.setDerivFlag();
    theSource.copyMyselfInto(mySource);
    mySource.setId(1);
    mySource.setDerivFlag();
  }

  void
  DerivativePropagatorSetDeriv::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << ourXAIFName.c_str() 
       << ">" 
       << std::endl; 
    printMemberXMLHierarchy(myTarget,our_myTarget_XAIFName,os);
    printMemberXMLHierarchy(mySource,our_mySource_XAIFName,os);
    os << pm.indent() 
       << "</"
       << ourXAIFName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSetDeriv::printXMLHierarchy

  void
  DerivativePropagatorSetDeriv::printMemberXMLHierarchy(const BaseVariableReference& theBaseVariableReference,
							const std::string& aName,
							std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << " "
       << BaseVariableReference::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << theBaseVariableReference.getDerivFlag()
       << "\""
       << ">" 
       << std::endl; 
    theBaseVariableReference.printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << aName.c_str()
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } // end of DerivativePropagatorSetDeriv::printXMLHierarchy

  std::string DerivativePropagatorSetDeriv::debug () const { 
    std::ostringstream out;
    out << "DerivativePropagatorSetDeriv[" << this 
	<< ", myTarget=" << myTarget.debug()
	<< ", mySource=" << mySource.debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of DerivativePropagatorSetDeriv::debug

  const BaseVariableReference& 
  DerivativePropagatorSetDeriv::getTarget() const {
    return myTarget;
  }

} // end of namespace xaifBooster 
