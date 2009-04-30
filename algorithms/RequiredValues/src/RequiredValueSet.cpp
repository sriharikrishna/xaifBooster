#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;

namespace xaifBoosterRequiredValues { 

  RequiredValueSet::RequiredValueSet() {
  } // end RequiredValueSet::RequiredValueSet()

  RequiredValueSet::~RequiredValueSet() {
    for (RequiredValuePList::const_iterator reqValI = myRequiredValuesPList.begin(); reqValI != myRequiredValuesPList.end(); ++reqValI)
      if (*reqValI)
	delete (*reqValI);
  } // end RequiredValueSet::~RequiredValueSet()

  std::string
  RequiredValueSet::debug() const {
    std::ostringstream out;
    out << "xaifBoosterRequiredValues::RequiredValueSet[" << this
	<< ", reqVals=";
    for (RequiredValuePList::const_iterator reqValI = myRequiredValuesPList.begin(); reqValI != myRequiredValuesPList.end(); ++reqValI)
      out << std::endl << "  (" << (*reqValI)->debug().c_str() << ")";
    out << std::endl << "]" << std::ends;
    return out.str();
  } // end RequiredValueSet::debug()

  RequiredValueSet::RequiredValue::RequiredValue(const Expression& anExpression,
                                                 const ControlFlowGraphVertex& aControlFlowGraphVertex,
                                                 const std::string& anOriginStr) :
    myExpression_p (&anExpression),
    myControlFlowGraphVertex_p (&aControlFlowGraphVertex),
    myOriginStr (anOriginStr) {
  } // end RequiredValueSet::RequiredValue::RequiredValue()

  RequiredValueSet::RequiredValue::~RequiredValue() {
  } // end RequiredValueSet::RequiredValue::~RequiredValue()

  std::string
  RequiredValueSet::RequiredValue::debug() const {
    std::ostringstream out;
    out << "RequiredValue[" << this
        << ",Expression=" << myExpression_p->debug().c_str() 
        << ",ControlFlowGraphVertex=" << myControlFlowGraphVertex_p->debug().c_str()
        << ",origin=" << myOriginStr;
    out << "]" << std::ends;
    return out.str();
  } // end RequiredValueSet::RequiredValue::debug()

  const Expression&
  RequiredValueSet::RequiredValue::getExpression() const {
    return *myExpression_p;
  } // end RequiredValueSet::RequiredValue::getValueEV()

  const ControlFlowGraphVertex&
  RequiredValueSet::RequiredValue::getControlFlowGraphVertex() const {
    return *myControlFlowGraphVertex_p;
  } // end RequiredValueSet::RequiredValue::getControlFlowGraphVertex()

  std::string
  RequiredValueSet::RequiredValue::getOriginStr() const {
    return myOriginStr;
  } // end RequiredValueSet::RequiredValue::getOrigin()

  bool
  RequiredValueSet::RequiredValue::isArgument() const {
    if (myExpression_p->numVertices() > 1)
      return false;
    return myExpression_p->getMaxVertex().isArgument();
  } // end RequiredValueSet::RequiredValue::isArgument()

  const Argument&
  RequiredValueSet::RequiredValue::getArgument() const {
    if (!isArgument())
      THROW_LOGICEXCEPTION_MACRO("RequiredValueSet::RequiredValue::getArgument:"
                                 << "the expression for this required value does not consist of just a single argument");
    return dynamic_cast<const Argument&>(myExpression_p->getMaxVertex());
  } // end RequiredValueSet::RequiredValue::getArgument()

  void
  RequiredValueSet::RequiredValue::populateArgumentPList(std::list<const Argument*> argumentListToBePopulated) const {
    myExpression_p->appendArguments(argumentListToBePopulated);
  } // end RequiredValueSet::RequiredValue::populateArgumentPList

  void RequiredValueSet::addValueToRequiredSet(const Expression& anExpression,
                                               const ControlFlowGraphVertex& aControlFlowGraphVertex,
                                               const std::string anOriginStr) {
    // ensure that this expression isn't already in the set
    RequiredValuePList::const_iterator reqValPListI;
    for (reqValPListI = myRequiredValuesPList.begin(); reqValPListI != myRequiredValuesPList.end(); ++reqValPListI) 
      if (&(*reqValPListI)->getExpression() == &anExpression)
        break;
    if (reqValPListI == myRequiredValuesPList.end())
      myRequiredValuesPList.push_back(new RequiredValue (anExpression,
                                                         aControlFlowGraphVertex,
                                                         anOriginStr));
/*
    // Also include the index expression if this variable is an array reference
    if (theVariable.hasArrayAccess()) {
      const ArrayAccess::IndexTripletListType& theIndexTripletList(theVariable.getArrayAccess().getIndexTripletList());
      for (ArrayAccess::IndexTripletListType::const_iterator anIndexTripletListTypeCI = theIndexTripletList.begin();
	   anIndexTripletListTypeCI != theIndexTripletList.end();
	   ++anIndexTripletListTypeCI) {
	for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI = (*anIndexTripletListTypeCI)->getIndexPairList().begin();
	     anIndexPairListCI!=(*anIndexTripletListTypeCI)->getIndexPairList().end();
	     ++anIndexPairListCI) {
	  const Expression& theIndexExpression (*((*anIndexPairListCI).second));
	  if (!theIndexExpression.isConstant())
	    addVarsInExpressionToRequiredSet(theIndexExpression,
					     theStatementId,
					     theOrigin);
	} // end iterate over index pairs
      } // end interate over index triplet lists
    } // end if array access
*/
  } // end RequiredValueSet::addValueToRequiredSet()

  const RequiredValueSet::RequiredValuePList&
  RequiredValueSet::getRequiredValuesPList() const {
    return myRequiredValuesPList;
  } // end RequiredValueSet::getRequiredValuesPList()

} // end namespace xaifBoosterRequiredValues

