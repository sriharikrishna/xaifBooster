#ifndef _VARIABLE_INCLUDE_
#define _VARIABLE_INCLUDE_
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
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/VariableVertex.hpp"
#include "xaifBooster/system/inc/VariableEdge.hpp"
#include "xaifBooster/system/inc/AliasMapKey.hpp"
#include "xaifBooster/system/inc/SymbolType.hpp"
#include "xaifBooster/system/inc/SymbolShape.hpp"
#include "xaifBooster/system/inc/ActiveUseType.hpp"
#include "xaifBooster/system/inc/StatementIdSetMapKey.hpp"

namespace xaifBooster { 

  class VariableSymbolReference;
  class ArrayAccess;

  /**
   * the default representation for Variables as a graph
   */
  class Variable : public GraphWrapperTraversable<VariableVertex,VariableEdge> , 
		   public XMLPrintable,
		   public ObjectWithId {
  public:
    
    Variable();

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print attributes associated with VariableReference XML type
     */
    void printVariableReferenceXMLAttributes(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

    /** 
     * creates a signature that represents 
     * equivalence between two Variable instances in 
     * the sense that they refer to the same address.
     * This can be established for plain references to value symbols
     * or array references with constant index expressions. 
     * Arrary references with index expressions that are not 
     * known to be constant cannot be equivalent in this sense
     * since we cannot establish if the index expression changes the 
     * the value between two 'semantically' equivalent arrary accesses
     * \todo incomplete implementation, doesn't deal with constant index expressions
     */
    virtual std::string equivalenceSignature() const ;

    /** 
     * establishes equivalence in the sense described for 
     * equivalenceSignature()
     */
    bool equivalentTo(const Variable& rhs) const;

    /**
     * \todo: JU think about copying duud information
     */
    void copyMyselfInto(Variable& theTarget) const;

    AliasMapKey& getAliasMapKey();

    const AliasMapKey& getAliasMapKey() const;

    StatementIdSetMapKey& getDuUdMapKey();

    const StatementIdSetMapKey& getDuUdMapKey() const;

    /**
     * get the data type from the SymbolReference,
     * \todo note that this will not work with structures
     */
    const SymbolType::SymbolType_E& getType() const;

    /**
     * the actual shape, e.g. scalar for vector element
     */
    const SymbolShape::SymbolShape_E getShape() const;

    /**
     * get the data type active flag from the SymbolReference
     * \todo note that this will not work if we ever allow 
     * structures
     */
    bool getActiveType() const;
 
    /**
     * set the flag to access the deriv component
     */
    void setDerivFlag();

    /**
     * get the deriv flag 
     */
    bool getDerivFlag() const;

    /**
     * name of member myAliasMapKey as represented in XAIF schema
     */
    static const std::string our_myAliasMapKey_XAIFName;

    /**
     * name of member myDuUdMapKey as represented in XAIF schema
     */
    static const std::string our_myDuUdMapKey_XAIFName;

    /**
     * name of member myDerivFlag as represented in XAIF schema
     */
    static const std::string our_myDerivFlag_XAIFName;

    /**
     * name of member myConstantUseFlag as represented in XAIF schema
     */
    static const std::string our_myConstantUseFlag_XAIFName;

    /** 
     * get the active use of this Variable
     * if UNDEFINED we go by the type specified in 
     * the SymbolTable
     */
    bool getActiveFlag() const; 

    ActiveUseType::ActiveUseType_E getActiveUseType() const; 

    /** 
     * set myActiveUseType once
     */
    void setActiveUseType(ActiveUseType::ActiveUseType_E anActiveUseType); 

    /** 
     * returns the first VariableVertex that is an ArrayAccess
     * \todo this is a bit of a hack because we might 
     * conceivably have something with more than one such vertex
     */
    const ArrayAccess& getArrayAccess() const;
    ArrayAccess& getArrayAccess();

    /** 
     * returns true if this has a VariableVertex that is an ArrayAccess
     * \todo see also getArrayAccess 
     */
    bool hasArrayAccess() const;

    /**
     * \see myConstantUseFlag
     * sets it to true
     */
    void setConstantUseFlag();

    /**
     * \see myConstantUseFlag
     */
    bool getConstantUseFlag() const;

    /** 
     * returns the first VariableVertex that is a VariableSymbolReference
     * \todo: this is a bit of a hack because we might 
     * conceivably have something with more than one such vertex
     */
    const VariableSymbolReference& getVariableSymbolReference() const;

    /** 
     * in some cases (e.g. in F77) array sections can masquerade 
     * as an array element access where the unspecified upper bound 
     * is implied by the calling convention. We need to add the "uppper" bound
     * explicitly for as many as count indices
     */
    void adjustUpperBounds(int count);
    
  private: 
    
    /** 
     * key into  AliasMap
     */
    AliasMapKey myAliasMapKey;

    /** 
     * key into  DuUdMap
     */
    StatementIdSetMapKey myDuUdMapKey;

    /** 
     * indicating the use of the value 
     * or the deriv component of an 
     * active type
     */
    bool myDerivFlag;

  private:

    /** 
     * indicating how a variable is used, 
     * defaults to UNDEFINED which is 
     * also the schema default, 
     * can be set once with setActiveUseType
     * and modified if UNDEFINED 
     * in getActiveFlag
     */
    mutable ActiveUseType::ActiveUseType_E myActiveUseType;

    mutable bool myActiveUseTypeSetFlag;

    /**
     * defaults to false, 
     * set from XAIF constant attribute
     * set to true for a use of a variable 
     * which provably always has a unique literal
     * value, but not necessarily a constant type modifier
     * Conversely, a variable with constant 
     * type modifier that is however not initialized 
     * by a literal constant but instead from a parameter
     * would have this flag set to false
     * i.e this flag decides if the value is known at 
     * compile time or not so we may use it for 
     * constant folding or may not.
     */
    bool myConstantUseFlag;

  }; // end of class Variable

} // end of namespace xaifBooster
                                                                     
#endif
