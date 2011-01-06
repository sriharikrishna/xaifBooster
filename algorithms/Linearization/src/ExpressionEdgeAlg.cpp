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

#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

namespace xaifBoosterLinearization { 

  ExpressionEdgeAlg::ExpressionEdgeAlg(ExpressionEdge& theContainingExpressionEdge) : 
    ExpressionEdgeAlgBase(theContainingExpressionEdge),
    myPartialDerivative_p(0),
    myConcretePartialAssignment_p(0),
    myConcreteConstant_p(0),
    myConcretePartialDerivativeKind(PartialDerivativeKind::NONLINEAR) { 
  }

  std::string ExpressionEdgeAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::ExpressionEdgeAlg[" << this
	<< ",myConcretePartialDerivativeKind" << PartialDerivativeKind::toString(myConcretePartialDerivativeKind)
 	<< "]" << std::ends;
    return out.str();
  } // end of ExpressionEdgeAlg::debug

  void
  ExpressionEdgeAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  void ExpressionEdgeAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  bool ExpressionEdgeAlg::hasPartial() const { 
    return (myPartialDerivative_p!=0);
  }

  const InlinableIntrinsicsExpression&  
  ExpressionEdgeAlg::getPartial() const { 
    if (!myPartialDerivative_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getPartial: not set");
    return *myPartialDerivative_p;
  } 

  void 
  ExpressionEdgeAlg::setPartial(const InlinableIntrinsicsExpression& thePartial) { 
    if (myPartialDerivative_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::setPartial: already set");
    myPartialDerivative_p=&thePartial;
    myConcretePartialDerivativeKind=PartialDerivativeKind::leastDependent(myConcretePartialDerivativeKind, 
									  thePartial.getPartialDerivativeKind());
  } 

  void 
  ExpressionEdgeAlg::addArgumentsConcretizationPair(const ExpressionVertex& aConcreteArgument,
						    const InlinableIntrinsicsExpressionVertex& anAbstractArgument) { 
    // for safety check uniqueness
    for (VertexPairList::iterator it=myConcreteArgumentInstancesList.begin();
	 it!=myConcreteArgumentInstancesList.end();
	 ++it) { 
      if (((*it).first==&aConcreteArgument 
	   &&
	   (*it).second==&anAbstractArgument))
	// both are the same, i.e. an allowed parallel 
	// edge that has already been added
	return;
      if (((*it).first==&aConcreteArgument 
	   ||
	   (*it).second==&anAbstractArgument))
	// if they are not both the same but just one of them matches, 
	THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::addArgumentsConcretizationPair: ambiguous pairs");
    } // end for
    myConcreteArgumentInstancesList.push_back(VertexPair(&aConcreteArgument,&anAbstractArgument));
  }

  void ExpressionEdgeAlg::makeConcretePartialAssignment() { 
    if (myConcreteConstant_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::makeConcretePartialAssignment: myConcreteConstant_p is already set, and we cannot have both");
    if (myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::makeConcretePartialAssignment: already set");
    myConcretePartialAssignment_p=new Assignment(false);
  } 

  Assignment& ExpressionEdgeAlg::getConcretePartialAssignment() { 
    if (!myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getConcretePartialAssignment: not set");
    return *myConcretePartialAssignment_p;
  } 

  const Assignment& ExpressionEdgeAlg::getConcretePartialAssignment() const { 
    if (!myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getConcretePartialAssignment: not set");
    return *myConcretePartialAssignment_p;
  } 

  bool ExpressionEdgeAlg::hasConcretePartialAssignment() const { 
    return (myConcretePartialAssignment_p!=0);
  } 

  void
  ExpressionEdgeAlg::setConcreteConstant(const Constant& aConstant) {
    if (myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::setConcreteConstant: myConcretePartialAssignment_p is already set, and we cannot have both");
    myConcreteConstant_p = &aConstant;
  } // end ExpressionEdgeAlg::setConcreteConstant()

  const Constant&
  ExpressionEdgeAlg::getConcreteConstant() const {
    if (!myConcreteConstant_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getConcreteConstant: not set, " <<
                                 "where the PDK is currently set to " << PartialDerivativeKind::toString(myConcretePartialDerivativeKind));
    return *myConcreteConstant_p;
  } // end ExpressionEdgeAlg::getConcreteConstant()

  void ExpressionEdgeAlg::passivate() { 
    myConcretePartialDerivativeKind=PartialDerivativeKind::PASSIVE;
  } 
  
  void ExpressionEdgeAlg::linearate() { 
    myConcretePartialDerivativeKind = PartialDerivativeKind::LINEAR;
  } 
  
  const ExpressionEdgeAlg::VertexPairList& ExpressionEdgeAlg::getConcreteArgumentInstancesList() const { 
    return myConcreteArgumentInstancesList;
  }

  PartialDerivativeKind::PartialDerivativeKind_E ExpressionEdgeAlg::getPartialDerivativeKind() const { 
    return myConcretePartialDerivativeKind;
  } 

}
