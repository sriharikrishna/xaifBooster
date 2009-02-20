#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/ArrayAccess.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;

namespace xaifBoosterRequiredValues { 

  RequiredValueSet::RequiredValueSet() {
  } // end RequiredValueSet::RequiredValueSet()

  RequiredValueSet::~RequiredValueSet() {
    for (std::list<RequiredValue*>::const_iterator reqValI = myRequiredValuesPList.begin(); reqValI != myRequiredValuesPList.end(); ++reqValI)
      if (*reqValI)
	delete (*reqValI);
  } // end RequiredValueSet::~RequiredValueSet()

  std::string
  RequiredValueSet::debug() const {
    std::ostringstream out;
    out << "xaifBoosterRequiredValues::RequiredValueSet[" << this
	<< ", reqVals=";
    for (std::list<RequiredValue*>::const_iterator reqValI = myRequiredValuesPList.begin(); reqValI != myRequiredValuesPList.end(); ++reqValI)
      out << std::endl << "(" << (*reqValI)->debug().c_str() << ")";
    out << "]" << std::ends;
    return out.str();
  } // end RequiredValueSet::debug()

  RequiredValueSet::RequiredValue::RequiredValue(const ExpressionVertex& aValueEV,
                                                 const ObjectWithId::Id& aValueStatementId,
                                                 const ExpressionVertex& aLocationEV,
                                                 const ObjectWithId::Id& aLocationStatementId,
                                                 const ControlFlowGraphVertex& aControlFlowGraphVertex,
                                                 const std::string& anOrigin) :
    myValueEV_p (&aValueEV),
    myValueStatementId (aValueStatementId),
    myLocationEV_p (&aLocationEV),
    myLocationStatementId (aLocationStatementId),
    myControlFlowGraphVertex_p (&aControlFlowGraphVertex),
    myOrigin (anOrigin) {
  } // end RequiredValueSet::RequiredValue::RequiredValue()

  RequiredValueSet::RequiredValue::~RequiredValue() {
  } // end RequiredValueSet::RequiredValue::~RequiredValue()

  std::string
  RequiredValueSet::RequiredValue::debug() const {
    std::ostringstream out;
    out << "RequiredValue[" << this
	<< ",ValueEV=" << myValueEV_p->debug().c_str() 
	<< ",ValueStatementId=" << myValueStatementId
	<< ",LocationEV=" << myLocationEV_p->debug().c_str() 
	<< ",LocationStatementId=" << myLocationStatementId
	<< ",ControlFlowGraphVertex=" << myControlFlowGraphVertex_p->debug().c_str()
	<< "," << myOrigin;
    return out.str();
  } // end RequiredValueSet::RequiredValue::debug()

  const ExpressionVertex&
  RequiredValueSet::RequiredValue::getValueEV() const {
    return *myValueEV_p;
  } // end RequiredValueSet::RequiredValue::getValueEV()

  const ObjectWithId::Id&
  RequiredValueSet::RequiredValue::getValueStatementId() const {
    return myValueStatementId;
  } // end RequiredValueSet::RequiredValue::getValueStatementId()

  const ExpressionVertex&
  RequiredValueSet::RequiredValue::getLocationEV() const {
    return *myLocationEV_p;
  } // end RequiredValueSet::RequiredValue::getLocationEV()

  const ObjectWithId::Id&
  RequiredValueSet::RequiredValue::getLocationStatementId() const {
    return myLocationStatementId;
  } // end RequiredValueSet::RequiredValue::getLocationStatementId()

  const ControlFlowGraphVertex&
  RequiredValueSet::RequiredValue::getControlFlowGraphVertex() const {
    return *myControlFlowGraphVertex_p;
  } // end RequiredValueSet::RequiredValue::getControlFlowGraphVertex()

  std::string
  RequiredValueSet::RequiredValue::getOrigin() const {
    return myOrigin;
  } // end RequiredValueSet::RequiredValue::getOrigin()

  void RequiredValueSet::addValueToRequiredSet(const ExpressionVertex& theEV,
						 const ObjectWithId::Id theStatementId,
						 const ControlFlowGraphVertex& theControlFlowGraphVertex,
						 const std::string theOrigin) {
    myRequiredValuesPList.push_back(new RequiredValue (theEV,
						       theStatementId,
						       theEV,
						       theStatementId,
						       theControlFlowGraphVertex,
						       theOrigin));
  } // end RequiredValueSet::addValueToRequiredSet()

  void RequiredValueSet::addValueToRequiredSet(const ExpressionVertex& theValueEV,
						 const ObjectWithId::Id theValueStatementId,
						 const ExpressionVertex& theLocationEV,
						 const ObjectWithId::Id theLocationStatementId,
						 const ControlFlowGraphVertex& theControlFlowGraphVertex,
						 const std::string theOrigin) {
    myRequiredValuesPList.push_back(new RequiredValue (theValueEV,
						       theValueStatementId,
						       theLocationEV,
						       theLocationStatementId,
						       theControlFlowGraphVertex,
						       theOrigin));
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

} // end namespace xaifBoosterRequiredValues

