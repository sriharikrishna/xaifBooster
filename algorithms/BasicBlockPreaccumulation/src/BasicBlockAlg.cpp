#include <sstream>

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/Intrinsic.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/CallGraph.hpp"
#include "xaifBooster/system/inc/Constant.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSaxpy.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagatorSetDeriv.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgParameter.hpp"

/** 
 * the call to the ANGEL library
 */
namespace angel { 
  extern void compute_elimination_sequence (const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph& xgraph,
					    int tasks, 
					    xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& expression_list);
}

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  BasicBlockAlg::Sequence::~Sequence() { 
    for (AssignmentPList::iterator i=myFrontAssignmentList.begin();
	 i!=myFrontAssignmentList.end();
	 ++i) 
      if (*i)
	delete *i;
    for (AssignmentPList::iterator i=myEndAssignmentList.begin();
	 i!=myEndAssignmentList.end();
	 ++i) 
      if (*i)
	delete *i;
  }

  Assignment& BasicBlockAlg::Sequence::appendFrontAssignment() { 
    Assignment* theAssignment_p=new Assignment(true);
    myFrontAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  Assignment& BasicBlockAlg::Sequence::appendEndAssignment() { 
    Assignment* theAssignment_p=new Assignment(true);
    myEndAssignmentList.push_back(theAssignment_p);
    return *theAssignment_p;
  }

  const BasicBlockAlg::Sequence::AssignmentPList& BasicBlockAlg::Sequence::getFrontAssignmentList() const { 
    return myFrontAssignmentList;
  }

  const BasicBlockAlg::Sequence::AssignmentPList& BasicBlockAlg::Sequence::getEndAssignmentList() const { 
    return myEndAssignmentList;
  }

  std::string BasicBlockAlg::Sequence::debug () const { 
    std::ostringstream out;
    out << "Sequence[" << this 
	<< ",myFirstElement_p=" << myFirstElement_p
	<< ",myLastElement_p=" << myLastElement_p
	<< "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug


  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) : 
    BasicBlockAlgBase(theContaining) { 
    compute_elimination_sequence=&angel::compute_elimination_sequence;
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
    printXMLHierarchyImpl(os,
			  xaifBoosterDerivativePropagator::DerivativePropagator::printXMLHierarchyImpl);
  }

  void BasicBlockAlg::printXMLHierarchyImpl(std::ostream& os,
					    BasicBlockAlg::PrintDerivativePropagator_fp aPrintDerivativePropagator_fp) const { 
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
	if (*li==aSequence_p->myFirstElement_p) { 
	  // print all the stuff before the first element
	  const Sequence::AssignmentPList& theFrontList(aSequence_p->getFrontAssignmentList());
	  for(Sequence::AssignmentPList::const_iterator fli=theFrontList.begin();
	      fli!=theFrontList.end();
	      ++fli) 
	    (*(fli))->printXMLHierarchy(os);
	}
	// print the element 
	(*(li))->printXMLHierarchy(os);
	// Is it the last element?
	if (*li==aSequence_p->myLastElement_p) { 
	  // print all the stuff after the last element
	  const Sequence::AssignmentPList& theEndList(aSequence_p->getEndAssignmentList());
	  for(Sequence::AssignmentPList::const_iterator fli=theEndList.begin();
	      fli!=theEndList.end();
	      ++fli) 
	    (*(fli))->printXMLHierarchy(os);
	  // that includes the accumulator
	  (aPrintDerivativePropagator_fp)(os,
					  aSequence_p->myDerivativePropagator);
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
  } // end of BasicBlockAlg::printXMLHierarchyImpl

  std::string BasicBlockAlg::debug () const { 
    std::ostringstream out;
    out << "BasicBlockAlg[" << this
	<< ",myUniqueSequencePList=";
    for(SequencePList::const_iterator myUniqueSequencePListI=myUniqueSequencePList.begin();
	myUniqueSequencePListI!=myUniqueSequencePList.end();
	++myUniqueSequencePListI) 
      out << (*myUniqueSequencePListI)->debug().c_str();
    out << "]" << std::ends;  
    return out.str();
  } // end of BasicBlockAlg::debug

  void
  BasicBlockAlg::algorithm_action_2() {
    static unsigned int recursionGuard=0;
    try { 
      recursionGuard++;
      if (recursionGuard>1)
	THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_2: recursive invocation not allowed");
      DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorithm_action_2(flatten)");
      
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
  BasicBlockAlg::algorithm_action_3() { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::algorihm_action_3");
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
      // the list to distinguish SAX from SAXPY: 
      typedef std::list<const Variable*> VariablePList;
      VariablePList theListOfAlreadyAssignedDependents;
      if (theFlattenedSequence.numVertices()>1) { 
	// call Angel which fills myJacobianAccumulationExpressionList
	try { 
	  (*compute_elimination_sequence) (theFlattenedSequence, 1, (*i)->myJacobianAccumulationExpressionList);
	} 
	catch(...) { 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::algorithm_action_3: exception thrown from within angel call");
	}
	// UN: this is used to keep track of those independent variables
	// that were already assigned to temporary variables to ensure correctness
	// of the Jacobian accumulation code.
	HashTable<const Variable*> theListOfAlreadyAssignedIndependents;
	
	InternalReferenceConcretizationList theInternalReferenceConcretizationList;
	for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	      (*i)->myJacobianAccumulationExpressionList.getGraphList().begin();
	    it!=(*i)->myJacobianAccumulationExpressionList.getGraphList().end();
	    ++it) { 
	  // make a new assignment: 
	  Assignment& aNewAssignment=(*i)->appendEndAssignment();
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
	  theLHS.getAliasMapKey().setTemporary();
	  theLHS.getDuUdMapKey().setTemporary();
	  const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
	  if (theExpression.isJacobianEntry()) { 
	    // UN: assign independent to temporary if aliased by some
	    // dependent
	    // use temporary in DerivativePropagator
	    // temporary currently lives in global scope 
	    // this is the actual independent:
	    const Variable& 
	      theIndepVariable(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
			       (theExpression.getIndependent()).getRHSVariable());
	    const Variable* theIndepVariableContainer_cp=0;
	    if (isAliased(theIndepVariable,
			  theFlattenedSequence)) { 
	      // make a Variable (container) for use in the saxpys:
	      Variable* theIndepVariableContainer_p = new Variable;
	      myNewIndependentsPList.push_back(theIndepVariableContainer_p);
	      // was this actual indepenent already assigned?
	      // Note, that at this point they should indeed all be syntactically distinct 
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
		theTarget.getAliasMapKey().setTemporary();
		theTarget.getDuUdMapKey().setTemporary();
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
	      } // end if (wasn't assigned efore  
	      else {
		// yes, it was assigned before
		// copy the previously created temporary into the container
		(theListOfAlreadyAssignedIndependents.getElement(theIndepVariable.equivalenceSignature()))->
		  copyMyselfInto(*theIndepVariableContainer_p); 
	      }
	      // point to the new or previously created temporary
	      theIndepVariableContainer_cp=theIndepVariableContainer_p;
	    } // end if isAliased
	    else { // not aliased
	      // point to the original independent
	      theIndepVariableContainer_cp=&theIndepVariable;
	    }
	    // make the entry to the DerivativePropagator
	    // UN: use the  variable in the container theIndepVariableContainer_p 
	    // instead of original independent
	    const Variable& theDependent(dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>
					 (theExpression.getDependent()).getLHSVariable());
	    xaifBoosterDerivativePropagator::DerivativePropagatorSaxpy& theSaxpy((*i)->myDerivativePropagator.addSaxpyToEntryList(theLHS,
																  *theIndepVariableContainer_cp,
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
	  } // end if is JacobianEntry
	  // iterate through all vertices bottom up
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair aPair(theExpression.vertices());
	  xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator aJacExprVertexI(aPair.first), aJacExprVertexIEnd(aPair.second);
	  // find the maximal vertex
	  for (;aJacExprVertexI!=aJacExprVertexIEnd; ++aJacExprVertexI) { 
	    if (!theExpression.numOutEdgesOf(*aJacExprVertexI))
	      break;
	  } // end for
	  VertexPairList theVertexPairList;
	  traverseAndBuildJacobianAccumulationsFromBottomUp(*aJacExprVertexI,
							    theExpression,
							    aNewAssignment,
							    theInternalReferenceConcretizationList,
							    theVertexPairList);
	  // add the LHS to the tracking list: 
	  theInternalReferenceConcretizationList.push_back(InternalReferenceConcretization(&*aJacExprVertexI,&theLHS));
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
  } // end of BasicBlockAlg::algorihm_action_3
 
  void BasicBlockAlg::traverseAndBuildJacobianAccumulationsFromBottomUp(const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theVertex,
									const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression,
									Assignment& theNewAssignment,
									const InternalReferenceConcretizationList& theInternalReferenceConcretizationList,
									VertexPairList& theVertexPairList) { 
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIteratorPair pi(theExpression.getInEdgesOf(theVertex));
    xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIterator aJacExprEdgeI(pi.first),aJacExprEdgeIEnd(pi.second);
    for (;aJacExprEdgeI!=aJacExprEdgeIEnd ;++aJacExprEdgeI)
      traverseAndBuildJacobianAccumulationsFromBottomUp(theExpression.getSourceOf(*aJacExprEdgeI),
							theExpression,
							theNewAssignment,
							theInternalReferenceConcretizationList,
							theVertexPairList); 
    // we add this vertex depending on its type
    ExpressionVertex* theNewExpressionVertex_p(0);
    switch (theVertex.getReferenceType()) { 
    case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::INTERNAL_REF: 
      {
	const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& theReferredToVertex(theVertex.getInternalReference());
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
	// we make the new Argument
	Argument* theInternalArgument_p=new Argument();
	theNewExpressionVertex_p=theInternalArgument_p;
	(*it).second->copyMyselfInto(theInternalArgument_p->getVariable());
	theNewExpressionVertex_p->setId(theNewAssignment.getRHS().getNextVertexId());
	theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
	break;
      } 
    case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::EXTERNAL_REF: 
      { 
	// we know that we can do the following cast
	// since we handed PrivateLinearizedComputationalGraphEdges
	// to Angel in the first place
	const PrivateLinearizedComputationalGraphEdge& thePrivateEdge(dynamic_cast<const PrivateLinearizedComputationalGraphEdge&>(theVertex.getExternalReference()));
	if(thePrivateEdge.getParallels().size()) { 
	  unsigned int position;
	  Intrinsic* theIntrinsic_p=0;
	  for (PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList::const_iterator i=thePrivateEdge.getParallels().begin();
	       i!=thePrivateEdge.getParallels().end();
	       ++i) { 
	    Argument* theExternalArgument_p=new Argument();
	    dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*i)->getExpressionEdgeAlgBase()).
	      getConcretePartialAssignment().getLHS().copyMyselfInto(theExternalArgument_p->getVariable());
	    theExternalArgument_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theExternalArgument_p);
	    if (theIntrinsic_p) { // have one addition already
	      ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theIntrinsic_p,
									   *theExternalArgument_p));
	      // make up an ID
	      theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	      theNewEdge.setPosition(position++);
	    }	      
	    theIntrinsic_p=new Intrinsic("add_scal_scal");
	    position=1; // start a new addition
	    theIntrinsic_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theIntrinsic_p);
	    ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theExternalArgument_p,
									 *theIntrinsic_p));
	    // make up an ID
	    theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	    theNewEdge.setPosition(position++);
	  } // end for 
	  // now deal with this edge
	  ExpressionVertex* theNewVertex_p=0;
	  if (thePrivateEdge.isUnitExpressionEdge()) { 
	    // add the constant '1' to the assignment
	    Constant* theConstant_p=new Constant(SymbolType::INTEGER_STYPE,
						 false);
	    // set the value
	    theConstant_p->setint(1);
	    // set the vertex id
	    theConstant_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    // add it to RHS
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theConstant_p);
	    theNewVertex_p=theConstant_p;
	  } 
	  else { 
	    Argument* theExternalArgument_p=new Argument();
	    dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(thePrivateEdge.getLinearizedExpressionEdge().getExpressionEdgeAlgBase()).
	      getConcretePartialAssignment().getLHS().copyMyselfInto(theExternalArgument_p->getVariable());
	    theExternalArgument_p->setId(theNewAssignment.getRHS().getNextVertexId());
	    theNewAssignment.getRHS().supplyAndAddVertexInstance(*theExternalArgument_p);
	    theNewVertex_p=theExternalArgument_p;
	  }
	  if (theIntrinsic_p) { // have one addition already
	    ExpressionEdge& theNewEdge(theNewAssignment.getRHS().addEdge(*theNewVertex_p,
									 *theIntrinsic_p));
	    // make up an ID
	    theNewEdge.setId(theNewAssignment.getRHS().getNextEdgeId());
	    theNewEdge.setPosition(position++);
	  }
	  theNewExpressionVertex_p=theIntrinsic_p;	      
	} // end if 
	else { 
	  if (thePrivateEdge.isUnitExpressionEdge()) { 
	    // add the constant '1' to the assignment
	    Constant* theConstant_p=new Constant(SymbolType::INTEGER_STYPE,
						 false);
	    // set the value
	    theConstant_p->setint(1);
	    theNewExpressionVertex_p=theConstant_p;
	  } // end if 
	  else { 
	    const ExpressionEdge& theOriginalAssignmentExpressionEdge(thePrivateEdge.getLinearizedExpressionEdge());
	    // we make the new Argument
	    // use the LHS of the local elementary partial assignment
	    Argument* theExternalArgument_p=new Argument();
	    theNewExpressionVertex_p=theExternalArgument_p;
	    dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>(theOriginalAssignmentExpressionEdge.getExpressionEdgeAlgBase()).
	      getConcretePartialAssignment().getLHS().copyMyselfInto(theExternalArgument_p->getVariable());
	  } // end else
	  theNewExpressionVertex_p->setId(theNewAssignment.getRHS().getNextVertexId());
	  theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
	} // end else 
	break;
      } 
    case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION: 
      { 
	std::string anOpName;
	switch (theVertex.getOperation()) { 
	case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP: 
	  anOpName="add_scal_scal";
	  break;
	case xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP: 
	  anOpName="mul_scal_scal";
	  break;
	default: 
	  THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown operation");
	  break;
	} // end switch 
	Intrinsic* theIntrinsic_p=new Intrinsic(anOpName);
	theNewExpressionVertex_p=theIntrinsic_p;
	theNewExpressionVertex_p->setId(theNewAssignment.getRHS().getNextVertexId());
	theNewAssignment.getRHS().supplyAndAddVertexInstance(*theNewExpressionVertex_p);
	break;
      } 
    default :
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::traverseFromBottomUp: unknown vertex type");
      break;
    } // end switch 
    theVertexPairList.push_back(VertexPair(&theVertex,theNewExpressionVertex_p));
    if (theVertex.getReferenceType()==xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION) { 
      // add the edges
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIteratorPair pe(theExpression.getInEdgesOf(theVertex));
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstInEdgeIterator ite(pe.first),aJacExprEdgeIEnd(pe.second);
      // JU: this is the position hack talked about in the todo item.
      unsigned int position=1;
      for (;ite!=aJacExprEdgeIEnd ;++ite) { 
	const ExpressionVertex *theConcreteSourceVertex_p(0);
	const xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex& 
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
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::getFlattenedSequence entering with "
	      << debug().c_str());
    Sequence* theSequence_p=0;
    if(!myBasicBlockElementSequencePPairList.size()) { 
      // not initialized
      for (PlainBasicBlock::BasicBlockElementList::const_iterator i=
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
	      theSequence_p->myFirstElement_p=theSequence_p->myLastElement_p=&theAssignment;
	      myUniqueSequencePList.push_back(theSequence_p);
	    } 
	    else { 
 	      // have something assigned which means this 
 	      // assignment is directly following its predecessor
 	      // so we use the same triple
 	      theSequence_p=(*i).second;
              theSequence_p->myLastElement_p=&theAssignment;
	    }
	    // go back to the requesting assignment: 
	    ++i;
	  } 
	  else { // have no predecessor
	    theSequence_p=new Sequence;
	    theSequence_p->myFirstElement_p=theSequence_p->myLastElement_p=&theAssignment;
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
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::getFlattenedSequence leaving with "
	      << debug().c_str());
    return theSequence_p->myFlattenedSequence;
  } // end of BasicBlockAlg::getFlattenedSequence

  void BasicBlockAlg::splitFlattenedSequence(const Assignment& theAssignment) { 
    DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::splitFlattenedSequence entering with "
	      << debug().c_str());
    if(!myBasicBlockElementSequencePPairList.size()) { 
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::splitFlattenedSequence: must be initialized unless called out of order");
    }
    for (BasicBlockElementSequencePPairList::iterator i=myBasicBlockElementSequencePPairList.begin();
	 i!=myBasicBlockElementSequencePPairList.end();
	 ++i) { 
      if ((*i).first==&theAssignment) { 
	if((*i).second) { // this should always be true
	  // reset the current sequence's last element
	  // which must be by definition the direct predecessor
	  --i;
	  BasicBlockElement* thePredecessorAssignment_p=(*i).first;
	  //reset iterator
	  ++i;
	  (*i).second->myLastElement_p=thePredecessorAssignment_p;
	}
	// now make a new one for this assignment
	(*i).second=new Sequence;
	(*i).second->myFirstElement_p=(*i).second->myLastElement_p=&theAssignment;
	myUniqueSequencePList.push_back((*i).second);
	DBG_MACRO(DbgGroup::CALLSTACK, "BasicBlockAlg::splitFlattenedSequence leaving with "
		  << debug().c_str());
	return; 
      } 
    } // end if 
    THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::splitFlattenedSequence: couldn't find"
			       << theAssignment.debug().c_str());
  } // end of BasicBlockAlg::splitFlattenedSequence

  xaifBoosterDerivativePropagator::DerivativePropagator& 
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
      THROW_LOGICEXCEPTION_MACRO("BasicBlockAlg::getDerivativePropagator: no Sequence exists for element "
				 << theAssignment.debug().c_str());
    return theSequence_p->myDerivativePropagator;
  } // end of BasicBlockAlg::getDerivativePropagator

  bool BasicBlockAlg::isAliased(const Variable& theIndepVariable,
				const PrivateLinearizedComputationalGraph& theFlattenedSequence) { 
    const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList& 
      theDependentList(theFlattenedSequence.getDependentList());
    AliasMap& theAliasMap(ConceptuallyStaticInstances::instance()->
			  getCallGraph().getAliasMap());
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::VertexPointerList::const_iterator li=theDependentList.begin();
	 li!=theDependentList.end();
	 ++li) { 
      if (theAliasMap.mayAlias(theIndepVariable.getAliasMapKey(),
			       dynamic_cast<const PrivateLinearizedComputationalGraphVertex&>(**li).getLHSVariable().getAliasMapKey()))
	return true;
    } // end for 
    return false;
  } // end of BasicBlockAlg::isAliased

  const BasicBlock&
  BasicBlockAlg::getContaining() const {
    return dynamic_cast<const BasicBlock&>(myContaining);
  }


} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
