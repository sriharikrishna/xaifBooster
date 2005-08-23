#ifndef _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENT_INCLUDE_
#define _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENT_INCLUDE_
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
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"
#include "xaifBooster/algorithms/CodeReplacement/inc/PrintVersion.hpp"
#include "xaifBooster/algorithms/ControlFlowReversal/inc/ReversibleControlFlowGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterCodeReplacement { 

  class Replacement : public XMLPrintable {
  public:

    Replacement (unsigned int aPlaceHolder);

    ~Replacement ();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for myPlaceHolder member as represented in XAIF schema
     */
    static const std::string our_myPlaceHolder_XAIFName;

    const unsigned int getPlaceHolder() const; 

    /** 
     * use this if we are referring to another ControlFlowGraphBase 
     * we don't own it
     */
    void setControlFlowGraphBase(const ControlFlowGraphBase& theOtherControlFlowGraphBase); 

    const ControlFlowGraphBase& getControlFlowGraphBase() const; 

    /** 
     * use this if we are referring to another ReversibleControlFlowGraph 
     * we don't own it
     */
    void setReversibleControlFlowGraph(const xaifBoosterControlFlowReversal::ReversibleControlFlowGraph& theOtherReversibleControlFlowGraph); 

    const xaifBoosterControlFlowReversal::ReversibleControlFlowGraph& getReversibleControlFlowGraph() const; 

    void setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion);

    PrintVersion::PrintVersion_E getPrintVersion() const;

  private: 

    /** 
     * no def
     */ 
    Replacement();
    
    const unsigned int myPlaceHolder;

    /** 
     * reference to external ControlFlowGraph
     * we don't own this and it is exclusively 
     * either this reference or 
     * the reference in 
     * myReversibleControlFlowGraph_p
     */
    const ControlFlowGraphBase* myControlFlowGraphBase_p;

    /** 
     * reference to external ReversibleControlFlowGraph
     * we don't own this and it is exclusively 
     * either this reference or 
     * the reference in 
     * myControlFlowGraphBase_p 
     */
    const xaifBoosterControlFlowReversal::ReversibleControlFlowGraph* 
    myReversibleControlFlowGraph_p;

    PrintVersion::PrintVersion_E myPrintVersion;

  }; // end of class Replacement
 
} // end of namespace xaifBooster
                                                                     
#endif
