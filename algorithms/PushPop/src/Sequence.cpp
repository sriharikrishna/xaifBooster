// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include <sstream>

#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/TraversalStack.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValue.hpp"

#include "xaifBooster/algorithms/PushPop/inc/Sequence.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  // \TODO: is this needed?
  Sequence::Sequence() : xaifBoosterBasicBlockPreaccumulationTape::Sequence() {
  }

  Sequence::~Sequence() {
    // delete all the push calls in the push block
    for (CBasicBlockElementPList::const_iterator pushBlockI = myPushBlock.begin();
         pushBlockI != myPushBlock.end(); ++pushBlockI)
      if (*pushBlockI)
        delete *pushBlockI;
  }

  std::string
  Sequence::debug() const {
    std::ostringstream out;    
    out << "xaifBoosterPushPop::"
        << "Sequence[" << this
      //<< ",myReinterpretedDerivativePropagator=" << myReinterpretedDerivativePropagator.debug()
        << "]" << std::ends;  
    return out.str();
  }

  bool
  Sequence::hasExpression(const Expression& anExpression) const {
    return xaifBoosterBasicBlockPreaccumulationTape::Sequence::hasExpression(anExpression);
  }

  void
  Sequence::assignAndPushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue) {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterPushPop::Sequence::assignAndPushRequiredValueAfter");
    const BasicBlock& theCurrentBasicBlock(ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentBasicBlockInstance());
    Assignment* theNewExpressionAssignment_p (new Assignment(false));
    theNewExpressionAssignment_p->setId("index_expression_assignment_for_taping");
    // create a new symbol and add a new VariableSymbolReference in the Variable
    //ConceptuallyStaticInstances::instance()->getTapingVariableNameCreator(),
    VariableSymbolReference* theNewVariableSymbolReference_p
      (new VariableSymbolReference(theCurrentBasicBlock.getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                                                                       SymbolType::INTEGER_STYPE,
                                                                                                       SymbolShape::SCALAR,
                                                                                                       false),
                                   theCurrentBasicBlock.getScope())
      );
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterPushPop::Sequence::assignAndPushRequiredValueAfter");
    // pass it on to the LHS and relinquish ownership
    theNewExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    // set the RHS
    aRequiredValue.getExpression().copyMyselfInto(theNewExpressionAssignment_p->getRHS(),
                                                  false,
                                                  false);
    myPushBlock.push_back(theNewExpressionAssignment_p);
    // now create the push
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theNewPushSubroutineCall_p
     (new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i_"+SymbolShape::toShortString(theNewExpressionAssignment_p->getLHS().getEffectiveShape())));
    theNewPushSubroutineCall_p->setId("xaifBoosterPushPop::Sequence::assignAndPushRequiredValueAfter:inline_push_i");
    theNewExpressionAssignment_p->getLHS().copyMyselfInto(theNewPushSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    myPushBlock.push_back(theNewPushSubroutineCall_p);
  }

  void
  Sequence::pushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue) {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterPushPop::Sequence::pushRequiredValueAfter");
    if (!aRequiredValue.isArgument())
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::pushRequiredValueAfter:"
                                 << " required value " << aRequiredValue.debug() << " is not an argument (it's some expression)");
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theNewPushSubroutineCall_p
      (new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i_"+SymbolShape::toShortString(aRequiredValue.getArgument().getVariable().getEffectiveShape())));
    theNewPushSubroutineCall_p->setId("xaifBoosterPushPop::Sequence::pushRequiredValueAfter:inline_push_i");
    aRequiredValue.getArgument().getVariable().copyMyselfInto(theNewPushSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    myPushBlock.push_back(theNewPushSubroutineCall_p);
  }

}
 
