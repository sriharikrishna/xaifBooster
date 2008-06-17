#ifndef _SUBROUTINECALL_INCLUDE_
#define _SUBROUTINECALL_INCLUDE_
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

#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/SymbolReference.hpp"
#include "xaifBooster/system/inc/ConcreteArgument.hpp"
#include "xaifBooster/system/inc/SubroutineCallAlgBase.hpp"
#include "xaifBooster/system/inc/ActiveUseType.hpp"
#include "xaifBooster/system/inc/ObjectWithLineNumber.hpp"

namespace xaifBooster { 

  /**
   * class SubroutineCall describes a SubroutineCall within a 
   * ControlFlowGraph
   */
  class SubroutineCall : public BasicBlockElement,
			 public ObjectWithLineNumber {
  public:

    /** 
     * \param theSymbol the name of the subroutine
     * \param theScope  the corresponding scope of theSymbol
     * \param activeUseType true if this call is active, i.e. has active arguments
     * \param makeAlgorithm  news up an algorithm object if required which then  is also carried through for the respective members
     */
    SubroutineCall (const Symbol& theSymbol,
		    const Scope& theScope,
		    const ActiveUseType::ActiveUseType_E activeUseType,
		    bool makeAlgorithm=true);

    ~SubroutineCall();

    /** 
     * algorithm access where the SubroutineCall may 
     * be const but in difference to the 
     * internal representation (wich is always 
     * const for the algorithms) the algorithm 
     * instances will always be modifiable.
     */
    SubroutineCallAlgBase& getSubroutineCallAlgBase()const;

    void printXMLHierarchy(std::ostream& os) const;

    /**
     * actual implementation for printing xaif
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for symbol id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_symbolId_XAIFName;

    /**
     * name for scope id used for SymbolReference member as represented in XAIF schema
     */
    static const std::string our_scopeId_XAIFName;

    typedef std::list<ConcreteArgument*> ConcreteArgumentPList;

    ConcreteArgumentPList& getConcreteArgumentPList();

    const ConcreteArgumentPList& getConcreteArgumentPList() const;

    const ConcreteArgument& getConcreteArgument(unsigned int aPosition) const;

    const SymbolReference& getSymbolReference() const;

    /**
     * get the data type active flag from the SymbolReference
     */
    bool getActiveType() const;

    /** 
     * get the active use of this Subroutine
     * if UNDEFINED we go by the type specified in 
     * the SymbolTable for this subroutine
     */
    bool getActiveFlag() const;
    
    /** 
     * set myActiveUse once
     */
    void setActiveUse(ActiveUseType::ActiveUseType_E anActiveUse); 

    /** 
     * returns the active use as currently set including 
     * an UNDEFINEDUSE setting.
     * for determining activity prefer getActiveFlag
     */
    ActiveUseType::ActiveUseType_E getActiveUse() const; 

    /** 
     * the implementation is incomplete
     * \todo refer to alias results
     */
    bool overwrites(const Variable& aVariable) const; 

    static bool getBlackBoxOptimism(); 

    /** 
     * set ourBlackBoxOptimism to false
     */
    static void noBlackBoxOptimism(); 

  private: 
    
    /**
     * no def
     */
    SubroutineCall();

    /**
     * the reference to the subroutine symbol 
     */
    const SymbolReference mySymbolReference;

    /**
     * indicating that this call makes active or passive
     * use of a subroutine
     */
    mutable ActiveUseType::ActiveUseType_E myActiveUse;

    mutable bool myActiveUseSetFlag;

    /** 
     * the list of concrete arguments for this call
     * these are owned by this instance and 
     * will be deleted in the dtor 
     * of SubroutineCall
     */
    ConcreteArgumentPList myConcreteArgumentPList;

    /** 
     * if true (default) we are optimistic 
     * in regard to black box routines, 
     * e.g. they don't have side effects
     */
    static bool ourBlackBoxOptimism; 

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
