#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator { 

  const std::string DerivativePropagatorSetDeriv::ourXAIFName("xaif:SetDeriv");
  const std::string DerivativePropagatorSetDeriv::our_myTarget_XAIFName("xaif:Tgt");
  const std::string DerivativePropagatorSetDeriv::our_mySource_XAIFName("xaif:Src");

  DerivativePropagatorSetDeriv::DerivativePropagatorSetDeriv(const Variable& theTarget,
							     const Variable& theSource) { 
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
  DerivativePropagatorSetDeriv::printMemberXMLHierarchy(const Variable& theVariable,
							const std::string& aName,
							std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent()
       << "<"
       << aName.c_str() 
       << " "
       << Variable::our_myDerivFlag_XAIFName.c_str()
       << "=\""
       << theVariable.getDerivFlag()
       << "\""
       << ">" 
       << std::endl; 
    theVariable.printXMLHierarchy(os);
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

  void DerivativePropagatorSetDeriv::getSources(VariablePList& theVariablePList) const { 
    theVariablePList.push_back(&mySource);
  }

  void  DerivativePropagatorSetDeriv::getFactors(FactorList& theFactorList) const { 
    Factor aFactor;
    aFactor.setUnit();
    theFactorList.push_back(aFactor);
  } 

  const Variable& 
  DerivativePropagatorSetDeriv::getTarget() const {
    return myTarget;
  }

} // end of namespace 
