#ifndef _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHVERTEX_INCLUDE_
#define _XAIFBOOSTERCONTROLFLOWREVERSAL_REVERSIBLECONTROLFLOWGRAPHVERTEX_INCLUDE_
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

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/VertexTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"

#include "xaifBooster/algorithms/ControlFlowReversal/inc/ControlFlowGraphVertexAlg.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ForLoopDirection.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal {  

  /** 
   * class to implement vertices that are used in
   * ControlFlowGraphAlg::myTransformedControlFlowGraph
   */
  class ReversibleControlFlowGraphVertex : public VertexTraversable, public XMLPrintable {

  public:
    
    ReversibleControlFlowGraphVertex(const ControlFlowGraphVertex*);
    ReversibleControlFlowGraphVertex();
    ~ReversibleControlFlowGraphVertex();

    const ControlFlowGraphVertexAlg&
    getOriginalControlFlowGraphVertexAlg() const;

    ControlFlowGraphVertexAlg&
    getOriginalControlFlowGraphVertexAlg();

    const ControlFlowGraphVertexAlg&
    getNewControlFlowGraphVertexAlg() const;

    virtual void printXMLHierarchy(std::ostream& os) const;
                                                                                
    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    int getIndex() const;
    void setIndex(int);
    void setAdjointIndex(int);

    ControlFlowGraphVertexAlg::ControlFlowGraphVertexKind_E getKind() const;

    bool isOriginal() const { return original; }

    

    const ControlFlowGraphVertex& getOriginalVertex() const { 
      return *myOriginalVertex_p; 
    }

    ControlFlowGraphVertex& getNewVertex() { 
      return *myNewVertex_p; 
    }

    const ControlFlowGraphVertex& getNewVertex() const { 
      return *myNewVertex_p; 
    }

    void supplyAndAddNewVertex(ControlFlowGraphVertex& theNewVertex);

    void setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType); 

    ForLoopReversalType::ForLoopReversalType_E getReversalType() const; 

    void setCounterPart(ReversibleControlFlowGraphVertex& theCounterPart);

    ReversibleControlFlowGraphVertex& getCounterPart();

    const ControlFlowGraphVertex::VariablePList& getKnownLoopVariables()const;
    
    void setLoopVariables(const ControlFlowGraphVertex::VariablePList&);

    void inheritLoopVariables(const ReversibleControlFlowGraphVertex& aParent);

    void addLoopVariable(const Variable& aLoopVariable);

    ReversibleControlFlowGraphVertex& getTopExplicitLoop();
    const ReversibleControlFlowGraphVertex& getTopExplicitLoop() const;

    void setTopExplicitLoop(ReversibleControlFlowGraphVertex& theTopExplicitLoop);

    ReversibleControlFlowGraphVertex& getTopExplicitLoopAddressArithmetic();

    void setTopExplicitLoopAddressArithmetic(ReversibleControlFlowGraphVertex& theTopExplicitLoop);

    bool hasStorePlaceholder() const;

    ReversibleControlFlowGraphVertex& getStorePlaceholder();

    void setStorePlaceholder(ReversibleControlFlowGraphVertex& theStorePlaceholder);

    bool hasRestorePlaceholder() const;

    ReversibleControlFlowGraphVertex& getRestorePlaceholder();

    void setRestorePlaceholder(ReversibleControlFlowGraphVertex& theRestorePlaceholder);

    bool hasEnclosingControlFlow() const;

    ReversibleControlFlowGraphVertex& getEnclosingControlFlow();

    void setEnclosingControlFlow(ReversibleControlFlowGraphVertex& theEnclosingControlFlow);

    /**
     * for explicitly reversible for loops
     * determine the count direction
     */
    ForLoopDirection::ForLoopDirection_E simpleCountUp() const;
    
  private:

    /** 
     * no def
     */
    ReversibleControlFlowGraphVertex(const ReversibleControlFlowGraphVertex&);

    /** 
     * no def
     */
    ReversibleControlFlowGraphVertex& operator=(const ReversibleControlFlowGraphVertex&);

    /** 
     * indicates if this is a reference to an original ControlFlowGraphVertex
     * or if it got created as a new ControlFlowGraphVertex
     */
    bool original;

    /** 
     * indicates if a reference to an original ControlFlowGraphVertex
     * references the augmented forward code or the adjoint code
     */
    bool adjoint;

    /** 
     * pointer to original ControlFlowGraphVertex
     */
    const ControlFlowGraphVertex* myOriginalVertex_p;

    /** 
     * pointer to new ControlFlowGraphVertex
     * these vertices are never added to any graph 
     * themselves, we own them so we need to delete them
     */
    ControlFlowGraphVertex* myNewVertex_p;

    /** 
     * index for topological sort
     */
    int myIndex;

    /** 
     * reversal type that applies to all 
     * nodes under a top forloop which 
     * is designated for explicit reversal;
     * this setting may differ from the reversal
     * type set in the original vertex
     */
    ForLoopReversalType::ForLoopReversalType_E myReversalType;

    /** 
     * pointer to corresponding vertex for 
     * LOOP-ENDLOOP and BRANCH-ENDBRANCH pairs
     * is initialized during the topological sort
     */
    ReversibleControlFlowGraphVertex* myCounterPart_p;

    /** 
     * list of variable known to be loop variables
     * in loops for explicit reversal collected from 
     * the respective top loop down
     * we don't own the Variables we are pointing to
     */ 
    ControlFlowGraphVertex::VariablePList myKnownLoopVariables; 

    /** 
     * pointer to the top level 
     * explicit loop for explicit reversals
     * this is just a reference not to be deleted by 
     * the dtor
     */
    ReversibleControlFlowGraphVertex* myTopExplicitLoop_p;

    /** 
     * pointer to the top level 
     * explicit loop's basic block that holds pushes/pops of
     * variables needed to fix address computations in simple 
     * loop constructs for those variables NOT redefined within 
     * the simple loop
     * this is just a reference not to be deleted by 
     * the dtor
     */
    ReversibleControlFlowGraphVertex* myTopExplicitLoopAddressArithmetic_p;

    /** 
     * pointer to the placeholder basic block 
     * to store control flow related information
     * for the variables that are redefined within the simple loop
     * this is just a reference not to be deleted by 
     * the dtor
     */ 
    ReversibleControlFlowGraphVertex* myStorePlaceholder_p;

    /** 
     * pointer to the placeholder basic block 
     * to restore control flow related information
     * for the variables that are redefined within the simple loop
     * this is just a reference not to be deleted by 
     * the dtor
     */ 
    ReversibleControlFlowGraphVertex* myRestorePlaceholder_p;

    /** 
     * pointer to the enclosing Loop or Branch vertex
     * if it exists; only set for original vertices
     * this is just a reference not to be deleted by 
     * the dtor
     */ 
    ReversibleControlFlowGraphVertex* myEnclosingControlFlow_p;
   
  };  // end of class

} // end of namespace 
                                                                     
#endif
