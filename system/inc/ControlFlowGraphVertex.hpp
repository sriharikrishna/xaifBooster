#ifndef _CONTROLFLOWGRAPHVERTEX_INCLUDE_
#define _CONTROLFLOWGRAPHVERTEX_INCLUDE_
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
#include "xaifBooster/utils/inc/ObjectWithId.hpp"

#include "xaifBooster/system/inc/FindDefinitionResult.hpp"
#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/VertexTraversable.hpp"
#include "xaifBooster/system/inc/ForLoopReversalType.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertexAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertexKind.hpp"
#include "xaifBooster/system/inc/Variable.hpp"

namespace xaifBooster { 

  class Assignment;

  /**
   * the ControlFlowGraphVertex is a base class for elements 
   * of a control flow such a if statements, basic blocks, loops etc.
   */
  class ControlFlowGraphVertex : public VertexTraversable, 
				 public XMLPrintable,
				 public ObjectWithId,
				 public ObjectWithAnnotation {
  public:

    /**
     * ctor
     */
    ControlFlowGraphVertex ();

    /** 
     * dtor
     */
    ~ControlFlowGraphVertex();

    /**
     * print XML hierarchy
     */
    virtual void printXMLHierarchy(std::ostream& os) const;
    virtual void printXMLHierarchyImpl(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;


    /**
     * get algorithm
     */
    ControlFlowGraphVertexAlgBase& getControlFlowGraphVertexAlgBase() const;
    
    virtual bool hasStatement(const ObjectWithId::Id& aStatementId) const; 

    /**
     * for aStatementId get the Assignment if it exists
     */
    virtual FindDefinitionResult  findDefinition(const ObjectWithId::Id& aStatementId) const;

    virtual ControlFlowGraphVertexKind::ControlFlowGraphVertexKind_E getKind() const = 0;

    ForLoopReversalType::ForLoopReversalType_E getReversalType() const; 

    void setReversalType(ForLoopReversalType::ForLoopReversalType_E aReversalType); 


    int getIndex() const;

    void setIndex(int);

    void setCounterPart(ControlFlowGraphVertex& theCounterPart);

    ControlFlowGraphVertex& getCounterPart();

    ControlFlowGraphVertex& getCounterPart() const;

    typedef std::list<const Variable*> VariablePList;

    const VariablePList& getKnownLoopVariables()const;
    void inheritLoopVariables(const ControlFlowGraphVertex& aParent);
    virtual void addLoopVariable(){} // overwritten in Loop vertices

    bool hasTopExplicitLoop() const;
    ControlFlowGraphVertex& getTopExplicitLoop();
    const ControlFlowGraphVertex& getTopExplicitLoop() const;
    void setTopExplicitLoop(ControlFlowGraphVertex& theTopExplicitLoop);


    bool hasEnclosingControlFlow() const;
    ControlFlowGraphVertex& getEnclosingControlFlow();
    const ControlFlowGraphVertex& getEnclosingControlFlow() const;
    void setEnclosingControlFlow(ControlFlowGraphVertex& theEnclosingControlFlow);

  protected:

    /**
     * this will be set to point a dynamically constructed instance
     * during construction and deleted during
     * destruction
     */
    ControlFlowGraphVertexAlgBase* myControlFlowGraphVertexAlgBase_p;

    /** 
     * the attribute indicating  
     * the reversal option as specified by 
     * a user directive for a top level loop
     */
    ForLoopReversalType::ForLoopReversalType_E myReversalType;

    /** 
     * index for topological sort
     */
    int myIndex;

    /** 
     * list of variable known to be loop variables
     * in loops for explicit reversal collected from 
     * the respective top loop down
     * we don't own the Variables we are pointing to
     */ 
    VariablePList myKnownLoopVariables; 

  private: 

    /** 
     * pointer to corresponding vertex for 
     * LOOP-ENDLOOP and BRANCH-ENDBRANCH pairs
     * is initialized during the topological sort
     */
    ControlFlowGraphVertex* myCounterPart_p;

    /** 
     * pointer to the top level 
     * explicit loop for explicit reversals
     * this is just a reference not to be deleted by 
     * the dtor
     */
    ControlFlowGraphVertex* myTopExplicitLoop_p;

    /** 
     * pointer to the enclosing Loop or Branch vertex
     * if it exists; only set for original vertices
     * this is just a reference not to be deleted by 
     * the dtor
     */ 
    ControlFlowGraphVertex* myEnclosingControlFlow_p;

  }; // end of class ControlFlowGraphVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
