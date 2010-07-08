#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICCONTROLFLOWGRAPH_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATION_BASICCONTROLFLOWGRAPH_INCLUDE_
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

#include <stack>
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/Symbol.hpp"
#include "xaifBooster/system/inc/Assignment.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"
#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"
#include "xaifBooster/algorithms/InlinableXMLRepresentation/inc/InlinableSubroutineCall.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicControlFlowGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/BasicControlFlowGraphEdge.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation {  

  /** 
   * class to implement a control flow graph for basic block preaccumulation.
   * creates a framework for modifying the control flow graph while keeping a pointer 
   * to the original graph
   */
  class BasicControlFlowGraph : public GraphWrapperTraversable<BasicControlFlowGraphVertex,BasicControlFlowGraphEdge> {

  public:
    
    BasicControlFlowGraph(const ControlFlowGraph&);

    std::string makeUniqueVertexId();
    std::string makeUniqueEdgeId();

    const ControlFlowGraph& myOriginalGraph_r;
 
    std::list<ControlFlowGraphVertex*> mySortedVertices_p_l;

    void makeThisACopyOfOriginalControlFlowGraph();

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    BasicControlFlowGraphVertex& getEntry();

    BasicControlFlowGraphVertex& getExit();
    /** 
     * insert a new basic block between after and before and return it
     */
    BasicBlock* insertBasicBlock();

    xaifBoosterInlinableXMLRepresentation::InlinableSubroutineCall& 
    addInlinableSubroutineCall(const std::string& aSubroutineName,BasicBlock* theBasicBlock);

    void addZeroDeriv(Variable& theTarget,BasicBlock* theBasicBlock);

    void initializeDerivComponents(BasicBlock* theBasicBlock);

    const std::string& getAlgorithmSignature() const;

  protected:

    /** 
     * no def
     */
    BasicControlFlowGraph();

    /** 
     * no def
     */
    BasicControlFlowGraph(const BasicControlFlowGraph&);

    /** 
     * no def
     */
    ControlFlowGraph& operator=(const ControlFlowGraph&);

    /**
     * signature used in annotations of objects generated
     * by the algorithm
     */
    static std::string myAlgorithmSignature;

  };  // end of class

} // end of namespace 
                                                                     
#endif
