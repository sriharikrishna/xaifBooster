#include <sstream>

#include "utils/inc/DbgLoggerManager.hpp"

#include "system/inc/Assignment.hpp"
#include "system/inc/AssignmentAlgBase.hpp"
#include "system/inc/AssignmentAlgFactory.hpp"
#include "system/inc/Variable.hpp"
#include "system/inc/GraphVizDisplay.hpp"
#include "system/inc/AliasActivityMap.hpp"
#include "system/inc/ConceptuallyStaticInstances.hpp"
#include "system/inc/CallGraph.hpp"
#include "system/inc/BaseVariableSymbolReference.hpp"

namespace xaifBooster { 

  Assignment::Assignment(bool theActiveFlag) : 
    PlainAssignment(theActiveFlag),
    myHaveLinearizedRightHandSide(false),
    myDelayedLHSAssignment_p(0) {
    myAssignmentAlgBase_p=AssignmentAlgFactory::instance()->makeNewAlg(*this);
  } 

  Assignment::~Assignment() {
    if (myAssignmentAlgBase_p)
      delete myAssignmentAlgBase_p;
  } 

  AssignmentAlgBase& 
  Assignment::getAssignmentAlgBase() { 
    if (!myAssignmentAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Assignment::getAssignmentAlgBase: not set");
    return *myAssignmentAlgBase_p;
  }

  const AssignmentAlgBase& 
  Assignment::getAssignmentAlgBase() const { 
    if (!myAssignmentAlgBase_p)
      THROW_LOGICEXCEPTION_MACRO("Assignment::getAssignmentAlgBase: not set");
    return *myAssignmentAlgBase_p;
  }

  void
  Assignment::printXMLHierarchy(std::ostream& os) const { 
    getAssignmentAlgBase().printXMLHierarchy(os);
  }

  void
  Assignment::printXMLHierarchyImpl(std::ostream& os) const { 
    if (mySSAReplacementAssignmentList.size()) { 
      for (std::list<PlainAssignment*>::const_iterator li=mySSAReplacementAssignmentList.begin();
	   li!=mySSAReplacementAssignmentList.end();
	   ++li)
	(*li)->printXMLHierarchy(os);
    }
    else { 
      PlainAssignment::printXMLHierarchyImpl(os);
    }
    if (myHaveLinearizedRightHandSide) { 
      // print edge annotations for partial 
      // assignments
      const Expression& theRHS(getLinearizedRightHandSide());
      // we have to print them in order, so: 
      // find maximal node: 
      Expression::ConstVertexIteratorPair p(theRHS.vertices());
      Expression::ConstVertexIterator beginIt(p.first),endIt(p.second);
      for (;beginIt!=endIt ;++beginIt)
	if (!theRHS.numOutEdgesOf(*beginIt))
	  break;
      if(beginIt==endIt) // nothing there, e.g. all passive, done
	return;
      Expression::ConstInEdgeIteratorPair pe(theRHS.getInEdgesOf(*beginIt));
      Expression::ConstInEdgeIterator beginIte(pe.first),endIte(pe.second);
      for (;beginIte!=endIte;++beginIte)
	printEdgeAnnotationsBottomUp(*beginIte,theRHS,os);
    } 
    if(myDelayedLHSAssignment_p)
      myDelayedLHSAssignment_p->PlainAssignment::printXMLHierarchyImpl(os);
  }

  void 
  Assignment::printEdgeAnnotationsBottomUp(const ExpressionEdge& theEdge,
					   const Expression& theExpression,
					   std::ostream& os) const { 
//     DBG_MACRO(DbgGroup::CALLSTACK,
// 	      "Assignment::printEdgeAnnotationsBottomUp: entered for " 
// 	      << theEdge.debug().c_str() 
// 	      << " in " 
// 	      << theExpression.debug().c_str());
//     Expression::ConstInEdgeIteratorPair pi(theExpression.getInEdgesOf(theExpression.getSourceOf(theEdge)));
//     Expression::ConstInEdgeIterator beginIte(pi.first),endIte(pi.second);
//     for (;beginIte!=endIte ;++beginIte)
//       printEdgeAnnotationsBottomUp(*beginIte,
// 				   theExpression,
// 				   os); 
//     if (theEdge.hasConcretePartialAssignment()) { 
//       DBG_MACRO(DbgGroup::CALLSTACK,
// 		"Assignment::printEdgeAnnotationsBottomUp: printing for " 
// 		<< theEdge.debug().c_str() 
// 		<< " in " 
// 		<< theExpression.debug().c_str());
//       theEdge.getConcretePartialAssignment().printXMLHierarchy(os);
//     }
  } // end of Assignment::printEdgeAnnotationsBottomUp

  std::string Assignment::debug () const { 
    std::ostringstream out;
    out << "Assignment[" << this 
      // JU fixme
      //	<< AssignmentWrapper<>::debug()
	<< "]" << std::ends;  
    return out.str();
  } // end of Assignment::debug

  void Assignment::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
    getAssignmentAlgBase().genericTraversal(anAction_c);
    getRHS().genericTraversal(anAction_c);
    getLHS().genericTraversal(anAction_c);
  } 

