
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
#include <cctype>
#include <algorithm>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"

#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"
#include "xaifBooster/system/inc/ArrayAccess.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/SubroutineNotFoundException.hpp"

#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"

#include "xaifBooster/algorithms/TypeChange/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/BasicBlockAlgParameter.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/MissingSubroutinesReport.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/ControlFlowGraphAlg.hpp"

namespace xaifBoosterTypeChange {  

  std::list<std::string> SubroutineCallAlg::ourWrapperSubRoutineNameList;

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    SubroutineCallAlgBase(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
  }

  void SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    printXMLHierarchyImplWithAdjustments(os);
  }

  void SubroutineCallAlg::printXMLHierarchyImplWithAdjustments(std::ostream& os) const {
    mySaveValuesAcrossForTypeChange.printXMLHierarchy(os);
    for (PlainBasicBlock::BasicBlockElementList::const_iterator priorI=myPriorAdjustmentsList.begin();
	 priorI!=myPriorAdjustmentsList.end();
	 ++priorI) { 
      (*priorI)->printXMLHierarchy(os);
    } 
    printXMLHierarchyImpl(os);
    for (PlainBasicBlock::BasicBlockElementList::const_iterator postI=myPostAdjustmentsList.begin();
	 postI!=myPostAdjustmentsList.end();
	 ++postI) { 
      (*postI)->printXMLHierarchy(os);
    } 
  }

  void SubroutineCallAlg::printXMLHierarchyImpl(std::ostream& os) const { 
    // figure out the replacement symbol if needed
    const SymbolAlg& theSymbolAlg(dynamic_cast<const SymbolAlg&>(getContainingSubroutineCall().
								 getSymbolReference().getSymbol().getSymbolAlgBase()));
    const SymbolReference* theSymbolReference_p;
    if (theSymbolAlg.hasReplacementSymbolReference()) 
      theSymbolReference_p=&(theSymbolAlg.getReplacementSymbolReference());
    else
      theSymbolReference_p=&(getContainingSubroutineCall().getSymbolReference());
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << SubroutineCall::ourXAIFName.c_str() 
       << " " 
       << SubroutineCall::our_myId_XAIFName.c_str() 
       << "=\"" 
       << getContainingSubroutineCall().getId().c_str()
       << "\" " 
       << SubroutineCall::our_symbolId_XAIFName.c_str() 
       << "=\"" 
       << theSymbolReference_p->getSymbol().getId().c_str()
       << "\" " 
       << SubroutineCall::our_scopeId_XAIFName.c_str() 
       << "=\"" 
       << theSymbolReference_p->getScope().getId().c_str()
       << "\" " 
       << ActiveUseType::our_attribute_XAIFName.c_str() 
       << "=\"" 
       << ActiveUseType::toString(getContainingSubroutineCall().getActiveUse()).c_str()
       << "\">" 
       << std::endl;
    for (SubroutineCall::ConcreteArgumentPList::const_iterator i=
	   getContainingSubroutineCall().getConcreteArgumentPList().begin();
	 i!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	 ++i)
      (*i)->printXMLHierarchy(os);
    os << pm.indent() 
       << "</"
       << SubroutineCall::ourXAIFName.c_str() 
       << ">" 
       << std::endl;
    pm.releaseInstance();
  } 

  std::string 
  SubroutineCallAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterTypeChange::SubroutineCallAlg["
	<< this 
	<< ","
 	<< SubroutineCallAlgBase::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void SubroutineCallAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void SubroutineCallAlg::initExternalCall(SymbolAlg& aSymbolAlg) {
    // we need to set it all up 
    aSymbolAlg.setExternal();
    // now try to figure out if this has hand written wrappers:
    for (std::list<std::string>::const_iterator aNameListI=ourWrapperSubRoutineNameList.begin();
	 aNameListI!=ourWrapperSubRoutineNameList.end();
	 ++aNameListI) { 
      // we have 2 issues, 
      // first case sensitivity
      std::string anInputName(*aNameListI);
      std::transform(anInputName.begin(),
		     anInputName.end(), 
		     anInputName.begin(), 
		     tolower);
      std::string aSymbolName(aSymbolAlg.getContaining().getId());
      std::transform(aSymbolName.begin(),
		     aSymbolName.end(), 
		     aSymbolName.begin(), 
		     tolower);
      // second the appendices added by the 
      // fortran front end.
      if (aSymbolName.find(anInputName)!=0)
	continue;
      // the tail should just be empty or contain underscores followed by digits
      std::string aSymbolNameTail(aSymbolName.substr(anInputName.size()));
      unsigned int position=0;
      while(position<aSymbolNameTail.size() && aSymbolNameTail[position]=='_')
	position++;
      while(position<aSymbolNameTail.size() && std::isdigit(aSymbolNameTail[position]))
	position++;
      if (position!=aSymbolNameTail.size())
	// this doesn't have the proper appendix
	continue;
      // now we we know this has a handwritten wrapper.
      aSymbolAlg.setHandCodedWrapper(getContainingSubroutineCall().getSymbolReference());
      aSymbolAlg.getActivityPattern().setSize(getContainingSubroutineCall().
						getConcreteArgumentPList().
						size());
      for (SubroutineCall::ConcreteArgumentPList::const_iterator concreteArgumentPI=
	     getContainingSubroutineCall().getConcreteArgumentPList().begin();
	   concreteArgumentPI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	   ++concreteArgumentPI) { 
	if (((*concreteArgumentPI)->isArgument())?
	    (*concreteArgumentPI)->getArgument().getVariable().getActiveType():
	    false) { 
	  aSymbolAlg.getActivityPattern().trackAt((*concreteArgumentPI)->getPosition());
	} 
      }// end for iterating through all concrete arguments 
    } // end for iterating through the list if hand written wrappers 
  } 

  void SubroutineCallAlg::handleExternalCall(const BasicBlock& theBasicBlock) { 
    // get the symbol's algorithm object
    SymbolAlg& theSymbolAlg(dynamic_cast<SymbolAlg&>(getContainingSubroutineCall().
						     getSymbolReference().getSymbol().getSymbolAlgBase()));
    if(!theSymbolAlg.isExternal()) { 
      initExternalCall(theSymbolAlg);
    } // end if - initial setup.
    else { 
      // this was initialized before
      // we do a consistency check if this is a handwritten wrapper
      if (theSymbolAlg.hasHandCodedWrapper()) { 
	// make the ActivityPattern for this call
	SignaturePattern aNewPattern;
	aNewPattern.setSize(getContainingSubroutineCall().
			    getConcreteArgumentPList().
			    size());
	if (aNewPattern.getSize()!=theSymbolAlg.getActivityPattern().getSize()) { 
	  THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_1: argument count inconsistent between calls for "
				     << getContainingSubroutineCall().getSymbolReference().debug().c_str());
	} 
	for (SubroutineCall::ConcreteArgumentPList::const_iterator concreteArgumentPI=
	       getContainingSubroutineCall().getConcreteArgumentPList().begin();
	     concreteArgumentPI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	     ++concreteArgumentPI) { 
	  if (((*concreteArgumentPI)->isArgument())?
	      (*concreteArgumentPI)->getArgument().getVariable().getActiveType():
	      false) { 
	    aNewPattern.trackAt((*concreteArgumentPI)->getPosition());
	  } 
	}// end for iterating through all concrete arguments 
	if (aNewPattern!=theSymbolAlg.getActivityPattern()) { 
	  THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::handleExternalCall: inconsistent activity patterns in position(s) "
				     << aNewPattern.discrepancyPositions(theSymbolAlg.getActivityPattern()).c_str()
				     << " for call to subroutine " 
				     << getContainingSubroutineCall().getSymbolReference().debug().c_str());
	}
      }
    }
    if (!theSymbolAlg.hasHandCodedWrapper()) { 
      // we may need to add conversion routines
      for (SubroutineCall::ConcreteArgumentPList::const_iterator concreteArgumentPI=
	     getContainingSubroutineCall().getConcreteArgumentPList().begin();
	   concreteArgumentPI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	   ++concreteArgumentPI) { 
	if (((*concreteArgumentPI)->isArgument())?
	    (*concreteArgumentPI)->getArgument().getVariable().getActiveType():
	    false) {
	  MissingSubroutinesReport::reportConversion(getContainingSubroutineCall().getSymbolReference());
       	  // we need conversion to passive
	  addExternalConversion(**concreteArgumentPI,
				theBasicBlock);
	} 
      }
    }
  }

  void SubroutineCallAlg::algorithm_action_1() { 
    replaceArguments(true);
  }

  void SubroutineCallAlg::replaceArguments(bool withCopy) {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterTypeChange::SubroutineCallAlg::replaceArguments() " << debug().c_str());
    const ArgumentList::ArgumentSymbolReferencePList* anArgumentSymbolReferencePList_p(0); 
    const ControlFlowGraph* aCFG_p(0); 
    const BasicBlock& theBasicBlock(BasicBlockAlgParameter::instance().get().getContaining());  // set in BasicBlockAlg::algorithm_action_1
    try { 
      // get the formal argument list; 
      anArgumentSymbolReferencePList_p=
	&((aCFG_p=&(ConceptuallyStaticInstances::instance()->
		    getCallGraph().
		    getSubroutineBySymbolReference(getContainingSubroutineCall().getSymbolReference()).
		    getControlFlowGraph()))->
	  getArgumentList().
	  getArgumentSymbolReferencePList());
    } 
    catch (const SubroutineNotFoundException& e) {
      MissingSubroutinesReport::report(e);
      handleExternalCall(theBasicBlock);
      return;
    } // end catch
    if (anArgumentSymbolReferencePList_p->size()!=getContainingSubroutineCall().getConcreteArgumentPList().size())
      THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_1: argument count mismatch ("
				 << anArgumentSymbolReferencePList_p->size() 
				 << " formal vs. "
				 << getContainingSubroutineCall().getConcreteArgumentPList().size()
				 << " concrete ) for "
				 << getContainingSubroutineCall().getSymbolReference().debug().c_str());
    ControlFlowGraphAlg& theControlFlowGraphAlg(dynamic_cast<ControlFlowGraphAlg&>(aCFG_p->getControlFlowGraphAlgBase()));
    for (SubroutineCall::ConcreteArgumentPList::const_iterator concreteArgumentPI=
	   getContainingSubroutineCall().getConcreteArgumentPList().begin();
	 concreteArgumentPI!=getContainingSubroutineCall().getConcreteArgumentPList().end();
	 ++concreteArgumentPI) { 
      bool concreteArgumentActive=((*concreteArgumentPI)->isArgument())?
	(*concreteArgumentPI)->getArgument().getVariable().getActiveType():false;
      bool formalArgumentActive=false; 
      ArgumentList::ArgumentSymbolReferencePList::const_iterator formalArgumentPI;
      for (formalArgumentPI=anArgumentSymbolReferencePList_p->begin();
	   formalArgumentPI!=anArgumentSymbolReferencePList_p->end();
	   ++formalArgumentPI) { 
	if((*concreteArgumentPI)->getPosition()==(*formalArgumentPI)->getPosition()) 
	  break;
      }
      if (formalArgumentPI==anArgumentSymbolReferencePList_p->end()) { 
	THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_1: cannot find formal argument for position "
				   << (*concreteArgumentPI)->getPosition()
				   << " for "
				   << getContainingSubroutineCall().getSymbolReference().debug().c_str());
      }
      formalArgumentActive=(*formalArgumentPI)->getSymbol().getActiveTypeFlag();
      if (concreteArgumentActive!=formalArgumentActive) { 
	addConversion(**concreteArgumentPI,
		      **formalArgumentPI,
		      theBasicBlock,
		      withCopy);
      } 
      if ((*concreteArgumentPI)->isConstant()
	  && 
	  !formalArgumentActive)
	// if the argument is constant but the formal is active we 
	// need a conversion so it no longer is constant
	theControlFlowGraphAlg.getSomewhereConstPattern().trackAt((*concreteArgumentPI)->getPosition());
      if (!(*concreteArgumentPI)->isConstant())
	theControlFlowGraphAlg.getSomewhereVariablePattern().trackAt((*concreteArgumentPI)->getPosition());
    }// end for 
  } 
  
  std::string SubroutineCallAlg::giveCallName(bool concreteArgumentActive,
					      const SymbolReference &aTempSymbolReference,
					      short shapeOffset,
					      bool prior) const { 
    std::string aSubroutineName("convert_");
    if (prior && concreteArgumentActive 
	|| 
	!prior && !concreteArgumentActive)
      aSubroutineName.append("a2p_");
    else
      aSubroutineName.append("p2a_");
    aSubroutineName.append(SymbolShape::toString(SymbolShape::offset(aTempSymbolReference.getSymbol().getSymbolShape(),
								     shapeOffset)));
    return aSubroutineName;
  } 

  void SubroutineCallAlg::addConversion(const ConcreteArgument& theConcreteArgument,
					const ArgumentSymbolReference& aFormalArgumentSymbolReference,
					const BasicBlock& theBasicBlock,
					bool withCopy) { 
    short formalMinusConcreteDims(0);
    // we observe the following cases: 
    // 1. exact shape match where formalMinusConcreteDims == 0 
    // 2. concrete has lesser shape than the formal, i.e. formalMinusConcreteDims > 0 
    //     call foo(vector,...) 
    //     subroutine foo(matrix,...)
    //       and the dimension is passed on to foo 
    //       and would refer to matrix(i,1) to reflect that only a vector was passed
    // 3. formal has lesser shape than the concrete, i.e. formalMinusConcreteDims < 0 
    //    a: slicing e.g. a  call foo (vector(i))  for a scalar concrete argument
    //    b: implicit reshaping, e.g. a call foo (matrix) for a vector concrete argument
    //       where it is assumed that 'matrix' occupies a consecutive 'n x m' bit in memory that can 
    //       be addressed by vector indices up to n*m
    //    in case a: we just convert the reduced data, i.e. vector(i)
    //    in case b: we need to convert all concrete data
    //    THE PROBLEM: it is not clear how to reliably distinguish cases a and b, in 
    //                 particular when we have non-constant dimension expressions
    if (theConcreteArgument.isArgument()) { 
      // it is possible that the concrete argument has more or less dimensions than the actual one and 
      // the conversion logic needs to address this problem
      formalMinusConcreteDims=SymbolShape::difference(aFormalArgumentSymbolReference.
						      getSymbol().
						      getSymbolShape(),
						      theConcreteArgument.
						      getArgument().
						      getVariable().
						      getVariableSymbolReference().
						      getSymbol().
						      getSymbolShape());
    }
    short shapeOffsetFromFormal(0);
    bool copyEntireArray=false;
    if (formalMinusConcreteDims>0)
      shapeOffsetFromFormal=-formalMinusConcreteDims;
    else { 
      if (formalMinusConcreteDims<0 
	  && 
	  aFormalArgumentSymbolReference.getSymbol().getSymbolShape()!=SymbolShape::SCALAR) { 
	shapeOffsetFromFormal=-formalMinusConcreteDims;
	copyEntireArray=true;
	DBG_MACRO(DbgGroup::DATA, "SubroutineCallAlg::addConversion: " 
		  << " cannot decide if shape offset "
		  << shapeOffsetFromFormal 
		  << " for " 
		  << theConcreteArgument.getArgument().getVariable().getVariableSymbolReference().getSymbol().plainName().c_str()
		  << " in call to " 
		  << getContainingSubroutineCall().getSymbolReference().getSymbol().plainName().c_str()
		  << " on line " 
		  << getContainingSubroutineCall().getLineNumber()
		  << " implies slicing or reshaping so we need to do a full copy");
      }
    }
    // this is the extra temporary that replaces the original argument
    Variable theTempVar;
    makeTempSymbol(theConcreteArgument,
		   aFormalArgumentSymbolReference.getSymbol(),
		   aFormalArgumentSymbolReference.getScope(),
		   theTempVar,
		   shapeOffsetFromFormal,
		   false);
    ConcreteArgumentAlg& theConcreteArgumentAlg(dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    theConcreteArgumentAlg.makeReplacement(theTempVar,copyEntireArray);
    if (!withCopy)
      return; 
    // prior call
    std::string 
      aSubroutineName(giveCallName((theConcreteArgument.isArgument())?theConcreteArgument.getArgument().getVariable().getActiveType():false,
				   aFormalArgumentSymbolReference,
				   shapeOffsetFromFormal,
				   true));
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
      thePriorCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myPriorAdjustmentsList.push_back(thePriorCall_p);
    thePriorCall_p->setId("SubroutineCallAlg::addConversion prior");
    theTempVar.copyMyselfInto(thePriorCall_p->addConcreteArgument(1).getArgument().getVariable());
    ConcreteArgument& theSecondPriorConcreteArg(thePriorCall_p->addConcreteArgument(2));
    theConcreteArgument.copyMyselfInto(theSecondPriorConcreteArg,!copyEntireArray);
    theConcreteArgumentAlg.setPriorConversionConcreteArgument(theSecondPriorConcreteArg);
    if (theConcreteArgument.isArgument()) { 
      // may have to adjust upper bounds
      if (!copyEntireArray)
	theSecondPriorConcreteArg.getArgument().getVariable().adjustUpperBounds((int)(aFormalArgumentSymbolReference.
										      getSymbol().	
										      getSymbolShape())+shapeOffsetFromFormal);
      // post call only if it is not a constant.
      aSubroutineName=giveCallName((theConcreteArgument.isArgument())?theConcreteArgument.getArgument().getVariable().getActiveType():false,
				   aFormalArgumentSymbolReference,
				   shapeOffsetFromFormal,
				   false);
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
	thePostCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
      myPostAdjustmentsList.push_back(thePostCall_p);
      thePostCall_p->setId("SubroutineCallAlg::addConversion post");
      ConcreteArgument& theFirstPostConcreteArg(thePostCall_p->addConcreteArgument(1));
      theConcreteArgumentAlg.setPostConversionConcreteArgument(theFirstPostConcreteArg);
      Variable& theInlineVariablePostRes(theFirstPostConcreteArg.getArgument().getVariable());
      theConcreteArgument.getArgument().getVariable().copyMyselfInto(theInlineVariablePostRes,!copyEntireArray);
      if (!copyEntireArray)
	theInlineVariablePostRes.adjustUpperBounds((int)(aFormalArgumentSymbolReference.
							 getSymbol().	
							 getSymbolShape())+shapeOffsetFromFormal);
      Variable& theInlineVariablePostArg(thePostCall_p->addConcreteArgument(2).getArgument().getVariable());
      theTempVar.copyMyselfInto(theInlineVariablePostArg);
      if (!copyEntireArray && theConcreteArgument.getArgument().getVariable().hasArrayAccess()) {
	handleArrayAccessIndices(theConcreteArgument,
				 theBasicBlock);
      }
    }
  } 
  

  void SubroutineCallAlg::addExternalConversion(const ConcreteArgument& theConcreteArgument,
						const BasicBlock& theBasicBlock) { 
    const SymbolReference& theActualSymbolReference(theConcreteArgument.getArgument().getVariable().
						    getVariableSymbolReference());
    // prior call
    std::string 
      aSubroutineName(giveCallName(true, // the concrete parameter is implied to be active
				   theActualSymbolReference, // we don't have a formal parameter here 
				   0,
				   true));
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
      thePriorCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myPriorAdjustmentsList.push_back(thePriorCall_p);
    thePriorCall_p->setId("SubroutineCallAlg::addExternalConversion prior");
    // this is the extra temporary that replaces the original argument
    Variable& theTempVar(thePriorCall_p->addConcreteArgument(1).getArgument().getVariable());
    makeTempSymbol(theConcreteArgument,
		   theActualSymbolReference.getSymbol(),
		   theActualSymbolReference.getScope(),
		   theTempVar,
		   0,
		   true);
    ConcreteArgument& theSecondPriorConcreteArg(thePriorCall_p->addConcreteArgument(2));
    theConcreteArgument.copyMyselfInto(theSecondPriorConcreteArg,false);
    ConcreteArgumentAlg& theConcreteArgumentAlg(dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    theConcreteArgumentAlg.makeReplacement(theTempVar,true);
    theConcreteArgumentAlg.setPriorConversionConcreteArgument(theSecondPriorConcreteArg);
    if (theConcreteArgument.isArgument()) {
//       theSecondPriorConcreteArg.getArgument().getVariable().adjustUpperBounds((int)(theConcreteArgument.
// 										    getArgument().
// 										    getVariable().
// 										    getVariableSymbolReference().
// 										    getSymbol().
// 										    getSymbolShape()));
      // post call only if not a constant
      aSubroutineName=giveCallName(true, // the concrete parameter is implied to be active
				   theActualSymbolReference, // we don't have a formal parameter here 
				   0,
				   false);
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
	thePostCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
      myPostAdjustmentsList.push_back(thePostCall_p);
      thePostCall_p->setId("SubroutineCallAlg::addExternalConversion post");
      ConcreteArgument& theFirstPostConcreteArg(thePostCall_p->addConcreteArgument(1));
      theConcreteArgumentAlg.setPostConversionConcreteArgument(theFirstPostConcreteArg);
      Variable& theInlineVariablePostRes(theFirstPostConcreteArg.getArgument().getVariable());
      theConcreteArgument.getArgument().getVariable().copyMyselfInto(theInlineVariablePostRes,false);
//       theInlineVariablePostRes.adjustUpperBounds((int)(theConcreteArgument.
// 						       getArgument().
// 						       getVariable().
// 						       getVariableSymbolReference().
// 						       getSymbol().
// 						       getSymbolShape()));
      Variable& theInlineVariablePostArg(thePostCall_p->addConcreteArgument(2).getArgument().getVariable());
      theTempVar.copyMyselfInto(theInlineVariablePostArg);
      if (theConcreteArgument.getArgument().getVariable().hasArrayAccess()) {
	handleArrayAccessIndices(theConcreteArgument,
				 theBasicBlock);
      }
    }
  } 
  
  void SubroutineCallAlg::makeTempSymbol(const ConcreteArgument& theConcreteArgument,
					 const Symbol& formalArgumentSymbol,
					 const Scope&, // formalArgumentScope  when we finally get around it
					 Variable& aVariable,
					 int shapeOffsetFromFormal,
					 bool forcePassive) { 
    // create a new symbol and add a new VariableSymbolReference in the Variable
    static std::list<std::string> reportShapeMismatchOnce;
    Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->getCallGraph().getScopeTree().getGlobalScope());
    Symbol& theNewVariableSymbol(theGlobalScope.getSymbolTable().
				 addUniqueAuxSymbol(SymbolKind::VARIABLE,
						    formalArgumentSymbol.getSymbolType(),
						    SymbolShape::offset(formalArgumentSymbol.getSymbolShape(),
									shapeOffsetFromFormal),
						    (forcePassive)?false:formalArgumentSymbol.getActiveTypeFlag()));
    theNewVariableSymbol.setFrontEndType(formalArgumentSymbol.getFrontEndType());
    VariableSymbolReference* theNewVariableSymbolReference_p(new VariableSymbolReference(theNewVariableSymbol,
											 theGlobalScope));
    if (theConcreteArgument.isArgument()){ 
      // preserve dimension information from the concrete argument if any:
      const Symbol& theConcreteArgumentSymbol(theConcreteArgument.getArgument().getVariable().getVariableSymbolReference().getSymbol());
      if (theConcreteArgumentSymbol.hasDimensionBounds()) { 
	const Symbol::DimensionBoundsPList& aDimensionBoundsPList(theConcreteArgumentSymbol.getDimensionBoundsPList());
	if (shapeOffsetFromFormal) { 
	  // this can be the case in Fortran where we pass in a n-tensor for 
	  // an n+k tensor formal argument.  The k missing dimension then 
	  // have to be 1 except it is unclear which of the n+k are the missing ones
	  std::ostringstream ostr;
	  ostr << "SubroutineCallAlg::makeTempSymbol: " 
	       << "trying to adjust for shape mismatch: actual parameter "
	       << theConcreteArgument.getArgument().getVariable().getVariableSymbolReference().getSymbol().plainName().c_str()
	       << " has ";
	  if (shapeOffsetFromFormal>0) { 
	    ostr << shapeOffsetFromFormal;
	    ostr << " extra";
	  }
	  else { 
	    ostr << -shapeOffsetFromFormal;
	    ostr << " missing";
	  } 
	  ostr << " dimension(s) in call to " 
	       << getContainingSubroutineCall().getSymbolReference().getSymbol().plainName().c_str();
	  std::list<std::string>::iterator i=reportShapeMismatchOnce.begin();
	  for (;
	       i!=reportShapeMismatchOnce.end();
	       ++i) { 
	    if (ostr.str().compare(*i)==0) { 
	      break;
	    }
	  }
	  if (i==reportShapeMismatchOnce.end()) { 
	    reportShapeMismatchOnce.push_back(ostr.str());
	    ostr << " on line " 
		 << getContainingSubroutineCall().getLineNumber();
	    DBG_MACRO(DbgGroup::ERROR, ostr.str().c_str());
	  }
	}
	switch(DimensionBounds::getIndexOrder()) { 
	case IndexOrder::ROWMAJOR: // c and c++
	  for (Symbol::DimensionBoundsPList::const_iterator li=aDimensionBoundsPList.begin();
	       (li!=aDimensionBoundsPList.end());
	       ++li, ++shapeOffsetFromFormal) { 
	    if (shapeOffsetFromFormal>=0)
	      // e.g. between the three-tensor vs vector the reduction is 2 so we skip over the 2 leftmost dimensions.
	      theNewVariableSymbol.addDimensionBounds((*li)->getLower(),
						      (*li)->getUpper());
	  }
	  break;
	case IndexOrder::COLUMNMAJOR: { // fortran
	  for (Symbol::DimensionBoundsPList::const_iterator li=aDimensionBoundsPList.begin();
	       (li!=aDimensionBoundsPList.end());
	       ++li) { 
	    theNewVariableSymbol.addDimensionBounds((*li)->getLower(),
						    (*li)->getUpper());
	  }
	  break;
	}     
	default:
	  THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::makeTempSymbol: no logic for "
				     << IndexOrder::toString(DimensionBounds::getIndexOrder()).c_str());
	  break;
	}
      }
    }
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterTypeChange::SubroutineCallAlg::makeTempVariable");
    aVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    aVariable.getAliasMapKey().setTemporary();
    aVariable.getDuUdMapKey().setTemporary();
  } // end SubroutineCallAlg::makeTempSymbol()

  void SubroutineCallAlg::addWrapperNames(const std::string& theSpaceSeparatedNames) { 
    std::string::size_type startPosition=0,endPosition=0;
    std::string::size_type totalSize(theSpaceSeparatedNames.size());
    while (startPosition<=totalSize && endPosition<=totalSize) { 
      startPosition=theSpaceSeparatedNames.find_first_not_of(' ',startPosition);
      endPosition=theSpaceSeparatedNames.find_first_of(' ',startPosition);
      ourWrapperSubRoutineNameList.push_back(theSpaceSeparatedNames.substr(startPosition,
									   endPosition));
      startPosition=endPosition;
    } 
  }

  void SubroutineCallAlg::handleArrayAccessIndices(const ConcreteArgument& theConcreteArgument,
						   const BasicBlock& theBasicBlock) {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterTypeChange::SubroutineCallAlg::handleArrayAccessIndices() " << debug().c_str());
    // get the argument algorithm instance 
    ConcreteArgumentAlg& theConcreteArgumentAlg(dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    if (!theConcreteArgumentAlg.hasPostConversionConcreteArgument()) { 
      // no post conversion, nothing further to be done here
      return;
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
	if (!theIndexExpression.isConstant()) {
	  Expression::CArgumentPList listToBeAppended;
	  theIndexExpression.appendArguments(listToBeAppended);
	  for (Expression::CArgumentPList::const_iterator argumentI=listToBeAppended.begin();
	       argumentI!=listToBeAppended.end();
	       ++argumentI) { 
	    if (!mySaveValuesAcrossForTypeChange.isSavedAcross(**argumentI)
		&& 
		(dynamic_cast<const SubroutineCall&>(getContaining())).overwrites((*argumentI)->getVariable())) {
	      if (theBasicBlock.getReversalType()==ForLoopReversalType::EXPLICIT) { 
	        // for sanity check if we a re about to change a known loop variable 
		// in this call which we forbid
		const ControlFlowGraphVertex::VariablePList& theKnownLoopVariables(theBasicBlock.getKnownLoopVariables());
		for (ControlFlowGraphVertex::VariablePList::const_iterator knownVarsI=theKnownLoopVariables.begin();
		     knownVarsI!=theKnownLoopVariables.end();
		     ++knownVarsI) {
		  if ((*argumentI)->getVariable().equivalentTo(**knownVarsI)) 
		    THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::handleArrayAccessIndices: analysis determines overwrite of simple loop variable "
					       << (*argumentI)->getVariable().getVariableSymbolReference().getSymbol().plainName().c_str()
					       << " in call to "
					       << getContainingSubroutineCall().getSymbolReference().getSymbol().plainName().c_str());
		}
	      }
	      // save the value of the Argument before the subroutine call
	      mySaveValuesAcrossForTypeChange.saveValue(**argumentI,theBasicBlock);
	    }
	  }
	}
      }
    }
    // now we are done going through all the index expressions. 
    // we need to replace all the saved variable values in the post conversion. 
    if (theConcreteArgumentAlg.getPostConversionConcreteArgument().getArgument().getVariable().hasArrayAccess()) { 
      ArrayAccess::IndexTripletListType& thePostReplacementIndexTripletList(theConcreteArgumentAlg.getPostConversionConcreteArgument().getArgument().getVariable().getArrayAccess().getIndexTripletList());
      for (ArrayAccess::IndexTripletListType::iterator thePostReplacementIndexTripletListI=thePostReplacementIndexTripletList.begin();
	   thePostReplacementIndexTripletListI!=thePostReplacementIndexTripletList.end();
	   ++thePostReplacementIndexTripletListI) {
	for (IndexTriplet::IndexPairList::iterator anIndexPairListI=(*thePostReplacementIndexTripletListI)->getIndexPairList().begin();
	     anIndexPairListI!=(*thePostReplacementIndexTripletListI)->getIndexPairList().end();
	     ++anIndexPairListI) {
	  Expression& theIndexExpression(*((*anIndexPairListI).second));
	  theIndexExpression.replaceVariables(mySaveValuesAcrossForTypeChange.getReplacementPairsList());
	}
      }
    }
  } // end of SubroutineCallAlg::handleArrayAccessIndices

} // end namespace xaifBoosterTypeChange

