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
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/SymbolAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulationTapeAdjoint/inc/BasicBlockAlg.hpp"

namespace xaifBoosterBasicBlockPreaccumulationTapeAdjoint {  

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    xaifBoosterLinearization::SubroutineCallAlg(theContainingSubroutineCall),
    BasicBlockElementAlg(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI=
	   myPops.begin();
	 aBasicBlockElementListI!=myPops.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
  } 

  void
  SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	   =myPops.begin();
	 aBasicBlockElementListI!=myPops.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI) { 
	(*aBasicBlockElementListI)->printXMLHierarchy(os);
      } 
    }
    // only print the adjustments (not the assignments)
    xaifBoosterLinearization::SubroutineCallAlg::printXMLHierarchyImplWithAdjustments(os);
  } // end of BasicBlockAlg::printXMLHierarchy

  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::insertYourself(const BasicBlock& theBasicBlock) { 
    xaifBoosterLinearization::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterLinearization::SymbolAlg&>
						      (getContainingSubroutineCall().
						       getSymbolReference().getSymbol().getSymbolAlgBase()));
    // we don't do this for external calls: 
    if(theSymbolAlg.isExternal())
      return;
    insertYourself(theBasicBlock, ForLoopReversalType::ANONYMOUS);
    insertYourself(theBasicBlock, ForLoopReversalType::EXPLICIT);
  } 

  void SubroutineCallAlg::insertYourself(const BasicBlock& theBasicBlock,
					 ForLoopReversalType::ForLoopReversalType_E aReversalType) { 
    xaifBoosterLinearization::SymbolAlg& theSymbolAlg(dynamic_cast<xaifBoosterLinearization::SymbolAlg&>
						      (getContainingSubroutineCall().
						       getSymbolReference().getSymbol().getSymbolAlgBase()));
    // we don't do this for external calls: 
    if(theSymbolAlg.isExternal())
      return;
    BasicBlockAlg& theBasicBlockAlg(dynamic_cast<BasicBlockAlg&>(theBasicBlock.getBasicBlockAlgBase()));
    SubroutineCall& theNewSubroutineCall(theBasicBlockAlg.addSubroutineCall(getContainingSubroutineCall().getSymbolReference().getSymbol(),
									    getContainingSubroutineCall().getSymbolReference().getScope(),
									    getContainingSubroutineCall().getActiveUse(),
									    aReversalType));
    const SubroutineCall::ConcreteArgumentPList& theOldConcreteArgumentPList(getContainingSubroutineCall().getConcreteArgumentPList());
    SubroutineCall::ConcreteArgumentPList& theNewConcreteArgumentPList(theNewSubroutineCall.getConcreteArgumentPList());
    for (SubroutineCall::ConcreteArgumentPList::const_iterator theOldConcreteArgumentPListI=theOldConcreteArgumentPList.begin();
	 theOldConcreteArgumentPListI!=theOldConcreteArgumentPList.end();
	 ++theOldConcreteArgumentPListI) { 
      ConcreteArgument* theNewConcreteArgument_p(new ConcreteArgument((*theOldConcreteArgumentPListI)->getPosition()));
      theNewConcreteArgumentPList.push_back(theNewConcreteArgument_p);
      (*theOldConcreteArgumentPListI)->copyMyselfInto(*theNewConcreteArgument_p);
    } // end for
    // reapply any argument conversions we may need
    dynamic_cast<xaifBoosterLinearization::SubroutineCallAlg&>(theNewSubroutineCall.getSubroutineCallAlgBase()).xaifBoosterLinearization::SubroutineCallAlg::algorithm_action_1();
    if (aReversalType==ForLoopReversalType::ANONYMOUS) { 
      // for each subroutinecall
      // restore the index value via 
      // an InlinableSubroutinecall for each 
      // nonconstant index of an argument that 
      // has array indices
      // all in reverser order 
      // and create a replacement argument.
      for (SubroutineCall::ConcreteArgumentPList::reverse_iterator aConcreteArgumentPListI=
	     theNewConcreteArgumentPList.rbegin();
	   aConcreteArgumentPListI!=theNewConcreteArgumentPList.rend();
	   ++aConcreteArgumentPListI) { 
	ConcreteArgument& theConcreteArgument(**aConcreteArgumentPListI);
	if (theConcreteArgument.isArgument() && theConcreteArgument.getArgument().getVariable().hasArrayAccess()) {
	  // if we have to restore index values we replace the ConcreteArgument in question
	  // using the associated ConcreteArgumentAlg instance
	  // and hold on to the pop operations in the alg object associated with this new call.
	  dynamic_cast<SubroutineCallAlg&>(theNewSubroutineCall.getSubroutineCallAlgBase()).
	    handleArrayAccessIndices(theConcreteArgument,
				     theBasicBlock.getScope()); 
	} 
      } // end for 
    }
  } 

  void SubroutineCallAlg::algorithm_action_4() { 
    // everything is done in insertYourself
    // because we are working on the new subroutineCall created 
    // there, not on the original one, so it is easier to do it there.
  } 
  
  void SubroutineCallAlg::handleArrayAccessIndices(ConcreteArgument& theConcreteArgument,
						   Scope& theBasicBlockScope) { 
    // first figure out if we actually need to do anything: 
    bool needReplacements=false;
    const ArrayAccess::IndexTripletListType& theIndexTripletList(theConcreteArgument.getArgument().getVariable().getArrayAccess().getIndexTripletList());
    for (ArrayAccess::IndexTripletListType::const_reverse_iterator anIndexTripletListTypeCI=theIndexTripletList.rbegin();
	 !needReplacements && (anIndexTripletListTypeCI!=theIndexTripletList.rend());
	 ++anIndexTripletListTypeCI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anIndexTripletListTypeCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anIndexTripletListTypeCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	const Expression& theIndexExpression(*((*anIndexPairListCI).second));
	if (theIndexExpression.numVertices()==1
	    && 
	    !(*(theIndexExpression.vertices().first)).isArgument()) { 
	  // do nothing
	}
	else { 
	  needReplacements=true;
	}
      }
    }
    if (!needReplacements)
      return;
    // get the algorithm instance
    xaifBoosterLinearization::ConcreteArgumentAlg& 
      theConcreteArgumentAlg(dynamic_cast<xaifBoosterLinearization::ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    // three different potential replacement spots:
    ArrayAccess::IndexTripletListType 
      *theArgumentReplacementIndexTripletListP=0, *thePriorReplacementIndexTripletListP=0, *thePostReplacementIndexTripletListP=0;
    ArrayAccess::IndexTripletListType::reverse_iterator theArgumentReplacementIndexTripletListI,thePriorReplacementIndexTripletListI,thePostReplacementIndexTripletListI;
    if (!theConcreteArgumentAlg.hasReplacement()) { 
      // it already may have a replacement in case we got an activity mismatch
      // make the identical copy
      theConcreteArgumentAlg.makeReplacement(theConcreteArgument.getArgument().getVariable());
      theArgumentReplacementIndexTripletListP=&(theConcreteArgumentAlg.getReplacement().getArgument().getVariable().getArrayAccess().getIndexTripletList());
      theArgumentReplacementIndexTripletListI=theArgumentReplacementIndexTripletListP->rbegin();
    } else { 
      if (theConcreteArgumentAlg.hasPriorConversionConcreteArgument()) { 
	thePriorReplacementIndexTripletListP=&(theConcreteArgumentAlg.getPriorConversionConcreteArgument().getArgument().getVariable().getArrayAccess().getIndexTripletList());
	thePriorReplacementIndexTripletListI=thePriorReplacementIndexTripletListP->rbegin();
      }
      if (theConcreteArgumentAlg.hasPostConversionConcreteArgument()) { 
	thePostReplacementIndexTripletListP=&(theConcreteArgumentAlg.getPostConversionConcreteArgument().getArgument().getVariable().getArrayAccess().getIndexTripletList());
	thePostReplacementIndexTripletListI=thePostReplacementIndexTripletListP->rbegin();
      }	
    }
    // reverse iterate in parallel through the original and replacement index lists 
    for (ArrayAccess::IndexTripletListType::const_reverse_iterator anIndexTripletListTypeCI=theIndexTripletList.rbegin();
	 anIndexTripletListTypeCI!=theIndexTripletList.rend();
	 ++anIndexTripletListTypeCI) { 
      for (IndexTriplet::IndexPairList::const_iterator anIndexPairListCI=(*anIndexTripletListTypeCI)->getIndexPairList().begin();
	   anIndexPairListCI!=(*anIndexTripletListTypeCI)->getIndexPairList().end();
	   ++anIndexPairListCI) { 
	const Expression& theIndexExpression(*((*anIndexPairListCI).second));
	if (theIndexExpression.numVertices()==1
	    && 
	    !(*(theIndexExpression.vertices().first)).isArgument()) { 
	  // do nothing
	}
	else { 
	  // it is a variable or expression whose value we pushed and now want to pop
	  // and replace. First clear the old index expressions where needed
	  if (theArgumentReplacementIndexTripletListP)
	    (*theArgumentReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).clear();
	  if (thePriorReplacementIndexTripletListP)
	    (*thePriorReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).clear();
	  if (thePostReplacementIndexTripletListP)
	    (*thePostReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).clear();
	  // pop the index value  we had taped
	  xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* thePopCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("pop_i"));
	  myPops.push_back(thePopCall_p);
	  thePopCall_p->setId("inline_pop_i");
	  Variable& theInlineVariable(thePopCall_p->addConcreteArgument(1).getArgument().getVariable());
	  // give it a name etc.
	  // create a new symbol and add a new VariableSymbolReference in the Variable
	  VariableSymbolReference* theInlineVariableSymbolReference_p=
	    new VariableSymbolReference(theBasicBlockScope.getSymbolTable().
					addUniqueAuxSymbol(SymbolKind::VARIABLE,
							   SymbolType::INTEGER_STYPE,
							   SymbolShape::SCALAR,
							   false),
					theBasicBlockScope);
	  theInlineVariableSymbolReference_p->setId("1");
	  theInlineVariableSymbolReference_p->setAnnotation("xaifBoosterBasicBlockPreaccumulationTapeAdjoint::SubroutineCallAlg::handleArrayAccessIndices");
	  // pass it on to the variable and relinquish ownership
	  theInlineVariable.supplyAndAddVertexInstance(*theInlineVariableSymbolReference_p);
	  theInlineVariable.getAliasMapKey().setTemporary();
	  theInlineVariable.getDuUdMapKey().setTemporary();
	  // create a copy of the variable in the indexExpression where needed
	  if (theArgumentReplacementIndexTripletListP) {
	    Argument& theIndexArgument(*new Argument);
	    // relinquish ownership and it to the index expression
	    // that we had previously cleared (see above)
	    (*theArgumentReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).supplyAndAddVertexInstance(theIndexArgument);
	    theIndexArgument.setId(1);
	    theInlineVariable.copyMyselfInto(theIndexArgument.getVariable());
	  }
	  if (thePriorReplacementIndexTripletListP) {
	    Argument& theIndexArgument(*new Argument);
	    // relinquish ownership and it to the index expression
	    // that we had previously cleared (see above)
	    (*thePriorReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).supplyAndAddVertexInstance(theIndexArgument);
	    theIndexArgument.setId(1);
	    theInlineVariable.copyMyselfInto(theIndexArgument.getVariable());
	  }
	  if (thePostReplacementIndexTripletListP) {
	    Argument& theIndexArgument(*new Argument);
	    // relinquish ownership and it to the index expression
	    // that we had previously cleared (see above)
	    (*thePostReplacementIndexTripletListI)->getExpression((*anIndexPairListCI).first).supplyAndAddVertexInstance(theIndexArgument);
	    theIndexArgument.setId(1);
	    theInlineVariable.copyMyselfInto(theIndexArgument.getVariable());
	  }
	}
	// advance the other iterators as needed
	if (theArgumentReplacementIndexTripletListP)
	  ++theArgumentReplacementIndexTripletListI;
	if (thePriorReplacementIndexTripletListP)
	  ++thePriorReplacementIndexTripletListI;
	if (thePostReplacementIndexTripletListP)
	  ++thePostReplacementIndexTripletListI;
      } // end for index pairs
    } // end for iteration through indices
  } // end of SubroutineCallAlg::handleArrayAccessIndices

} // end of namespace 
