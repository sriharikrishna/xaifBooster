// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/SymbolAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterLinearization::SubroutineCallAlg(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI=
	   myPriorToCallIndexAssignments.begin();
	 aBasicBlockElementListI!=myPriorToCallIndexAssignments.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI=
	   myAfterCallIndexPushes.begin();
	 aBasicBlockElementListI!=myAfterCallIndexPushes.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
  } 

  void
  SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    // assignments prior to the call
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	   =myPriorToCallIndexAssignments.begin();
	 aBasicBlockElementListI!=myPriorToCallIndexAssignments.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI) { 
	(*aBasicBlockElementListI)->printXMLHierarchy(os);
      } 
    }
    // the call
    xaifBoosterLinearization::SubroutineCallAlg::printXMLHierarchy(os);
    // pushes after the call
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	   =myAfterCallIndexPushes.begin();
	 aBasicBlockElementListI!=myAfterCallIndexPushes.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI) { 
	(*aBasicBlockElementListI)->printXMLHierarchy(os);
      } 
    }
  } // end of BasicBlockAlg::printXMLHierarchy
  
  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTape::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  
  void SubroutineCallAlg::algorithm_action_4() { 
    xaifBoosterLinearization::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterLinearization::SymbolAlg&>
						      (getContainingSubroutineCall().
						       getSymbolReference().getSymbol().getSymbolAlgBase()));
    // we don't do this for external calls: 
    if(!theSymbolAlg.isExternal()) { 
      // for each subroutinecall
      // store the index value via 
      // an InlinableSubroutinecall for each 
      // nonconstant index of an argument that 
      // has array indices
      for (SubroutineCall::ConcreteArgumentPList::const_iterator aConcreteArgumentPListI=
	     getContainingSubroutineCall().getConcreteArgumentPList().begin();
	   aConcreteArgumentPListI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	   ++aConcreteArgumentPListI) { 
	if ((*aConcreteArgumentPListI)->isArgument()
	    && 
	    (*aConcreteArgumentPListI)->getArgument().getVariable().hasArrayAccess()) {
	  handleArrayAccessIndices(**aConcreteArgumentPListI,
				   // the following parameter was set in BasicBlockAlg::algorithm_action_4()
				   xaifBoosterBasicBlockPreaccumulation::BasicBlockAlgParameter::get().getContaining().getScope()); 
	}
      } // end for
    } 
  } 

  void SubroutineCallAlg::handleArrayAccessIndices(ConcreteArgument& theConcreteArgument,
						   Scope& theBasicBlockScope) { 
    const ArrayAccess::IndexListType& theIndexList(theConcreteArgument.getArgument().getVariable().getArrayAccess().getIndexList());
    for (ArrayAccess::IndexListType::const_iterator anIndexListTypeCI=theIndexList.begin();
	 anIndexListTypeCI!=theIndexList.end();
	 ++anIndexListTypeCI) { 
      // now we have two cases, essentially the expression is a single vertex with a constant 
      // (this discounts constant expressions, this is a todo which might be dealt with later or 
      // it may be completelt superceded by a TBR analysis)
      const Expression& theIndexExpression(**anIndexListTypeCI);
      if (theIndexExpression.numVertices()==1
	  && 
	  (!(*(theIndexExpression.vertices().first)).isArgument())) { 
	// this must be a constant
	// do nothing
      }
      else {  // is not a constant
	if (dynamic_cast<xaifBoosterLinearization::ConcreteArgumentAlg&>(theConcreteArgument.
									 getConcreteArgumentAlgBase()).
	    hasReplacement()) { 
	  // if we have a conversion for this, i.e. the concrete argument has a replacement in 
	  // its algorithm object then stop here. If we have a case like this, 
	  // things get a lot more complicated
	  // because while we still have to potentially store the same indices 
	  // we have to restore the indices for the call to the conversion routine and not for  
	  // this subroutine call since it has already been replaced.
	  THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::handleArrayAccessIndices: in "
				     << debug().c_str()
				     << " cannot handle concrete arguments with array indices "
				     << theConcreteArgument.debug().c_str()
				     << " that also have conversion routines for type mismatches involved."); 
	}
	// make an assignment 
	// because we cannot be sure that whatever variables 
	// are involved in the index expression remain unchanged during this call
	// and we also do not allow expressions as arguments in general
	Assignment* theIndexExpressionAssignment_p(new Assignment(false));
	// save it in the list
	myPriorToCallIndexAssignments.push_back(theIndexExpressionAssignment_p);
	theIndexExpressionAssignment_p->setId("index_expression_assignment_for_taping");
	// create a new symbol and add a new VariableSymbolReference in the Variable
	VariableSymbolReference* theNewVariableSymbolReference_p=
	  new VariableSymbolReference(theBasicBlockScope.getSymbolTable().
				      addUniqueAuxSymbol(SymbolKind::VARIABLE,
							 SymbolType::INTEGER_STYPE,
							 SymbolShape::SCALAR,
							 false),
				      theBasicBlockScope);
	theNewVariableSymbolReference_p->setId("1");
	theNewVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTape::SubroutineCallAlg::handleArrayAccessIndices");
	// pass it on to the LHS and relinquish ownership
	theIndexExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
	theIndexExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
	theIndexExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
	// set the RHS
	theIndexExpression.copyMyselfInto(theIndexExpressionAssignment_p->getRHS(),false,false);
	// make the subroutine call: 
	xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
	// save it in the list
	myAfterCallIndexPushes.push_back(theSubroutineCall_p);
	theSubroutineCall_p->setId("inline_push_i");
	theIndexExpressionAssignment_p->getLHS().copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
      }  // end else has more then one vertex   
    } // end for index
  } // end of SubroutineCallAlg::handleArrayAccessIndices
  
} // end of namespace 
