#include <sstream>

#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

namespace xaifBoosterLinearization { 

  ExpressionEdgeAlg::ExpressionEdgeAlg(ExpressionEdge& theContainingExpressionEdge) : 
    ExpressionEdgeAlgBase(theContainingExpressionEdge),
    myPartialDerivative_p(0),
    myConcretePartialAssignment_p(0),
    myConcretePartialDerivativeKind(PartialDerivativeKind::NONLINEAR) { 
  }

  std::string ExpressionEdgeAlg::debug () const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::ExpressionEdgeAlg[" << this
 	<< "]" << std::ends;  
    return out.str();
  } // end of ExpressionEdgeAlg::debug

  void
  ExpressionEdgeAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  void ExpressionEdgeAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
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
    if (myConcretePartialAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionEdgeAlg::getConcretePartialAssignment: already set");
    myConcretePartialAssignment_p=new Assignment(false,false);
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

  void ExpressionEdgeAlg::passivate() { 
    myConcretePartialDerivativeKind=PartialDerivativeKind::PASSIVE;
  } 
  
  void ExpressionEdgeAlg::setPartialDerivativeKind(PartialDerivativeKind::PartialDerivativeKind_E theKind) { 
    myConcretePartialDerivativeKind=theKind;
  } 

  const ExpressionEdgeAlg::VertexPairList& ExpressionEdgeAlg::getConcreteArgumentInstancesList() const { 
    return myConcreteArgumentInstancesList;
  }

  PartialDerivativeKind::PartialDerivativeKind_E ExpressionEdgeAlg::getPartialDerivativeKind() const { 
    return myConcretePartialDerivativeKind;
  } 

}
