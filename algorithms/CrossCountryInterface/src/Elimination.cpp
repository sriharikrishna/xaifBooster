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
  Elimination::AwarenessLevel_E Elimination::ourAwarenessLevel = NO_AWARENESS;
  bool Elimination::ourAllowMaintainingFlag = false;

  // constructor for regular (complete) or scarce elimination modes
  Elimination::Elimination (LinearizedComputationalGraph& lcg) : myType (UNSET_ELIMTYPE),
								 myLCG_p (&lcg),
								 myNumIterations (0),
								 myGamma (0) {
    //if (eType == LSA_VERTEX_ELIMTYPE || eType == LSA_FACE_ELIMTYPE)
    //  THROW_LOGICEXCEPTION_MACRO("Elimination::Elimination(): incorrect constructor invoked");
  }

  void Elimination::setAwarenessLevel(Elimination::AwarenessLevel_E anAwarenessLevel) {
    ourAwarenessLevel = anAwarenessLevel;
  }
  
  std::string Elimination::AwarenessLevelToString (const Elimination::AwarenessLevel_E anAwarenessLevel)
	  //throw (PrintingIntException)
  {
    std::string returnString;
    switch(anAwarenessLevel) {
    case NO_AWARENESS:
      returnString="no_awareness";
      break;
    case UNIT_AWARENESS:
      returnString="unit_awareness";
      break;
    case CONSTANT_AWARENESS:
      returnString="constant_awareness";
      break;
    default:
      std::cout << "Error: unknown value passed to AwarenessLevelToString\n";
      //throw PrintingIntException("Elimination::AwarenessLevelToString(): unknown value", aPreaccumulationMode);
      break;
    }
    return returnString;
  } // end of toString();
 
  void Elimination::setAllowMaintainingFlag() {
    ourAllowMaintainingFlag = true;
  }

  void Elimination::initAsRegular() {
    myType = REGULAR_ELIMTYPE;
    myDescription = "default vertex / edge elimination";
  }

  void Elimination::initAsLSAVertex(int i, double g) {
    myType = LSA_VERTEX_ELIMTYPE;
    myDescription = "LSA vertex elimination";
    myNumIterations = i;
    myGamma = g;
  }

  void Elimination::initAsLSAFace(int i, double g) {
    myType = LSA_FACE_ELIMTYPE;
    myDescription = "LSA face elimination";
    myNumIterations = i;
    myGamma = g;
  }

  void Elimination::initAsScarceElimination() {
    myType = SCARCE_ELIMTYPE;
    myDescription = "Scarcity-conscious partial elimination";
  }

  void Elimination::initAsScarceTransformation() {
    myType = SCARCE_TRANSFORMATION_TYPE;
    myDescription = "Scarcity-conscious partial transformation (edge elims and reroutings)";
  }

  std::string Elimination::getDescription() {
    if (myType == UNSET_ELIMTYPE)
      THROW_LOGICEXCEPTION_MACRO("Elimination::getDescription() : cannot return description - Elimination never init'ed");
    return myDescription;
  }

  Elimination::EliminationResult::EliminationResult() :
    myNumReroutings (0),
    myCountedFlag (false) { 
  }

  void Elimination::EliminationResult::countPreaccumulationOperations() const {
    myCounter.jacInc(myRemainderLCG.numEdges());
    bool usesRemainderGraph(myCounter.getJacValue()!=0);
    for(xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList::GraphList::const_iterator it=
	  myJAEList.getGraphList().begin();
	it!=myJAEList.getGraphList().end();
	++it) {
      const xaifBoosterCrossCountryInterface::JacobianAccumulationExpression& theExpression(*(*it));
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIteratorPair testPair(theExpression.vertices());
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpression::ConstVertexIterator testVertexI(testPair.first), testVertexIEnd(testPair.second);
      if(!usesRemainderGraph && theExpression.isJacobianEntry()) {
	myCounter.jacInc();
      }
      //goes through every vertex in each graph
      for (;testVertexI!=testVertexIEnd; ++testVertexI) {
	//if the vertex is an operation then figure out which one it is and increment the counter
	if ((*testVertexI).getReferenceType() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::OPERATION) {
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::MULT_OP) 
	    myCounter.mulInc();
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::ADD_OP) 
	    myCounter.addInc();
	  if ((*testVertexI).getOperation() == xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionVertex::DIV_OP) 
	    myCounter.divInc();
	}
      }
    }
  }

  const PreaccumulationCounter& Elimination::EliminationResult::getCounter() const { 
    if (!myCountedFlag) { 
      countPreaccumulationOperations();
      if (myCounter.getJacValue()+myCounter.getAddValue()+myCounter.getMulValue()==0) 	
	THROW_LOGICEXCEPTION_MACRO("Elimination::EliminationResult::getCounter() nothing counted");
      myCountedFlag=true;
    }
    return myCounter; 
  } 

} // end of namespace xaifBoosterCrossCountryInterface
