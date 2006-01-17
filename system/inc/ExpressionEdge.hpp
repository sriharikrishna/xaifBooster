#ifndef _EXPRESSIONEDGE_INCLUDE_
#define _EXPRESSIONEDGE_INCLUDE_
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

#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/system/inc/EdgeTraversable.hpp"
#include "xaifBooster/system/inc/ExpressionEdgeAlgBase.hpp"

namespace xaifBooster { 

  class Expression;

  class ExpressionEdge : public EdgeTraversable,
			 public ObjectWithId { 

  public:

    /**
     * ctor sets pointer to dynamically allocated algorithm
     */
    ExpressionEdge(bool makeAlgorithm=true);

    /**
     * dtor deallocates the algorithm object if present
     */
    ~ExpressionEdge();

    /**
     * called by parser, expects a string 
     * representing an unsigned int
     */
    void setPosition(const std::string& i);
    
    void setPosition(unsigned int i);

    /**
     * position is retrieved as integer > 0
     */
    unsigned int getPosition() const;

    /**
     * print xaif driven by algorithm
     * always invoked by the graph
     */
    void printXMLHierarchy(std::ostream& os, const Expression& theExpression) const;

    /**
     * actual implementation for printing xaif
     * always invoked by the graph
     */
    void printXMLHierarchyImpl(std::ostream& os, const Expression& theExpression) const;

    /** 
     * this is for vertices, nothing implemented
     */
    void printXMLHierarchyImpl(std::ostream& os) const {};

    /**
     * concretization of virtual base function in Debuggable
     */
    std::string debug() const ;

    /**
     * names used in xaif schema
     */
    static const std::string ourXAIFName; 
    static const std::string our_myId_XAIFName;
    static const std::string our_source_XAIFName;
    static const std::string our_target_XAIFName;
    static const std::string our_myPosition_XAIFName;

    /**
     * copy into provided object
     */
    void copyMyselfInto(ExpressionEdge& theCopy) const;

    /**
     * provide copy (default: without algorithm)
     */
    ExpressionEdge& createCopyOfMyself(bool withAlgorithm=false) const;

    /**
     * access the algorithm
     */
    ExpressionEdgeAlgBase& getExpressionEdgeAlgBase() const;

    /**
     * used by generic traversal
     * child is myExpressionEdgeAlgBase_p (if set)
     * virtual in utils/GenericTraverseInvoke
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private: 

    /**
     * not defined
     */
    ExpressionEdge(const ExpressionEdge&);
    ExpressionEdge operator=(const ExpressionEdge&);

    /**
     * this indicates the position 
     * of the argument in the call
     * to an elemental function 
     * represent by the target vertex
     * counting starts with 1
     * initialized to 0 to indicate 'not set'
     */
    unsigned int myPosition;

    /**
     * if required then an algorithm object is allocated dynamically
     * by the factory and the pointer is set
     */
    ExpressionEdgeAlgBase* myExpressionEdgeAlgBase_p;

  }; // end of class ExpressionEdge
 
} // end of namespace xaifBooster
                                                                     
#endif
