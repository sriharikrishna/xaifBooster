#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"

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
    //     xaifBoosterLinearization::AssignmentAlg::algorithm_action_1();
    // we don't invoke this here. 
    // rather it becomes a part of 
  }
  
  bool 
  AssignmentAlg::vertexIdentification(VertexPPairList& theVertexTrackList,
				      PrivateLinearizedComputationalGraph& theFlattenedSequence) { 
    Expression& theExpression(getLinearizedRightHandSide());
    ActiveVertexIdentificationList& theVertexLHSIdentificationList(theFlattenedSequence.getVertexLHSIdentificationList());
    ActiveVertexIdentificationList& theVertexRHSIdentificationList(theFlattenedSequence.getVertexRHSIdentificationList());
    PassiveVertexIdentificationList& thePassiveVertexIdentificationList(theFlattenedSequence.getPassiveVertexIdentificationList());
    Expression::VertexIteratorPair p=theExpression.vertices();
    Expression::VertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second);
    for (; ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) {
      ActiveVertexIdentificationList::IdentificationResult theLHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0),
	theRHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0);
      VertexIdentificationList::IdentificationResult_E thePassiveIdResult(VertexIdentificationList::NOT_IDENTIFIED);
      if ((*ExpressionVertexI).isArgument()) { 
	theLHSIdResult=theVertexLHSIdentificationList.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	theRHSIdResult=theVertexRHSIdentificationList.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	thePassiveIdResult=thePassiveVertexIdentificationList.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
      } 
      if (theLHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED)  
	theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						 theLHSIdResult.getVertexP()));
      else if (theRHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						 theRHSIdResult.getVertexP()));
      } // end if 
      else if (thePassiveIdResult==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	// note, this isn't the exact question to ask here but it is 
	// a conservatively correct question to ask 
	// passivate this: 
	dynamic_cast<xaifBoosterLinearization::ExpressionVertexAlg&>((*ExpressionVertexI).getExpressionVertexAlgBase()).passivate();
      } // end if 
      else { // the vertex cannot be uniquely identified
	if (theLHSIdResult.getAnswer()==VertexIdentificationList::NOT_IDENTIFIED) {
	  // the RHS identification doesn't really matter since we cannot 
	  // uniquely identify within the RHSs it is only important that we don't 
	  // alias a preceding LHS
	  // don't need to do anything else at this point, just continue
	} // end if NOT_IDENTIFIED
	else // there is an ambiguity
	  // don't continue here. 
	  // Note that this is the point where we cut off somewhat arbitrarily in 
	  // two respects: 
	  // A: we decide to break the flattening here because it is convenient
	  //    but we could continue to flatten other not connected unambiguous portions 
	  //    into this graph at the cost of more maintenance. see the basic block 
	  //    flattening paper
	  // B: for the purpose of identifying passive portions it would actually 
	  //    be sufficient to just verify that all ambiguous definitions are 
	  //    constant as well so we could proceed despite ambiguity. 
	  //    Here too it requires additional logic and we don't expect any 
	  //    significant gains in practice. Therefore we decided it is ok 
	  //    to split here. For more detail see the basic block flattening paper. 
	  return false;
      } // end else (no unique identification)
    } // end for all vertices in this LHS 
    return true;
  } // end of AssignmentAlg::vertexIdentification 

  void 
  AssignmentAlg::algorithm_action_2() { 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) called for: "
	      << debug().c_str());
    // this was set in BasicBlockAlg::algorithm_action_2
    PrivateLinearizedComputationalGraph& theFlattenedSequence=
      BasicBlockAlgParameter::get().getFlattenedSequence(getContaining());
    VertexPPairList theVertexTrackList;
    vertexIdentification(theVertexTrackList,
			 theFlattenedSequence);
    PassiveVertexIdentificationList& thePassiveVertexIdentificationList(theFlattenedSequence.getPassiveVertexIdentificationList());
    if (!getActiveFlag()) { 
      if (getContaining().getLHS().getActiveType()) {   // but the LHS has active type
	thePassiveVertexIdentificationList.replaceOrAddElement(getContaining().getLHS());
	if (getContaining().getActiveFlag()) // this means the assignment has been passivated 
	  BasicBlockAlgParameter::get().getDerivativePropagator(getContaining()).
	    addZeroDerivToEntryList(getContaining().getLHS());
      } // end if
    } // end if 
    else {
      Expression& theExpression(getLinearizedRightHandSide());
      Expression::VertexIteratorPair p=theExpression.vertices();
      Expression::VertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second);
      // keep track of all the vertices we add with this statement in case we need to split and 
      // remove them
      std::list<PrivateLinearizedComputationalGraphVertex*> theUndoThenSplitList;
      ActiveVertexIdentificationList& theVertexLHSIdentificationList(theFlattenedSequence.getVertexLHSIdentificationList());
      ActiveVertexIdentificationList& theVertexRHSIdentificationList(theFlattenedSequence.getVertexRHSIdentificationList());
      PrivateLinearizedComputationalGraphVertex* theLHSLCGVertex_p=0; // LHS representation
      for (; ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) {
	ActiveVertexIdentificationList::IdentificationResult theLHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0),
	  theRHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0);
	if ((*ExpressionVertexI).isArgument()) { 
	  theLHSIdResult=theVertexLHSIdentificationList.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	  theRHSIdResult=theVertexRHSIdentificationList.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	} 
	if (theLHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED)  
	  theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						   theLHSIdResult.getVertexP()));
	else if (theRHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	  theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						   theRHSIdResult.getVertexP()));
	} // end if 
	else { // the vertex cannot be uniquely identified
	  if (theLHSIdResult.getAnswer()==VertexIdentificationList::NOT_IDENTIFIED) {
	    // the RHS identification doesn't really matter since we cannot 
	    // uniquely identify within the RHSs it is only important that we don't 
	    // alias a preceding LHS
	    // we need to add this vertex
	    PrivateLinearizedComputationalGraphVertex* theLCGVertex_p=new PrivateLinearizedComputationalGraphVertex;
	    theUndoThenSplitList.push_back(theLCGVertex_p);
	    theFlattenedSequence.supplyAndAddVertexInstance(*theLCGVertex_p);
	    DBG_MACRO(DbgGroup::DATA,
		      "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten):" 
		      << theLCGVertex_p->debug().c_str());
	    if ((*ExpressionVertexI).isArgument()) {
	      Variable& theVariable(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	      if (theRHSIdResult.getAnswer()==VertexIdentificationList::NOT_IDENTIFIED)
		theVertexRHSIdentificationList.addElement(theVariable,
							  theLCGVertex_p);
	      theLCGVertex_p->setRHSVariable(theVariable);
	    } // end if 
	    theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						     theLCGVertex_p));
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
	VertexPPairList::const_iterator listIt;
	for (listIt=theVertexTrackList.begin();
	     (listIt!=theVertexTrackList.end()) 
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
	if (!theLCGTarget_p || !theLCGSource_p) 
	  THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): cannot find edge source or target");
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
      theVertexRHSIdentificationList.removeIfAliased(theLHS);
      theVertexLHSIdentificationList.replaceOrAddElement(theLHS,
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
