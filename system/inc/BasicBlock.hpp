#ifndef _BASICBLOCK_INCLUDE_
#define _BASICBLOCK_INCLUDE_
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

#include "xaifBooster/system/inc/FindDefinitionResult.hpp"
#include "xaifBooster/system/inc/PlainBasicBlock.hpp"
#include "xaifBooster/system/inc/BasicBlockAlgBase.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"

namespace xaifBooster { 

  /**
   * representation for basic block with pointer to 
   * BasicBlockAlgBase
   */
  class BasicBlock : public PlainBasicBlock, public ControlFlowGraphVertex {
  public:
    
    BasicBlock (Scope& theScope,
		bool makeAlgorithm=true);

    ~BasicBlock();

    /**
     * calls virtual routine in BasicBlockAlgBase
     * that gets resolved to either printing the
     * actual expression using PlainBasicBlock::printXMLHierarchy
     * or to printing the transformed copy depending
     * on the algorithm used.
     */
    virtual void printXMLHierarchy(std::ostream& os) const;
    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    /** 
     * get algorithm
     */
    BasicBlockAlgBase& getBasicBlockAlgBase() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c); 

    virtual bool hasStatement(const ObjectWithId::Id& aStatementId) const; 

    /**
     * Searches for \p anExpression by first calling the PlainBasicBlock version of this method,
     * which checks each of the elements.  If it is not found there, it checks the associated algorithm (if any).
     */
    virtual bool hasExpression(const Expression& anExpression) const;

    /**
     * for aStatementId get the definition
     */
    virtual FindDefinitionResult findDefinition(const ObjectWithId::Id& aStatementId) const;

    virtual ControlFlowGraphVertexKind::ControlFlowGraphVertexKind_E getKind() const { return ControlFlowGraphVertexKind::BASICBLOCK_VKIND;}

  }; // end of class BasicBlock
 
} // end of namespace xaifBooster
                                                                     
#endif
