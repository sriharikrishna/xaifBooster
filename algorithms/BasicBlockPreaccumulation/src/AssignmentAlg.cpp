#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
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

      // keep track of all the vertices we add with this statement in case we need to split and 
      // remove them
      std::list<PrivateLinearizedComputationalGraphVertex*> theUndoThenSplitList;

      VertexIdentificationList& theVertexIdentificationList(theFlattenedSequence.getVertexIdentificationList());
      PrivateLinearizedComputationalGraphVertex* theLHSLCGVertex_p=0; // LHS representation
      for (; ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) {
	VertexIdentificationList::IdentificationResult_E theIdResult(VertexIdentificationList::NOT_IDENTIFIED);
	if ((*ExpressionVertexI).isArgument()) 
	  theIdResult=theVertexIdentificationList.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable()).getAnswer();
	if (theIdResult==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	  // we have the vertex already in theFlattenedSequence
	  // nothing to do here
	} // end if 
	else { // the vertex cannot be uniquely identified
	  if (theIdResult==VertexIdentificationList::NOT_IDENTIFIED) { 
	    // we need to add this vertex
	    PrivateLinearizedComputationalGraphVertex* theLCGVertex_p=new PrivateLinearizedComputationalGraphVertex;
	    theUndoThenSplitList.push_back(theLCGVertex_p);
	    theFlattenedSequence.supplyAndAddVertexInstance(*theLCGVertex_p);
	    DBG_MACRO(DbgGroup::DATA,
		      "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten):" 
		      << theLCGVertex_p->debug().c_str());
	    if ((*ExpressionVertexI).isArgument()) {
	      theVertexIdentificationList.addElement(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable(),
						     theLCGVertex_p);
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
	  } // end if NOT_IDENTIFIED
	  else { // there is an ambiquity
	    // we need to undo all additions of vertices of this assignment
	    // edges have not been added yet
	    std::list<PrivateLinearizedComputationalGraphVertex*>::iterator theUndoThenSplitListI=theUndoThenSplitList.begin();
	    for (; theUndoThenSplitListI!=theUndoThenSplitList.end(); ++theUndoThenSplitListI) { 
	      theFlattenedSequence.removeAndDeleteVertex(**theUndoThenSplitListI);
	    } 
	    // now do the split
	    BasicBlockAlgParameter::get().splitFlattenedSequence(getContaining());
	    // redo everything for this assignment
	    algorithm_action_2();
	    // and leave
	    return;
	  } // end else (ambiguity)
	} // end else
      } // end for 
      Expression::EdgeIteratorPair pe=theExpression.edges();
      Expression::EdgeIterator ExpressionEdgeI(pe.first),ExpressionEdgeIEnd(pe.second);
      for (; ExpressionEdgeI!=ExpressionEdgeIEnd ;++ExpressionEdgeI) { 
	const PrivateLinearizedComputationalGraphVertex *theLCGSource_p(0), *theLCGTarget_p(0);
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
	  if(!theSource.isArgument())
	    THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): edge source must be an Argument");
	  // we would have to have found the target 
	  // already (always intermediate) but the 
	  // source can be a variable reference
	  // the following call will throw an exception on 
	  // its own if the source cannot be found. 
	  theLCGSource_p=theVertexIdentificationList.canIdentify(dynamic_cast<Argument&>(theSource).getVariable()).getVertexP();
	// filter out parallel edges:
	PrivateLinearizedComputationalGraph::OutEdgeIteratorPair 
	  anOutEdgeItPair(theFlattenedSequence.getOutEdgesOf(*theLCGSource_p));
	PrivateLinearizedComputationalGraph::OutEdgeIterator 
	  aPrivLinCompGEdgeI(anOutEdgeItPair.first),
	  aPrivLinCompGEdgeIEnd(anOutEdgeItPair.second);
	for (;aPrivLinCompGEdgeI!=aPrivLinCompGEdgeIEnd;++aPrivLinCompGEdgeI) { 
	  if (theLCGTarget_p==&(theFlattenedSequence.getTargetOf(*aPrivLinCompGEdgeI)))
	    break; // already have such an edge in here
	} // end for 
	if (aPrivLinCompGEdgeI!=aPrivLinCompGEdgeIEnd) {  // this is an edge parallel to an existing  edge
	  dynamic_cast<PrivateLinearizedComputationalGraphEdge&>(*aPrivLinCompGEdgeI).addParallel(*ExpressionEdgeI);
	  continue; // we can skip the rest
	}
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
      if (!theLHSLCGVertex_p)
	THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): don't have a maximal vertex");
      theVertexIdentificationList.replaceOrAddElement(theLHS,
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
