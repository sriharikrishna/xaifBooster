#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/BasicBlockAlg.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/PlainAssignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/VariableReference.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/Constant.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgParameter.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/DerivativePropagatorSetDeriv.hpp"

namespace angel { 
  extern void compute_elimination_sequence (const xaifBooster::LinearizedComputationalGraph& xgraph,
					    int tasks, 
					    xaifBooster::JacobianAccumulationExpressionList& expression_list);
}

using namespace xaifBooster;

namespace xaifBoosterAngelInterfaceAlgorithms { 

  BasicBlockAlg::Sequence::~Sequence() { 
    for (PlainAssignmentPList::iterator i=myFrontAssignmentList.begin();
	 i!=myFrontAssignmentList.end();
	 ++i) 
      if (*i)
	delete *i;
    for (PlainAssignmentPList::iterator i=myEndAssignmentList.begin();
	 i!=myEndAssignmentList.end();
	 ++i) 
      if (*i)
	delete *i;
  }

  PlainAssignment& BasicBlockAlg::Sequence::appendFrontAssignment() { 
    PlainAssignment* theAssignment_p=new PlainAssignment(true);
    myFrontAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  PlainAssignment& BasicBlockAlg::Sequence::appendEndAssignment() { 
    PlainAssignment* theAssignment_p=new PlainAssignment(true);
    myEndAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  const BasicBlockAlg::Sequence::PlainAssignmentPList& BasicBlockAlg::Sequence::getFrontAssignmentList() const { 
    return myFrontAssignmentList;
  }

  const BasicBlockAlg::Sequence::PlainAssignmentPList& BasicBlockAlg::Sequence::getEndAssignmentList() const { 
    return myEndAssignmentList;
  }

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    BasicBlockAlgBase(theContaining) { 
  }

  BasicBlockAlg::~BasicBlockAlg() {
    for(SequencePList::iterator i=myUniqueSequencePList.begin();
	i!=myUniqueSequencePList.end();
	++i)
      if (*i) // should always be true
	delete *i;
    for(VariablePList::iterator i=myNewIndependentsPList.begin();
	i!=myNewIndependentsPList.end();
	++i)
      if (*i) // should always be true
	delete *i;
    for(VariablePList::iterator i=myIndependentsPList.begin();
	i!=myIndependentsPList.end();
	++i)
      if (*i) // should always be true
	delete *i;
    for(VariablePList::iterator i=myDependentsPList.begin();
	i!=myDependentsPList.end();
	++i)
      if (*i) // should always be true
	delete *i;
  } // end of BasicBlockAlg::~BasicBlockAlg()

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const { 
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<"
       << PlainBasicBlock::ourXAIFName.c_str()
       << " " 
       << PlainBasicBlock::our_myId_XAIFName.c_str()
       << "=\"" 
       << getContaining().getId().c_str()
       << "\" " 
       << ObjectWithAnnotation::our_myAnnotation_XAIFName.c_str() 
       << "=\""
       << getContaining().getAnnotation().c_str()
       << "\" " 
       << PlainBasicBlock::our_myScopeId_XAIFName.c_str() 
       << "=\""
       << getContaining().getScope().getId().c_str()
       << "\">" 
       << std::endl;
    for (PlainBasicBlock::BasicBlockElementList::const_iterator li=getContaining().getBasicBlockElementList().begin();
	 li!=getContaining().getBasicBlockElementList().end();
	 li++) { 
      // do we have a sequence for this element?
      Sequence* aSequence_p=0;
      for (BasicBlockElementSequencePPairList::const_iterator pli=
	     myBasicBlockElementSequencePPairList.begin();
	   pli!=myBasicBlockElementSequencePPairList.end();
	   pli++) { 
	if((*pli).first==*li) { 
	  if ((*pli).second) 
	    aSequence_p=(*pli).second;
	  break;
	}
      }
      if (aSequence_p) { 
	// we have a sequence.
	// Is it the first element?
	if (*li==aSequence_p->myFirstElement) { 
	  // print all the stuff before the first element
	  const Sequence::PlainAssignmentPList& theFrontList(aSequence_p->getFrontAssignmentList());
	  for(Sequence::PlainAssignmentPList::const_iterator fli=theFrontList.begin();
	      fli!=theFrontList.end();
	      ++fli) 
	    (*(fli))->printXMLHierarchy(os);
	}
	// print the element 
	(*(li))->printXMLHierarchy(os);
	// Is it the last element?
	if (*li==aSequence_p->myFirstElement) { 
	  // print all the stuff after the last element
	  const Sequence::PlainAssignmentPList& theEndList(aSequence_p->getEndAssignmentList());
	  for(Sequence::PlainAssignmentPList::const_iterator fli=theEndList.begin();
	      fli!=theEndList.end();
	      ++fli) 
	    (*(fli))->printXMLHierarchy(os);
	  // that includes the accumulator
	  aSequence_p->myDerivativePropagator.printXMLHierarchy(os);
	}
      }// end if have sequence
      else 
	// have no sequence, just print the element
	(*(li))->printXMLHierarchy(os);
    } // end for all BasicBlockElement instances
    os << pm.indent()
       << "</"
       << PlainBasicBlock::ourXAIFName.c_str()
       << ">"
       << std::endl;
    pm.releaseInstance();
  } // end of BasicBlockAlg::printXMLHierarchy

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "BasicBlockAlg[" << this 
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void
  BasicBlockAlg::algorithm_action_1() {
    static unsigned int recursionGuard=0;
    try { 
      recursionGuard++;
      if (recursionGuard>1)
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_1: recursive invocation not allowed");
      DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorithm_action_1(flatten)");
      
      // the BasicBlock instance will be used in AssignmentAlg::algorithm_action_1:
      // because of virtual function use on the system structural level we cannot 
      // invoke directly and need to rely on GenericTraverseInvoke
      // In order to pass parameters through BasicBlockParameter
      // we have to make sure that this method is never invoked recursively
      BasicBlockAlgParameter::set(*this);	
    } 
    catch (...) { 
      recursionGuard--;
      throw;
    }
    recursionGuard--;
  }

  void 
  BasicBlockAlg::algorithm_action_2() { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorihm_action_2");
    for (SequencePList::iterator i=myUniqueSequencePList.begin();
	 i!=myUniqueSequencePList.end();
	 ++i) { // outer loop over all items in myUniqueSequencePList
      PrivateLinearizedComputationalGraph& theFlattenedSequence=(*i)->myFlattenedSequence;
      PrivateLinearizedComputationalGraph::VertexIteratorPair p(theFlattenedSequence.vertices());
      PrivateLinearizedComputationalGraph::VertexIterator it(p.first),endIt(p.second);
      for (;it!=endIt;++it) { 
	// here we should have constants etc. already removed
	// JU: this is temporary until we have r/w analysis
	// JU: the dependent variables are all LHSs of all assignments
	if (!theFlattenedSequence.numInEdgesOf(*it)) {
	  theFlattenedSequence.addToIndependentList(*it);
	}
      } 
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS)) {     
	GraphVizDisplay::show(theFlattenedSequence,"flattened");
      } 
      if (DbgLoggerManager::instance()->isSelected(DbgGroup::TEMPORARY)) {     
	std::ostringstream mesg;
	mesg << "list of dependents "; 
	for (LinearizedComputationalGraph::VertexPointerList::const_iterator i=theFlattenedSequence.getDependentList().begin();
	     i!=theFlattenedSequence.getDependentList().end();
	     ++i) { 
	  mesg << dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(*i)->getLHSVariable().equivalenceSignature().c_str() << ",";
	}
	mesg << "list of independents "; 
	for (LinearizedComputationalGraph::VertexPointerList::const_iterator i=theFlattenedSequence.getIndependentList().begin();
	     i!=theFlattenedSequence.getIndependentList().end();
	     ++i) { 
	  mesg << dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(*i)->getRHSVariable().equivalenceSignature().c_str() << ",";
	}
	mesg << std::ends;
	DBG_MACRO(DbgGroup::TEMPORARY,mesg.str());
      } 
      // the list to distinguish SAX from SAXPY: 
      typedef std::list<const Variable*> VariablePList;
      VariablePList theListOfAlreadyAssignedDependents;
      if (theFlattenedSequence.numVertices()>1) { 
	// call Angel which fills myJacobianAccumulationExpressionList
	angel::compute_elimination_sequence (theFlattenedSequence, 1, (*i)->myJacobianAccumulationExpressionList);
	// UN: this is used to keep track of those independent variables
	// that were already assigned to temporary variables to ensure correctness
	// of the Jacobian accumulation code.
	HashTable<const Variable*> theListOfAlreadyAssignedIndependents;
	
	InternalReferenceConcretizationList theInternalReferenceConcretizationList;
	for(JacobianAccumulationExpressionList::GraphList::const_iterator it=
	      (*i)->myJacobianAccumulationExpressionList.getGraphList().begin();
	    it!=(*i)->myJacobianAccumulationExpressionList.getGraphList().end();
	    ++it) { 
	  // make a new assignment: 
	  PlainAssignment& aNewAssignment=(*i)->appendEndAssignment();
	  // JU should we get away with this setting of "jacobian_accumulation" for the Id
	  aNewAssignment.setId("jacobian_accumulation");
	  // make a new LHS: 
	  Variable& theLHS(aNewAssignment.getLHS());
	  Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
				getCallGraph().getScopeTree().getGlobalScope());
	  VariableSymbolReference* theVariableSymbolReference_p=
	    new VariableSymbolReference(theGlobalScope.getSymbolTable().
					    addUniqueAuxSymbol(SymbolKind::VARIABLE,
							       SymbolType::REAL_STYPE,
							       SymbolShape::SCALAR,
							       false),
					    theGlobalScope);
	  // JU: this assignment of the vertex Id might have to change 
	  // if we create vector assignments as auxilliary variables...
	  theVariableSymbolReference_p->setId("1");
	  theLHS.supplyAndAddVertexInstance(*theVariableSymbolReference_p);
	  theLHS.getAliasActivityMapKey().setTemporary();
	  const JacobianAccumulationExpression& theExpression(*(*it));
	  if (theExpression.isJacobianEntry()) { 
	    // UN: assign independent to temporary if aliased by some
	    // dependent
	    // use temporary in DerivativePropagator
	    // temporary currently lives in global scope 
	    if (true) { // isAliased(...)
	      // make a Variable (container) for use in the saxpys:
	      Variable* theIndepVariableContainer_p = new Variable;
	      myNewIndependentsPList.push_back(theIndepVariableContainer_p);
	      // this is the actual independent:
	      const Variable& 
		theIndepVariable(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
					      (theExpression.getIndependent()).getRHSVariable());
	      // was this actual indepenent already assigned?
	      if (!(theListOfAlreadyAssignedIndependents.hasElement(theIndepVariable.equivalenceSignature()))) {
		// no, we have to make a new assignment
		// this will be the lhs:
		Variable theTarget;
		Scope& theGlobalScope(ConceptuallyStaticInstances::instance()->
				      getCallGraph().getScopeTree().getGlobalScope());
		VariableSymbolReference* theTemporaryVariableReference_p=
		  new VariableSymbolReference(theGlobalScope.getSymbolTable().
						  addUniqueAuxSymbol(SymbolKind::VARIABLE,
								     SymbolType::REAL_STYPE,
								     SymbolShape::SCALAR,
								     true),
						  theGlobalScope);
		theTemporaryVariableReference_p->setId("1");
		theTarget.supplyAndAddVertexInstance(*theTemporaryVariableReference_p);
		theTarget.getAliasActivityMapKey().setTemporary();
		// copy the new temporary into the container
		theTarget.copyMyselfInto(*theIndepVariableContainer_p);
		// "theTarget" is only local but the DerivativePropagatorSetDeriv 
		// ctor performs a deep copy and owns the new instance so we are fine
		// the theListOfAlreadyAssignedIndependents needs to contain the 
		// address of the copy.
		theListOfAlreadyAssignedIndependents.
		  addElement(theIndepVariable.equivalenceSignature(),
			     &((*i)->myDerivativePropagator.addSetDerivToEntryList(theTarget,
										   theIndepVariable).getTarget()));
	      } 
	      else {
		// yes, it was assigned before
		// copy the previously created temporary into the container
		(theListOfAlreadyAssignedIndependents.getElement(theIndepVariable.equivalenceSignature()))->
		  copyMyselfInto(*theIndepVariableContainer_p); 
	      }
	      // make the entry to the DerivativePropagator
	      // UN: use the  variable in the container theIndepVariableContainer_p 
	      // instead of original independent
	      const Variable& theDependent(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
							(theExpression.getDependent()).getLHSVariable());
	      DerivativePropagatorSaxpy& theSaxpy((*i)->myDerivativePropagator.addSaxpyToEntryList(theLHS,
												   *theIndepVariableContainer_p,
												   theDependent));
	      bool found=false;
	      for (VariablePList::iterator i=theListOfAlreadyAssignedDependents.begin();
		   i!=theListOfAlreadyAssignedDependents.end();
		   ++i) { 
		if (*i==&theDependent){ 
		  found=true;
		  break;
		} 
	      }
	      if (!found) { 
		theSaxpy.useAsSax();
		theListOfAlreadyAssignedDependents.push_back(&theDependent);
	      }
	    } // UN: done
	  }
						       
	  // iterate through all vertices bottom up
	  JacobianAccumulationExpression::ConstVertexIteratorPair aPair(theExpression.vertices());
	  JacobianAccumulationExpression::ConstVertexIterator it(aPair.first), itEnd(aPair.second);
	  // find the maximal vertex
	  for (;it!=itEnd; ++it) { 
	    if (!theExpression.numOutEdgesOf(*it))
	      break;
	  } // end for
	  VertexPairList theVertexPairList;
	  int theCounter(0);
	  traverseAndBuildJacobianAccumulationsFromBottomUp(*it,
							    theExpression,
							    aNewAssignment,
							    theInternalReferenceConcretizationList,
							    theCounter,
							    theVertexPairList);
	  // add the LHS to the tracking list: 
	  theInternalReferenceConcretizationList.push_back(InternalReferenceConcretization(&*it,&theLHS));
	} // end for 
      } // end if  have flattened graph with more than one vertex
      else if (theFlattenedSequence.numVertices()==1) { // we have only one vertex, i.e. an assignment y=x: 
	(*i)->myDerivativePropagator.addSetDerivToEntryList(dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(*(theFlattenedSequence.getDependentList().begin()))->getLHSVariable(),
							    dynamic_cast<const PrivateLinearizedComputationalGraphVertex*>(*(theFlattenedSequence.getIndependentList().begin()))->getRHSVariable());
      } // end else if
      else { 
	// do nothing, empty graph, as e.g. for a single assignment x=const;
      }
    } // end for 
  } // end of BasicBlockAlg::algorihm_action_2
 
  void BasicBlockAlg::traverseAndBuildJacobianAccumulationsFromBottomUp(const JacobianAccumulationExpressionVertex& theVertex,
									const JacobianAccumulationExpression& theExpression,
									PlainAssignment& theNewAssignment,
									const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
									int& theCounter,
									VertexPairList& theVertexPairList) { 
    int theCurrentId=theCounter;
    JacobianAccumulationExpression::ConstInEdgeIteratorPair pi(theExpression.getInEdgesOf(theVertex));
    JacobianAccumulationExpression::ConstInEdgeIterator beginIte(pi.first),endIte(pi.second);
    for (;beginIte!=endIte ;++beginIte)
      traverseAndBuildJacobianAccumulationsFromBottomUp(theExpression.getSourceOf(*beginIte),
							theExpression,
							theNewAssignment,
							theInternalReferenceConcretizationList,
							++theCounter,
							theVertexPairList); 
    // we add this vertex depending on its type
    ExpressionVertex* theNewExpressionVertex_p(0);
    switch (theVertex.getReferenceType()) { 
    case JacobianAccumulationExpressionVertex::INTERNAL_REF: 
      {
	const JacobianAccumulationExpressionVertex& theReferredToVertex(theVertex.getInternalReference());
	// this has to be a maximal vertex in one of previous 
	// expressions in the list that we tracked already: 
	InternalReferenceConcretizationList::const_iterator it;
	for (it=theInternalReferenceConcretizationList.begin();
	     it!=theInternalReferenceConcretizationList.end();
	     ++it) 
	  if ((*it).first==&theReferredToVertex) 
	    break;
	if (it==theInternalReferenceConcretizationList.end()) 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown internal reference");
	// we make the new VariableReference
	VariableReference* theInternalVariableReference_p=new VariableReference();
	theNewExpressionVertex_p=theInternalVariableReference_p;
	(*it).second->copyMyselfInto(theInternalVariableReference_p->getVariable());
	break;
      } 
    case JacobianAccumulationExpressionVertex::EXTERNAL_REF: 
      { 
	// we know that we can do the following cast
	// since we handed PrivateLinearizedComputationalGraphEdges
	// to Angel in the first place
	const ExpressionEdge& theOriginalAssignmentExpressionEdge(dynamic_cast<const PrivateLinearizedComputationalGraphEdge&>(theVertex.getExternalReference()).
								  getLinearizedExpressionEdge());
	// we make the new VariableReference
	// use the LHS of the local elementary partial assignment
	VariableReference* theExternalVariableReference_p=new VariableReference();
	theNewExpressionVertex_p=theExternalVariableReference_p;
	theOriginalAssignmentExpressionEdge.getConcretePartialAssignment().getLHS().
	  copyMyselfInto(theExternalVariableReference_p->getVariable());
	break;
      } 
    case JacobianAccumulationExpressionVertex::OPERATION: 
      { 
	std::string anOpName;
	switch (theVertex.getOperation()) { 
	case JacobianAccumulationExpressionVertex::ADD_OP: 
	  anOpName="add_scal_scal";
	  break;
	case JacobianAccumulationExpressionVertex::MULT_OP: 
	  anOpName="mul_scal_scal";
	  break;
	default: 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown operation");
	  break;
	} // end switch 
	Intrinsic* theIntrinsic_p=new Intrinsic(anOpName);
	theNewExpressionVertex_p=theIntrinsic_p;
	break;
      } 
    default :
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown vertex type");
      break;
    } // end switch 
    theNewExpressionVertex_p->setId(theCurrentId);
    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
    theVertexPairList.push_back(VertexPair(&theVertex,theNewExpressionVertex_p));
    if (theVertex.getReferenceType()==JacobianAccumulationExpressionVertex::OPERATION) { 
      // add the edges
      JacobianAccumulationExpression::ConstInEdgeIteratorPair pe(theExpression.getInEdgesOf(theVertex));
      JacobianAccumulationExpression::ConstInEdgeIterator ite(pe.first),endIte(pe.second);
      // JU: this is the position hack talked about in the todo item.
      unsigned int position=1;
      for (;ite!=endIte ;++ite) { 
	const ExpressionVertex *theConcreteSourceVertex_p(0);
	const JacobianAccumulationExpressionVertex& 
	  theJacobianAccumulationExpressionSourceVertex(theExpression.getSourceOf(*ite));
	for (VertexPairList::const_iterator li=theVertexPairList.begin();
	     li!=theVertexPairList.end();
	     ++li) { 
	  if (&theJacobianAccumulationExpressionSourceVertex == (*li).first) { 
	    theConcreteSourceVertex_p=(*li).second;
	    break;
	  }
	} // end for all vertex pairs in vertex map
	if (!theConcreteSourceVertex_p)
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: could not find source");
	ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theConcreteSourceVertex_p,
								     *theNewExpressionVertex_p));
	// make up an ID
	theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	theNewEdge.setPosition(position++);
      } // end for all abstract edges
    } 
  } 

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 
  
  PrivateLinearizedComputationalGraph& 
  BasicBlockAlg::getFlattenedSequence(const Assignment& theAssignment) { 
    Sequence* theSequence_p=0;
    if(!myBasicBlockElementSequencePPairList.size()) { 
      // not initialized
      for (PlainBasicBlock::BasicBlockElementList::iterator i=
	     getContaining().getBasicBlockElementList().begin();
	   i!=getContaining().getBasicBlockElementList().end();
	   ++i)
	myBasicBlockElementSequencePPairList.push_back(BasicBlockElementSequencePPair(*i,0));
    }
    for (BasicBlockElementSequencePPairList::iterator i=myBasicBlockElementSequencePPairList.begin();
	 i!=myBasicBlockElementSequencePPairList.end();
	 ++i) 
      if ((*i).first==&theAssignment) { 
	if(!(*i).second) { // nothing assigned yet
	  if(i!=myBasicBlockElementSequencePPairList.begin()) { 
	    // have a predecessor: 
	    --i;
	    if(!(*i).second) { 
	      // nothing assigned yet which means this is not an 
	      // assignment unless we call this out of order
	      theSequence_p=new Sequence;
	      theSequence_p->myFirstElement=theSequence_p->myLastElement=&theAssignment;
	      myUniqueSequencePList.push_back(theSequence_p);
	    } 
	    else { 
	      // TEMPORARY CHANGE: 
	      // 	      // have something assigned which means this 
	      // 	      // assignment is directly following its predecessor
	      // 	      // so we use the same triple
	      // 	      theSequence_p=(*i).second;
	      //              theSequence_p->myLastElement=&theAssignment;
	      // we give one to every assignment
	      // BEGIN TEMP CODE
	      theSequence_p=new Sequence;
	      theSequence_p->myFirstElement=theSequence_p->myLastElement=&theAssignment;
	      myUniqueSequencePList.push_back(theSequence_p);
	      // END TEMP CODE
	    }
	    // go back to the requesting assignment: 
	    ++i;
	  } 
	  else { // have no predecessor
	    theSequence_p=new Sequence;
	    theSequence_p->myFirstElement=theSequence_p->myLastElement=&theAssignment;
	    myUniqueSequencePList.push_back(theSequence_p);
	  }
	  (*i).second=theSequence_p;
	} // end if nothing assigned
	else
	  theSequence_p=(*i).second;
	break;
      } // end if 
    if (!theSequence_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getFlattenedSequence: this basic block does not have element "
				 << theAssignment.debug().c_str());
    return theSequence_p->myFlattenedSequence;
  } // end of BasicBlockAlg::getFlattenedSequence

  DerivativePropagator& 
  BasicBlockAlg::getDerivativePropagator(const Assignment& theAssignment) { 
    Sequence* theSequence_p=0;
    for (BasicBlockElementSequencePPairList::iterator i=myBasicBlockElementSequencePPairList.begin();
	 i!=myBasicBlockElementSequencePPairList.end();
	 ++i) 
      if ((*i).first==&theAssignment) { 
	if((*i).second)
	  theSequence_p=(*i).second;
      } // end if 
    if (!theSequence_p)
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getDerivativeAccumulator: no Sequence exists for element "
				 << theAssignment.debug().c_str());
    return theSequence_p->myDerivativePropagator;
  } // end of BasicBlockAlg::getFlattenedSequence

} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
