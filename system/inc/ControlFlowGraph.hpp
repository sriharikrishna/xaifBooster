#ifndef _CONTROLFLOWGRAPH_INCLUDE_
#define _CONTROLFLOWGRAPH_INCLUDE_
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

#include "xaifBooster/system/inc/FindDefinitionResult.hpp"
#include "xaifBooster/system/inc/SideEffectList.hpp"
#include "xaifBooster/system/inc/SideEffectListType.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphCommonAttributes.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphAlgBase.hpp"
#include "xaifBooster/system/inc/ArgumentList.hpp"
#include "xaifBooster/system/inc/Variable.hpp"

namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ControlFlowGraph : public ControlFlowGraphCommonAttributes,
			   public ControlFlowGraphBase {

  public:

    ControlFlowGraph(const Symbol& theSymbol,
		     const Scope& theScope,
		     const Scope& theCFGScope,
		     const bool activeFlag);

    ~ControlFlowGraph();

    void printXMLHierarchy(std::ostream& os) const;

    /** 
     * to keep the algorithm template happy
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    /** 
     * pass in an alternative
     * so we don't have to replicate 
     * all the printing
     */
    void printXMLHierarchyImpl(std::ostream& os,
			       const SymbolReference& anAlternativeSymbolReference) const;

    std::string debug() const ;
    
    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

    Variable& addSideEffectReference(SideEffectListType::SideEffectListType_E aType);

    const SideEffectList& getSideEffectList(SideEffectListType::SideEffectListType_E aType) const;

    SideEffectList& getSideEffectList(SideEffectListType::SideEffectListType_E aType);

    /**
     * get algorithm
     */
    ControlFlowGraphAlgBase& getControlFlowGraphAlgBase() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    const bool& getActiveFlag() const;

    ArgumentList& getArgumentList();

    const ArgumentList& getArgumentList() const;

    /** 
     * this is the scope of the ArgumentList
     * \todo returning a non-const Scope is a hack, fix this
     */ 
    Scope& getScope() const; 

    /** 
     * this is the scope of the ArgumentList
     * \todo reintroduce this when the above problem is fixed
     */ 
    // Scope& getScope(); 

    /**
     * for aStatementId get the definition (may not be found)
     */
    FindDefinitionResult findDefinition(const ObjectWithId::Id& aStatementId) const;

    /**
     * for aStatementId get the containing ControlFlowGraphVertex
     * or throw an exception
     */
    const ControlFlowGraphVertex& getContainingVertex(const ObjectWithId::Id& aStatementId) const;

    /** 
     * determines if theSymbolReference is overwritten
     * \todo this hack should be replaced by the proper analysis
     */
    bool overwrites(const SymbolReference& theSymbolReference) const; 

    typedef std::pair<bool,int> FormalResult;

    /** 
     * determines if theSymbolReference is a formal parameter
     */
    FormalResult hasFormal(const SymbolReference& theSymbolReference) const; 

    /** 
     * augment the graph vertices with additional 
     * information
     */
    void augmentGraphInfo();

    /** 
     * how often is theVariable defined within this CF subtree with theControlFlowGraphVertex as root
     */
    unsigned int definesUnderControlFlowGraphVertex(const Variable& theVariable,
						    const ControlFlowGraphVertex& theControlFlowGraphVertex) const;

    std::list<const ControlFlowGraphVertex*> getSOrtedVertexList() const; 

  private: 
    
    /** 
     * no def
     */
    ControlFlowGraph();

    /**
     * the flag indicating that this subroutine is active or passive
     */
    const bool myActiveFlag;

    /**
     * the various side effect lists
     * indexed by SideEffectListType
     */
    std::vector<SideEffectList> mySideEffectLists;

    /**
     * this will be set to point a dynamically instance
     * during construction and deleted during
     * destruction
     */
    ControlFlowGraphAlgBase* myControlFlowGraphAlgBase_p;
                                                                                
    /**
     * a list of arguments 
     * these are owned by this instance and 
     * will be deleted in the dtor 
     * of ControlFlowGraph
     */
    ArgumentList myArgumentList;

    /** 
     * workhorse for augmentGraphInfo
     */
    void augmentGraphInfoRecursively(ControlFlowGraphVertex& theCurrentVertex_r, 
				     int& idx,
				     std::stack<ControlFlowGraphVertex*>& endNodes_p_s_r, 
				     ForLoopReversalType::ForLoopReversalType_E aReversalType,
				     ControlFlowGraphVertex* aTopExplicitLoopVertex_p,
				     ControlFlowGraphVertex* enclosingControlFlowVertex_p); 
      
    /** 
     * for certain vertex types we find the 'parent' vertex among 
     * the sources of theCurrentVertex_r  in-edges and 
     * let the current vertex inherit the loop variables from there
     */
    void inheritLoopVariables(ForLoopReversalType::ForLoopReversalType_E aReversalType,
 			      ControlFlowGraphVertex& theCurrentVertex_r);

    /** 
     * topologically sorted vertex list
     */
    std::list<const ControlFlowGraphVertex*> mySortedVertices_p_l;

    ControlFlowGraphVertex& getEntry();

  }; // end of class ControlFlowGraph
  
} // end of namespace xaifBooster
                                                                     
#endif
