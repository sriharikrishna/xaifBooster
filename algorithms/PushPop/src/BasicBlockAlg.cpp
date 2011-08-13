// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockElementAlg.hpp"

#include "xaifBooster/algorithms/PushPop/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/PushPop/inc/Sequence.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterAddressArithmetic::BasicBlockAlg(theContaining) {
  } // end BasicBlockAlg::BasicBlockAlg()

  BasicBlockAlg::~BasicBlockAlg() {
  } // end BasicBlockAlg::~BasicBlockAlg()

  std::string BasicBlockAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterPushPop::BasicBlockAlg[" << this
	<< "]" << std::ends;
    return out.str();
  } // end BasicBlockAlg::debug()

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end BasicBlockAlg::traverseToChildren()

  void 
  BasicBlockAlg::algorithm_action_6() {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterPushPop::BasicBlockAlg::algorithm_action_6: invoked for " << debug().c_str());
    // create a CombinedGraph for each sequence
    for (SequencePList::iterator aSequencePListI = myUniqueSequencePList.begin();
         aSequencePListI != myUniqueSequencePList.end();
         ++aSequencePListI) { // outer loop over all items in myUniqueSequencePList
      Sequence& currentSequence(dynamic_cast<Sequence&>(**aSequencePListI));
      if (currentSequence.myComputationalGraph_p->numVertices()) {
        currentSequence.populateCombinedGraph();
      } // end if LCG has vertices
    } // end iterate over sequences
  }

  void
  BasicBlockAlg::pushSupremum(xaifBoosterRequiredValues::RequiredValueSet::RequiredValuePList aRequiredValuePList) {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterPushPop::BasicBlockAlg::pushSupremum");
    // perform a pairwise comparison of all the values in the list
    for (xaifBoosterRequiredValues::RequiredValueSet::RequiredValuePList::const_iterator reqValPI = aRequiredValuePList.begin();
         reqValPI != aRequiredValuePList.end(); ++reqValPI) {
      if (!getContaining().hasExpression((*reqValPI)->getExpression()))
        THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::CallGraphVertexAlg::algorithm_action_6:"
                                   << "The expression " << (*reqValPI)->getExpression().debug() << " was not found in " << getContaining().debug());
      xaifBoosterRequiredValues::RequiredValueSet::RequiredValuePList::const_iterator reqValPI2 = aRequiredValuePList.begin();
      for (; reqValPI2 != aRequiredValuePList.end(); ++reqValPI2) {
        if (*reqValPI2 == *reqValPI) continue;
        xaifBoosterRequiredValues::RequiredValueSet::ComparisonResult_E theResult = compareExpressions((*reqValPI)->getExpression(),
                                                                                                       (*reqValPI2)->getExpression());
        DBG_MACRO(DbgGroup::DATA, "compareExpressions determined that " << (*reqValPI)->debug()
                                 << " has relation " << xaifBoosterRequiredValues::RequiredValueSet::comparisonResultToString(theResult)
                                 << " to " << (*reqValPI2)->debug());
        if (theResult == xaifBoosterRequiredValues::RequiredValueSet::LESSTHAN)
          break;
      } // end for all other required values
      if (reqValPI2 == aRequiredValuePList.end()) {
        // no value comes LATER than this one, so we push it
        pushRequiredValue(**reqValPI);
        return;
      } // end if we've found a supremum
    } // end iterate over required variables
  } // end BasicBlockAlg::pushSupremum

  xaifBoosterRequiredValues::RequiredValueSet::ComparisonResult_E
  BasicBlockAlg::compareExpressions(const Expression& firstExpression,
                                    const Expression& secondExpression) const {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterPushPop::BasicBlockAlg::compareExpressions");
    SequencePList::const_iterator CSeqI = myUniqueSequencePList.begin();
    PlainBasicBlock::BasicBlockElementList::const_iterator bbeI = getContaining().getBasicBlockElementList().begin();
    for (PlainBasicBlock::BasicBlockElementList::const_iterator bbeI = getContaining().getBasicBlockElementList().begin();
         bbeI != getContaining().getBasicBlockElementList().end(); ++bbeI) {
      const BasicBlockElement& theBasicBlockElement (**bbeI);
      // check the element itself
      bool foundFirst = theBasicBlockElement.hasExpression(firstExpression);
      bool foundSecond = theBasicBlockElement.hasExpression(secondExpression);
      if (foundFirst && foundSecond) return xaifBoosterRequiredValues::RequiredValueSet::EQUAL;
      else if (foundFirst) return xaifBoosterRequiredValues::RequiredValueSet::LESSTHAN;
      else if (foundSecond) return xaifBoosterRequiredValues::RequiredValueSet::GREATERTHAN;

      if (CSeqI == myUniqueSequencePList.end()) { // no more sequences
        continue;
      }
      else if (&theBasicBlockElement == (*CSeqI)->myLastElement_p) { // we are at the end of the current sequence
        const Sequence& currentSequence(dynamic_cast<const Sequence&>(**CSeqI));
        // check the stuff that comes after the sequence
        // (for now we can consider it to all occur at the same time)
        // meaning that everything in accumulation and propagation is considered to occur simultaneously
        // for the same reason, we can just do all the pushes at the end
        foundFirst = false;
        foundSecond = false;
        // check the accumulation code
        for (Sequence::AssignmentPList::const_iterator accAssPI = currentSequence.getEndAssignmentList().begin();
             accAssPI != currentSequence.getEndAssignmentList().end(); ++accAssPI) {
          foundFirst = (*accAssPI)->hasExpression(firstExpression);
          foundSecond = (*accAssPI)->hasExpression(secondExpression);
          if (foundFirst && foundSecond) return xaifBoosterRequiredValues::RequiredValueSet::EQUAL;
          else if (foundFirst) return xaifBoosterRequiredValues::RequiredValueSet::LESSTHAN;
          else if (foundSecond) return xaifBoosterRequiredValues::RequiredValueSet::GREATERTHAN;
        }
        // check the propagation code FIXME?: actually go through the derivative propagator (probably no need)
        for (xaifBoosterDerivativePropagator::DerivativePropagator::EntryPList::const_iterator entryI = currentSequence.myDerivativePropagator.getEntryPList().begin();
             entryI != currentSequence.myDerivativePropagator.getEntryPList().end(); ++entryI) {
          foundFirst = (*entryI)->hasExpression(firstExpression);
          foundSecond = (*entryI)->hasExpression(secondExpression);
          if (foundFirst && foundSecond) return xaifBoosterRequiredValues::RequiredValueSet::EQUAL;
          else if (foundFirst) return xaifBoosterRequiredValues::RequiredValueSet::LESSTHAN;
          else if (foundSecond) return xaifBoosterRequiredValues::RequiredValueSet::GREATERTHAN;
        }
        ++CSeqI;
      } // end if we're at the end of a sequence
    } // end for all original elements
    THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::BasicBlockAlg::compareExpressions:"
                               << " neither " << firstExpression.debug()
                               << " nor " << secondExpression.debug()
                               << " found in " << debug());
  } // end BasicBlockAlg::compareExpressions()

  void
  BasicBlockAlg::pushRequiredValue(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue) {
    // first iterate through the elements
    for (PlainBasicBlock::BasicBlockElementList::const_iterator bbeI = getContaining().getBasicBlockElementList().begin();
         bbeI != getContaining().getBasicBlockElementList().end(); ++bbeI) {
      if ((*bbeI)->hasExpression(aRequiredValue.getExpression())) {
        xaifBoosterBasicBlockPreaccumulationTape::BasicBlockElementAlg& theBasicBlockElementAlg
         (dynamic_cast<xaifBoosterBasicBlockPreaccumulationTape::BasicBlockElementAlg&>((*bbeI)->getBasicBlockElementAlgBase()));
        if (aRequiredValue.isArgument())
          theBasicBlockElementAlg.pushVariable(aRequiredValue.getArgument().getVariable());
        else
          theBasicBlockElementAlg.assignAndPushRequiredValue(aRequiredValue,
                                                             getContaining().getScope());
        return;
      }
    }
    // iterate through the sequences
    for (SequencePList::iterator seqI = myUniqueSequencePList.begin(); seqI != myUniqueSequencePList.end(); ++seqI) {
      Sequence& currentSequence(dynamic_cast<Sequence&>(**seqI));
      if (currentSequence.hasExpression(aRequiredValue.getExpression())) {
        if (aRequiredValue.isArgument())
          currentSequence.pushRequiredValueAfter(aRequiredValue);
        else
          currentSequence.assignAndPushRequiredValueAfter(aRequiredValue);
        return;
      }
    } // end for all sequences
    THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::BasicBlockAlg::pushRequiredValue:"
                               << aRequiredValue.debug() << " was not found in this basic block");
  } // end BasicBlockAlg::pushRequiredValue()

  const BasicBlock&
  BasicBlockAlg::getContaining() const {
    return xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getContaining();
  } // end BasicBlockAlg::getContaining()

} // end namespace xaifBoosterPushPop

