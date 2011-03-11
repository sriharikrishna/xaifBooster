// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Scope.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/TemporariesHelper.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockElementAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint { 

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterBasicBlockPreaccumulationTape::BasicBlockAlg(theContaining) { 
  }

  BasicBlockAlg::~BasicBlockAlg() { } 

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << PlainBasicBlock::ourXAIFName.c_str()
       << " " 
       << PlainBasicBlock::our_myId_XAIFName.c_str()
       << "=\"" 
       << getContaining().getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getContaining().getAnnotation().c_str()
       << "\" " 
       << PlainBasicBlock::our_myScopeId_XAIFName.c_str() 
       << "=\""
       << getContaining().getScope().getId().c_str()
       << "\">" 
       << std::endl;
    const PlainBasicBlock::BasicBlockElementList& aBasicBlockElementList(getBasicBlockElementList(xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()));
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=aBasicBlockElementList.begin();
	 li!=aBasicBlockElementList.end();
	 li++)
      (*(li))->printXMLHierarchy(os);
    os << pm.indent()
       << "</"
       << PlainBasicBlock::ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg[" << this
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 


  void BasicBlockAlg::algorithm_action_5() { // adjoin the DerivativePropagators
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5(adjoin propagators)");
    if (getContaining().getBasicBlockElementList().empty())
      return;
    // mesh the BasicBlockElements with the Sequences
    PlainBasicBlock::BasicBlockElementList::const_reverse_iterator aBasicBlockElementListRI=getContaining().getBasicBlockElementList().rbegin();
    SequencePList::const_reverse_iterator aSequencePListRI = myUniqueSequencePList.rbegin();
    SequencePList::const_reverse_iterator aSequencePListRend = myUniqueSequencePList.rend();
    std::list<PerSequenceData*>::const_reverse_iterator seqDataPListRI = myPerSequenceDataPList.rbegin();
    bool noSequence=false;
    if (aSequencePListRI==aSequencePListRend)
      // we don't have any sequence left, meaning there is either no sequence at all 
      // or we are at the end where there is a bit left without a sequence
      noSequence=true;
    bool done=false; // are we all done?
    while (!done) { 
      // deal with the bit outside the current Sequence
      while (noSequence ||
	     (*aSequencePListRI)->myLastElement_p!=(*aBasicBlockElementListRI)) { 
	// let the stuff outside the sequence insert itself 
	dynamic_cast<BasicBlockElementAlg&>((**aBasicBlockElementListRI).getBasicBlockElementAlgBase()).insertYourself(getContaining());
	++aBasicBlockElementListRI;
	if (aBasicBlockElementListRI==getContaining().getBasicBlockElementList().rend()) { 
	  done=true;
	  break;
	}
      } // end while
	// now we are done or (*aSequencePListRI)->myLastElement_p==(*aBasicBlockElementListRI))
      while (!done  // this implies noSequence=false
	     && 
	     (*aSequencePListRI)->myFirstElement_p!=(*aBasicBlockElementListRI)) { 
	// this should bring us to the begin of the sequence
	++aBasicBlockElementListRI;
	if (aBasicBlockElementListRI==getContaining().getBasicBlockElementList().rend()) { 
	  done=true;
	  break;
	}
      }
      if (!done) { 
        // pop all of the address variables
        for (VariablePList::const_reverse_iterator pushedAddVarPrI = (*seqDataPListRI)->myPushedAddressVariablesPList.rbegin();
             pushedAddVarPrI != (*seqDataPListRI)->myPushedAddressVariablesPList.rend(); ++pushedAddVarPrI) {
	  xaifBoosterTypeChange::TemporariesHelper aTemporariesHelper("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5",
								      **pushedAddVarPrI);
          const Variable& thePoppedAddressVariable (addAddressPop(ForLoopReversalType::ANONYMOUS,aTemporariesHelper));
          DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5: "
                                   << "Popping address into variable " << thePoppedAddressVariable.debug());
          //addAddressPop(ForLoopReversalType::EXPLICIT);
          // we push to the front so that when we search from the beginning we find the most recent addition,
          // which should be the appropriate one for the occurance of this variable in this sequence
          myAddressVariableCorList.push_front(std::make_pair(*pushedAddVarPrI,&thePoppedAddressVariable));
        }
        // pop all of the factor variables
        for (VariablePList::const_reverse_iterator pushedFacVarPrI = (*seqDataPListRI)->myPushedFactorVariablesPList.rbegin();
             pushedFacVarPrI != (*seqDataPListRI)->myPushedFactorVariablesPList.rend(); ++pushedFacVarPrI) {
	  xaifBoosterTypeChange::TemporariesHelper aTemporariesHelper("BasicBlockPreaccumulationTapeAdjoint::BasicBlockAlg::algorithm_action_5",
								      **pushedFacVarPrI);
          const Symbol& aTemporarySymbol (aTemporariesHelper.makeTempSymbol(getContaining().getScope()));
	  // allocation needed?
	  if (aTemporariesHelper.needsAllocation()) { 
            addAllocation(aTemporarySymbol,
			  getContaining().getScope(),
			  aTemporariesHelper,
	                  ForLoopReversalType::ANONYMOUS);
            addAllocation(aTemporarySymbol,
			  getContaining().getScope(),
                          aTemporariesHelper,
                          ForLoopReversalType::EXPLICIT);
          }
          // Anonymous version
          const Variable& thePoppedFactorVariable (addFactorPop(aTemporarySymbol,
                                                                ForLoopReversalType::ANONYMOUS));
          // Explicit version (we can use the same symbol for the popped factor variable)
          addFactorPop(aTemporarySymbol,
              	       ForLoopReversalType::EXPLICIT);
          myFactorVariableCorList.push_back(std::make_pair(*pushedFacVarPrI,&thePoppedFactorVariable));
        } // end for all pushed factor variables

	const xaifBoosterDerivativePropagator::DerivativePropagator& aDerivativePropagator((*aSequencePListRI)->myDerivativePropagator);
	for(xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_reverse_iterator entryPListI=
	      aDerivativePropagator.getEntryPList().rbegin();
	    entryPListI!= aDerivativePropagator.getEntryPList().rend();
	    ++entryPListI) {
	  reinterpretDerivativePropagatorEntry(**entryPListI);
	} // end for DerivativePropagatorEntry list
	++aSequencePListRI;
        ++seqDataPListRI;
	if (aSequencePListRI==aSequencePListRend)
	  // there is no sequence left
	  noSequence=true;
      } // end of if (!done)
    } // end while (!done)
  } // end BasicBlockAlg::algorithm_action_5()

  Scope&  
  BasicBlockAlg::getScope() { 
    return getContaining().getScope();
  } 

} // end namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint

