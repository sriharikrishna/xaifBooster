#ifndef _ARGUMENTSYMBOLREFERENCE_INCLUDE_
#define _ARGUMENTSYMBOLREFERENCE_INCLUDE_
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
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"
#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/IntentType.hpp"
#include "xaifBooster/system/inc/ArgumentSymbolReferenceAlgBase.hpp"


namespace xaifBooster { 
  class ArgumentSymbolReference: public SymbolReference, 
				 public XMLPrintable, 
				 public ObjectWithAnnotation,
				 public GenericTraverseInvoke { 
  public:
    
    ArgumentSymbolReference (const Symbol& theSymbol,
			     const Scope& theScope,
			     unsigned int thePosition,
			     IntentType::IntentType_E theIntent,
			     bool makeAlgorithm=true);

    ~ArgumentSymbolReference();

    /** 
     * algorithm access where the ArgumentSymbolReference may 
     * be const but in difference to the 
     * internal representation (wich is always 
     * const for the algorithms) the algorithm 
     * instances will always be modifiable.
     */
    ArgumentSymbolReferenceAlgBase& getArgumentSymbolReferenceAlgBase()const;

    void printXMLHierarchy(std::ostream& os) const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * actual implementation for printing xaif
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myPosition as represented in XAIF schema
     */
    static const std::string our_myPosition_XAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_symbolId_XAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_scopeId_XAIFName;

    /**
     * name for member myIntent as represented in XAIF schema
     */
    static const std::string our_myIntent_XAIFName;

    unsigned int getPosition() const;
    
    IntentType::IntentType_E getIntent() const;

  private:
    
    /**
     * no def
     */
    ArgumentSymbolReference();

    /**
     * position of this argument in the argument list of 
     * a subroutine
     */
    unsigned int myPosition;

    /**
     * the flag indicating the intent of this argument
     */
    const IntentType::IntentType_E myIntent;

    /** 
     * this will be set to point a dynamically instance
     * during construction and deleted during 
     * destruction
     */
    ArgumentSymbolReferenceAlgBase* myArgumentSymbolReferenceAlgBase_p;

  }; // end of class ArgumentSymbolReference

} // end of namespace xaifBooster
                                                                     
#endif