  void Assignment::makeSSACodeList(){
//     Expression& theExpression(myLinearizedRightHandSide);
//     Expression::VertexIteratorPair p=theExpression.vertices();
//     Expression::VertexIterator beginIt(p.first),endIt(p.second);
//     for (; beginIt!=endIt ;++beginIt) {
//       // find the maximal node
//       if (!theExpression.numOutEdgesOf(*beginIt))
// 	// this is the maximal vertex
// 	break;
//     }
//     Expression::InEdgeIteratorPair pe(theExpression.getInEdgesOf(*beginIt));
//     Expression::InEdgeIterator beginIte(pe.first), endIte(pe.second);
//     for (;beginIte!=endIte;++beginIte) { 
//       localRHSExtractionOuter(*beginIte);
//     }
//     // the top level node may not require replacement 
//     // itself but needs to be replaced if any subexpression is replaced: 
//     if(mySSAReplacementAssignmentList.size()) { 
//       PlainAssignment* theReplacementAssignment_p=new PlainAssignment(true);
//       theReplacementAssignment_p->setId(getId());
//       // make the replacement known to the vertex which is its 
//       // maximal node
//       (*beginIt).setReplacement(*theReplacementAssignment_p);
//       // now we add a copy of the  target vertex  to the replacement assignment
//       ExpressionVertex& theReplacementTargetVertex((*beginIt).createCopyOfMyself());
//       theReplacementAssignment_p->getRHS().supplyAndAddVertexInstance(theReplacementTargetVertex);
//       // keep track of the node map for the edges: 
//       PointerPairList theVertexPointerPairList; // first is the original, second is the copy
//       theVertexPointerPairList.push_back(PointerPair(&(*beginIt),
// 						     &theReplacementTargetVertex));
//       // decide if we need an extra temporary to ensure
//       // correctness of partial calculations: 
//       const Expression::VariableReferencePList& thePartialUsageList(theExpression.getPartialUsageList());
//       AliasActivityMap::AliasActivityMapKeyList theUsedArgumentsKeyList;
//       for(Expression::VariableReferencePList::const_iterator uLI=thePartialUsageList.begin();
// 	  uLI!=thePartialUsageList.end();
// 	  ++uLI)
// 	theUsedArgumentsKeyList.push_back(&((*uLI)->getBaseVariableReference().getAliasActivityMapKey()));
//       if (ConceptuallyStaticInstances::instance()->
// 	  getCallGraph().getAliasActivityMap().
// 	  isAliased(getLHS().getAliasActivityMapKey(),
// 		    theUsedArgumentsKeyList)) { 
// 	// need the extra temporary assignment: 
// 	myTemporaryLHSAssignment_p=new PlainAssignment(true);
// 	myTemporaryLHSAssignment_p->setId(getId());
// 	// make a temporary Variable on the RHS:
// 	VariableReference* theTemporaryVertex_p=new VariableReference();
// 	theTemporaryVertex_p->setId(1);
// 	// add it to the RHS of the temp assignment
// 	myTemporaryLHSAssignment_p->getRHS().supplyAndAddVertexInstance(*theTemporaryVertex_p);
// 	// set the alias key to temporary: 
// 	theTemporaryVertex_p->getBaseVariableReference().getAliasActivityMapKey().setTemporary();
// 	// get the global scope
// 	Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
// 			      getCallGraph().getScopeTree().getGlobalScope());
// 	// create a new symbol and add a new BaseVariableSymbolReference in the BaseVariableReference
// 	BaseVariableSymbolReference* theNewBaseVariableSymbolReference_p=
// 	  new BaseVariableSymbolReference(theGlobalScope.
// 					  getSymbolTable().
// 					  addUniqueAuxSymbol(SymbolKind::VARIABLE,
// 							     SymbolType::DOUBLE_STYPE,
// 							     SymbolShape::SCALAR),
// 					  theGlobalScope);
// 	theNewBaseVariableSymbolReference_p->setId("1");
// 	theTemporaryVertex_p->getBaseVariableReference().
// 	  supplyAndAddVertexInstance(*theNewBaseVariableSymbolReference_p);
// 	// set the new LHS to the original LHS
// 	getLHS().copyMyselfInto(myTemporaryLHSAssignment_p->getLHS());
// 	// make the temporary the LHS of theReplacementAssignment 
// 	theTemporaryVertex_p->getBaseVariableReference().copyMyselfInto(theReplacementAssignment_p->getLHS());
//       } // end if 
//       else // no extra temporary needed:  
// 	getLHS().copyMyselfInto(theReplacementAssignment_p->getLHS());
//       // we iterate through all the in edges
//       Expression::InEdgeIteratorPair pInner(theExpression.getInEdgesOf((*beginIt)));
//       Expression::InEdgeIterator beginIteInner(pInner.first), endIteInner(pInner.second);
//       for (;beginIteInner!=endIteInner;++beginIteInner) { 
// 	localRHSExtractionInner(*beginIteInner,
// 				*theReplacementAssignment_p,
// 				(*beginIt),
// 				theReplacementTargetVertex,
// 				theVertexPointerPairList);
//       } // end for 
//       mySSAReplacementAssignmentList.push_back(theReplacementAssignment_p);	
//     } // end if  
  } // end of Assignment::makeSSACodeList

