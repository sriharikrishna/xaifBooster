#ifndef _ARGUMENTLIST_INCLUDE_
#define _ARGUMENTLIST_INCLUDE_
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

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReference.hpp"

namespace xaifBooster { 

  /**
   * a ControlFlowGraph describes 
   * the control flow for a subroutine
   * it is a member of a CallGraphVertex
   */
  class ArgumentList : public XMLPrintable,
		       public GenericTraverseInvoke {

  public:

    ArgumentList();

    ~ArgumentList();

    void printXMLHierarchy(std::ostream& os) const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    std::string debug() const ;
    
    /**
     * name for member myArgumentList as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_symbolId_XAIFName;

    /**
     * name for scope id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_scopeId_XAIFName;

    typedef std::list<ArgumentSymbolReference*> ArgumentSymbolReferencePList;

    ArgumentSymbolReferencePList& getArgumentSymbolReferencePList();

    const ArgumentSymbolReferencePList& getArgumentSymbolReferencePList() const;

    /**
     * \todo cleanup see const casts in the code
     * \see myScope_p
     */ 
    Scope& getScope() const;

    /* 
     * 
     */
    void copyMyselfInto(ArgumentList& theArgumentList,
			bool makeAlgorithm=false) const;

  private: 
    
    /**
     * a list of arguments 
     * these are owned by this instance and 
     * will be deleted in the dtor 
     */
    ArgumentSymbolReferencePList myArgumentSymbolReferencePList;

    /** 
     * this is pointer for setting the scope 
     * which we don't know at construction time
     * it is not explicitly given but taken 
     * from the first element in myArgumentSymbolReferencePList
     * in getScope or an exception is thrown.
     */
    mutable Scope* myScope_p;

  }; // end of class ArgumentList

} // end of namespace xaifBooster
                                                                     
#endif
