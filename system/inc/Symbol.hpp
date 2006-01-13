#ifndef _SYMBOL_INCLUDE_
#define _SYMBOL_INCLUDE_
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
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"

#include "xaifBooster/system/inc/ObjectWithAnnotation.hpp"
#include "xaifBooster/system/inc/SymbolKind.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/SymbolShape.hpp"
#include "xaifBooster/system/inc/DimensionBounds.hpp"
#include "xaifBooster/system/inc/SymbolAlgBase.hpp"

namespace xaifBooster { 

  class Symbol : public XMLPrintable,
		 public ObjectWithId,
		 public ObjectWithAnnotation,
		 public GenericTraverseInvoke {
  public:
    
    const SymbolKind::SymbolKind_E& getSymbolKind() const;

    const SymbolType::SymbolType_E& getSymbolType() const;

    const SymbolShape::SymbolShape_E& getSymbolShape() const;

    bool getActiveTypeFlag() const;

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;

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
     * name for member myActiveTypeFlag as represented in XAIF schema
     */
    static const std::string our_myActiveTypeFlag_XAIFName;

    /**
     * name for inherited member myTempFlag as represented in XAIF schema
     */
    static const std::string our_myTempFlag_XAIFName;

    /**
     * Destructor.
     * Symbols should only be destroyed through SymbolTable's methods
     * but it is not private because it is used for a hash table template
     */    
    virtual ~Symbol();

    typedef std::list<DimensionBounds*> DimensionBoundsPList;

    void addDimensionBounds(int aLower, 
			    int anUpper);

    const DimensionBoundsPList& getDimensionBoundsPList() const;

    bool hasDimensionBounds()const;

    /**
     * get algorithm
     */
    SymbolAlgBase& getSymbolAlgBase();
                                                                                
    /**
     * get algorithm
     */
    const SymbolAlgBase& getSymbolAlgBase() const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private:

    friend class SymbolTable;

    /**
     * Constructor.
     * Symbols can only be created through SymbolTable::addSymbol
     * otherwise we deal with references only
     */      
    Symbol(const std::string& aName, 
	   const SymbolKind::SymbolKind_E& aKind,
	   const SymbolType::SymbolType_E& aType,
	   const SymbolShape::SymbolShape_E& aShape,
	   bool anActiveTypeFlag,
	   bool aTempFlag,
	   bool makeAlgorithm=true);

    const SymbolKind::SymbolKind_E myKind;
    const SymbolType::SymbolType_E myType;
    const SymbolShape::SymbolShape_E myShape;

    /**
     * no def
     */
    Symbol(const Symbol&);

    /**
     * no def
     */
    Symbol operator=(const Symbol&);

    /**
     * is it an active data type?
     */
    bool myActiveTypeFlag;

    /**
     * is this a temporary variable created by xaifBooster?
     */
    bool myTempFlag;

    /** 
     * optionally empty list of dimension bounds
     * as a tentative rule: we either know all or no dimension bounds
     * we own the items in the list
     */
    DimensionBoundsPList myDimensionBoundsPList;
    
    /**
     * this will be set to point a dynamically instance
     * during construction and deleted during
     * destruction
     */
    SymbolAlgBase* mySymbolAlgBase_p;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
