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

#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/Argument.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"
#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#include "xaifBooster/system/inc/PartialDerivativeKind.hpp"
#include "xaifBooster/system/inc/TraversalStack.hpp"
#include "xaifBooster/system/inc/VariableSymbolReference.hpp"

#include "xaifBooster/algorithms/Linearization/inc/ExpressionEdgeAlg.hpp"

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraph.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/RemainderGraphWriters.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionVertex.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValue.hpp"

#include "xaifBooster/algorithms/PushPop/inc/Sequence.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  // \TODO: is this needed?
  Sequence::Sequence() : xaifBoosterBasicBlockPreaccumulationTape::Sequence() {
  }

  Sequence::~Sequence() {
    // delete all the push calls in the push block
    for (CBasicBlockElementPList::const_iterator pushBlockI = myPushBlock.begin();
         pushBlockI != myPushBlock.end(); ++pushBlockI)
      if (*pushBlockI)
        delete *pushBlockI;
  }

  std::string
  Sequence::debug() const {
    std::ostringstream out;    
    out << "xaifBoosterPushPop::"
        << "Sequence[" << this
        << ",myCombinedGraph=" << myCombinedGraph.debug()
        << "]" << std::ends;  
    return out.str();
  }

  bool
  Sequence::hasExpression(const Expression& anExpression) const {
    return xaifBoosterBasicBlockPreaccumulationTape::Sequence::hasExpression(anExpression);
  }

  void
  Sequence::assignAndPushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue) {
    DBG_MACRO(DbgGroup::CALLSTACK, "xaifBoosterPushPop::Sequence::assignAndPushRequiredValueAfter");
    const BasicBlock& theCurrentBasicBlock(ConceptuallyStaticInstances::instance()->getTraversalStack().getCurrentBasicBlockInstance());
    Assignment* theNewExpressionAssignment_p (new Assignment(false));
    theNewExpressionAssignment_p->setId("index_expression_assignment_for_taping");
    // create a new symbol and add a new VariableSymbolReference in the Variable
    //ConceptuallyStaticInstances::instance()->getTapingVariableNameCreator(),
    VariableSymbolReference* theNewVariableSymbolReference_p
      (new VariableSymbolReference(theCurrentBasicBlock.getScope().getSymbolTable().addUniqueAuxSymbol(SymbolKind::VARIABLE,
                                                                                                       SymbolType::INTEGER_STYPE,
                                                                                                       SymbolShape::SCALAR,
                                                                                                       false),
                                   theCurrentBasicBlock.getScope())
      );
    theNewVariableSymbolReference_p->setId("1");
    theNewVariableSymbolReference_p->setAnnotation("xaifBoosterPushPop::Sequence::assignAndPushRequiredValueAfter");
    // pass it on to the LHS and relinquish ownership
    theNewExpressionAssignment_p->getLHS().supplyAndAddVertexInstance(*theNewVariableSymbolReference_p);
    theNewExpressionAssignment_p->getLHS().getAliasMapKey().setTemporary();
    theNewExpressionAssignment_p->getLHS().getDuUdMapKey().setTemporary();
    // set the RHS
    aRequiredValue.getExpression().copyMyselfInto(theNewExpressionAssignment_p->getRHS(),
                                                  false,
                                                  false);
    myPushBlock.push_back(theNewExpressionAssignment_p);
    // now create the push
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theNewPushSubroutineCall_p
     (new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i_"+SymbolShape::toShortString(theNewExpressionAssignment_p->getLHS().getEffectiveShape())));
    theNewPushSubroutineCall_p->setId("xaifBoosterPushPop::Sequence::assignAndPushRequiredValueAfter:inline_push_i");
    theNewExpressionAssignment_p->getLHS().copyMyselfInto(theNewPushSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    myPushBlock.push_back(theNewPushSubroutineCall_p);
  }

  void
  Sequence::pushRequiredValueAfter(const xaifBoosterRequiredValues::RequiredValue& aRequiredValue) {
    DBG_MACRO(DbgGroup::CALLSTACK,"xaifBoosterPushPop::Sequence::pushRequiredValueAfter");
    if (!aRequiredValue.isArgument())
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::pushRequiredValueAfter:"
                                 << " required value " << aRequiredValue.debug() << " is not an argument (it's some expression)");
    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall* theNewPushSubroutineCall_p
      (new xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall("push_i_"+SymbolShape::toShortString(aRequiredValue.getArgument().getVariable().getEffectiveShape())));
    theNewPushSubroutineCall_p->setId("xaifBoosterPushPop::Sequence::pushRequiredValueAfter:inline_push_i");
    aRequiredValue.getArgument().getVariable().copyMyselfInto(theNewPushSubroutineCall_p->addConcreteArgument(1).getArgument().getVariable());
    myPushBlock.push_back(theNewPushSubroutineCall_p);
  }

  void
  Sequence::populateCombinedGraph() {
    myCombinedGraph.clear();

    const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph& theOriginalPLCG(*myComputationalGraph_p);
    // copy the PLCG vertices
    PLCGVp2CGVpMap thePLCGVp2CGVpMap;
    xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph::ConstVertexIteratorPair aPLCGVpair(theOriginalPLCG.vertices());
    for (xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph::ConstVertexIterator aPLCGVi(aPLCGVpair.first), aPLCGViend(aPLCGVpair.second);
         aPLCGVi != aPLCGViend;
         ++aPLCGVi) {
      const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex& theCurrentPLCGV(
        dynamic_cast<const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex&>(*aPLCGVi)
      );
      CombinedGraphVertex* theNewCGV_p = new CombinedGraphVertex(theCurrentPLCGV);
      myCombinedGraph.supplyAndAddVertexInstance(*theNewCGV_p);
      thePLCGVp2CGVpMap[&theCurrentPLCGV] = theNewCGV_p;
      // map each associated expressionvertex to the PLCGV (for handling the linearization expressions)
      const CExpressionVertexPSet& theAssociatedExpressionVertexPSet(theCurrentPLCGV.getAssociatedExpressionVertexPSet());
      for (CExpressionVertexPSet::const_iterator evI = theAssociatedExpressionVertexPSet.begin(); evI != theAssociatedExpressionVertexPSet.end(); ++evI)
        myEVp2CGVpMap[*evI] = theNewCGV_p;
    }

    // local map to correlate results of linearization expressions with AccumulationGraph inputs
    CExpressionEdgeP2CCombinedGraphVertexPMap theEEp2CGVpMap;
    // add PLCG edges
    xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph::ConstEdgeIteratorPair aPLCGEpair(theOriginalPLCG.edges());
    for (xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraph::ConstEdgeIterator aPLCGEi(aPLCGEpair.first), aPLCGEi_end(aPLCGEpair.second);
         aPLCGEi != aPLCGEi_end;
         ++aPLCGEi) {
      const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdge& theCurrentPLCGE(
       dynamic_cast<const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdge&>(*aPLCGEi)
      );
      // add the corresp. edge to the combined graph
      myCombinedGraph.supplyAndAddEdgeInstance(*(new CombinedGraphEdge(theCurrentPLCGE)),
                                               *thePLCGVp2CGVpMap[dynamic_cast<const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex*>(&theOriginalPLCG.getSourceOf(*aPLCGEi))],
                                               *thePLCGVp2CGVpMap[dynamic_cast<const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex*>(&theOriginalPLCG.getTargetOf(*aPLCGEi))]);
      // affix the linearization expression graph(s)
      if (theCurrentPLCGE.hasLinearizedExpressionEdge()) {
        theEEp2CGVpMap[&theCurrentPLCGE.getLinearizedExpressionEdge()] = &affixLinearizationExpressionToCombinedGraph(theCurrentPLCGE.getLinearizedExpressionEdge());
        // handle any parallel expression edges
        if (theCurrentPLCGE.getParallels().size()) {
          for (xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdge::ExpressionEdgePList::const_iterator parallelI = theCurrentPLCGE.getParallels().begin();
               parallelI != theCurrentPLCGE.getParallels().end(); ++parallelI) {
            theEEp2CGVpMap[*parallelI] = &affixLinearizationExpressionToCombinedGraph(**parallelI);
          }
        }
      } // end if there is a linearized expression edge associated with this PLCGE
      else if (!theCurrentPLCGE.isDirectCopyEdge()) {
        THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::populateCombinedGraph:"
                                   << "theCurrentPLCGE " << theCurrentPLCGE.debug().c_str()
                                   << " has no LinearizedExpressionEdge and is not a DirectCopyEdge");
      }
    }

    // include the AccumulationGraph vertices
    const xaifBoosterCrossCountryInterface::AccumulationGraph& theAccumulationGraph(getBestElimination().getAccumulationGraph());
    std::map<const xaifBoosterCrossCountryInterface::AccumulationGraphVertex*,
             const CombinedGraphVertex*> aAGVp2CGVpMap;
    xaifBoosterCrossCountryInterface::AccumulationGraph::ConstVertexIteratorPair aAGVpair(theAccumulationGraph.vertices());
    for (xaifBoosterCrossCountryInterface::AccumulationGraph::ConstVertexIterator aAGVi(aAGVpair.first); aAGVi != aAGVpair.second; ++aAGVi) {
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex& theCurrentAGV(*aAGVi);
      if (theAccumulationGraph.numInEdgesOf(theCurrentAGV) == 0) { // if it has no children, then it's a local partial
        if (theCurrentAGV.hasExpressionEdge()) {
          // in this case, a vertex should already exist (linearization expression vertex/ PLCG edge)
          const ExpressionEdge& theLinearizedExpressionEdge(theCurrentAGV.getExpressionEdge());
          //aAGVp2CGVpMap[&theCurrentAGV] = myEEp2CGVpMap[&theCurrentAGV.getExpressionEdge()];
          CExpressionEdgeP2CCombinedGraphVertexPMap::const_iterator EEp2CGVpMapI = theEEp2CGVpMap.find(&theLinearizedExpressionEdge);
          if (EEp2CGVpMapI == theEEp2CGVpMap.end())
            THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::populateCombinedGraph: could not find CGV corresp. to " << theLinearizedExpressionEdge.debug().c_str());
          const CombinedGraphVertex& correspCGV(*theEEp2CGVpMap[&theCurrentAGV.getExpressionEdge()]);
          aAGVp2CGVpMap[&theCurrentAGV] = &correspCGV;
        }
        else { // should ONLY happen in cases where this AGV corresp. to a direct copy edge (riiight??)
          //THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::populateCombinedGraph: no ExpressionEdge for " << theCurrentAGV.debug().c_str());
          CombinedGraphVertex* theNewCGV_p = new CombinedGraphVertex(theCurrentAGV);
          myCombinedGraph.supplyAndAddVertexInstance(*theNewCGV_p);
          aAGVp2CGVpMap[&theCurrentAGV] = theNewCGV_p;
        }
      }
      else {// if it has children, then it's either an ADD or MULT vertex
        CombinedGraphVertex* theNewCGV_p = new CombinedGraphVertex(theCurrentAGV);
        myCombinedGraph.supplyAndAddVertexInstance(*theNewCGV_p);
        aAGVp2CGVpMap[&theCurrentAGV] = theNewCGV_p;
      }
    } // end iterate over AccumulationGraphVertices
    // incorporate AccumulationGraph edges
    xaifBoosterCrossCountryInterface::AccumulationGraph::ConstEdgeIteratorPair aAGEpair(theAccumulationGraph.edges());
    for (xaifBoosterCrossCountryInterface::AccumulationGraph::ConstEdgeIterator aAGEi(aAGEpair.first); aAGEi != aAGEpair.second; ++aAGEi) {
      const xaifBoosterCrossCountryInterface::AccumulationGraphVertex
       &theAccSource(theAccumulationGraph.getSourceOf(*aAGEi)),
       &theAccTarget(theAccumulationGraph.getTargetOf(*aAGEi));
      const CombinedGraphVertex& theCGSource(*aAGVp2CGVpMap[&theAccSource]);
      const CombinedGraphVertex& theCGTarget(*aAGVp2CGVpMap[&theAccTarget]);
      myCombinedGraph.supplyAndAddEdgeInstance(*(new CombinedGraphEdge(*aAGEi)),
                                               theCGSource,
                                               theCGTarget);
    }

    if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS) && DbgLoggerManager::instance()->wantTag("cg")) {
      std::stringstream aCombinedGraphName;
      aCombinedGraphName << "CombinedGraph" << &myCombinedGraph;
      GraphVizDisplay::show(myCombinedGraph,
                            aCombinedGraphName.str(),
                            CombinedGraphVertexLabelWriter(myCombinedGraph),
                            CombinedGraphEdgeLabelWriter(myCombinedGraph),
                            CombinedGraphPropertiesWriter(myCombinedGraph,theOriginalPLCG));
    }

  }

  const CombinedGraphVertex&
  Sequence::affixLinearizationExpressionToCombinedGraph(const ExpressionEdge& aLinearizedExpressionEdge) {
    // the CGV to be returned (corresp. to the maximal partial ExpressionVertex)
    // cannot be const because we set the LHS variable in this part
    CombinedGraphVertex* theReturnedMaximalCGVertex_p(NULL);

    const xaifBoosterLinearization::ExpressionEdgeAlg& theLinearizedExpressionEdgeAlg(
     dynamic_cast<const xaifBoosterLinearization::ExpressionEdgeAlg&>(aLinearizedExpressionEdge.getExpressionEdgeAlgBase())
    );
    if (!theLinearizedExpressionEdgeAlg.hasPartial())
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::affixLinearizationExpressionToCombinedGraph: no abstract partial expression is set for " << theLinearizedExpressionEdgeAlg.debug().c_str());
    if (theLinearizedExpressionEdgeAlg.hasConcretePartialAssignment()) {
      const Expression& theConcretePartialRHSExpression(theLinearizedExpressionEdgeAlg.getConcretePartialAssignment().getRHS());
    //GraphVizDisplay::show(theConcretePartialRHSExpression,"theConcretePartialRHSExpression");
      // temporary local map for reconstructing the partial assignment expression
      std::map<const ExpressionVertex*, CombinedGraphVertex*> aEVp2CGVpMap;
      // copy the partial expression vertices
      Expression::ConstVertexIteratorPair aEVpair(theConcretePartialRHSExpression.vertices());
      for (Expression::ConstVertexIterator aEVi(aEVpair.first); aEVi != aEVpair.second; ++aEVi) {
        const ExpressionVertex& aPartialExpressionVertex(*aEVi);
        if (aPartialExpressionVertex.isArgument()) {// the expression vertex is an argument, and corresponds to an existing PLCGV
          const ExpressionVertex& theOriginalExpressionVertex(
           theLinearizedExpressionEdgeAlg.getOriginalExpressionVertex4ConcretePartialArgument(aPartialExpressionVertex)
          );
          CExpressionVertexP2CombinedGraphVertexPMap::const_iterator mapI = myEVp2CGVpMap.find(&theOriginalExpressionVertex);
          // does it corresp. to an existing PLCG vertex?
          if (mapI != myEVp2CGVpMap.end()) {
            CombinedGraphVertex& correspCGV(*(mapI->second));
            aEVp2CGVpMap[&aPartialExpressionVertex] = &correspCGV;
          }
          else {
            CombinedGraphVertex* theNewCGV_p = new CombinedGraphVertex(aPartialExpressionVertex);
            myCombinedGraph.supplyAndAddVertexInstance(*theNewCGV_p);
            // store the association in the local map
            aEVp2CGVpMap[&aPartialExpressionVertex] = theNewCGV_p;
          }
        } // end if aPartialExpressionVertex is an argument
        else { // if it's not an argument, then we need to make a new vertex
          CombinedGraphVertex* theNewCGV_p = new CombinedGraphVertex(aPartialExpressionVertex);
          myCombinedGraph.supplyAndAddVertexInstance(*theNewCGV_p);
          // store the association in the local map
          aEVp2CGVpMap[&aPartialExpressionVertex] = theNewCGV_p;
        }
      } // end iterate over partial assignment expression vertices

      // add the edges from the linearization assignment expression
      Expression::ConstEdgeIteratorPair aEEpair(theConcretePartialRHSExpression.edges());
      for (Expression::ConstEdgeIterator aEEi(aEEpair.first); aEEi != aEEpair.second; ++aEEi)
        myCombinedGraph.supplyAndAddEdgeInstance(*(new CombinedGraphEdge(*aEEi)),
                                                 *aEVp2CGVpMap[&theConcretePartialRHSExpression.getSourceOf(*aEEi)],
                                                 *aEVp2CGVpMap[&theConcretePartialRHSExpression.getTargetOf(*aEEi)]);
      theReturnedMaximalCGVertex_p = aEVp2CGVpMap[&theConcretePartialRHSExpression.getMaxVertex()];
      theReturnedMaximalCGVertex_p->addLHSVariable(theLinearizedExpressionEdgeAlg.getConcretePartialAssignment().getLHS());
    } // end if there is a concrete partial assignment
    else {
      switch (theLinearizedExpressionEdgeAlg.getPartialDerivativeKind()) {
        case PartialDerivativeKind::LINEAR_ONE:
        case PartialDerivativeKind::LINEAR_MINUS_ONE: {
          CombinedGraphVertex* theNewCGV_p = new CombinedGraphVertex(aLinearizedExpressionEdge);
          myCombinedGraph.supplyAndAddVertexInstance(*theNewCGV_p);
          theReturnedMaximalCGVertex_p = theNewCGV_p;
          break;
        }
        case PartialDerivativeKind::LINEAR: {
          CombinedGraphVertex* theNewConcreteConstantCGV_p = new CombinedGraphVertex(theLinearizedExpressionEdgeAlg.getConcreteConstant());
          myCombinedGraph.supplyAndAddVertexInstance(*theNewConcreteConstantCGV_p);
          theReturnedMaximalCGVertex_p = theNewConcreteConstantCGV_p;
          break;
        }
        case PartialDerivativeKind::NONLINEAR:
          THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::affixLinearizationExpressionToCombinedGraph: "
                                       << "theLinearizedExpressionEdgeAlg has PartialDerivativeKind::NONLINEAR yet no ConcretePartialAssignment: " << theLinearizedExpressionEdgeAlg.debug().c_str());
          break;
        case PartialDerivativeKind::NOT_SET:
        case PartialDerivativeKind::PASSIVE:
        default:
          THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::affixLinearizationExpressionToCombinedGraph:"
                                     << "invalid PDK for theLinearizedExpressionEdgeAlg " << theLinearizedExpressionEdgeAlg.debug().c_str());
          break;
      } // end switch PDK
    }
    if (!theReturnedMaximalCGVertex_p)
      THROW_LOGICEXCEPTION_MACRO("xaifBoosterPushPop::Sequence::affixLinearizationExpressionToCombinedGraph:"
                                 << "could not determine which CombinedGraphVertex corresp. to maximal expression vertex for " << theLinearizedExpressionEdgeAlg.debug().c_str());
    return *theReturnedMaximalCGVertex_p;
  }

}
 