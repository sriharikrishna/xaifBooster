#ifndef _CALLGRAPHVERTEX_INCLUDE_
#define _CALLGRAPHVERTEX_INCLUDE_
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
#include "xaifBooster/system/inc/VertexTraversable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraph.hpp"
#include "xaifBooster/system/inc/CallGraphVertexAlgBase.hpp"

namespace xaifBooster { 

  /** 
   * A CallGraphVertex represents the target of a call 
   * in a code represented by XAIF. 
   * One can think of subroutines as being represented 
   * as vertices in the call graph. 
   */
  class CallGraphVertex : public VertexTraversable, 
			  public XMLPrintable{
  public:

    CallGraphVertex (const Symbol& theSymbol,
		     const Scope& theScope,
		     const Scope& theCFGScope,
		     const bool activeFlag,
		     bool makeAlgorithm=true);

    ~CallGraphVertex();

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyImpl(std::ostream& os) const;

    std::string debug() const ;

    /**
     * returns a reference to the ControlFlowGraph
     */
    ControlFlowGraph& getControlFlowGraph();

    /**
     * returns a reference to the ControlFlowGraph
     */
    const ControlFlowGraph& getControlFlowGraph() const;

    /**
     * override default behavior
     */
    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c); 

    static void setInitializeDerivativeComponentsFlag();
    
    bool getInitializeDerivativeComponentsFlag() const;

    /** 
     * algorithm access where the CallGraphVertex may 
     * be const but in difference to the 
     * internal representation (wich is always 
     * const for the algorithms) the algorithm 
     * instances will always be modifiable.
     */
    CallGraphVertexAlgBase& getCallGraphVertexAlgBase()const;

    /** 
     * get name of subroutine associated with myControlFlowGraph
     */
    const std::string& getSubroutineName() const;

  private: 

    /**
     * no def
     */
    CallGraphVertex ();

    /** each call graph has a control flow 
     * graph 
     * @see ControlFlowGraph
     */
    ControlFlowGraph myControlFlowGraph;

    /** 
     * this will be set to point a dynamically instance
     * during construction and deleted during 
     * destruction
     */
    CallGraphVertexAlgBase* myCallGraphVertexAlgBase_p;

    static bool ourInitializeDerivativeComponentsFlag;

  }; // end of class CallGraphVertex
 
} // end of namespace xaifBooster
                                                                     
#endif
