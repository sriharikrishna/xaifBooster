#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlgParameter.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    xaifBoosterLinearization::AssignmentAlg(theContainingAssignment) { 
  }

  void AssignmentAlg::printXMLHierarchy(std::ostream& os) const { 
    xaifBoosterLinearization::AssignmentAlg::printXMLHierarchy(os);
  }

  std::string 
  AssignmentAlg::debug() const { 
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg["
	<< this 
	<< ","
	<< xaifBoosterLinearization::AssignmentAlg::debug().c_str()
	<< "]" << std::ends;  
    return out.str();
  }

  void 
  AssignmentAlg::algorithm_action_1() { 
    xaifBoosterLinearization::AssignmentAlg::algorithm_action_1();
  }
  
  void 
  AssignmentAlg::algorithm_action_2() { 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) called for: "
	      << debug().c_str());
    // this was set in BasicBlockAlg::algorithm_action_2
    PrivateLinearizedComputationalGraph& theFlattenedSequence=
      BasicBlockAlgParameter::get().getFlattenedSequence(getContaining());
    if (!getActiveFlag()) { 
      if (getContaining().getActiveFlag() // this means the assignment has been passivated 
	  &&
	  getContaining().getLHS().getActiveType())  // but the LHS is active
	BasicBlockAlgParameter::get().getDerivativePropagator(getContaining()).
	  addZeroDerivToEntryList(getContaining().getLHS());
      // for the ones that are not of active type we don't do anything.
    } // end if 
    else {
      Expression& theExpression(getLinearizedRightHandSide());
      Expression::VertexIteratorPair p=theExpression.vertices();
      Expression::VertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second);
      typedef std::pair<ExpressionVertex*,PrivateLinearizedComputationalGraphVertex*> VertexPointerPair;
      std::list<VertexPointerPair> theIntermediateVertexTrackList;
      PrivateLinearizedComputationalGraph::VariableTrackList& theVariableTrackList(theFlattenedSequence.getVariableTrackList());
      PrivateLinearizedComputationalGraphVertex* theLHSLCGVertex_p=0; // LHS representation
      for (; ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) { 
	if (theVariableTrackList.hasElement((*ExpressionVertexI).equivalenceSignature())) { 
	  // we have the vertex already in theFlattenedSequence
	  // and since it is in theVariableTrackList
	  // it must be a Variable
	  if (theExpression.numOutEdgesOf(*ExpressionVertexI)>0){ 
	    // and this vertex is not maximal in the RHS
	    // we don't need to do anything
	  } // end if ,there is no else here, i.e. cannot happen
	} // end if 
	else { // the vertex is not in theVariableTrackList
	  // we need to add this vertex
	  PrivateLinearizedComputationalGraphVertex* theLCGVertex_p=new PrivateLinearizedComputationalGraphVertex;
	  theFlattenedSequence.supplyAndAddVertexInstance(*theLCGVertex_p);
	  DBG_MACRO(DbgGroup::DATA,
		    "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten):" 
		    << theLCGVertex_p->debug().c_str());
	  if (theExpression.numInEdgesOf(*ExpressionVertexI)==0) {
	    // JU: this should be a Variable
	    // JU: it cannot be a Constant since the Constants 
	    // JU: are supposed to be removed by the linerarization which has to happen
	    // JU: before the flattening, so eventually this will operate on a copy of 
	    // JU: this assignment
	    // JU: check this statement made above on Constant removal
	    theVariableTrackList.addElement((*ExpressionVertexI).equivalenceSignature(),
					    theLCGVertex_p);
	    // JU: this cast will fail if Constants are not removed:
	    try { 
	      theLCGVertex_p->setRHSVariable(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	    } 
	    catch(std::bad_cast& e) { 
	      THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2: invalid cast of "
					 << (*ExpressionVertexI).debug().c_str() 
					 << " into a Variable for "
					 << getContaining().debug().c_str());
	    } // end catch
	  } // end if 
	  else { // number of in edges is > 0
	    // this must be a vertex that is some intermediate
	    // i.e. an intrinsic
	    theIntermediateVertexTrackList.push_back(VertexPointerPair(&(*ExpressionVertexI),theLCGVertex_p));
	  } // end else 
	  if (theExpression.numOutEdgesOf(*ExpressionVertexI)==0) { 
	    if (theLHSLCGVertex_p)
	      THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): we should only find one maximal vertex");
	    // the maximal vertex in the RHS is the  
	    // representation of the LHS
	    theLHSLCGVertex_p=theLCGVertex_p;
	  }
	} // end else
      } // end for 
      Expression::EdgeIteratorPair pe=theExpression.edges();
      Expression::EdgeIterator ExpressionEdgeI(pe.first),ExpressionEdgeIEnd(pe.second);
      for (; ExpressionEdgeI!=ExpressionEdgeIEnd ;++ExpressionEdgeI) { 
	PrivateLinearizedComputationalGraphVertex *theLCGSource_p(0), *theLCGTarget_p(0);
	ExpressionVertex& theSource(theExpression.getSourceOf(*ExpressionEdgeI));
	ExpressionVertex& theTarget(theExpression.getTargetOf(*ExpressionEdgeI));
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
	  THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): cannot find edge target");
	if (!theLCGSource_p) 
	  // we would have to have found the target 
	  // already (always intermediate) but the 
	  // source can be a variable reference
	  // the following call will throw an exception on 
	  // its own if the source cannot be found. 
	  theLCGSource_p=theVariableTrackList.getElement(theSource.equivalenceSignature());
	PrivateLinearizedComputationalGraphEdge* theEdge_p=new PrivateLinearizedComputationalGraphEdge();
	// set the back reference
	theEdge_p->setLinearizedExpressionEdge(*ExpressionEdgeI);
	theFlattenedSequence.supplyAndAddEdgeInstance(*theEdge_p,
						      *theLCGSource_p,
						      *theLCGTarget_p);
	DBG_MACRO(DbgGroup::DATA,
		  "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten)"
		  << " Edge source:" 
		  << theLCGSource_p->debug().c_str() 
		  << " target " 
		  <<  theLCGTarget_p->debug().c_str());
      } // end for 
      const Variable& theLHS(getContaining().getLHS());
      if (theVariableTrackList.hasElement(theLHS.equivalenceSignature()))  
	theVariableTrackList.removeElement(theLHS.equivalenceSignature());
      if (!theLHSLCGVertex_p)
	THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): don't have a maximal vertex");
      theVariableTrackList.addElement(theLHS.equivalenceSignature(),
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
