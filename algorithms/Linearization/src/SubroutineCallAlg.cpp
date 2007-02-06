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

#include "xaifBooster/algorithms/Linearization/inc/SubroutineCallAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/BasicBlockAlgParameter.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ConcreteArgumentAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/MissingSubroutinesReport.hpp"
#include "xaifBooster/algorithms/Linearization/inc/SymbolAlg.hpp"

namespace xaifBoosterLinearization {  

  std::list<std::string> SubroutineCallAlg::ourWrapperSubRoutineNameList;

  SubroutineCallAlg::SubroutineCallAlg(const SubroutineCall& theContainingSubroutineCall) : 
    SubroutineCallAlgBase(theContainingSubroutineCall) { 
  }

  SubroutineCallAlg::~SubroutineCallAlg() { 
    for (PlainBasicBlock::BasicBlockElementList::iterator aBasicBlockElementListI=
	   myPriorToCallIndexAssignments.begin();
	 aBasicBlockElementListI!=myPriorToCallIndexAssignments.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI)
	delete *aBasicBlockElementListI;
    }
  }

  void SubroutineCallAlg::printXMLHierarchy(std::ostream& os) const { 
    // assignments prior to the call
    for (PlainBasicBlock::BasicBlockElementList::const_iterator aBasicBlockElementListI
	   =myPriorToCallIndexAssignments.begin();
	 aBasicBlockElementListI!=myPriorToCallIndexAssignments.end();
	 ++aBasicBlockElementListI) {
      if (*aBasicBlockElementListI) { 
	(*aBasicBlockElementListI)->printXMLHierarchy(os);
      } 
    }
    printXMLHierarchyImplWithAdjustments(os);
  }

  void SubroutineCallAlg::printXMLHierarchyImplWithAdjustments(std::ostream& os) const { 
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
    out << "xaifBoosterLinearization::SubroutineCallAlg["
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
	  aSymbolAlg.getActivityPattern().setActive((*concreteArgumentPI)->getPosition());
	} 
      }// end for iterating through all concrete arguments 
    } // end for iterating through the list if hand written wrappers 
  } 

  void SubroutineCallAlg::handleExternalCall(Scope& theBasicBlockScope) { 
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
	ActivityPattern aNewPattern;
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
	    aNewPattern.setActive((*concreteArgumentPI)->getPosition());
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
	  // we need conversion to passive
	  addExternalConversion(**concreteArgumentPI,
				theBasicBlockScope);
	} 
      }
    }
  }

  void SubroutineCallAlg::algorithm_action_1() { 
    const ArgumentList::ArgumentSymbolReferencePList* anArgumentSymbolReferencePList_p(0); 
    Scope& theBasicBlockScope(BasicBlockAlgParameter::instance().get().getContaining().getScope());  // in SubroutineCallAlg::algorithm_action_1
    try { 
      // get the formal argument list; 
      anArgumentSymbolReferencePList_p=
	&(ConceptuallyStaticInstances::instance()->
	  getCallGraph().
	  getSubroutineBySymbolReference(getContainingSubroutineCall().getSymbolReference()).
	  getControlFlowGraph().
	  getArgumentList().
	  getArgumentSymbolReferencePList());
    } 
    catch (const SubroutineNotFoundException& e) {
      MissingSubroutinesReport::report(e);
      handleExternalCall(theBasicBlockScope);
      return;
    } // end catch
    if (anArgumentSymbolReferencePList_p->size()!=getContainingSubroutineCall().getConcreteArgumentPList().size())
      THROW_LOGICEXCEPTION_MACRO("SubroutineCallAlg::algorithm_action_1: argument count mismatch ("
				 << anArgumentSymbolReferencePList_p->size() 
				 << " formal vs. "
				 << getContainingSubroutineCall().getConcreteArgumentPList().size()
				 << " concrete ) for "
				 << getContainingSubroutineCall().getSymbolReference().debug().c_str());
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
		      theBasicBlockScope);
      } 
    }// end for 
  }

  std::string SubroutineCallAlg::giveCallName(bool concreteArgumentActive,
					      const SymbolReference &aTempSymbolReference,
					      unsigned int missingDimensions,
					      bool prior) const { 
    std::string aSubroutineName("convert_");
    if (prior && concreteArgumentActive 
	|| 
	!prior && !concreteArgumentActive)
      aSubroutineName.append("a2p_");
    else
      aSubroutineName.append("p2a_");
    aSubroutineName.append(SymbolShape::toString(SymbolShape::lesserShape(aTempSymbolReference.getSymbol().getSymbolShape(),
									  missingDimensions)));
    return aSubroutineName;
  } 

  void SubroutineCallAlg::addConversion(const ConcreteArgument& theConcreteArgument,
					const ArgumentSymbolReference& aFormalArgumentSymbolReference,
					Scope& theBasicBlockScope) { 
    unsigned int missingDimensions(0);
    int formalMinusConcreteDims(0);
    if (theConcreteArgument.isArgument()) { 
      // it is possible that the concrete argument has fewer dimensions than the actual one and 
      // the user logic works around this problem by inserting a 1 in the missing indices. 
      // in this case we get a positive number
      formalMinusConcreteDims=SymbolShape::difference(aFormalArgumentSymbolReference.
									getSymbol().
									getSymbolShape(),
									theConcreteArgument.
									getArgument().
									getVariable().
									getVariableSymbolReference().
									getSymbol().
									getSymbolShape());
      // slicing can also lead to the case that the formal argument has fewer dimensions than the 
      // concrete one but rather than a negative number we reset this to 0. 
      if (formalMinusConcreteDims<0)
	missingDimensions=0;
      else 
	missingDimensions=formalMinusConcreteDims;
    }
    // prior call
    std::string 
      aSubroutineName(giveCallName((theConcreteArgument.isArgument())?theConcreteArgument.getArgument().getVariable().getActiveType():false,
				   aFormalArgumentSymbolReference,
				   missingDimensions,
				   true));
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
      thePriorCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
    myPriorAdjustmentsList.push_back(thePriorCall_p);
    thePriorCall_p->setId("SubroutineCallAlg::addConversion prior");
    // this is the extra temporary that replaces the original argument
    Variable& theTempVar(thePriorCall_p->addConcreteArgument(1).getArgument().getVariable());
    makeTempSymbol(theConcreteArgument,
		   aFormalArgumentSymbolReference.getSymbol(),
		   aFormalArgumentSymbolReference.getScope(),
		   theTempVar,
		   formalMinusConcreteDims,
		   false);
    ConcreteArgument& theSecondPriorConcreteArg(thePriorCall_p->addConcreteArgument(2));
    theConcreteArgument.copyMyselfInto(theSecondPriorConcreteArg);
    ConcreteArgumentAlg& theConcreteArgumentAlg(dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    theConcreteArgumentAlg.makeReplacement(theTempVar);
    theConcreteArgumentAlg.setPriorConversionConcreteArgument(theSecondPriorConcreteArg);
    if (theConcreteArgument.isArgument()) { // no point in copying a constant back.
      // post call:
      aSubroutineName=giveCallName((theConcreteArgument.isArgument())?theConcreteArgument.getArgument().getVariable().getActiveType():false,
				   aFormalArgumentSymbolReference,
				   missingDimensions,
				   false);
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
	thePostCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
      myPostAdjustmentsList.push_back(thePostCall_p);
      thePostCall_p->setId("SubroutineCallAlg::addConversion post");
      ConcreteArgument& theFirstPostConcreteArg(thePostCall_p->addConcreteArgument(1));
      theConcreteArgumentAlg.setPostConversionConcreteArgument(theFirstPostConcreteArg);
      Variable& theInlineVariablePostRes(theFirstPostConcreteArg.getArgument().getVariable());
      theConcreteArgument.getArgument().getVariable().copyMyselfInto(theInlineVariablePostRes);
      Variable& theInlineVariablePostArg(thePostCall_p->addConcreteArgument(2).getArgument().getVariable());
      theTempVar.copyMyselfInto(theInlineVariablePostArg);
      if (theConcreteArgument.getArgument().getVariable().hasArrayAccess()) {
	handleArrayAccessIndices(theConcreteArgument,
				 theBasicBlockScope);
      }
    }
  } 
  

  void SubroutineCallAlg::addExternalConversion(const ConcreteArgument& theConcreteArgument,
						Scope& theBasicBlockScope) { 
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
    thePriorCall_p->setId("SubroutineCallAlg::addConversion prior");
    // this is the extra temporary that replaces the original argument
    Variable& theTempVar(thePriorCall_p->addConcreteArgument(1).getArgument().getVariable());
    makeTempSymbol(theConcreteArgument,
		   theActualSymbolReference.getSymbol(),
		   theActualSymbolReference.getScope(),
		   theTempVar,
		   0,
		   true);
    ConcreteArgument& theSecondPriorConcreteArg(thePriorCall_p->addConcreteArgument(2));
    theConcreteArgument.copyMyselfInto(theSecondPriorConcreteArg);
    ConcreteArgumentAlg& theConcreteArgumentAlg(dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.getConcreteArgumentAlgBase()));
    theConcreteArgumentAlg.makeReplacement(theTempVar);
    theConcreteArgumentAlg.setPriorConversionConcreteArgument(theSecondPriorConcreteArg);
    if (theConcreteArgument.isArgument()) { // no point in copying a constant back.
      // post call:
      aSubroutineName=giveCallName(true, // the concrete parameter is implied to be active
				   theActualSymbolReference, // we don't have a formal parameter here 
				   0,
				   false);
      xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* 
	thePostCall_p(new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall(aSubroutineName));
      myPostAdjustmentsList.push_back(thePostCall_p);
      thePostCall_p->setId("SubroutineCallAlg::addConversion post");
      ConcreteArgument& theFirstPostConcreteArg(thePostCall_p->addConcreteArgument(1));
      theConcreteArgumentAlg.setPostConversionConcreteArgument(theFirstPostConcreteArg);
      Variable& theInlineVariablePostRes(theFirstPostConcreteArg.getArgument().getVariable());
      theConcreteArgument.getArgument().getVariable().copyMyselfInto(theInlineVariablePostRes);
      Variable& theInlineVariablePostArg(thePostCall_p->addConcreteArgument(2).getArgument().getVariable());
      theTempVar.copyMyselfInto(theInlineVariablePostArg);
      if (theConcreteArgument.getArgument().getVariable().hasArrayAccess()) {
	handleArrayAccessIndices(theConcreteArgument,
				 theBasicBlockScope);
      }
    }
  } 
  
  void SubroutineCallAlg::makeTempSymbol(const ConcreteArgument& theConcreteArgument,
					 const Symbol& formalArgumentSymbol,
					 const Scope&, // formalArgumentScope  when we finally get around it
					 Variable& aVariable,
					 int formalMinusConcreteDims,
					 bool forcePassive) { 
    // create a new symbol and add a new VariableSymbolReference in the Variable
    Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getScopeTree().getGlobalScope());
    Symbol& theNewVariableSymbol(theGlobalScope.
				 getSymbolTable().
				 addUniqueAuxSymbol(SymbolKind::VARIABLE,
						    formalArgumentSymbol.getSymbolType(),
						    SymbolShape::lesserShape(formalArgumentSymbol.getSymbolShape(),
									     (formalMinusConcreteDims<0)?0:formalMinusConcreteDims),
						    (forcePassive)?false:formalArgumentSymbol.getActiveTypeFlag()));
    VariableSymbolReference* 
      theNewVariableSymbolReference_p(new VariableSymbolReference(theNewVariableSymbol,
								  theGlobalScope));
    if (theConcreteArgument.isArgument()){ 
      // preserve dimension information from the concrete argument if any:
      const Symbol& theConcreteArgumentSymbol(theConcreteArgument.
					      getArgument().
					      getVariable().
					      getVariableSymbolReference().
					      getSymbol());
      if (theConcreteArgumentSymbol.hasDimensionBounds()) { 
	const Symbol::DimensionBoundsPList& aDimensionBoundsPList(theConcreteArgumentSymbol.getDimensionBoundsPList());
	if (formalMinusConcreteDims>0) { 
	  // this can be the case in Fortran where we pass in a n-tensor for 
	  // and n+k tensor formal argument.  The k missing dimension then 
	  // have to be 1 except it is unclear which of the n+k are the missing ones
	  DBG_MACRO(DbgGroup::ERROR, "SubroutineCallAlg::makeTempSymbol: " 
		    << formalMinusConcreteDims 
		    << " missing dimensions for " 
		    << theConcreteArgument.getArgument().getVariable().getVariableSymbolReference().getSymbol().getId().c_str()
		    << " in call to " 
		    << getContainingSubroutineCall().getSymbolReference().getSymbol().getId().c_str());
	}
	switch(DimensionBounds::getIndexOrder()) { 
	case IndexOrder::ROWMAJOR: // c and c++
	  for (Symbol::DimensionBoundsPList::const_iterator li=aDimensionBoundsPList.begin();
	       (li!=aDimensionBoundsPList.end());
	       ++li, ++formalMinusConcreteDims) { 
	    if (formalMinusConcreteDims>=0)
	      // e.g. between the three-tensor vs vector the reduction is 2 so we skip over the 2 leftmost dimensions.
	      theNewVariableSymbol.addDimensionBounds((*li)->getLower(),
						      (*li)->getUpper());
	  }
	  break;
	case IndexOrder::COLUMNMAJOR: { // fortran
	  int usedDimensions=aDimensionBoundsPList.size()+formalMinusConcreteDims;
	  // formalMinusConcreteDims is negative if we are supposed to use fewer dimensions 
	  // of the concrete Argument.
	  for (Symbol::DimensionBoundsPList::const_iterator li=aDimensionBoundsPList.begin();
	       (li!=aDimensionBoundsPList.end());
	       ++li,--usedDimensions) { 
	    if (usedDimensions>0)
	      // e.g. between the three-tensor vs vector the reduction is 2 so we skip over the 2 rightmost dimensions.
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
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterLinearization::SubroutineCallAlg::makeTempVariable");
    aVariable.supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    aVariable.getAliasMapKey().setTemporary();
    aVariable.getDuUdMapKey().setTemporary();
  } 

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
						   Scope& theBasicBlockScope) { 
    // get the argument algorithm instance 
    ConcreteArgumentAlg& theConcreteArgumentAlg(dynamic_cast<ConcreteArgumentAlg&>(theConcreteArgument.
										   getConcreteArgumentAlgBase()));
    // one potential extra replacement spot:
    ArrayAccess::IndexListType *thePostReplacementIndexListP=0;
    ArrayAccess::IndexListType::iterator thePostReplacementIndexListI;
    if (theConcreteArgumentAlg.hasPostConversionConcreteArgument()) { 
      thePostReplacementIndexListP=&(theConcreteArgumentAlg.getPostConversionConcreteArgument().getArgument().getVariable().getArrayAccess().getIndexList());
      thePostReplacementIndexListI=thePostReplacementIndexListP->begin();
    }
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
	// clear out the old index expression
	if (thePostReplacementIndexListP)
	  (*thePostReplacementIndexListI)->clear();
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
	theNewVariableSymbolReference_p->setAnnotation("xaifBoosterLinearization::SubroutineCallAlg::handleArrayAccessIndices");
	// pass it on to the LHS and relinquish ownership
	theIndexExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
	theIndexExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
	theIndexExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
	// set the RHS
	theIndexExpression.copyMyselfInto(theIndexExpressionAssignment_p->getRHS(),false,false);
	if (thePostReplacementIndexListP) {
	  Argument& theIndexArgument(*new Argument);
	  // relinquish ownership and it to the index expression
	  // that we had previously cleared (see above)
	  (*thePostReplacementIndexListI)->supplyAndAddVertexInstance(theIndexArgument);
	  theIndexArgument.setId(1);
	  theIndexExpressionAssignment_p->getLHS().copyMyselfInto(theIndexArgument.getVariable());
	}
      }  // end else has more then one vertex   
      // advance the other iterator if needed
      if (thePostReplacementIndexListP)
	++thePostReplacementIndexListI;
    } // end for index
  } // end of SubroutineCallAlg::handleArrayAccessIndices

} // end of namespace 
