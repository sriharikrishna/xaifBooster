#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgParameter.hpp"

using namespace xaifBooster;

namespace xaifBoosterAngelInterfaceAlgorithms {  

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    AssignmentAlgBase(theContainingAssignment) { 
  }

  void AssignmentAlg::printXMLHierarchy(std::ostream& os) const { 
    getContaining().printXMLHierarchyImpl(os);
  }

  std::string 
  AssignmentAlg::debug() const { 
    return std::string("AssignmentAlg");
  }

  void 
  AssignmentAlg::algorithm_action_1() { 
    DBG_MACRO(DbgGroup::CALLSTACK,"AssignmentAlg::algorithm_action_1(flatten)");
    // this was set in BasicBlockAlg::algorithm_action_1
    PrivateLinearizedComputationalGraph& theFlattenedSequence=
      BasicBlockAlgParameter::get().getFlattenedSequence(getContaining());
    if (!getContaining().isActive()) { 
      if (getContaining().isPassivated() 
	  &&
	  getContaining().getLHS().getActiveType()) 
	BasicBlockAlgParameter::get().getDerivativePropagator(getContaining()).
	  addZeroDerivToEntryList(getContaining().getLHS());
      // for the ones that are not of active type we don't do anything.
    } // end if 
    else {
      Expression& theExpression(getContaining().getLinearizedRightHandSide());
      Expression::VertexIteratorPair p=theExpression.vertices();
      Expression::VertexIterator beginIt(p.first),endIt(p.second);
      typedef std::pair<ExpressionVertex*,PrivateLinearizedComputationalGraphVertex*> VertexPointerPair;
      std::list<VertexPointerPair> theIntermediateVertexTrackList;
      HashTable<PrivateLinearizedComputationalGraphVertex*>& theVariableReferenceTrackList(theFlattenedSequence.getVariableReferenceTrackList());
      PrivateLinearizedComputationalGraphVertex* theLHSLCGVertex_p=0; // LHS representation
      for (; beginIt!=endIt ;++beginIt) { 
	if (theVariableReferenceTrackList.hasElement((*beginIt).equivalenceSignature())) { 
	  // we have the vertex already in theFlattenedSequence
	  // and since it is in theVariableReferenceTrackList
	  // it must be a VariableReference
	  if (theExpression.numOutEdgesOf(*beginIt)>0){ 
	    // and this vertex is not maximal in the RHS
	    // we don't need to do anything
	  } // end if ,there is no else here, i.e. cannot happen
	} // end if 
	else { // the vertex is not in theVariableReferenceTrackList
	  // we need to add this vertex
	  PrivateLinearizedComputationalGraphVertex* theLCGVertex_p=new PrivateLinearizedComputationalGraphVertex;
	  theFlattenedSequence.supplyAndAddVertexInstance(*theLCGVertex_p);
	  DBG_MACRO(DbgGroup::DATA,
		    "AssignmentAlg::algorithm_action_1(flatten):" 
		    << theLCGVertex_p->debug().c_str());
	  if (theExpression.numInEdgesOf(*beginIt)==0) {
	    // JU: this should be a VariableReference
	    // JU: it cannot be a Constant since the Constants 
	    // JU: are supposed to be removed by the linerarization which has to happen
	    // JU: before the flattening, so eventually this will operate on a copy of 
	    // JU: this assignment
	    // JU: check this statement made above on Constant removal
	    theVariableReferenceTrackList.addElement((*beginIt).equivalenceSignature(),
						     theLCGVertex_p);
	    // JU: this cast will fail if Constants are not removed:
	    try { 
	      theLCGVertex_p->setRHSVariable(dynamic_cast<VariableReference&>(*beginIt).getVariable());
	    } 
	    catch(std::bad_cast& e) { 
	      THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::algorithm_action_1: invalid cast of "
					 << (*beginIt).debug().c_str() 
					 << " into a VariableReference");
	    } // end catch
	  } // end if 
	  else { // number of in edges is > 0
	    // this must be a vertex that is some intermediate
	    // i.e. an intrinsic
	    theIntermediateVertexTrackList.push_back(VertexPointerPair(&(*beginIt),theLCGVertex_p));
	  } // end else 
	  if (theExpression.numOutEdgesOf(*beginIt)==0) { 
	    if (theLHSLCGVertex_p)
	      THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::algorithm_action_1(flatten): we should only find one maximal vertex");
	    // the maximal vertex in the RHS is the  
	    // representation of the LHS
	    theLHSLCGVertex_p=theLCGVertex_p;
	  }
	} // end else
      } // end for 
      Expression::EdgeIteratorPair pe=theExpression.edges();
      Expression::EdgeIterator beginIte(pe.first),endIte(pe.second);
      for (; beginIte!=endIte ;++beginIte) { 
	PrivateLinearizedComputationalGraphVertex *theLCGSource_p(0), *theLCGTarget_p(0);
	ExpressionVertex& theSource(theExpression.getSourceOf(*beginIte));
	ExpressionVertex& theTarget(theExpression.getTargetOf(*beginIte));
	std::list<VertexPointerPair>::const_iterator listIt;
	for (listIt=theIntermediateVertexTrackList.begin();
	     (listIt!=theIntermediateVertexTrackList.end()) 
	       &&
	       !(theLCGSource_p && theLCGTarget_p);
	     listIt++) {
	  // look in the intermediate list first
	  if ((!theLCGSource_p) 
	      && 
	      (&theSource == (*listIt).first))
	    theLCGSource_p=(*listIt).second;
	  if ((!theLCGTarget_p) 
	      && 
	      (&theTarget == (*listIt).first))
	    theLCGTarget_p=(*listIt).second;
	} // end for
	if (!theLCGTarget_p) 
	  THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::algorithm_action_1(flatten): cannot find edge target");
	if (!theLCGSource_p) 
	  // we would have to have found the target 
	  // already (always intermediate) but the 
	  // source can be a variable reference
	  // the following call will throw an exception on 
	  // its own if the source cannot be found. 
	  theLCGSource_p=theVariableReferenceTrackList.getElement(theSource.equivalenceSignature());
	PrivateLinearizedComputationalGraphEdge* theEdge_p=new PrivateLinearizedComputationalGraphEdge();
	// set the back reference
	theEdge_p->setLinearizedExpressionEdge(*beginIte);
	theFlattenedSequence.supplyAndAddEdgeInstance(*theEdge_p,
						      *theLCGSource_p,
						      *theLCGTarget_p);
	DBG_MACRO(DbgGroup::DATA,
		  "AssignmentAlg::algorithm_action_1(flatten)"
		  << " Edge source:" 
		  << theLCGSource_p->debug().c_str() 
		  << " target " 
		  <<  theLCGTarget_p->debug().c_str());
      } // end for 
      Variable& theLHS(getContaining().getLHS());
      if (theVariableReferenceTrackList.hasElement(theLHS.equivalenceSignature()))  
	theVariableReferenceTrackList.removeElement(theLHS.equivalenceSignature());
      if (!theLHSLCGVertex_p)
	THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::algorithm_action_1(flatten): don't have a maximal vertex");
      theVariableReferenceTrackList.addElement(theLHS.equivalenceSignature(),
					       theLHSLCGVertex_p);
      theLHSLCGVertex_p->setLHSVariable(theLHS);
      // JU: this is a temporary measure, add all LHSs to the 
      // JU: list of dependent variables
      theFlattenedSequence.addToDependentList(*theLHSLCGVertex_p);
    } // end else 
  } 

  void AssignmentAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 
  
} // end of namespace xaifBoosterAngelInterfaceAlgorithms 
