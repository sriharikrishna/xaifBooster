#ifndef _EXPRESSION_INCLUDE_
#define _EXPRESSION_INCLUDE_
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
#include "xaifBooster/system/inc/ExpressionVertex.hpp"
#include "xaifBooster/system/inc/ExpressionEdge.hpp"
#include "xaifBooster/system/inc/GraphWrapperTraversable.hpp"
#include "xaifBooster/system/inc/ExpressionAlgBase.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/Argument.hpp"

namespace xaifBooster { 

  /**
   * an expression, usually 
   * numeric but can contain boolean operations 
   */
  class Expression : 
    public GraphWrapperTraversable<ExpressionVertex, ExpressionEdge>, 
    public XMLPrintable {

  public:

    /**
     * ctor stes pointer to dynamically allocated algorithm
     * object if required
     */
    Expression(bool hasAlgorithm=true);

    /**
     * dtor deallocates algorithm if present
     */
    ~Expression();

    /**
     * virtual in XMLPrintable
     * decision on what is to be printed is taken in
     * algorithm (if present, otherwise printXMLHierarchyImpl
     * is called
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * actual implementation for printing xaif
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    /**
     * is virtual in Debuggable inherited via XMLPrintable
     */
    std::string debug() const ;

    /**
     * \param theTarget where we deep copy the contents of this instance to
     * \param withNewId indicates if the graph 
     * elements will have their own Id's  
     * created from getNexVertex/EdgeId()
     * \param withAlgorithm indicates if the graph 
     * elements will have their algorithm objects 
     * created.
     */
    void copyMyselfInto(Expression& theTarget,
			bool withNewId,
			bool withAlgorithm) const;  

    /**
     * similar to copyMyselfInto
     * perform a deep copy of the subexpression  contents 
     * starting with theTopVertex into theTarget
     * returning the copy of theTopVertex in theTarget
     */
    ExpressionVertex& copySubExpressionInto(Expression& theTarget,
					    const ExpressionVertex& theTopVertex,
					    bool withNewId,
					    bool withAlgorithm) const;
    
    /** 
     * algorithm access where the Expression may 
     * be const but in difference to the 
     * internal representation (wich is always 
     * const for the algorithms) the algorithm 
     * instances will always be modifiable.
     */
    ExpressionAlgBase& getExpressionAlgBase() const;

    /**
     * virtual in GenericTraverseInvoke
     * used by generic traversal
     * child is myExpressionAlgBase_p (if set)
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * finds top vertex of positional subexpression
     */
    const ExpressionVertex& findPositionalSubExpressionOf(const ExpressionVertex& aVertex,
							  unsigned int aPosition) const;


    /**
     * for variable replacements in an expression: 
     * in the pair the first is the variable to be replaced, 
     * the second the variable by which the first is replaced
     */
    typedef std::pair<const Variable*,VariableSymbolReference*> VariablePVariableSRPPair;
    typedef std::list<VariablePVariableSRPPair> VariablePVariableSRPPairList; 

    /** 
     * this is generic utility for replacing Variables in a given 
     * Expression.  These Expression instances have to be non-constant, 
     * i.e. attributes of some algorithm class
     */
    void replaceVariables(const VariablePVariableSRPPairList& replacementList); 

    typedef std::list<Argument*> ArgumentPList;

    void appendArguments(ArgumentPList& listToBeAppended);

    typedef std::list<const Argument*> CArgumentPList;

    void appendArguments(CArgumentPList& listToBeAppended) const;

    /** 
     * true if the expression is constant
     * \todo for the time being assumes the value is contained in a single constant vertex
     */
    bool isConstant() const; 

    void appendActiveArguments(CArgumentPList& listToBeAppended) const;

  private:

    /** 
     * the class owns this instance, 
     * it will be set 
     * during construction and deleted during 
     * destruction
     */
    ExpressionAlgBase* myExpressionAlgBase_p;

    typedef std::list<const ExpressionVertex*> ExpressionVertexPList;

    /** 
     * recursively invoked implementation for public copySubExpressionInto
     */
    void copySubExpressionInto(Expression& theTarget,
					    const ExpressionVertex& theTopVertex,
					    ExpressionVertex& theTopCopy,
					    bool withNewId,
					    bool withAlgorithm,
					    ExpressionVertexPList theList) const;


  }; // end of class Expression

} // end of namespace xaifBooster
                                                                     
#endif