  void Assignment::localRHSExtractionOuter(const ExpressionEdge& theEdge) { 
//     DBG_MACRO(DbgGroup::CALLSTACK, "Assignment::localRHSExtractionOuter");
//     Expression& theExpression(myLinearizedRightHandSide);
//     ExpressionVertex& theVertex(theExpression.getSourceOf(theEdge));
//     Expression::InEdgeIteratorPair p(theExpression.getInEdgesOf(theVertex));
//     Expression::InEdgeIterator beginIte(p.first), endIte(p.second);
//     // go down first
//     for (;beginIte!=endIte;++beginIte) { 
//       localRHSExtractionOuter(*beginIte);
//     } // end for
//     ExpressionVertex& theTargetVertex(theExpression.getTargetOf(theEdge));
//     if (theTargetVertex.hasAuxilliaryVariableReference()) {    
//       // this is a starting point for the inner iteration
//       // as the recusion unwinds we find the vertices closest to 
//       // the leafs first.
//       if (!theTargetVertex.hasReplacement()) { 
// 	// create replacement Assignment, 
// 	PlainAssignment* theReplacementAssignment_p=new PlainAssignment(true);
// 	theReplacementAssignment_p->setId(getId());
// 	// make the replacement known to the vertex which is its 
// 	// maximal node
// 	theTargetVertex.setReplacement(*theReplacementAssignment_p);
// 	// now we add a copy of the  target vertex  to the replacement assignment
// 	ExpressionVertex& theReplacementTargetVertex(theTargetVertex.createCopyOfMyself());
// 	theReplacementAssignment_p->getRHS().supplyAndAddVertexInstance(theReplacementTargetVertex);
// 	// keep track of the node map for the edges: 
// 	PointerPairList theVertexPointerPairList; // first is the original, second is the copy
// 	theVertexPointerPairList.push_back(PointerPair(&theTargetVertex,
// 						       &theReplacementTargetVertex));
// 	// set the LHS
// 	theTargetVertex.getAuxilliaryVariableReference().copyMyselfInto(theReplacementAssignment_p->getLHS());
// 	// we iterate through all the in edges
// 	Expression::InEdgeIteratorPair pInner(theExpression.getInEdgesOf(theTargetVertex));
// 	Expression::InEdgeIterator beginIteInner(pInner.first), endIteInner(pInner.second);
// 	for (;beginIteInner!=endIteInner;++beginIteInner) { 
// 	  localRHSExtractionInner(*beginIteInner,
// 				  *theReplacementAssignment_p,
// 				  theTargetVertex,
// 				  theReplacementTargetVertex,
// 				  theVertexPointerPairList);
// 	} // end for 
// 	mySSAReplacementAssignmentList.push_back(theReplacementAssignment_p);	
//       } // end if  
//       // else we have already dealt with this vertex, nothing to be done
//     } // end if 
//     // else we just walk back up in the graph
  } // end of Assignment::localRHSExtractionOuter

