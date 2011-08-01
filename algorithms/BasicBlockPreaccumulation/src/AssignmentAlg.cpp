// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================
#include <sstream>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/AssignmentAlgFactory.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionVertexAlg.hpp"
#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/AssignmentAlg.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  bool AssignmentAlg::ourPermitAliasedLHSsFlag = false;

  AssignmentAlg::AssignmentAlg(Assignment& theContainingAssignment) : 
    xaifBoosterLinearization::AssignmentAlg(theContainingAssignment),
    myDerivAction_p(0) {
  }

  AssignmentAlg::~AssignmentAlg() {
    if (myDerivAction_p)
      delete (myDerivAction_p);
  }

  void AssignmentAlg::permitAliasedLHSs() {
    ourPermitAliasedLHSsFlag = true;
  }

  bool AssignmentAlg::doesPermitAliasedLHSs() {
    return ourPermitAliasedLHSsFlag;
  }

  void AssignmentAlg::printXMLHierarchy(std::ostream& os) const {
    xaifBoosterLinearization::AssignmentAlg::printXMLHierarchy(os);
    if (myDerivAction_p) {
      myDerivAction_p->printXMLHierarchyImpl(os);
    }
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
  
  bool 
  AssignmentAlg::vertexIdentification(PrivateLinearizedComputationalGraph& theComputationalGraph) { 
    if (BasicBlockAlg::isOneGraphPerStatement() && !theComputationalGraph.getStatementIdLists().myStatementIdList.empty()) { 
      return false ;
    } 
    if (!getActiveFlag()) {
      // nothing else to do here 
      return true; 
    }
    if (getContainingAssignment().isNonInlinable()) { 
      // can't identify
      return false;
    }
    Expression& theExpression(getLinearizedRightHandSide());
    VertexIdentificationListActiveLHS& theVertexIdentificationListActiveLHS(theComputationalGraph.getVertexIdentificationListActiveLHS());
    VertexIdentificationListActiveRHS& theVertexIdentificationListActiveRHS(theComputationalGraph.getVertexIdentificationListActiveRHS());
    VertexIdentificationListPassive& theVertexIdentificationListPassive(theComputationalGraph.getVertexIdentificationListPassive());
    Expression::VertexIteratorPair p=theExpression.vertices();
    Expression::VertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second);
    for (; ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) {
      VertexIdentificationListActive::IdentificationResult theLHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0),
	theRHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0);
      VertexIdentificationList::IdentificationResult_E thePassiveIdResult(VertexIdentificationList::NOT_IDENTIFIED);
      if ((*ExpressionVertexI).isArgument()) { 
	theLHSIdResult=theVertexIdentificationListActiveLHS.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable(),
									getContainingAssignment().getId());
	theRHSIdResult=theVertexIdentificationListActiveRHS.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	thePassiveIdResult=theVertexIdentificationListPassive.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable(),
									getContainingAssignment().getId());
      } 
      if (theLHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED
	  || 
	  theRHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	// do nothing, 
	// push later
      } // end if 
      else if (thePassiveIdResult==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	// note, that for the passive identification we have a misnomer here but 
	// uniquely identified means positively passive identfied regardless if 
	// the actual identification is unique to a particular LHS or not as long 
	// as all possibly identified LHSs are passive.
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
	  // that we decide to break the flattening here because it is convenient
	  // but we could continue to flatten other not connected unambiguous portions 
	  // into this graph at the cost of more maintenance. see the basic block 
	  // flattening paper
	  return false;
      } // end else (no unique identification)
    } // end for all vertices in this RHS

    // check whether the LHS possibly overlaps with a previous LHS in this graph
    if (!doesPermitAliasedLHSs()) {
      // We must split into a new computational graph when a LHS is determined to possibly alias with a previous LHS.
      // If we didn't, we would have a graph with two vertices that may correspond to the same variable,
      // and thus the graph would not properly represent the dependences in the code.
      // Consider the following case, where there is a possibility that p and q point to the same memory location:
      //   *q = a*b
      //   *p = b*c
      // When it comes time to propagate, both *p and *q will get a SAX along one inedge and a SAXPY along the other.
      // In the case where p = q, the second SAX applied will erase the contribution from the first SAX (along with any SAXPY applied in between).
      // As a computational graph encapsulates precedence information exclusively, the type of complication described above is not representable as part of the graph.
      // This is our motivation for stipulating that a new graph must be created.
      VertexIdentificationListActive::IdentificationResult theLHSAliasIdResult (theVertexIdentificationListActiveLHS.aliasIdentify(getContainingAssignment().getLHS()));
      if (theLHSAliasIdResult.getAnswer() != VertexIdentificationList::NOT_IDENTIFIED)
	return false;
    }
    return true;
  } // end of AssignmentAlg::vertexIdentification 

  // local writer definition: 
  class VertexLabelWriter {
  public:
    VertexLabelWriter(const Expression& e) : myE(e) {};
    template <class BoostIntenalVertexDescriptor>
    void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
      xaifBoosterLinearization::ExpressionVertexAlg& va(dynamic_cast<xaifBoosterLinearization::ExpressionVertexAlg&>((*(boost::get(boost::get(BoostVertexContentType(),
																	      myE.getInternalBoostGraph()),
																   v))).getExpressionVertexAlgBase()));
      out << "[label=\"" << va.isActive() << "\"]";
    }
    const Expression& myE;
  };

  void 
  AssignmentAlg::algorithm_action_2() { 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) called for: "
	      << debug().c_str());
    BasicBlockAlg& aBasicBlockAlg(dynamic_cast<BasicBlockAlg&>(ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentBasicBlockInstance().getBasicBlockAlgBase()));
    PrivateLinearizedComputationalGraph& theComputationalGraph (aBasicBlockAlg.getComputationalGraph(getContainingAssignment()));
    VertexPPairList theVertexTrackList;
    if (!vertexIdentification(theComputationalGraph)
	||
	(!getActiveFlag()
	 && 
	 theComputationalGraph.
	 getVertexIdentificationListIndAct().
	 overwrittenBy(getContainingAssignment().getLHS(),
		       getContainingAssignment().getId(),
		       aBasicBlockAlg.getContaining()))) {
      // there is an ambiguity, do the split
      aBasicBlockAlg.splitComputationalGraph(getContainingAssignment());
      if (!(getContainingAssignment().isNonInlinable())) { 
	// redo everything for this assignment
	// if it is non-inlinable we don't do anything here
	// but implement the logic in the next pass
	algorithm_action_2();
      }
      // and leave
      return;
    }
    aBasicBlockAlg.addMyselfToAssignmentIdList(getContainingAssignment());
    const StatementIdList& theKnownAssignments(aBasicBlockAlg.getAssignmentIdList());
    // now redo the activity analysis
    //     if (haveLinearizedRightHandSide() && 
    // 	DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))
    //       GraphVizDisplay::show(getLinearizedRightHandSide(),"before",
    // 			    VertexLabelWriter(getLinearizedRightHandSide()));
    xaifBoosterLinearization::AssignmentAlg::activityAnalysis();
    //     if (haveLinearizedRightHandSide() && 
    // 	DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))
    //       GraphVizDisplay::show(getLinearizedRightHandSide(),"after",
    // 			    VertexLabelWriter(getLinearizedRightHandSide()));
    // and the second part of the linearization
    xaifBoosterLinearization::AssignmentAlg::algorithm_action_2();
    VertexIdentificationListPassive& theVertexIdentificationListPassive(theComputationalGraph.getVertexIdentificationListPassive());
    VertexIdentificationListIndAct& theVertexIdentificationListIndAct(theComputationalGraph.getVertexIdentificationListIndAct());
    if (!getActiveFlag()) { 
      theComputationalGraph.addToPassiveStatementIdList(getContainingAssignment().getId());
      if (getContainingAssignment().getLHS().getActiveType()) {   // but the LHS has active type
	theVertexIdentificationListPassive.addElement(getContainingAssignment().getLHS(),
						      getContainingAssignment().getId());
	theVertexIdentificationListIndAct.addElement(getContainingAssignment().getLHS(),
						     getContainingAssignment().getId());
	if (getContainingAssignment().getLHS().getActiveFlag()) // this means the LHS has been passivated 
	  aBasicBlockAlg.getDerivativePropagator(getContainingAssignment()).
	    addZeroDerivToEntryPList(getContainingAssignment().getLHS());
      } // end if
    } // end if 
    else {
      // keep track of all the vertices we add with this statement in case we need to split and remove them
      VertexIdentificationListActiveLHS& theVertexIdentificationListActiveLHS(theComputationalGraph.getVertexIdentificationListActiveLHS());
      VertexIdentificationListActiveRHS& theVertexIdentificationListActiveRHS(theComputationalGraph.getVertexIdentificationListActiveRHS());
      DBG_MACRO(DbgGroup::DATA, "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) passive: " << theVertexIdentificationListPassive.debug().c_str()
				<< " LHS " << theVertexIdentificationListActiveLHS.debug().c_str()
				<< " RHS " << theVertexIdentificationListActiveRHS.debug().c_str());
      PrivateLinearizedComputationalGraphVertex* theLHSLCGVertex_p = 0; // LHS representation
      ExpressionVertex* theMaximalExpressionVertex_p = 0;
      Expression& theExpression(getLinearizedRightHandSide());
      Expression::VertexIteratorPair p=theExpression.vertices();
      for (Expression::VertexIterator ExpressionVertexI(p.first),ExpressionVertexIEnd(p.second); ExpressionVertexI!=ExpressionVertexIEnd ;++ExpressionVertexI) {
	VertexIdentificationListActive::IdentificationResult theLHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0),
							     theRHSIdResult(VertexIdentificationList::NOT_IDENTIFIED,0);
	PrivateLinearizedComputationalGraphVertex* theLCGVertex_p=0;

	if ((*ExpressionVertexI).isArgument()) { 
	  theLHSIdResult=theVertexIdentificationListActiveLHS.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable(),
									  getContainingAssignment().getId());
	  theRHSIdResult=theVertexIdentificationListActiveRHS.canIdentify(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	} 

	if (theLHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	  theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						   theLHSIdResult.getVertexP()));
	  theLCGVertex_p=theLHSIdResult.getVertexP();
	}
	else if (theRHSIdResult.getAnswer()==VertexIdentificationList::UNIQUELY_IDENTIFIED) { 
	  theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						   theRHSIdResult.getVertexP()));
	  theLCGVertex_p=theRHSIdResult.getVertexP();
	} // end if 
	else { // the vertex cannot be uniquely identified
	  if (theLHSIdResult.getAnswer()==VertexIdentificationList::NOT_IDENTIFIED
	   && dynamic_cast<xaifBoosterLinearization::ExpressionVertexAlg&>((*ExpressionVertexI).getExpressionVertexAlgBase()).isActive()) {
	    // passive bits have not been removed yet since we potentially need them for some partial code generation
	    // but vertices may have been marked as passive during the previous analysis.
	    // the RHS identification doesn't really matter since we cannot uniquely identify within the RHSs it is
	    // only important that we don't alias a preceding LHS
	    // we need to add this vertex
	    theLCGVertex_p=(BasicBlockAlg::getPrivateLinearizedComputationalGraphVertexAlgFactory())->makeNewPrivateLinearizedComputationalGraphVertex();
	    theComputationalGraph.supplyAndAddVertexInstance(*theLCGVertex_p);
	    DBG_MACRO(DbgGroup::DATA, "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten):" << theLCGVertex_p->debug().c_str());
	    if ((*ExpressionVertexI).isArgument()) {
	      Variable& theVariable(dynamic_cast<Argument&>(*ExpressionVertexI).getVariable());
	      if (theRHSIdResult.getAnswer()==VertexIdentificationList::NOT_IDENTIFIED) { 
		theVertexIdentificationListActiveRHS.addElement(theVariable,
								getContainingAssignment().getId(),
								theLCGVertex_p,
								theKnownAssignments);
		theVertexIdentificationListIndAct.addElement(theVariable,
							     getContainingAssignment().getId());
		DBG_MACRO(DbgGroup::DATA, "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) added to RHS: "
					  << theVertexIdentificationListActiveRHS.debug().c_str());
	      }
	      theLCGVertex_p->setOriginalVariable(theVariable,
						  getContainingAssignment().getId());
	    } // end if 
	    theVertexTrackList.push_back(VertexPPair(&(*ExpressionVertexI),
						     theLCGVertex_p));
	  } // end if NOT_IDENTIFIED
	  else if (!dynamic_cast<xaifBoosterLinearization::ExpressionVertexAlg&>((*ExpressionVertexI).getExpressionVertexAlgBase()).isActive()) { 
	    // this is passive stuff  we don't do anything
	  }
	  else { // there is an ambiquity, but we should have detected this earlier
	    THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): should not find an ambiguity at this point");
	  } // end else (ambiguity)
	} // end else

	// is this the maximal expression vertex?
	if (theExpression.numOutEdgesOf(*ExpressionVertexI)==0) { 
	  if (theLHSLCGVertex_p)
	    THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): we should only find one maximal vertex");
	  // the maximal vertex in the RHS is the representation of the LHS
	  theLHSLCGVertex_p=theLCGVertex_p;
	  theMaximalExpressionVertex_p = &(*ExpressionVertexI);
	}
      } // end for all expression vertices

      Expression::EdgeIteratorPair pe=theExpression.edges();
      for (Expression::EdgeIterator ExpressionEdgeI(pe.first),ExpressionEdgeIEnd(pe.second); ExpressionEdgeI!=ExpressionEdgeIEnd ;++ExpressionEdgeI) {
	PartialDerivativeKind::PartialDerivativeKind_E thePartialDerivativeKind(dynamic_cast<xaifBoosterLinearization::ExpressionEdgeAlg&>((*ExpressionEdgeI).getExpressionEdgeAlgBase()).getPartialDerivativeKind());
	if (thePartialDerivativeKind == PartialDerivativeKind::PASSIVE) 
	  continue;
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
	PrivateLinearizedComputationalGraph::OutEdgeIteratorPair anOutEdgeItPair(theComputationalGraph.getOutEdgesOf(*theLCGSource_p));
	PrivateLinearizedComputationalGraph::OutEdgeIterator aPrivLinCompGEdgeI(anOutEdgeItPair.first), aPrivLinCompGEdgeIEnd(anOutEdgeItPair.second);
	for (;aPrivLinCompGEdgeI!=aPrivLinCompGEdgeIEnd;++aPrivLinCompGEdgeI) { 
	  if (theLCGTarget_p==&(theComputationalGraph.getTargetOf(*aPrivLinCompGEdgeI)))
	    break; // already have such an edge in here
	} // end for 
	if (aPrivLinCompGEdgeI!=aPrivLinCompGEdgeIEnd) {  // this is an edge parallel to an existing  edge
	  dynamic_cast<PrivateLinearizedComputationalGraphEdge&>(*aPrivLinCompGEdgeI).addParallel(*ExpressionEdgeI);
	  continue; // we can skip the rest
	}
	PrivateLinearizedComputationalGraphEdge* theEdge_p=(BasicBlockAlg::getPrivateLinearizedComputationalGraphEdgeAlgFactory())->makeNewPrivateLinearizedComputationalGraphEdge();
	// set the back reference
	theEdge_p->setLinearizedExpressionEdge(*ExpressionEdgeI);
	if (thePartialDerivativeKind == PartialDerivativeKind::LINEAR_ONE || thePartialDerivativeKind == PartialDerivativeKind::LINEAR_MINUS_ONE)
	  theEdge_p->setEdgeLabelType(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::UNIT_LABEL);
	else if (thePartialDerivativeKind == PartialDerivativeKind::LINEAR)
	  theEdge_p->setEdgeLabelType(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::CONSTANT_LABEL);
	theComputationalGraph.supplyAndAddEdgeInstance(*theEdge_p,
						      *theLCGSource_p,
						      *theLCGTarget_p);
	DBG_MACRO(DbgGroup::DATA,
		  "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten)"
		  << " Edge source:" 
		  << theLCGSource_p->debug().c_str() 
		  << " target " 
		  <<  theLCGTarget_p->debug().c_str());
      }  // end for all expression edges

      const Variable& theLHS(getContainingAssignment().getLHS());
      if (!theLHSLCGVertex_p)
	THROW_LOGICEXCEPTION_MACRO("xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten): don't have a maximal vertex");
      if (theMaximalExpressionVertex_p->isArgument()) { 
	// now we are in a case like: 
	// t1=<some expression>
	// t2=t1
	// where the top vertex is the top vertex of <some expression> which has 't1' as LHS and now we would try to add 't2' as another LHS.
	// The clean solution is to represent t2=t1 by adding another vertex with a special direct copy edge. the top node becomes the old LHS.
	PrivateLinearizedComputationalGraphVertex* theOldLHSLCGVertex_p(theLHSLCGVertex_p);
	// now we make a new one which will be top node
	theLHSLCGVertex_p=(BasicBlockAlg::getPrivateLinearizedComputationalGraphVertexAlgFactory())->makeNewPrivateLinearizedComputationalGraphVertex();
	// the new one needs to be added to the graph, the old one is already in there
	theComputationalGraph.supplyAndAddVertexInstance(*theLHSLCGVertex_p);
	// we need to add the direct copy edge, we can't set a back reference because there is none
	PrivateLinearizedComputationalGraphEdge* theEdge_p=(BasicBlockAlg::getPrivateLinearizedComputationalGraphEdgeAlgFactory())->makeNewPrivateLinearizedComputationalGraphEdge();
	theEdge_p->setDirectCopyEdge();
	theComputationalGraph.supplyAndAddEdgeInstance(*theEdge_p,
						       *theOldLHSLCGVertex_p,
						       *theLHSLCGVertex_p);
      } // end if 
      // we need to keep the lists mutually exclusive. a left hand side cannot occur in the right hand side list
      DBG_MACRO(DbgGroup::DATA, "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) before remove from RHS: " << theVertexIdentificationListActiveRHS.debug().c_str());
      theVertexIdentificationListActiveRHS.removeIfIdentifiable(theLHS);
      DBG_MACRO(DbgGroup::DATA, "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) after remove from RHS: " << theVertexIdentificationListActiveRHS.debug().c_str());
      // a known active lhs cannot have a passive identification
      theVertexIdentificationListPassive.removeIfIdentifiable(theLHS,
							      getContainingAssignment().getId());
      // an overwritten LHS needs to refer to the respective last definition
      theVertexIdentificationListActiveLHS.removeIfIdentifiable(theLHS);
      theVertexIdentificationListActiveLHS.addElement(theLHS,
					     	      theLHSLCGVertex_p,
						      getContainingAssignment().getId());
      theVertexIdentificationListIndAct.addElement(theLHS,
						   getContainingAssignment().getId());
      theLHSLCGVertex_p->setOriginalVariable(theLHS,
					     getContainingAssignment().getId());
      // as we step through the assignments we add all the left hand sides as dependendents
      // and when we are done with one flattening section we remove the ones not needed
      theComputationalGraph.addToDependentList(*theLHSLCGVertex_p,
					       getContainingAssignment().getId());
      DBG_MACRO(DbgGroup::DATA,
		"xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_2(flatten) passive: "
		<< theVertexIdentificationListPassive.debug().c_str()
		<< " LHS "
		<< theVertexIdentificationListActiveLHS.debug().c_str()
		<< " RHS " 
		<< theVertexIdentificationListActiveRHS.debug().c_str());
    } // end else 
  } // end AssignmentAlg::algorithm_action_2()

  void 
  AssignmentAlg::algorithm_action_3() {
    if (!getActiveFlag() || !getContainingAssignment().isNonInlinable())
      return; 
    DBG_MACRO(DbgGroup::CALLSTACK,
	      "xaifBoosterBasicBlockPreaccumulation::AssignmentAlg::algorithm_action_3(handle non-inlinable) called for: "
	      << debug().c_str());
    const Expression& theOrigRHS(getContainingAssignment().getRHS());
    const ExpressionVertex& theOrigIntrinsic(theOrigRHS.getMaxVertex());
    const NonInlinableIntrinsicsCatalogueItem& theNonInlinableIntrinsicsCatalogueItem(theOrigIntrinsic.getNonInlinableIntrinsicsCatalogueItem());
    if (theNonInlinableIntrinsicsCatalogueItem.isExplicitJacobian()) {
      THROW_LOGICEXCEPTION_MACRO("AssignmentAlg::algorithm_action_3: not implemented for explicit Jacobian")
    }
    else if (theNonInlinableIntrinsicsCatalogueItem.isDirectAction()) {
      myDerivAction_p=new Assignment(false);
      myDerivAction_p->setId(getContainingAssignment().getId());
      getContainingAssignment().getLHS().copyMyselfInto(myDerivAction_p->getLHS());
      myDerivAction_p->getLHS().setDerivFlag();
      Intrinsic* newIntrinsic_p=new Intrinsic(theNonInlinableIntrinsicsCatalogueItem.getDirectAction().getDerivAction(),false);
      myDerivAction_p->getRHS().supplyAndAddVertexInstance(*newIntrinsic_p);
      newIntrinsic_p->setId(theOrigIntrinsic.getId());
      Expression::ConstInEdgeIteratorPair p(getContainingAssignment().getRHS().getInEdgesOf(getContainingAssignment().getRHS().getMaxVertex()));
      Expression::ConstInEdgeIterator ieIt(p.first), endIt(p.second);
      for (; ieIt!=endIt; ++ieIt) {
        ExpressionVertex& newInput(theOrigRHS.getSourceOf(*ieIt).createCopyOfMyself(false));
        if (newInput.isArgument()) {
          Argument& theArg(dynamic_cast<Argument&>(newInput));
          if (theArg.getVariable().getActiveType())
            theArg.getVariable().setDerivFlag();
        }
        myDerivAction_p->getRHS().supplyAndAddVertexInstance(newInput);
        ExpressionEdge* newEdge_p=new ExpressionEdge(false);
        myDerivAction_p->getRHS().supplyAndAddEdgeInstance(*newEdge_p,newInput,*newIntrinsic_p);
        newEdge_p->setPosition((*ieIt).getPosition());
        newEdge_p->setId((*ieIt).getId());
      }
    }
  }

  void AssignmentAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) { 
  } 

} // end namespace xaifBoosterBasicBlockPreaccumulation
