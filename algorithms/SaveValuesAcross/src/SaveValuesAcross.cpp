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
    // delete the SavedValues and the assignments they own
    for (SaveValuesAcross::SavedValueList::iterator saI = mySavedValueList.begin(); saI != mySavedValueList.end(); ++saI) {
      if (*saI) {
        if ((*saI)->myAssignment_p)
          delete (*saI)->myAssignment_p;
        delete *saI;
      }
    }
  } // end SaveValuesAcross::~SaveValuesAcross()

  void
  SaveValuesAcross::printXMLHierarchy(std::ostream& os) const {
    for (SaveValuesAcross::SavedValueList::const_iterator saI = mySavedValueList.begin(); saI != mySavedValueList.end(); ++saI) {
      if ((*saI)->myAssignment_p)
        (*saI)->myAssignment_p->printXMLHierarchy(os);
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
    SaveValuesAcross::SavedValueList::const_iterator saI;
    for (saI = mySavedValueList.begin(); saI != mySavedValueList.end(); ++saI)
      if (anArgument.getVariable().equivalentTo((*saI)->myArgument_p->getVariable()))
	break;
    return (saI != mySavedValueList.end());
  } // end SaveValuesAcross::isSavedAcross()

  void
  SaveValuesAcross::saveValue(const Argument& anArgument,
                              const BasicBlock& theBasicBlock) {
    Assignment* theNewAssignment_p (new Assignment(false));
    theNewAssignment_p->setId("assignment_to_temporary_for_saving_value_across_statement");
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
    theNewAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    // set the RHS
    theNewAssignment_p->getRHS().supplyAndAddVertexInstance(anArgument.createCopyOfMyself());
    // save the replacement pairs and the assignment
    mySavedValueList.push_back(new SavedValue(anArgument, *theNewVariableSymbolReference_p, *theNewAssignment_p));
  } // end SaveValuesAcross::saveValue()

  void
  SaveValuesAcross::populateReplacementPairsList(Expression::VariablePVariableSRPPairList& aListToBePopulated) const {
    // this should possibly become deprecated?  It's currently used by typeChange::subroutinecallalg
    aListToBePopulated.clear();
    for (SaveValuesAcross::SavedValueList::const_iterator saI = mySavedValueList.begin(); saI != mySavedValueList.end(); ++saI)
      aListToBePopulated.push_back(std::make_pair(&((*saI)->myArgument_p->getVariable()),
                                                                  (*saI)->myTempVarVSR_p));
  } // end SaveValuesAcross::populateReplacementPairsList()

  const SaveValuesAcross::SavedValueList&
  SaveValuesAcross::getSavedValueList() const {
    return mySavedValueList;
  } // end 

} // end namespace xaifBoosterSaveValuesAcross