  void Assignment::localRHSExtractionInner(const ExpressionEdge& theEdge,
					   PlainAssignment& theReplacementAssignment,
					   const ExpressionVertex& theTargetVertex,
					   ExpressionVertex& theReplacementTargetVertex,
					   Assignment::PointerPairList& theVertexPointerPairList) {
//     DBG_MACRO(DbgGroup::CALLSTACK, "Assignment::localRHSExtractionInner");
//     Expression& theExpression(myLinearizedRightHandSide);
//     ExpressionVertex& theSourceVertex(theExpression.getSourceOf(theEdge));
//     ExpressionVertex* theReplacementSourceVertex_p(0);
//     // did we add it already?
//     for (PointerPairList::const_iterator li=theVertexPointerPairList.begin();
// 	 li!=theVertexPointerPairList.end();
// 	 ++li) { 
//       if ((*li).first==&theSourceVertex) { 
// 	theReplacementSourceVertex_p=(*li).second;
// 	break;
//       } // end if 
//     } // end for 
//     if (!theReplacementSourceVertex_p) { 
//       if (theSourceVertex.hasAuxilliaryVariableReference()) {    
// 	// check if we have a subexpression that needs to be dealt with 
// 	// first 
// 	if (!theSourceVertex.hasReplacement()) { 
// 	  Expression::InEdgeIteratorPair pe(theExpression.getInEdgesOf(theSourceVertex));
// 	  Expression::InEdgeIterator beginIte(pe.first), endIte(pe.second);
// 	  for (;beginIte!=endIte;++beginIte) { 
// 	    // do this first so we get the order right
// 	    // for all the replacement assignments
// 	    localRHSExtractionOuter(*beginIte);
// 	  } // end for 
// 	} // end if 
// 	// if we have an auxilliary Variable
// 	// then the replacement for this vertex needs to be a
// 	// variable reference initialized from the AuxilliaryVariableReference
// 	VariableReference* theReplacementVariableReference_p=new VariableReference();
// 	theReplacementSourceVertex_p=theReplacementVariableReference_p;
// 	// here we have to explicitly set the ID while in all other 
// 	// cases it is copied through the 'createCopyOfMyself' calls
// 	theReplacementSourceVertex_p->setId(theSourceVertex.getId());
// 	theSourceVertex.getAuxilliaryVariableReference().
// 	  copyMyselfInto(theReplacementVariableReference_p->getBaseVariableReference());
//       } // end if (has auxilliary reference)
//       else { // doesn't have auxilliary reference
// 	// make a simple copy
// 	theReplacementSourceVertex_p=&(theSourceVertex.createCopyOfMyself());
//       } // end else 
//       // add the copy to the replacement
//       theReplacementAssignment.getRHS().supplyAndAddVertexInstance(*theReplacementSourceVertex_p);
//       // keep track of it in the map
//       theVertexPointerPairList.push_back(PointerPair(&theSourceVertex,
// 						     theReplacementSourceVertex_p));
//     } // end if 			       
//     ExpressionEdge& theReplacementEdge(theReplacementAssignment.getRHS().addEdge(*theReplacementSourceVertex_p,
// 										 theReplacementTargetVertex));
//     theEdge.copyMyselfInto(theReplacementEdge);
//     if (!theSourceVertex.hasAuxilliaryVariableReference()) {    
//       // go through the in edges of the source recursively: 
//       Expression::InEdgeIteratorPair pInner(theExpression.getInEdgesOf(theSourceVertex));
//       Expression::InEdgeIterator beginIteInner(pInner.first), endIteInner(pInner.second);
//       for (;beginIteInner!=endIteInner;++beginIteInner) { 
// 	localRHSExtractionInner(*beginIteInner,
// 				theReplacementAssignment,
// 				theSourceVertex,
// 				*theReplacementSourceVertex_p,
// 				theVertexPointerPairList);
//       } // end for 
//     } // end if 
  } // end of Assignment::localRHSExtractionInner

