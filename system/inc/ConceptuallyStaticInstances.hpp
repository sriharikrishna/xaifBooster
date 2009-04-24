#ifndef _CONCEPTUALLYSTATICINSTANCES_INCLUDE_
#define _CONCEPTUALLYSTATICINSTANCES_INCLUDE_
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

#include "xaifBooster/utils/inc/NameCreator.hpp"

#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogue.hpp"
#include "xaifBooster/system/inc/PrintVersion.hpp"
#include "xaifBooster/system/inc/TraversalStack.hpp"

namespace xaifBooster { 

  class CallGraph;

  /** 
   * class to contain 'globally static'
   * instances. This can later be extended 
   * to instances that are threadspecific 
   * if we decide to opt for a multithreaded 
   * implementation
   */
  class ConceptuallyStaticInstances { 
 
  public : 

    static ConceptuallyStaticInstances* instance();

    ~ConceptuallyStaticInstances();

    CallGraph& getCallGraph();

    InlinableIntrinsicsCatalogue& getInlinableIntrinsicsCatalogue();

    void createCallGraph(const std::string& aSchemaInstance,
			 const std::string& anXAIFInstance,
			 const std::string& aSchemaLocation,
			 const std::string& aPrefix);

    /**
     * instantiated as "VIRTUAL" meaning 
     * printXMLHierarchy uses the normal virtual 
     * invocation mechanism
     * modifiable through setPrintVersion
     */
    PrintVersion::PrintVersion_E getPrintVersion() const;

    /**
     * set PrintVersion to either 
     * VIRTUAL or SYSTEM_ONLY
     */
    void setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion);

    const NameCreator& getUniversalNameCreator() const;
    const NameCreator& getAccumulationVariableNameCreator() const;
    const NameCreator& getPropagationVariableNameCreator() const;
    const NameCreator& getLinearizationVariableNameCreator() const;
    const NameCreator& getTemporaryVariableNameCreator() const;

    const TraversalStack& getTraversalStack() const;
    TraversalStack& getTraversalStack();

  private: 
    
    ConceptuallyStaticInstances();
    
    /** 
     * no def
     */
    ConceptuallyStaticInstances(const ConceptuallyStaticInstances&);

    /** 
     * no def
     */
    ConceptuallyStaticInstances& operator=(const ConceptuallyStaticInstances&);

    static ConceptuallyStaticInstances* ourInstance_p;
    
    /**
     * this class owns the CallGraph
     * it is created with createCallGraph
     * and deleted in the dtor
     */
    CallGraph* myCallGraph_p;

    InlinableIntrinsicsCatalogue myInlinableIntrinsicsCatalogue;

    /**
     * initialized to 
     * VIRTUAL 
     */
    PrintVersion::PrintVersion_E myPrintVersion;

    /// used to give unique names for variables created for some purpose not covered by those below
    NameCreator myUniversalNameCreator;

    /// used to give unique names to variables created for the accumulation
    NameCreator myAccumulationVariableNameCreator;

    /// used to give unique names to variables created for the propagation
    NameCreator myPropagationVariableNameCreator;

    /// used to give unique names to variables that get assigned the value of a local partial during linearization
    NameCreator myLinearizationVariableNameCreator;

    /// used to give unique names to temporary variables created for linearization
    NameCreator myTemporaryVariableNameCreator;

    /**
     * the stack for pointers that allow one to access different parts of the AST
     */
    TraversalStack myTraversalStack;

  }; // end of ConceptuallyStaticInstances
  
} 

#endif 
