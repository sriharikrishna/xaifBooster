#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/AliasActivityMap.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpression.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionVertex.hpp"

#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

namespace xaifBoosterLinearization { 

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    AssignmentAlgBase(theContainingAssignment),
    myHaveLinearizedRightHandSide(false),
    myDelayedLHSAssignment_p(0),
    myActiveFlag(true),
    myLHSActiveFlag(true) { 
  }

  std::string 
  AssignmentAlg::debug() const { 
    return std::string("AssignmentAlg");
  }

  void
  AssignmentAlg::printXMLHierarchy(std::ostream& os) const { 
    if (mySSAReplacementAssignmentList.size()) { 
      for (std::list<Assignment*>::const_iterator li=mySSAReplacementAssignmentList.begin();
	   li!=mySSAReplacementAssignmentList.end();
	   ++li)
	(*li)->printXMLHierarchy(os);
    }
    else { 
      getContaining().printXMLHierarchyImpl(os);
    }
    if (myHaveLinearizedRightHandSide) { 
      // print edge annotations for partial 
      // assignments
      const Expression& theRHS(getLinearizedRightHandSide());
      // we have to print them in order, so: 
      // find maximal node: 
      Expression::ConstVertexIteratorPair p(theRHS.vertices());
      Expression::ConstVertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second);
      for (;ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI)
	if (!theRHS.numOutEdgesOf(*ExpressionVertexI))
	  break;
      if(ExpressionVertexI==ExpressionVertexIEnd) // nothing there, e.g. all passive, done
	return;
      Expression::ConstInEdgeIteratorPair pe(theRHS.getInEdgesOf(*ExpressionVertexI));
      Expression::ConstInEdgeIterator ExpressionEdgeI(pe.first),ExpressionEdgeIEnd(pe.second);
      for (;ExpressionEdgeI!=ExpressionEdgeIEnd;++ExpressionEdgeI)
	printEdgeAnnotationsBottomUp(*ExpressionEdgeI,theRHS,os);
    } 
    if(myDelayedLHSAssignment_p)
      myDelayedLHSAssignment_p->Assignment::printXMLHierarchyImpl(os);
  }

  void 
  AssignmentAlg::printEdgeAnnotationsBottomUp(const ExpressionEdge& theEdge,
					      const Expression& theExpression,
					      std::ostream& os) const { 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "AssignmentAlg::printEdgeAnnotationsBottomUp: entered for " 
	      << theEdge.debug().c_str() 
	      << " in " 
	      << theExpression.debug().c_str());
    Expression::ConstInEdgeIteratorPair pi(theExpression.getInEdgesOf(theExpression.getSourceOf(theEdge)));
    Expression::ConstInEdgeIterator ExpressionEdgeI(pi.first),ExpressionEdgeIEnd(pi.second);
    for (;ExpressionEdgeI!=ExpressionEdgeIEnd ;++ExpressionEdgeI)
      printEdgeAnnotationsBottomUp(*ExpressionEdgeI,
				   theExpression,
				   os); 
    if (dynamic_cast<ExpressionEdgeAlg&>(theEdge.getExpressionEdgeAlgBase()).hasConcretePartialAssignment()) { 
      DBG_MACRO(DbgGroup::CALLSTACK,
		"AssignmentAlg::printEdgeAnnotationsBottomUp: printing for " 
		<< theEdge.debug().c_str() 
		<< " in " 
		<< theExpression.debug().c_str());
      dynamic_cast<ExpressionEdgeAlg&>(theEdge.getExpressionEdgeAlgBase()).getConcretePartialAssignment().printXMLHierarchy(os);
    }
  } // end of AssignmentAlg::printEdgeAnnotationsBottomUp

  void AssignmentAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

  void AssignmentAlg::makeSSACodeList(){
    Expression& theExpression(myLinearizedRightHandSide);
    Expression::VertexIteratorPair p=theExpression.vertices();
    Expression::VertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second);
    for (; ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) {
      // find the maximal node
      if (!theExpression.numOutEdgesOf(*ExpressionVertexI))
	// this is the maximal vertex
	break;
    }
    Expression::InEdgeIteratorPair pe(theExpression.getInEdgesOf(*ExpressionVertexI));
    Expression::InEdgeIterator ExpressionInEdgeI(pe.first), ExpressionEdgeIEnd(pe.second);
    for (;ExpressionInEdgeI!=ExpressionEdgeIEnd;++ExpressionInEdgeI) { 
      localRHSExtractionOuter(*ExpressionInEdgeI);
    }
    bool needDelay=false;
    // decide if we need an extra delaying temporary to ensure
    // correctness of partial calculations: 
    ExpressionAlg& theExpressionAlg(dynamic_cast<ExpressionAlg&>(theExpression.getExpressionAlgBase()));
    const ExpressionAlg::ArgumentPList& thePartialUsageList(theExpressionAlg.getPartialUsageList());
    AliasActivityMap::AliasActivityMapKeyList theUsedArgumentsKeyList;
    for(ExpressionAlg::ArgumentPList::const_iterator uLI=thePartialUsageList.begin();
	uLI!=thePartialUsageList.end();
	++uLI)
      theUsedArgumentsKeyList.push_back(&((*uLI)->getVariable().getAliasActivityMapKey()));
    if (ConceptuallyStaticInstances::instance()->
	getCallGraph().getAliasActivityMap().
	isAliased(getContaining().getLHS().getAliasActivityMapKey(),
		  theUsedArgumentsKeyList)) 
      // the top level node may not require replacement 
      // itself but needs to be replaced if any subexpression is replaced: 
      needDelay=true;
    if(mySSAReplacementAssignmentList.size() 
       || 
       needDelay) { 
      Assignment& theReplacementAssignment(dynamic_cast<ExpressionVertexAlg&>((*ExpressionVertexI).getExpressionVertexAlgBase()).
					   makeReplacementAssignment());
      theReplacementAssignment.setId("replacement for " + getContaining().getId());
      // now we add a copy of the  target vertex  to the replacement assignment
      ExpressionVertex& theReplacementTargetVertex((*ExpressionVertexI).createCopyOfMyself());
      theReplacementAssignment.getRHS().supplyAndAddVertexInstance(theReplacementTargetVertex);
      // keep track of the node map for the edges: 
      PointerPairList theVertexPointerPairList; // first is the original, second is the copy
      theVertexPointerPairList.push_back(PointerPair(&(*ExpressionVertexI),
						     &theReplacementTargetVertex));
      if (needDelay) { 
	// need the extra temporary assignment: 
	myDelayedLHSAssignment_p=new Assignment(true);
	myDelayedLHSAssignment_p->setId(getContaining().getId()+ ": delayed LHS assignment for correct partials");
	// make a temporary Variable on the RHS:
	Argument* theDelayVertex_p=new Argument();
	theDelayVertex_p->setId(1);
	// add it to the RHS of the temp assignment
	myDelayedLHSAssignment_p->getRHS().supplyAndAddVertexInstance(*theDelayVertex_p);
	// set the alias key to temporary: 
	theDelayVertex_p->getVariable().getAliasActivityMapKey().setTemporary();
	// get the global scope
	Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
			      getCallGraph().getScopeTree().getGlobalScope());
	// create a new symbol and add a new VariableSymbolReference in the Variable
	VariableSymbolReference* theNewVariableSymbolReference_p=
	  new VariableSymbolReference(theGlobalScope.
				      getSymbolTable().
				      addUniqueAuxSymbol(SymbolKind::VARIABLE,
							 SymbolType::REAL_STYPE,
							 SymbolShape::SCALAR,
							 false),
				      theGlobalScope);
	theNewVariableSymbolReference_p->setId("1");
	theDelayVertex_p->getVariable().
	  supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
	// set the new LHS to the original LHS
	getContaining().getLHS().copyMyselfInto(myDelayedLHSAssignment_p->getLHS());
	// make the temporary the LHS of theReplacementAssignment 
	theDelayVertex_p->getVariable().copyMyselfInto(theReplacementAssignment.getLHS());
      } // end if 
      else // no extra temporary needed:  
	getContaining().getLHS().copyMyselfInto(theReplacementAssignment.getLHS());
      // we iterate through all the in edges
      Expression::InEdgeIteratorPair pInner(theExpression.getInEdgesOf((*ExpressionVertexI)));
      Expression::InEdgeIterator ExpressionInEdgeI(pInner.first), ExpressionInEdgeIEnd(pInner.second);
      for (;ExpressionInEdgeI!=ExpressionInEdgeIEnd;++ExpressionInEdgeI) { 
	localRHSExtractionInner(*ExpressionInEdgeI,
				theReplacementAssignment,
				(*ExpressionVertexI),
				theReplacementTargetVertex,
				theVertexPointerPairList);
      } // end for 
      mySSAReplacementAssignmentList.push_back(&theReplacementAssignment);	
    } // end if  
  } // end of AssignmentAlg::makeSSACodeList

  void AssignmentAlg::localRHSExtractionOuter(const ExpressionEdge& theEdge) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "AssignmentAlg::localRHSExtractionOuter");
    Expression& theExpression(myLinearizedRightHandSide);
    ExpressionVertex& theVertex(theExpression.getSourceOf(theEdge));
    Expression::InEdgeIteratorPair p(theExpression.getInEdgesOf(theVertex));
    Expression::InEdgeIterator ExpressionInEdgeI(p.first), endIte(p.second);
    // go down first
    for (;ExpressionInEdgeI!=endIte;++ExpressionInEdgeI) { 
      localRHSExtractionOuter(*ExpressionInEdgeI);
    } // end for
    ExpressionVertex& theTargetVertex(theExpression.getTargetOf(theEdge));
    ExpressionVertexAlg& theTargetVertexAlg(dynamic_cast<ExpressionVertexAlg&>(theTargetVertex.getExpressionVertexAlgBase()));
    if (theTargetVertexAlg.hasAuxilliaryVariable()) {    
      // this is a starting point for the inner iteration
      // as the recusion unwinds we find the vertices closest to 
      // the leafs first.
      if (!theTargetVertexAlg.hasReplacement()) { 
	// create replacement Assignment, 
	Assignment& theReplacementAssignment(theTargetVertexAlg.makeReplacementAssignment());
	theReplacementAssignment.setId("replacement for " + getContaining().getId());
	// now we add a copy of the  target vertex  to the replacement assignment
	ExpressionVertex& theReplacementTargetVertex(theTargetVertex.createCopyOfMyself());
	theReplacementAssignment.getRHS().supplyAndAddVertexInstance(theReplacementTargetVertex);
	// keep track of the node map for the edges: 
	PointerPairList theVertexPointerPairList; // first is the original, second is the copy
	theVertexPointerPairList.push_back(PointerPair(&theTargetVertex,
						       &theReplacementTargetVertex));
	// set the LHS
	theTargetVertexAlg.getAuxilliaryVariable().copyMyselfInto(theReplacementAssignment.getLHS());
	// we iterate through all the in edges
	Expression::InEdgeIteratorPair pInner(theExpression.getInEdgesOf(theTargetVertex));
	Expression::InEdgeIterator ExpressionInEdgeI(pInner.first), ExpressionInEdgeIEnd(pInner.second);
	for (;ExpressionInEdgeI!=ExpressionInEdgeIEnd;++ExpressionInEdgeI) { 
	  localRHSExtractionInner(*ExpressionInEdgeI,
				  theReplacementAssignment,
				  theTargetVertex,
				  theReplacementTargetVertex,
				  theVertexPointerPairList);
	} // end for 
	mySSAReplacementAssignmentList.push_back(&theReplacementAssignment);	
      } // end if  
      // else we have already dealt with this vertex, nothing to be done
    } // end if 
    // else we just walk back up in the graph
  } // end of AssignmentAlg::localRHSExtractionOuter

  void AssignmentAlg::localRHSExtractionInner(const ExpressionEdge& theEdge,
					      Assignment& theReplacementAssignment,
					      const ExpressionVertex& theTargetVertex,
					      ExpressionVertex& theReplacementTargetVertex,
					      AssignmentAlg::PointerPairList& theVertexPointerPairList) {
    DBG_MACRO(DbgGroup::CALLSTACK, "AssignmentAlg::localRHSExtractionInner");
    Expression& theExpression(myLinearizedRightHandSide);
    ExpressionVertex& theSourceVertex(theExpression.getSourceOf(theEdge));
    ExpressionVertexAlg& theSourceVertexAlg(dynamic_cast<ExpressionVertexAlg&>(theSourceVertex.getExpressionVertexAlgBase()));
    ExpressionVertex* theReplacementSourceVertex_p(0);
    // did we add it already?
    for (PointerPairList::const_iterator li=theVertexPointerPairList.begin();
	 li!=theVertexPointerPairList.end();
	 ++li) { 
      if ((*li).first==&theSourceVertex) { 
	theReplacementSourceVertex_p=(*li).second;
	break;
      } // end if 
    } // end for 
    if (!theReplacementSourceVertex_p) { 
      if (theSourceVertexAlg.hasAuxilliaryVariable()) {    
	// check if we have a subexpression that needs to be dealt with 
	// first 
	if (!theSourceVertexAlg.hasReplacement()) { 
	  Expression::InEdgeIteratorPair pe(theExpression.getInEdgesOf(theSourceVertex));
	  Expression::InEdgeIterator ExpressionInEdgeI(pe.first), endIte(pe.second);
	  for (;ExpressionInEdgeI!=endIte;++ExpressionInEdgeI) { 
	    // do this first so we get the order right
	    // for all the replacement assignments
	    localRHSExtractionOuter(*ExpressionInEdgeI);
	  } // end for 
	} // end if 
	// if we have an auxilliary Variable
	// then the replacement for this vertex needs to be a
	// variable initialized from the AuxilliaryVariable
	Argument* theReplacementArgument_p=new Argument();
	theReplacementSourceVertex_p=theReplacementArgument_p;
	// here we have to explicitly set the ID while in all other 
	// cases it is copied through the 'createCopyOfMyself' calls
	theReplacementSourceVertex_p->setId(theSourceVertex.getId());
	theSourceVertexAlg.getAuxilliaryVariable().
	  copyMyselfInto(theReplacementArgument_p->getVariable());
      } // end if (has auxilliary reference)
      else { // doesn't have auxilliary reference
	// make a simple copy
	theReplacementSourceVertex_p=&(theSourceVertex.createCopyOfMyself());
      } // end else 
      // add the copy to the replacement
      theReplacementAssignment.getRHS().supplyAndAddVertexInstance(*theReplacementSourceVertex_p);
      // keep track of it in the map
      theVertexPointerPairList.push_back(PointerPair(&theSourceVertex,
						     theReplacementSourceVertex_p));
    } // end if 			       
    ExpressionEdge& theReplacementEdge(theReplacementAssignment.getRHS().addEdge(*theReplacementSourceVertex_p,
										 theReplacementTargetVertex));
    theEdge.copyMyselfInto(theReplacementEdge);
    if (!theSourceVertexAlg.hasAuxilliaryVariable()) {    
      // go through the in edges of the source recursively: 
      Expression::InEdgeIteratorPair pInner(theExpression.getInEdgesOf(theSourceVertex));
      Expression::InEdgeIterator ExpressionInEdgeI(pInner.first), ExpressionInEdgeIEnd(pInner.second);
      for (;ExpressionInEdgeI!=ExpressionInEdgeIEnd;++ExpressionInEdgeI) { 
	localRHSExtractionInner(*ExpressionInEdgeI,
				theReplacementAssignment,
				theSourceVertex,
				*theReplacementSourceVertex_p,
				theVertexPointerPairList);
      } // end for 
    } // end if 
  } // end of AssignmentAlg::localRHSExtractionInner

  void AssignmentAlg::algorithm_action_1() { 
    if (myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::algorithm_action_1(linearize): cannot be called twice");
    if (!getContaining().getLHS().getActiveType()) { 
      // the LHS is an inactive type
      // passivate the entire statement.
      // note that the 'active'=true may just 
      // be the default set by the schema...
      myLHSActiveFlag=false;
      // skip the rest
      return;
    }
    // perform the activity analysis on the original right hand side
    
    dynamic_cast<ExpressionAlg&>(getContaining().getRHS().getExpressionAlgBase()).activityAnalysis(); 
    // has the maximal node become passive?
    Expression::ConstVertexIteratorPair pV(getContaining().getRHS().vertices());
    Expression::ConstVertexIterator iV(pV.first),iVe(pV.second);
    for (;iV!=iVe ;++iV)
      if (!getContaining().getRHS().numOutEdgesOf(*iV))
	break;
    if (!dynamic_cast<ExpressionVertexAlg&>((*iV).getExpressionVertexAlgBase()).isActive())
      // make the entire assignment passive
      myLHSActiveFlag=false;
    if (!myLHSActiveFlag)
      return;
    // copy the right hand side: 
    getContaining().getRHS().
      copyMyselfInto(myLinearizedRightHandSide,
		     true); // make algorithm objects in the copy
    // set the flag
    myHaveLinearizedRightHandSide=true;
    // create auxilliary variables and 
    // attach partial expressionsions
    dynamic_cast<ExpressionAlg&>(myLinearizedRightHandSide.getExpressionAlgBase()).
      createPartialExpressions();
    // create ssa code
    makeSSACodeList();
    passiveReduction();
  } // end of AssignmentAlg::algorithm_action_1(linearize)

  Expression& AssignmentAlg::getLinearizedRightHandSide() { 
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::getLinearizedRightHandSide: this has not been linearized");
    return myLinearizedRightHandSide;
  } // end of AssignmentAlg::getLinearizedRightHandSide

  const Expression& AssignmentAlg::getLinearizedRightHandSide() const { 
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::getLinearizedRightHandSide: this has not been linearized");
    return myLinearizedRightHandSide;
  } // end of AssignmentAlg::getLinearizedRightHandSide

  void AssignmentAlg::passiveReduction() { 
    // find the maximal vertex: 
    Expression::VertexIteratorPair pV(myLinearizedRightHandSide.vertices());
    Expression::VertexIterator iV(pV.first),iVe(pV.second);
    for (;iV!=iVe ;++iV)
      if (!myLinearizedRightHandSide.numOutEdgesOf(*iV))
	break;
    Expression::InEdgeIteratorPair pE(myLinearizedRightHandSide.getInEdgesOf(*iV));
    Expression::InEdgeIterator iE(pE.first),iEe(pE.second);
    for (;iE!=iEe;) { 
      Expression::InEdgeIterator iEdel(iE);
      ++iE;
      passiveReductionTopDownPass(*iEdel);
    } // end for 
    // the top level node may be inactive too
    if (!dynamic_cast<ExpressionVertexAlg&>((*iV).getExpressionVertexAlgBase()).isActive()) { 
      DBG_MACRO(DbgGroup::TEMPORARY, " removing top vertex " << (*iV).debug().c_str());
      myLinearizedRightHandSide.removeAndDeleteVertex(*iV);
    }
  } // end of AssignmentAlg::passiveReduction

  void AssignmentAlg::passiveReductionTopDownPass(const ExpressionEdge& theEdge) { 
    ExpressionVertex& v=myLinearizedRightHandSide.getSourceOf(theEdge);
    if (dynamic_cast<ExpressionEdgeAlg&>(theEdge.getExpressionEdgeAlgBase()).
	getPartialDerivativeKind()!=PartialDerivativeKind::PASSIVE) { 
      Expression::InEdgeIteratorPair pE(myLinearizedRightHandSide.getInEdgesOf(v));
      Expression::InEdgeIterator iE(pE.first),iEe(pE.second);
      for (;iE!=iEe ;) { 
	Expression::InEdgeIterator iEdel(iE);
        ++iE;
	passiveReductionTopDownPass(*iEdel);
      }
    } 
    else
      // this gets rid of the vertices 
      // which implies getting rid of the edges
      passiveReductionTopDownPass(v);
  } // end of AssignmentAlg::passiveReductionTopDownPass()

  void AssignmentAlg::passiveReductionTopDownPass(const ExpressionVertex& theVertex) { 
    Expression::InEdgeIteratorPair pE(myLinearizedRightHandSide.getInEdgesOf(theVertex));
    Expression::InEdgeIterator iE(pE.first),iEe(pE.second);
    for (;iE!=iEe ;){ 
      Expression::InEdgeIterator iEdel(iE);
      ++iE;
      passiveReductionTopDownPass(myLinearizedRightHandSide.getSourceOf(*iEdel));
    }
    myLinearizedRightHandSide.removeAndDeleteVertex(theVertex);
  } // end of AssignmentAlg::passiveReductionTopDownPass()

}
