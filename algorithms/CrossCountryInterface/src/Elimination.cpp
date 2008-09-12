// ========== begin copyright notice ==============
// This file is part of 
// ---------------
// xaifBooster
// ---------------
// Distributed under the BSD license as follows:
// Copyright (c) 2005, The University of Chicago
// All rights reserved.
//
// Redistribution and use in source and binary forms, 
// with or without modification, are permitted provided that the following conditions are met:
//
//    - Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//    - Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//    - Neither the name of The University of Chicago nor the names of its contributors 
//      may be used to endorse or promote products derived from this software without 
//      specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// General Information:
// xaifBooster is intended for the transformation of 
// numerical programs represented as xml files according 
// to the XAIF schema. It is part of the OpenAD framework. 
// The main application is automatic 
// differentiation, i.e. the generation of code for 
// the computation of derivatives. 
// The following people are the principal authors of the 
// current version: 
// 	Uwe Naumann
//	Jean Utke
// Additional contributors are: 
//	Andrew Lyons
//	Peter Fine
//
// For more details about xaifBooster and its use in OpenAD please visit:
//   http://www.mcs.anl.gov/openad
//
// This work is partially supported by:
// 	NSF-ITR grant OCE-0205590
// ========== end copyright notice ==============

#include "xaifBooster/algorithms/CrossCountryInterface/inc/Elimination.hpp"

namespace xaifBoosterCrossCountryInterface {

  // defaults for command-line configurable settings
  xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::AwarenessLevel_E Elimination::ourAwarenessLevel = xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::NO_AWARENESS;

  bool Elimination::ourAllowMaintainingFlag = false;

  // constructor for regular (complete) or scarce elimination modes
  Elimination::Elimination (LinearizedComputationalGraph& lcg) : myType (UNSET_ELIMTYPE),
								 myLCG_p (&lcg),
								 myNumIterations (0),
								 myGamma (0) {
    //if (eType == LSA_VERTEX_ELIMTYPE || eType == LSA_FACE_ELIMTYPE)
    //  THROW_LOGICEXCEPTION_MACRO("Elimination::Elimination(): incorrect constructor invoked");
  }

  void Elimination::setAwarenessLevel(xaifBoosterBasicBlockPreaccumulation::AwarenessLevel::AwarenessLevel_E anAwarenessLevel) {
    ourAwarenessLevel = anAwarenessLevel;
  }
  
  void Elimination::setAllowMaintainingFlag() {
    ourAllowMaintainingFlag = true;
  }

  void Elimination::initAsOperations() {
    myType = OPS_ELIMTYPE;
    myDescription = "default min. ops vertex / edge elimination";
  }

  void Elimination::initAsLSAVertex(int i, double g) {
    myType = OPS_LSA_VERTEX_ELIMTYPE;
    myDescription = "min. ops LSA vertex elimination";
    myNumIterations = i;
    myGamma = g;
  }

  void Elimination::initAsLSAFace(int i, double g) {
    myType = OPS_LSA_FACE_ELIMTYPE;
    myDescription = "min. ops LSA face elimination";
    myNumIterations = i;
    myGamma = g;
  }

  void Elimination::initAsScarceElimination() {
    myType = SCARCE_ELIMTYPE;
    myDescription = "scarcity edge elimination";
  }

  void Elimination::initAsScarceRandomElimination() {
    myType = SCARCE_RANDOM_ELIMTYPE;
    myDescription = "randomized scarcity edge elimination";
  } // end Elimination::initAsScarceRandomElimination()

  void Elimination::initAsScarceTransformation() {
    myType = SCARCE_TRANSFORMATIONTYPE;
    myDescription = "scarcity edge elimination and rerouting";
  }

  void Elimination::initAsScarceRandomTransformation() {
    myType = SCARCE_RANDOM_TRANSFORMATIONTYPE;
    myDescription = "randomized scarcity edge elimination and rerouting";
  } // end Elimination::initAsScarceRandomTransformation()

  std::string Elimination::getDescription() const {
    if (myType == UNSET_ELIMTYPE)
      THROW_LOGICEXCEPTION_MACRO("Elimination::getDescription() : cannot return description - Elimination never init'ed");
    return myDescription;
  }

  const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex&
  Elimination::rVertex2oVertex (const LinearizedComputationalGraphVertex& theRemainderVertex) const {
  VertexCorrelationList::const_iterator vCorrListI;
    for (vCorrListI = myEliminationResult.myVertexCorrelationList.begin(); vCorrListI != myEliminationResult.myVertexCorrelationList.end(); ++vCorrListI)
      if ((*vCorrListI).myRemainderVertex_p == &theRemainderVertex) break;
    if (vCorrListI == myEliminationResult.myVertexCorrelationList.end())
      THROW_LOGICEXCEPTION_MACRO("Elimination::remainderVertex2OriginalVertex: correlation could not be found for remainder graph vertex");

    return dynamic_cast<const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex&>(*vCorrListI->myOriginalVertex_p);
  }

  Elimination::EliminationResult::EliminationResult() :
    myNumReroutings (0),
    myCountedFlag (false) { 
  }

  void Elimination::EliminationResult::countPreaccumulationOperations() const {
   for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	  myJAEList.getGraphList().begin();
	it!=myJAEList.getGraphList().end();
	++it) {
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair testPair(theExpression.vertices());
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator testVertexI(testPair.first), testVertexIEnd(testPair.second);
      //goes through every vertex in each graph
      for (;testVertexI!=testVertexIEnd; ++testVertexI) {
	//if the vertex is an operation then figure out which one it is and increment the counter
	if ((*testVertexI).getReferenceType() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION) {
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP) 
	    myCounter.numMultiplicationsInc();
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP) 
	    myCounter.numAdditionsInc();
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::DIV_OP) 
	    myCounter.numDivisionsInc();
          //if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::SUB_OP) 
            //myCounter.numSubtractionsInc();
	}
      }
    }
  }

  void Elimination::EliminationResult::countRemainderGraphEdges() const {
    if (myRemainderLCG.numEdges() == 0)
	THROW_LOGICEXCEPTION_MACRO("Elimination::EliminationResult::countRemainderGraphEdges(): The remainder graph is empty!");

    xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIteratorPair anLCGeIPair (myRemainderLCG.edges());
    for (xaifBoosterCrossCountryInterface::LinearizedComputationalGraph::ConstEdgeIterator LCGeI (anLCGeIPair.first), LCGeIEnd (anLCGeIPair.second);
         LCGeI != LCGeIEnd;
         ++LCGeI) {
      myCounter.numEdgesInc();
      if ((*LCGeI).getEdgeLabelType() == xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::VARIABLE_LABEL)
        myCounter.numNonconstantEdgesInc();
      if ((*LCGeI).getEdgeLabelType() != xaifBoosterCrossCountryInterface::LinearizedComputationalGraphEdge::UNIT_LABEL)
        myCounter.numNonunitEdgesInc();
    } // end iterate over edges
  } // end Elimination::EliminationResult::countRemainderGraphEdges()

  const PreaccumulationCounter& Elimination::EliminationResult::getCounter() const { 
    if (!myCountedFlag) { 
      countPreaccumulationOperations();
      countRemainderGraphEdges();
      if (myCounter.getNumMultiplications()+myCounter.getNumAdditions()+myCounter.getNumEdges()==0)
	THROW_LOGICEXCEPTION_MACRO("Elimination::EliminationResult::getCounter() nothing counted");
      myCountedFlag=true;
    }
    return myCounter; 
  } 

} // end of namespace xaifBoosterCrossCountryInterface
