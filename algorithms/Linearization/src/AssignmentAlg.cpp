#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpression.hpp"
#include "xaifBooster/system/inc/InlinableIntrinsicsExpressionVertex.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/Linearization/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

namespace xaifBoosterLinearization { 

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    AssignmentAlgBase(theContainingAssignment),
    myHaveLinearizedRightHandSide(false),
    myDelayedLHSAssignment_p(0),
    myActiveFlag(true), // note: delayed initialization
    myActiveFlagInit(false) { 
  }

  std::string AssignmentAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterLinearization::AssignmentAlg[" 
	<< this 
	<< ","
	<< "mySSAReplacementAssignmentList.size()="
	<< "="
	<< mySSAReplacementAssignmentList.size()
	<< ","
	<< "myHaveLinearizedRightHandSide"
	<< "="
	<< myHaveLinearizedRightHandSide
	<< ","
	<< "myDelayedLHSAssignment_p"
	<< "="
	<< myDelayedLHSAssignment_p
	<< ","
	<< "myActiveFlag"
	<< "="
	<< myActiveFlag
	<< "]" << std::ends;  
    return out.str();
  } // end of AssignmentAlg::debug

  void
  AssignmentAlg::printXMLHierarchy(std::ostream& os) const { 
    if (mySSAReplacementAssignmentList.size()) { 
      for (std::list<Assignment*>::const_iterator li=mySSAReplacementAssignmentList.begin();
	   li!=mySSAReplacementAssignmentList.end();
	   ++li) { 
	DBG_MACRO(DbgGroup::DATA, "xaifBoosterLinearization::AssignmentAlg::printXMLHierarchy: printing: " << *li );
	(*li)->printXMLHierarchy(os);
      }
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
    ExpressionEdgeAlg& theExpressionEdgeAlg(dynamic_cast<ExpressionEdgeAlg&>(theEdge.getExpressionEdgeAlgBase())); 
    if (theExpressionEdgeAlg.hasConcretePartialAssignment()
	&& 
	theExpressionEdgeAlg.getPartialDerivativeKind()!=PartialDerivativeKind::PASSIVE) { 
      DBG_MACRO(DbgGroup::CALLSTACK,
		"xaifBoosterLinearization::AssignmentAlg::printEdgeAnnotationsBottomUp: printing for " 
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
    AliasMap::AliasMapKeyPList theUsedArgumentsKeyPList;
    const Assignment& theContainingAssignment(dynamic_cast<const Assignment&>(getContaining()));
    for(ExpressionAlg::ArgumentPList::const_iterator uLI=thePartialUsageList.begin();
	uLI!=thePartialUsageList.end();
	++uLI)
      theUsedArgumentsKeyPList.push_back(&((*uLI)->getVariable().getAliasMapKey()));
    if (ConceptuallyStaticInstances::instance()->
	getCallGraph().getAliasMap().
	mayAlias(theContainingAssignment.getLHS().getAliasMapKey(),
		 theUsedArgumentsKeyPList)) 
      // The current final execution sequence is: 
      //   the assignment or all replacement assignments in a block 
      //   followed by the all partials pertaining to this assignment in a block
      // Therefore the aliasing question applies to all inputs. 
      // Note: 
      // If we somehow changed the order that all partial expression follow immediately 
      // their respective replacement assignments then the alias question would include 
      // only those variables who appear in the top level replacement assignment. 
      // This however is not the case here.
      needDelay=true;
    // the top level node may not require replacement 
    // itself but needs to be replaced if any subexpression is replaced: 
    if(mySSAReplacementAssignmentList.size() 
       || 
       needDelay) { 
      // we need a replacement assignment: 
      // A: if the maximal vertex's value is needed for a partial 
      //    in which case we already have a replacement assignment created
      //    by the call to localRHSExtractionOuter further up in this code
      // B: if there is any other replacement assignment in this expression because 
      //    we need to create the replacement assignment for the 'remainder', 
      //    i.e. all elements in this expression not covered by any of the previously 
      //    created replacement assignments
      if (!dynamic_cast<ExpressionVertexAlg&>((*ExpressionVertexI).getExpressionVertexAlgBase()).hasReplacement()) { // this is case B
	Assignment& theReplacementAssignment(dynamic_cast<ExpressionVertexAlg&>((*ExpressionVertexI).
										getExpressionVertexAlgBase()).
					     makeReplacementAssignment());
	theReplacementAssignment.setId("replacement for " + theContainingAssignment.getId());
	// now we add a copy of the  target vertex  to the replacement assignment
	ExpressionVertex& theReplacementTargetVertex((*ExpressionVertexI).createCopyOfMyself());
	theReplacementAssignment.getRHS().supplyAndAddVertexInstance(theReplacementTargetVertex);
	// keep track of the node map for the edges: 
	PointerPairList theVertexPointerPairList; // first is the original, second is the copy
	theVertexPointerPairList.push_back(PointerPair(&(*ExpressionVertexI),
						       &theReplacementTargetVertex));
	if (needDelay) { // we create a new LHS which is the right hand side of the delay 
	  // need the extra temporary assignment: 
	  myDelayedLHSAssignment_p=new Assignment(true);
	  myDelayedLHSAssignment_p->setId(theContainingAssignment.getId()+ ": delayed LHS assignment for correct partials");
	  // make a temporary Variable on the RHS:
	  Argument* theDelayVertex_p=new Argument();
	  theDelayVertex_p->setId(1);
	  // add it to the RHS of the temp assignment
	  myDelayedLHSAssignment_p->getRHS().supplyAndAddVertexInstance(*theDelayVertex_p);
	  // set the alias key to temporary: 
	  theDelayVertex_p->getVariable().getAliasMapKey().setTemporary();
	  theDelayVertex_p->getVariable().getDuUdMapKey().setTemporary();
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
	  theNewVariableSymbolReference_p->setAnnotation("xaifBoosterLinearization::AssignmentAlg::makeSSACodeList");
	  theDelayVertex_p->getVariable().
	    supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
	  // set the new LHS to the original LHS
	  theContainingAssignment.getLHS().copyMyselfInto(myDelayedLHSAssignment_p->getLHS());
	  // make the temporary the LHS of theReplacementAssignment 
	  theDelayVertex_p->getVariable().copyMyselfInto(theReplacementAssignment.getLHS());
	} // end if 
	else // no extra temporary needed, we use the original LHS
	  theContainingAssignment.getLHS().copyMyselfInto(theReplacementAssignment.getLHS());
	// create the top level replacement
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
      } // end if case B
      else { // this is case A
	// we have the top level replacement, so we need the delay assignment no matter what
	// but the difference is now that the RHS of the delay assignment is the LHS 
	// of the top level replacement.
	myDelayedLHSAssignment_p=new Assignment(true);
	myDelayedLHSAssignment_p->setId(theContainingAssignment.getId()+ ": delayed LHS assignment for top level replacement");
	// make a the replacement the RHS:
	Argument* theDelayVertex_p=new Argument();
	theDelayVertex_p->setId(1);
	// add it to the RHS of the temp assignment
	myDelayedLHSAssignment_p->getRHS().supplyAndAddVertexInstance(*theDelayVertex_p);
	// set the alias key to temporary: 
	dynamic_cast<ExpressionVertexAlg&>((*ExpressionVertexI).getExpressionVertexAlgBase()).
	  getReplacementAssignment().getLHS().copyMyselfInto(theDelayVertex_p->getVariable());
	// set the new LHS to the original LHS
	theContainingAssignment.getLHS().copyMyselfInto(myDelayedLHSAssignment_p->getLHS());
      } // end else (case A)
    } // end if  
  } // end of AssignmentAlg::makeSSACodeList

  void AssignmentAlg::localRHSExtractionOuter(const ExpressionEdge& theEdge) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterLinearization::AssignmentAlg::localRHSExtractionOuter");
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
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterLinearization::AssignmentAlg::localRHSExtractionInner");
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

  // local writer definition: 
  class VertexLabelWriter {
  public:
    VertexLabelWriter(const Expression& e) : myE(e) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      out << "[label=\"" << dynamic_cast<xaifBoosterLinearization::ExpressionVertexAlg&>((*(boost::get(boost::get(BoostVertexContentType(),
														  myE.getInternalBoostGraph()),
												       v))).getExpressionVertexAlgBase()).isActive() << "\"]";
    }
    const Expression& myE;
  };

  void AssignmentAlg::algorithm_action_1() { 
    DBG_MACRO(DbgGroup::CALLSTACK, 
	      "xaifBoosterLinearization::AssignmentAlg::algorithm_action_1(analyze/copy) called for: "
	      << debug().c_str());
    if (myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterLinearization::AssignmentAlg::algorithm_action_1(analyze/copy): cannot be called twice");
    if (!getContainingAssignment().getLHS().getActiveType()) { 
      // the LHS is an inactive type
      // passivate the entire statement.
      // note that the 'active'=true may just 
      // be the default set by the schema...
      myActiveFlag=false;
      // skip the rest
      return;
    }

    //     GraphVizDisplay::show(getContainingAssignment().getRHS(),"originalBefore",
    //      			  VertexLabelWriter(getContainingAssignment().getRHS()));
    // perform the activity analysis on the original right hand side
    dynamic_cast<ExpressionAlg&>(getContainingAssignment().getRHS().getExpressionAlgBase()).activityAnalysis(); 
    //     GraphVizDisplay::show(getContainingAssignment().getRHS(),"originalAfter",
    //      			  VertexLabelWriter(getContainingAssignment().getRHS()));

    // has the maximal node become passive?
    Expression::ConstVertexIteratorPair pV(getContainingAssignment().getRHS().vertices());
    Expression::ConstVertexIterator iV(pV.first),iVe(pV.second);
    for (;iV!=iVe ;++iV)
      if (!getContainingAssignment().getRHS().numOutEdgesOf(*iV))
	break;
    if (!dynamic_cast<ExpressionVertexAlg&>((*iV).getExpressionVertexAlgBase()).isActive()) { 
      // make the entire assignment passive
      myActiveFlag=false;
    }
    if (!myActiveFlag)
      return;

    // copy the right hand side: 
    getContainingAssignment().getRHS().
      copyMyselfInto(myLinearizedRightHandSide,false,
		     true); // make algorithm objects in the copy
    // set the flag
    myHaveLinearizedRightHandSide=true;
    // repeat the activity analysis on the copy
    // \todo: could change to always create the copy and run the 
    // the activityAnalysis once on the copy instead.
    dynamic_cast<ExpressionAlg&>(myLinearizedRightHandSide.getExpressionAlgBase()).activityAnalysis(); 
  } // end of AssignmentAlg::algorithm_action_1(analyze/copy)

  void AssignmentAlg::activityAnalysis() {
    if (!myActiveFlag)
      return;
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterLinearization::AssignmentAlg::activityAnalysis: need right hand side copy");
    dynamic_cast<ExpressionAlg&>(myLinearizedRightHandSide.getExpressionAlgBase()).activityAnalysis(); 
    //     GraphVizDisplay::show(getLinearizedRightHandSide(),"myLinearizedRightHandSideAfter",
    // 			  VertexLabelWriter(getLinearizedRightHandSide()));
    // has the maximal node become passive?
    Expression::VertexIteratorPair pV(myLinearizedRightHandSide.vertices());
    Expression::VertexIterator iV(pV.first),iVe(pV.second);
    for (;iV!=iVe ;++iV)
      if (!myLinearizedRightHandSide.numOutEdgesOf(*iV))
	break;
    if (!dynamic_cast<ExpressionVertexAlg&>((*iV).getExpressionVertexAlgBase()).isActive()
	||
	(myLinearizedRightHandSide.numVertices()==1 // we have only one vertex which must
	 // be an argument, otherwise it would be a constant and we would have hit the previous condition
	 // and not execute this one
	 &&
	 !dynamic_cast<const Argument&>(*iV).getVariable().getActiveType())) {
      // make the entire assignment passive
      myActiveFlag=false;
      // remove all possibly created code: 
      if (myDelayedLHSAssignment_p) { 
	delete myDelayedLHSAssignment_p;
	myDelayedLHSAssignment_p=0;
      } // end if 
      for(AssignmentPList::iterator aListIterator=mySSAReplacementAssignmentList.begin();
	  aListIterator!=mySSAReplacementAssignmentList.end();
	  ++aListIterator) 
	delete *aListIterator;
      mySSAReplacementAssignmentList.clear();
      myLinearizedRightHandSide.clear();
      myHaveLinearizedRightHandSide=false;	
    } // end if 
  } // end of AssignmentAlg::activityAnalysis

  void AssignmentAlg::algorithm_action_2() { 
    DBG_MACRO(DbgGroup::CALLSTACK, 
	      "xaifBoosterLinearization::AssignmentAlg::algorithm_action_2(code generation) called for: "
	      << debug().c_str());
    if (!myActiveFlag)
      return; // nothing to be done here
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterLinearization::AssignmentAlg::algorithm_action_2(code generation): need right hand side copy");
    if (mySSAReplacementAssignmentList.size()) 
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterLinearization::AssignmentAlg::algorithm_action_2(code generation): cannot run twice");
    // create auxilliary variables and 
    // attach partial expressionsions
    dynamic_cast<ExpressionAlg&>(myLinearizedRightHandSide.getExpressionAlgBase()).
      createPartialExpressions();
    // create ssa code
    makeSSACodeList();
  } // end of AssignmentAlg::algorithm_action_2(code generation)

  Expression& AssignmentAlg::getLinearizedRightHandSide() { 
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterLinearization::AssignmentAlg::getLinearizedRightHandSide: this has not been linearized");
    return myLinearizedRightHandSide;
  } // end of AssignmentAlg::getLinearizedRightHandSide

  const Expression& AssignmentAlg::getLinearizedRightHandSide() const { 
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterLinearization::AssignmentAlg::getLinearizedRightHandSide: this has not been linearized");
    return myLinearizedRightHandSide;
  } // end of AssignmentAlg::getLinearizedRightHandSide

  bool AssignmentAlg::haveLinearizedRightHandSide() const { 
    return myHaveLinearizedRightHandSide;
  } // end of AssignmentAlg::haveLinearizedRightHandSide

  bool AssignmentAlg::getActiveFlag() const { 
    if (!myActiveFlagInit) { 
      myActiveFlag=getContainingAssignment().getLHS().getActiveFlag();
      myActiveFlagInit=true;
    }
    return myActiveFlag;
  } 

}
