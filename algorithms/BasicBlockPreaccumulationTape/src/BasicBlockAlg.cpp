#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/ArgumentSubstitute.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"


using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) { 
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchyImpl(os,
									       printDerivativePropagatorAsTape);
  } // end of BasicBlockAlg::printXMLHierarchy
  
  void xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg::printDerivativePropagatorAsTape(std::ostream& os,
 												const xaifBoosterDerivativePropagator::DerivativePropagator& aPropagator) { 
    // create an InlinableSubroutinecall for each Variable in each saxpy element in the propagator
    const xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList& theEntryPList(aPropagator.getEntryPList());
    for (xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_iterator entryPListI=theEntryPList.begin();
 	 entryPListI!=theEntryPList.end();
 	 ++entryPListI) { 
      xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList aFactorList;
      (*entryPListI)->getFactors(aFactorList);
      for (xaifBoosterDerivativePropagator::DerivativePropagatorEntry::FactorList::iterator aFactorListI=aFactorList.begin();
 	   aFactorListI!=aFactorList.end();
 	   ++aFactorListI) { 
	if ((*aFactorListI).getKind()==xaifBoosterDerivativePropagator::DerivativePropagatorEntry::Factor::VARIABLE_FACTOR) { 
	  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall theSubroutineCall("push");
	  theSubroutineCall.setId("inline_push");
	  (*aFactorListI).getVariable().copyMyselfInto(theSubroutineCall.addArgumentSubstitute(1).getVariable());
	  theSubroutineCall.printXMLHierarchy(os);
	}
      }
    } 
  } // end of xaifBoosterBasicBlockPreaccumulationTape::printDerivativePropagatorAsTape

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
