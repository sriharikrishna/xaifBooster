#ifndef _XAIFBOOSTERTYPECHANGE_SYMBOLALG_INCLUDE_
#define _XAIFBOOSTERTYPECHANGE_SYMBOLALG_INCLUDE_
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

#include "xaifBooster/system/inc/SymbolAlgBase.hpp"
#include "xaifBooster/algorithms/TypeChange/inc/SignaturePattern.hpp"

using namespace xaifBooster;

namespace xaifBooster { 
  class Symbol;
  class SymbolReference;
  class ArgumentSymbolReference;
}

namespace xaifBoosterTypeChange {  

  /** 
   * class to track external subroutine references
   * and their active calling patterns 
   */
  class SymbolAlg : public SymbolAlgBase{

  public:
    
    SymbolAlg(const Symbol& theContainingSymbol);

    virtual ~SymbolAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    bool isExternal() const; 

    /**
     * set the symbol to be 
     * representing an external subroutine
     */
    void setExternal(); 

    bool hasHandCodedWrapper() const;

    /** 
     * indicate that this symbol has 
     * a handcoded wrapper
     */
    void setHandCodedWrapper(const SymbolReference& theOriginalSymbolReference);

    /** 
     * rename subroutines that have a 
     * definition within the representation 
     * as opposed to external calls
     */
    void internalRename(const SymbolReference& theOriginalSymbolReference); 

    /**    
     * if this is not a hand-adjoined call 
     * an exception is thrown. 
     */
    const SignaturePattern& getActivityPattern() const; 

    /**    
     * if this is not a hand-adjoined call 
     * an exception is thrown. 
     */
    SignaturePattern& getActivityPattern(); 

    const SymbolReference& getReplacementSymbolReference() const; 

    bool hasReplacementSymbolReference() const; 

  private: 

    /** 
     * no def
     */
    SymbolAlg();

    /** 
     * no def
     */
    SymbolAlg(const SymbolAlg&);

    /** 
     * no def
     */
    SymbolAlg operator=(const SymbolAlg&);

    /** 
     * true if this symbol refers to an 
     * external subroutine
     */
    bool myIsExternalFlag;

    /** 
     * true if this symbol's name 
     * appears on the list of hand coded 
     * wrappers 
     * which for now is supplied on the command line
     */
    bool myHasHandCodedWrapperFlag;

    /** 
     * activity pattern of formal arguments by position
     */
    SignaturePattern myActivityPattern;

    SymbolReference* myHandCodeWrapperSymbolReference_p; 

    void makeReplacementSymbol(const SymbolReference& theOriginalSymbolReference); 
     
  }; // end of class SymbolAlg
 
} 
                                                                     
#endif
