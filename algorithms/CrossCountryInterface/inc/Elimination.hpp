#ifndef _ELIMINATION_INCLUDE_
#define _ELIMINATION_INCLUDE_
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

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/GraphCorrelations.hpp"

using namespace xaifBooster;
using namespace xaifBoosterCrossCountryInterface;

namespace xaifBoosterCrossCountryInterface { 

  /**
   * class for configuring and carrying out an elimination sequence
   */
  class Elimination {

    public:
    
    enum EliminationType_E {UNSET_ELIMTYPE,
			    REGULAR_ELIMTYPE,
	                    LSA_VERTEX_ELIMTYPE,
	                    LSA_FACE_ELIMTYPE,
			    SCARCE_ELIMTYPE,
			    SCARCE_TRANSFORMATION_TYPE};

    enum AwarenessLevel_E { NO_AWARENESS=0,
			    UNIT_AWARENESS=1,
			    CONSTANT_AWARENESS=2};
    
    Elimination (LinearizedComputationalGraph& lcg);
    ~Elimination(){};

    // init functions allow for a generic constructor for all elimination types
    void initAsRegular();
    void initAsLSAVertex(int i, double g);
    void initAsLSAFace(int i, double g);
    void initAsScarceElimination();
    void initAsScarceTransformation();
    
    void eliminate();

    static void setAwarenessLevel (AwarenessLevel_E anAwarenessLevel);
    static std::string AwarenessLevelToString (const AwarenessLevel_E anAwarenessLevel);
   
    static void setAllowMaintainingFlag();
    
    std::string getDescription();
    
     const LinearizedComputationalGraph& getLCG () const {
      if (!myLCG_p)
	THROW_LOGICEXCEPTION_MACRO("Elimination::getLCG(): myLCG_p is NULL");
      return *myLCG_p;
    } // end of Elimination::getLCG

    const int getNumIterations () const {
      return myNumIterations;
    }
    
    const double getGamma () const {
      return myGamma;
    }
    
    /**
     * returns a reference to the original LCG vertex that corresponds to the passed remainder graph vertex
     */
    const xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertex&
    rVertex2oVertex (const LinearizedComputationalGraphVertex& theRemainderVertex) const;

    /**
     * this is the result of applying an elimination to a Sequence
     */
    class EliminationResult {

    public:

      EliminationResult();

      JacobianAccumulationExpressionList myJAEList;
      LinearizedComputationalGraph myRemainderLCG;
      VertexCorrelationList myVertexCorrelationList;
      EdgeCorrelationList myEdgeCorrelationList;
      unsigned int myNumReroutings;

      const PreaccumulationCounter& getCounter() const;

    private:
      
      /**
       * the ensuing operation counts etc.
       */
      mutable PreaccumulationCounter myCounter;

      /**
       * count the number of multiplications and additions in a JacobianAccumulationExpresstionList
       */
      void countPreaccumulationOperations() const;

      /**
       * have we counted the elimination operations
       */
      mutable bool myCountedFlag;

    }; // end of class EliminationResult

    EliminationResult& getEliminationResult() {
      return myEliminationResult;
    }

  private:

    Elimination(){};
    
    EliminationType_E myType;
   
    std::string myDescription;
    
    LinearizedComputationalGraph* myLCG_p;

    static AwarenessLevel_E ourAwarenessLevel;
    static bool ourAllowMaintainingFlag;
    
    int myNumIterations;
    double myGamma;
   
    EliminationResult myEliminationResult;
  }; // end of class Elimination

} 

#endif
