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

#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SymbolAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/BasicBlockAlgParameter.hpp"

#include "xaifBooster/algorithms/AdjointUtils/inc/BasicBlockPrintVersion.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTape {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterTypeChange::SubroutineCallAlg(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
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
    // the call
    xaifBoosterTypeChange::SubroutineCallAlg::printXMLHierarchy(os);
    if (xaifBoosterAdjointUtils::BasicBlockPrintVersion::get()==ForLoopReversalType::ANONYMOUS) { 
      // pushes after the call
      for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	     =myAfterCallIndexPushes.begin();
	   aBasicBlockElementListI!=myAfterCallIndexPushes.end();
	 ++aBasicBlockElementListI) {
	if (*aBasicBlockElementListI) { 
	  (*aBasicBlockElementListI)->printXMLHierarchy(os);
	} 
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
    xaifBoosterTypeChange::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterTypeChange::SymbolAlg&>
						   (getContainingSubroutineCall().
						    getSymbolReference().getSymbol().getSymbolAlgBase()));
    // we don't do this for external calls: 
    if(!theSymbolAlg.isExternal()) { 
      // for each subroutinecall
      // store the index value via 
      // an InlinableSubroutinecall for each 
      // nonconstant index of an argument that 
      // has array indices
      PlainBasicBlock::BasicBlockElementList::iterator indexAssignmentListI=myPriorToCallAssignments.begin();
      for (SubroutineCall::ConcreteArgumentPList::const_iterator aConcreteArgumentPListI=
	     getContainingSubroutineCall().getConcreteArgumentPList().begin();
	   aConcreteArgumentPListI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	   ++aConcreteArgumentPListI) { 
	if ((*aConcreteArgumentPListI)->isArgument()
	    && 
	    (*aConcreteArgumentPListI)->getArgument().getVariable().hasArrayAccess()) {
	  handleArrayAccessIndices(**aConcreteArgumentPListI,
				   dynamic_cast<BasicBlockAlg&>(xaifBoosterTypeChange::BasicBlockAlgParameter::instance().get()).getContaining().getScope(), // in SubroutineCallAlg::algorithm_action_4()
				   indexAssignmentListI); 
	}
      } // end for
    } 
  } 

  void SubroutineCallAlg::handleArrayAccessIndices(ConcreteArgument& theConcreteArgument,
						   Scope& theBasicBlockScope,
						   PlainBasicBlock::BasicBlockElementList::iterator& indexAssignmentListI) { 
    // get the argument algorithm instance 
    xaifBoosterTypeChange::ConcreteArgumentAlg& 
      theConcreteArgumentAlg(dynamic_cast<xaifBoosterTypeChange::ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    // one potential extra replacement spots:
    ArrayAccess::IndexTripletListType *thePostReplacementIndexTripletListP=0;
    ArrayAccess::IndexTripletListType::iterator thePostReplacementIndexTripletListI;
    if (theConcreteArgumentAlg.hasPostConversionConcreteArgument()) { 
      thePostReplacementIndexTripletListP=&(theConcreteArgumentAlg.getPostConversionConcreteArgument().getArgument().getVariable().getArrayAccess().getIndexTripletList());
      thePostReplacementIndexTripletListI=thePostReplacementIndexTripletListP->begin();
    }
    const ArrayAccess::IndexTripletListType& theIndexTripletList(theConcreteArgument.getArgument().getVariable().getArrayAccess().getIndexTripletList());
    for (ArrayAccess::IndexTripletListType::const_iterator anIndexTripletListTypeCI=theIndexTripletList.begin();
	 anIndexTripletListTypeCI!=theIndexTripletList.end();
	 ++anIndexTripletListTypeCI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anIndexTripletListTypeCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anIndexTripletListTypeCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	// now we have two cases, essentially the expression is a single vertex with a constant 
	// (this discounts constant expressions, this is a todo which might be dealt with later or 
	// it may be completly superceded by a TBR analysis)
	const Expression& theIndexExpression(*((*anIndexPairListCI).second));
	if (theIndexExpression.numVertices()==1
	    && 
	    (!(*(theIndexExpression.vertices().first)).isArgument())) { 
	  // this must be a constant
	  // do nothing
	}
	else {  // is not a constant
	  // clear out the old index expression
	  if (thePostReplacementIndexTripletListP)
	    (*thePostReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).clear();
	  xaifBoosterTypeChange::ConcreteArgumentAlg& 
	    theConcreteArgumentAlg(dynamic_cast<xaifBoosterTypeChange::ConcreteArgumentAlg&>(theConcreteArgument.
											      getConcreteArgumentAlgBase()));
	  Assignment* theIndexExpressionAssignment_p(0);
	  if (!theConcreteArgumentAlg.hasReplacement()) { 
	    theIndexExpressionAssignment_p=new Assignment(false);
	    // save it in the list
	    myPriorToCallAssignments.push_back(theIndexExpressionAssignment_p);
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
	  }
	  else { 
	    // get it from the list we already have
	    theIndexExpressionAssignment_p=dynamic_cast<Assignment*>(*indexAssignmentListI);
	    // advance in the list 
	    ++indexAssignmentListI;
	  }
	  // make the subroutine call: 
	  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theSubroutineCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i"));
	  // save it in the list
	  myAfterCallIndexPushes.push_back(theSubroutineCall_p);
	  theSubroutineCall_p->setId("SRcall_inline_push_i");
	  const Variable& theIndexAssignmentLHS(theIndexExpressionAssignment_p->getLHS());
	  theIndexAssignmentLHS.copyMyselfInto(theSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
	  if (thePostReplacementIndexTripletListP) {
	    Argument& theIndexArgument(*new Argument);
	    // relinquish ownership and it to the index expression
	    // that we had previously cleared (see above)
	    (*thePostReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).supplyAndAddVertexInstance(theIndexArgument);
	    theIndexArgument.setId(1);
	    theIndexAssignmentLHS.copyMyselfInto(theIndexArgument.getVariable());
	  }
	}  // end else has more then one vertex   
      } // end loop through the triplet pairs
      // advance the other iterator if needed
      if (thePostReplacementIndexTripletListP)
	++thePostReplacementIndexTripletListI;
    } // end for index
  } // end of SubroutineCallAlg::handleArrayAccessIndices
  
} // end of namespace 
