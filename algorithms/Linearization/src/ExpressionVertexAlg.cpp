#include <sstream>

#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

namespace xaifBoosterLinearization { 

  ExpressionVertexAlg::ExpressionVertexAlg(ExpressionVertex& theContainingExpressionVertex) : 
    ExpressionVertexAlgBase(theContainingExpressionVertex),
    myAuxilliaryVariable_p(0),
    myReplacementAssignment_p(0), 
    myActiveFlag(true) { 
  }

  ExpressionVertexAlg::~ExpressionVertexAlg() { 
    if (myAuxilliaryVariable_p)
      delete myAuxilliaryVariable_p;
    if (myReplacementAssignment_p)
      delete myReplacementAssignment_p;
  }

  std::string 
  ExpressionVertexAlg::debug() const { 
    return std::string("ExpressionVertexAlg");
  }

  void
  ExpressionVertexAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  void ExpressionVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void ExpressionVertexAlg::makeAuxilliaryVariable(const Symbol& aSymbol,
						   const Scope& aScope) { 
    if (myAuxilliaryVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeAuxilliaryVariable: already set");
    Variable* theVariable_p=new Variable();
    VariableSymbolReference* theVariableSymbolReference_p=new VariableSymbolReference(aSymbol,
										      aScope);
    // JU: this assignment of the vertex Id might have to change 
    // if we create vector assignments as auxilliary variables...
    theVariableSymbolReference_p->setId("1");
    theVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theVariable_p->getAliasActivityMapKey().setTemporary();
    myAuxilliaryVariable_p=theVariable_p;
    DBG_MACRO(DbgGroup::TEMPORARY,
	      "made auxilliary:"
	      << debug().c_str());
  }
  
  bool ExpressionVertexAlg::hasAuxilliaryVariable() const { 
    return (myAuxilliaryVariable_p!=0);
  } 

  const Variable& 
  ExpressionVertexAlg::getAuxilliaryVariable() const { 
    if (!myAuxilliaryVariable_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::getAuxilliaryVariable: not set");
    return *myAuxilliaryVariable_p;
  } 

  bool ExpressionVertexAlg::hasReplacement() const { 
    return (myReplacementAssignment_p!=0);
  }

  Assignment&
  ExpressionVertexAlg::makeReplacementAssignment() { 
    if (myReplacementAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeReplacementAssignment : has already a replacement");
    myReplacementAssignment_p=new Assignment(true);
    return *myReplacementAssignment_p;
  }

  bool ExpressionVertexAlg::isActive() const { 
    return myActiveFlag;
  } // end of ExpressionVertexAlg::isActive

  void ExpressionVertexAlg::passivate() { 
    myActiveFlag=false;
  } // end of ExpressionVertexAlg::passivate

}
