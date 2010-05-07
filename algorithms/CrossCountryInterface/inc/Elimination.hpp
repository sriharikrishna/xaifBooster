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

#include <map>

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PreaccumulationCounter.hpp"

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/AwarenessLevel.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraph.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/JacobianAccumulationExpressionList.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/GraphCorrelations.hpp"

namespace xaifBoosterCrossCountryInterface { 

  /**
   * class for configuring and carrying out an elimination sequence
   */
  class Elimination {

    public:
    
    enum EliminationType_E {
      UNSET_ELIMTYPE,
      OPS_ELIMTYPE,
      OPS_RANDOM_ELIMTYPE,
      OPS_LSA_VERTEX_ELIMTYPE,
      OPS_LSA_FACE_ELIMTYPE,
      SCARCE_ELIMTYPE,
      SCARCE_RANDOM_ELIMTYPE,
      SCARCE_TRANSFORMATIONTYPE,
      SCARCE_RANDOM_TRANSFORMATIONTYPE};

    /// just sets graph.  Use initAs* methods for more specific things
    Elimination (LinearizedComputationalGraph& lcg);
    ~Elimination(){};

    // init functions allow for a generic constructor for all elimination types
    void initAsOperations();
    void initAsOperationsRandom();
    void initAsLSAVertex(int i, double g);
    void initAsLSAFace(int i, double g);
    void initAsScarceElimination();
    void initAsScarceRandomElimination();
    void initAsScarceTransformation();
    void initAsScarceRandomTransformation();
    
    void eliminate();

    static void
    setAwarenessLevel(AwarenessLevel::AwarenessLevel_E anAwarenessLevel);
   
    static void setAllowMaintainingFlag();
    
    std::string getDescription() const;

    const int getNumIterations () const {
      return myNumIterations;
    }
    
    const double getGamma () const {
      return myGamma;
    }
    
    const LinearizedComputationalGraph& getRemainderLCG() const;
    LinearizedComputationalGraph& getRemainderLCG();

    const AccumulationGraph& getAccumulationGraph() const;
    AccumulationGraph& getAccumulationGraph();

    /**
     * used for propagation
     */
    typedef std::map<const LinearizedComputationalGraphEdge*,
                     const AccumulationGraphVertex*> RemainderEdge2AccumulationVertexMap;

    const RemainderEdge2AccumulationVertexMap& getRemainderEdge2AccumulationVertexMap() const;

    const PreaccumulationCounter& getCounter() const;

    unsigned int getNumReroutings() const;

    /**
     * returns a reference to the original LCG vertex that corresponds to the passed remainder graph vertex
     */
    const LinearizedComputationalGraphVertex&
    rVertex2oVertex (const LinearizedComputationalGraphVertex& theRemainderVertex) const;

    /**
     * Flattens the JAEs into a single Accumulation graph and populates a mapping from remainder graph edges to
     * accumulation graph vertices, which will be used in the generation of propagators. 
     */
    void buildAccumulationGraph();

  private:

    Elimination(){};
    
    EliminationType_E myType;
   
    std::string myDescription;
    
    LinearizedComputationalGraph* myLCG_p;

    static AwarenessLevel::AwarenessLevel_E ourAwarenessLevel;
    static bool ourAllowMaintainingFlag;
    
    int myNumIterations;
    double myGamma;

    /// this will be populated by angel during the transformation process
    JacobianAccumulationExpressionList myJAEList;

    /// this is populated by angel after the elimination process
    LinearizedComputationalGraph myRemainderLCG;

    /// maps vertices in the remainder graph to vertices in the original graph
    VertexCorrelationList myVertexCorrelationList;

    /// maps edges in the remainder graph to edges in the original graph
    EdgeCorrelationList myEdgeCorrelationList;

    /// built subsequent to the angel transformation
    AccumulationGraph myAccumulationGraph;

    /// maps edges in the remainder graph to thjeiur corresponding vertices in myAccumulationGraph.  used in propagation
    RemainderEdge2AccumulationVertexMap myRemainderEdge2AccumulationVertexMap;

    /// contains the results of performing the transformation (in terms of ops and remainder graph edges)
    mutable PreaccumulationCounter myCounter;

    /// for scarcity with rerouting, holds the number of reroutings
    unsigned int myNumReroutings;

    typedef std::map<const LinearizedComputationalGraphEdge*,
                     AccumulationGraphVertex*> LCGe_to_ACCv_map;

    typedef std::map<const JacobianAccumulationExpressionVertex*,
                     AccumulationGraphVertex*> JAEv_to_ACCv_map;

    /**
     * have we counted the elimination operations
     */
    mutable bool myCountedFlag;

    /// used for evaluating preaccumulation cost
    typedef std::map<const AccumulationGraphVertex*,
                     bool> AccVertexIsUnitMap;

    /**
     * \brief recursively visits Accumulation graph vertices and counts nontrivial operations (cost)
     * should be called exactly once for every accumulation graph vertex
     */
    void evaluateCostRecursively(const AccumulationGraphVertex& rootAccvertex,
                                 AccVertexIsUnitMap& theAccVertexIsUnitMap) const;

    /// counts all nontrivial operations in myAccumulationGraph
    void countPreaccumulationOperations() const;

    /// sets the three counters that measure scarcity in the remainder graph
    void countRemainderGraphEdges() const;

  }; // end of class Elimination

} // end namespace xaifBoosterCrossCountryInterface

#endif
