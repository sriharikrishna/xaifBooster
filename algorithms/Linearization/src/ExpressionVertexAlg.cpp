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
    std::ostringstream out;
    out << "xaifBoosterLinearization::ExpressionVertexAlg["
	<< this 
	<< ","
	<< "myAuxilliaryVariable_p="
	<< "="
	<< myAuxilliaryVariable_p
	<< ","
	<< "myReplacementAssignment_p="
	<< "="
	<< myReplacementAssignment_p
	<< ","
	<< "myActiveFlag="
	<< "="
	<< myActiveFlag
	<< "]" << std::ends;  
    return out.str();
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
    theVariableSymbolReference_p->setAnnotation("xaifBoosterLinearization::ExpressionVertexAlg::makeAuxilliaryVariable");
    theVariable_p->supplyAndAddVertexInstance(*theVariableSymbolReference_p);
    theVariable_p->getAliasMapKey().setTemporary();
    theVariable_p->getDuUdMapKey().setTemporary();
    myAuxilliaryVariable_p=theVariable_p;
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
    myReplacementAssignment_p=new Assignment(false);
    return *myReplacementAssignment_p;
  }

  Assignment&
  ExpressionVertexAlg::getReplacementAssignment() { 
    if (!myReplacementAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeReplacementAssignment : has no replacement");
    return *myReplacementAssignment_p;
  }

  const Assignment&
  ExpressionVertexAlg::getReplacementAssignment() const { 
    if (!myReplacementAssignment_p)
      THROW_LOGICEXCEPTION_MACRO("ExpressionVertexAlg::makeReplacementAssignment : has no replacement");
    return *myReplacementAssignment_p;
  }

  bool ExpressionVertexAlg::isActive() const { 
    return myActiveFlag;
  } // end of ExpressionVertexAlg::isActive

  void ExpressionVertexAlg::passivate() { 
    myActiveFlag=false;
  } // end of ExpressionVertexAlg::passivate

}
