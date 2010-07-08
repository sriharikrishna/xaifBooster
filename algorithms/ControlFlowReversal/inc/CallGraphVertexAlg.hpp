#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_CALLGRAPHVERTEXALG_INCLUDE_
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

#include "xaifBooster/system/inc/CallGraphVertexAlgBase.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement algorithms relevant for the 
   * reversal of the control flow
   */
  class CallGraphVertexAlg : virtual public CallGraphVertexAlgBase {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    ~CallGraphVertexAlg();

    /**
     * control flow reversal
     */
    virtual void algorithm_action_4();
                                                                                
    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    static void initializeDerivativeComponents();
    
    bool hasTapingControlFlowGraph() const;
    ReversibleControlFlowGraph& getTapingControlFlowGraph();
    const ReversibleControlFlowGraph& getTapingControlFlowGraph() const;
 
    bool hasAdjointControlFlowGraph() const;
    ReversibleControlFlowGraph& getAdjointControlFlowGraph();
    const ReversibleControlFlowGraph& getAdjointControlFlowGraph() const;

    bool hasStrictAnonymousTapingControlFlowGraph() const;
    ReversibleControlFlowGraph& getStrictAnonymousTapingControlFlowGraph();
    const ReversibleControlFlowGraph& getStrictAnonymousTapingControlFlowGraph() const;
 
    bool hasStrictAnonymousAdjointControlFlowGraph() const;
    ReversibleControlFlowGraph& getStrictAnonymousAdjointControlFlowGraph();
    const ReversibleControlFlowGraph& getStrictAnonymousAdjointControlFlowGraph() const;

  private:
    
    /** 
     * no def
     */
    CallGraphVertexAlg();

    /** 
     * no def
     */
    CallGraphVertexAlg(const CallGraphVertexAlg&);

    void structuredReversal();

    void unstructuredReversal();

    /** 
     * no def
     */
    CallGraphVertexAlg& operator=(const CallGraphVertexAlg&);

    static bool ourInitializeDerivativeComponentsFlag;

    /**
     * CFG copy that tapes for partially explicit reversal
     * the graph structure is the same as for strictly anonymous
     * reversal but the contents of the basic blocks differ from the ones in 
     * the strictly anonymous version
     */
    ReversibleControlFlowGraph* myTapingControlFlowGraph_p;
    /**
     * CFG copy that performs partially explicit reversal 
     * the graph structure is the same as for strictly anonymous
     * reversal but the contents of the basic blocks and the 
     * adjoint control flow expressions differ from the ones in 
     * the strictly anonymous version
     */
    ReversibleControlFlowGraph* myAdjointControlFlowGraph_p;
    /**
     * CFG copy that tapes for strictly anonymous reversal 
     */
    ReversibleControlFlowGraph* myStrictAnonymousTapingControlFlowGraph_p;
    /**
     * CFG copy that performs strictly anonymous reversal 
     */
    ReversibleControlFlowGraph* myStrictAnonymousAdjointControlFlowGraph_p;

  };  // end of class

} // end of namespace 
                                                                     
#endif
