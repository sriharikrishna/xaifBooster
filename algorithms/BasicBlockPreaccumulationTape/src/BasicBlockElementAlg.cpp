#include <sstream>

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockElementAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTape {

  BasicBlockElementAlg::BasicBlockElementAlg(const BasicBlockElement& theContainingBasicBlockElement) : 
    BasicBlockElementAlgBase(theContainingBasicBlockElement) { 
  } // end BasicBlockElementAlg::BasicBlockElementAlg()

  BasicBlockElementAlg::~BasicBlockElementAlg() {
    // delete the contents of myAssignmentsforPush
    for (std::list<const BasicBlockElement*>::const_iterator assignI = myAssignmentsforPush.begin();
         assignI != myAssignmentsforPush.end(); ++assignI)
      if (*assignI)
        delete *assignI;
    // delete the contents of myPushBlock
    for (std::list<const BasicBlockElement*>::const_iterator pushI = myPushBlock.begin();
         pushI != myPushBlock.end(); ++pushI)
      if (*pushI)
        delete *pushI;
  } // end BasicBlockElementAlg::~BasicBlockElementAlg()

  std::string
  BasicBlockElementAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterLinearization::BasicBlockElementAlg[" << this
        << "]" << std::ends;  
    return out.str();
  } // end BasicBlockElementAlg::debug()

  void
  BasicBlockElementAlg::printXMLHierarchy(std::ostream& os) const {
    // print any assignments in myAssignmentsforPush
//  for (std::list<const BasicBlockElement*>::const_iterator assignI = myAssignmentsforPush.begin();
//       assignI != myAssignmentsforPush.end(); ++assignI)
//    (*assignI)->printXMLHierarchy(os);
    getContaining().printXMLHierarchyImpl(os);
    // print any push calls in myPushBlock
//  for (std::list<const BasicBlockElement*>::const_iterator pushI = myPushBlock.begin();
//       pushI != myPushBlock.end(); ++pushI)
//    (*pushI)->printXMLHierarchy(os);
  } // end BasicBlockElementAlg::printXMLHierarchy()

  void
  BasicBlockElementAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end BasicBlockElementAlg::traverseToChildren()

  void
  BasicBlockElementAlg::assignAndPushRequiredValue(const xaifBoosterRequiredValues::RequiredValueSet::RequiredValue& aRequiredValue,
                                                   Scope& aScope) {
    Assignment* theNewExpressionAssignment_p (new Assignment(false));
    theNewExpressionAssignment_p->setId("BasicBlockPreaccumulationTape::BasicBlockElementAlg::assignAndPushRequiredValue:index_expression_assignment_for_taping");
    // create a new symbol and add a new VariableSymbolReference in the Variable
    VariableSymbolReference* theNewVariableSymbolReference_p (new VariableSymbolReference(
    // AL: it should be changed to this after merge
    //aScope.getSymbolTable().addUniqueSymbol(ConceptuallyStaticInstances::instance()->getTapingVariableNameCreator(),
      aScope.getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                 SymbolType::INTEGER_STYPE,
                                                 SymbolShape::SCALAR,
                                                 false),
      aScope));
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTape::BasicBlockElementAlg::assignAndPushRequiredValue");
    DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTape::BasicBlockElementAlg::assignAndPushRequiredValue:"
                          << " assigning the expression for " << aRequiredValue.debug()
                          << " to temporary variable " << theNewVariableSymbolReference_p->debug());
    // pass it on to the LHS and relinquish ownership
    theNewExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    // set the RHS
    aRequiredValue.getExpression().copyMyselfInto(theNewExpressionAssignment_p->getRHS(),
                                                  false,
                                                  false);
    // add the assignment to our assignment block
    myAssignmentsforPush.push_back(theNewExpressionAssignment_p);
    // now push the temporary
    pushVariable(theNewExpressionAssignment_p->getLHS());
  } // end BasicBlockElementAlg::assignAndPushRequiredValue

  void
  BasicBlockElementAlg::pushVariable(const Variable& aVariable) {
    DBG_MACRO(DbgGroup::DATA,"BasicBlockPreaccumulationTape::BasicBlockElementAlg::pushVariable:"
                          << " creating a push call for " << aVariable.debug());
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theNewPushSubroutineCall_p
     (new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
    theNewPushSubroutineCall_p->setId("xaifBoosterBasicBlockPreaccumulationTape::BasicBlockElementAlg::pushRequiredValue:inline_push_i");
    aVariable.copyMyselfInto(theNewPushSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    myPushBlock.push_back(theNewPushSubroutineCall_p);
  } // end BasicBlockElementAlg::pushVariable()

} // end namespace xaifBoosterBasicBlockPreaccumulationTape