  class EdgeLabelWriter { 
  public: 
    EdgeLabelWriter(const Expression& e) : myE(e) {};
    template <class BoostIntenalEdgeDescriptor>
    void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const { 
      out << "[label=\"" << PartialDerivativeKind::toString(boost::get(boost::get(BoostEdgeContentType(),
										  myE.getInternalBoostGraph()),
								       v)->getPartialDerivativeKind()).c_str() << "\"]";
    };
    const Expression& myE;
  };


  class VertexLabelWriter { 
  public: 
    VertexLabelWriter(const Expression& e) : myE(e) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const { 
      out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(),
						  myE.getInternalBoostGraph()),
				       v)->equivalenceSignature().c_str() << "\"]";
    };
    const Expression& myE;
  };

  void Assignment::linearize() { 
//     if (myHaveLinearizedRightHandSide)
//       THROW_LOGICEXCEPTION_MACRO("Assignment::linearize: cannot be called twice");
//     // perform the activity analysis on the original right hand side
//     getRHS().activityAnalysis(); 
//     // display the graph: 
//     if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))      
//       GraphVizDisplay::show(getRHS(),"analyzed",
// 			    VertexLabelWriter(getRHS()),
// 			    EdgeLabelWriter(getRHS()));
//     // has the maximal node become passive?
//     Expression::VertexIteratorPair pV(getRHS().vertices());
//     Expression::VertexIterator iV(pV.first),iVe(pV.second);
//     for (;iV!=iVe ;++iV)
//       if (!getRHS().numOutEdgesOf(*iV))
// 	break;
//     if (!(*iV).isActive())
//       // make the entire assignment passive
//       passivate();
//     // copy the right hand side: 
//     getRHS().copyMyselfInto(myLinearizedRightHandSide);
//     // create auxilliary variables and 
//     // attach partial expressionsions
//     myLinearizedRightHandSide.createPartialExpressions();
//     // create ssa code
//     makeSSACodeList();
//     // clip the passive portions: 
//     myLinearizedRightHandSide.passiveReduction();
//     if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))      
//       GraphVizDisplay::show(myLinearizedRightHandSide,"analyzed",
// 			    VertexLabelWriter(myLinearizedRightHandSide),
// 			    EdgeLabelWriter(myLinearizedRightHandSide));
//     // set the flag
//     myHaveLinearizedRightHandSide=true;
  } // end of Assignment::linearize

  Expression& Assignment::getLinearizedRightHandSide() { 
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("Assignment::getLinearizedRightHandSide: this has not been linearized");
    return myLinearizedRightHandSide;
  } // end of Assignment::getLinearizedRightHandSide

  const Expression& Assignment::getLinearizedRightHandSide() const { 
    if (!myHaveLinearizedRightHandSide)
      THROW_LOGICEXCEPTION_MACRO("Assignment::getLinearizedRightHandSide: this has not been linearized");
    return myLinearizedRightHandSide;
  } // end of Assignment::getLinearizedRightHandSide

} // end of namespace xaifBooster 
