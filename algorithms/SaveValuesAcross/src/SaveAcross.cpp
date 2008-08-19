#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/SaveValuesAcross/inc/SaveValuesAcross.hpp"

using namespace xaifBooster;

namespace xaifBoosterSaveValuesAcross {

  SaveValuesAcross::SaveValuesAcross() {
  } // end SaveValuesAcross::SaveValuesAcross()

  SaveValuesAcross::~SaveValuesAcross() {
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI = myPriorToCallAssignments.begin();
         aBasicBlockElementListI != myPriorToCallAssignments.end();
         ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
        delete *aBasicBlockElementListI;
    }
  } // end SaveValuesAcross::~SaveValuesAcross()

  void
  SaveValuesAcross::printXMLHierarchy(std::ostream& os) const {
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI = myPriorToCallAssignments.begin();
         aBasicBlockElementListI != myPriorToCallAssignments.end();
         ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
        (*aBasicBlockElementListI)->printXMLHierarchy(os);
    }
  } // end SaveValuesAcross::printXMLHierarchy()

  std::string
  SaveValuesAcross::debug () const {
    std::ostringstream out;
    out << "SaveValuesAcross[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end SaveValuesAcross::debug()

  bool
  SaveValuesAcross::isSavedAcross(const Argument& anArgument) const {
    Expression::VariablePVariableSRPPairList::const_iterator pairIt;
    for (pairIt = mySavedVarsAndReplacementVSRsList.begin(); pairIt != mySavedVarsAndReplacementVSRsList.end(); ++pairIt)
      if (anArgument.getVariable().equivalentTo(*(*pairIt).first))
	break;
    return (pairIt != mySavedVarsAndReplacementVSRsList.end());
  } // end SaveValuesAcross::isSavedAcross()

  void
  SaveValuesAcross::saveValue(const Argument& anArgument,
			const BasicBlock& theBasicBlock) {
    Assignment* theIndexExpressionAssignment_p(new Assignment(false));
    theIndexExpressionAssignment_p->setId("assignment_to temporary_for_saving_value_across_statement");
    // create a new symbol and add a new VariableSymbolReference in the Variable
    VariableSymbolReference* theNewVariableSymbolReference_p =
     new VariableSymbolReference(theBasicBlock.getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
											      SymbolType::INTEGER_STYPE,
											      SymbolShape::SCALAR,
											      false),
				 theBasicBlock.getScope());
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterSaveValuesAcross::SaveValuesAcross::saveValue");
    // pass it on to the LHS and relinquish ownership
    theIndexExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theIndexExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theIndexExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    // set the RHS
    theIndexExpressionAssignment_p->getRHS().supplyAndAddVertexInstance(anArgument.createCopyOfMyself());
    // save the replacement pairs and the assignment
    myPriorToCallAssignments.push_back(theIndexExpressionAssignment_p);
    mySavedVarsAndReplacementVSRsList.push_back(std::make_pair(&anArgument.getVariable(),theNewVariableSymbolReference_p));
  } // end SaveValuesAcross::saveValue()

  const Expression::VariablePVariableSRPPairList&
  SaveValuesAcross::getReplacementPairsList() const {
    return mySavedVarsAndReplacementVSRsList;
  } // end SaveValuesAcross::getReplacementPairsList()

} // end namespace xaifBoosterSaveValuesAcross

