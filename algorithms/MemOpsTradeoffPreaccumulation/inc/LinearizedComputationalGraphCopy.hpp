#ifndef _LINEARIZEDCOMPUTATIONALGRAPHCOPY_INCLUDE_
#define _LINEARIZEDCOMPUTATIONALGRAPHCOPY_INCLUDE_
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

#include <list>
#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/algorithms/CrossCountryInterface/inc/LinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/LinearizedComputationalGraphCopyEdge.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation { 

  class LinearizedComputationalGraphCopy : public GraphWrapper<xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex,
				       LinearizedComputationalGraphCopyEdge>{
  public:

    unsigned int sdsum, spsum, opsum;

    /**
     * each edge in an edge list has a direction associated with it, so an edge can be in the list twice, one for each direction
     * this allows the heuristics to be mroe efficient
     */
    enum edgeElimDirection {FRONT, BACK};
    struct edgeEntry{
      MemOpsTradeoffPreaccumulation::LinearizedComputationalGraphCopyEdge* edge_p;
      edgeElimDirection direction;
    };

    typedef std::list<const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> ConstVertexPointerList;
    typedef std::list<xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex*> VertexPointerList;
    typedef std::list<edgeEntry> EdgePointerList;

    /**
     * these functions facilitate the elimination of vertices and edges in an LCG.  the corresponding
     * new edges are created, and the relevant accumulation expressions are constructed and added to the list.
     */
    void front_elim_edge(LinearizedComputationalGraphCopyEdge& theEdge,
			 xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);
    void back_elim_edge(LinearizedComputationalGraphCopyEdge& theEdge,
			xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);
    void elim_vertex(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex,
		     xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList& theJacobianAccumulationExpressionList);

    /**
     * these functions return the independent and dependent lists associated with the graph.
     */
    const ConstVertexPointerList& getIndependentList() const;
    const ConstVertexPointerList& getDependentList() const;

    bool isDep(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex) const;

    /**
     * these functions return the number of independent and dependent vertices, respectively
     */
    const unsigned int numIndeps() const;
    const unsigned int numDeps() const;

    /**
     * returns the vertex list associated with the graph
     */
    VertexPointerList getVertexList() const;

    /**
     * these functions facilitate the population of the dependent and independent lists when the graph copy is made
     */
    void addToIndependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theIndepdentVertex);
    void addToDependentList(const xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theDepdentVertex);

    /**
     * vertexlist is a topologically sorted list of all the vertices in the graph, the vertex list stays the same throughout
     * the elimination process, except that when a vertex is eliminated it is removed from the list.  the edgelist is
     * cleared and recreated based on the vertex list before every edge elimination decision is made.
     */
    void addToVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex);
    void removeFromVertexList(xaifBoosterCrossCountryInterface::LinearizedComputationalGraphVertex& theVertex);
    EdgePointerList populateEdgeList();
    void clearEdgeList();

  private: 

    ConstVertexPointerList myIndependentList;
    ConstVertexPointerList myDependentList;
    VertexPointerList myVertexList;
    EdgePointerList myEdgeList;

  }; // end of class LinearizedComputationalGraphCopy 

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
