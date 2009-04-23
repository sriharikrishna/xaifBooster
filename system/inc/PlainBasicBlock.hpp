#ifndef _PLAINBASICBLOCK_INCLUDE_
#define _PLAINBASICBLOCK_INCLUDE_
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

//UN #include "xaifBooster/system/inc/ControlFlowGraphVertex.hpp"
#include <list>

#include "xaifBooster/system/inc/Expression.hpp"
#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/Scope.hpp"

namespace xaifBooster { 

  /**
   * class PlainBasicBlock describes a block of statements.
   * I.e. think of statements within {}
   */
  // UNclass PlainBasicBlock : public ControlFlowGraphVertex {
  class PlainBasicBlock {
  public:
    
    PlainBasicBlock (Scope& theScope);

    virtual ~PlainBasicBlock();

    std::string debug() const;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for member myScopeId as represented in XAIF schema
     */
    static const std::string our_myScopeId_XAIFName;

    /**
     * adds an element  to the basic block,
     * however the element instance has to 
     * be DYNAMICALLY ALLOCATED and the 
     * OWNERSHIP IS RELINQUISHED to the basic block.
     */
    void supplyAndAddBasicBlockElementInstance(BasicBlockElement& theBasicBlockElement);
    void supplyAndAddBasicBlockElementInstanceAtBeginning(BasicBlockElement& theBasicBlockElement);
    
    typedef std::list<BasicBlockElement*> BasicBlockElementList;
    
    const BasicBlockElementList& getBasicBlockElementList() const;

    BasicBlockElementList& getBasicBlockElementList();

    /**
     * get the scope, here not constant yet
     * because right now we don't have 
     * a derive ScopeAlg object but rather add 
     * new symbols right away in the original scope
     * which is contrary to the rest of the design 
     * where we keep the original constant... 
     * \todo JU: revisit the const Scope issue
     */
    Scope& getScope() const;

    /**
     * Checks each element in the element list for \p anExpression.
     * We don't check the respective algorithm because this class has none
     */ 
    virtual bool hasExpression(const Expression& anExpression) const;

  protected:
    
    /**
     * the (ordered) list of basic block elements
     * which are instances of the derived classes 
     * assignment, subroutine call etc..
     * we own the elements in this list and delete them
     * at destruction time
     */
    BasicBlockElementList myElementList;

    /**
     * the scope as specified by the scope id
     */
    Scope& myScope_r;

  }; // end of class PlainBasicBlock
 
} // end of namespace xaifBooster
                                                                     
#endif
