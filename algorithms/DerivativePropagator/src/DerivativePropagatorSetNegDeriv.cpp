#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetNegDeriv.hpp"

using namespace xaifBooster;

namespace xaifBoosterDerivativePropagator {

  const std::string DerivativePropagatorSetNegDeriv::ourXAIFName("xaif:SetNegDeriv");
  const std::string DerivativePropagatorSetNegDeriv::our_myTarget_XAIFName("xaif:Tgt");
  const std::string DerivativePropagatorSetNegDeriv::our_mySource_XAIFName("xaif:Src");

  DerivativePropagatorSetNegDeriv::DerivativePropagatorSetNegDeriv(const Variable& theTarget,
                                                                   const Variable& theSource) :
    DerivativePropagatorEntry(theTarget) {
    theSource.copyMyselfInto(mySource);
    mySource.setId(1);
    mySource.setDerivFlag();
  } // end DerivativePropagatorSetNegDeriv::DerivativePropagatorSetNegDeriv

  void
  DerivativePropagatorSetNegDeriv::printXMLHierarchy(std::ostream& os) const { 
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
  } // end DerivativePropagatorSetNegDeriv::printXMLHierarchy()

  void
  DerivativePropagatorSetNegDeriv::printMemberXMLHierarchy(const Variable& theVariable,
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
  } // end DerivativePropagatorSetNegDeriv::printXMLHierarchy()

  std::string DerivativePropagatorSetNegDeriv::debug() const { 
    std::ostringstream out;
    out << "DerivativePropagatorSetNegDeriv[" << this 
	<< DerivativePropagatorEntry::debug().c_str()
	<< ", mySource=" << mySource.debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  } // end DerivativePropagatorSetNegDeriv::debug()

  void  DerivativePropagatorSetNegDeriv::getFactors(FactorList& theFactorList) const {
    Factor aFactor;
    aFactor.setNegativeUnit();
    aFactor.setSource(mySource);
    theFactorList.push_back(aFactor);
  }

  bool
  DerivativePropagatorSetNegDeriv::hasExpression(const Expression& anExpression) const {
    return (mySource.hasExpression(anExpression)
         || DerivativePropagatorEntry::hasExpression(anExpression));
  } // end DerivativePropagatorSetNegDeriv::hasExpression()

} // end namespace xaifBoosterDerivativePropagator

