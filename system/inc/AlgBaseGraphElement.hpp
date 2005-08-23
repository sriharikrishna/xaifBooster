#ifndef _ALGBASEGRAPHELEMENT_INCLUDE_
#define _ALGBASEGRAPHELEMENT_INCLUDE_
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

#include "xaifBooster/utils/inc/Debuggable.hpp"
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"

namespace xaifBooster {  

  /** 
   * \see AlgBase ; the difference lies in the XML unparsing 
   * for edges that need to reference their containing 
   * graph in order to be determine source and target
   * via boost methods
   */
  template <class AlgContaining, class GraphType>
  class AlgBaseGraphElement : public virtual Debuggable, 
                              public GenericTraverseInvoke { 

  public:
    
    /**
     * ctor sets reference to container
     */
    AlgBaseGraphElement(const AlgContaining& theContaining);

    virtual ~AlgBaseGraphElement();

    /**
     * access container
     */
    const AlgContaining& getContaining() const;

    /** 
     * we refer back to AlgContaining::printXMLHierarchyImpl
     */
    virtual void printXMLHierarchy(std::ostream& os,
				   const GraphType& theGraph) const;
    /**
     * print for vertices (by default AlgContaining is printed)
     * \todo remove this
     */
    virtual void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const;

    void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

  private:

    /** 
     * not defined
     */
    AlgBaseGraphElement();

    /** 
     * not defined
     */
    AlgBaseGraphElement(const AlgBaseGraphElement&);

    /** 
     * not defined
     */
    AlgBaseGraphElement& operator=(const AlgBaseGraphElement&);

    /** 
     * the back reference to AlgContaining 
     * this is constant because by design 
     * all modifications are to be done on 
     * algorithm specific data. Otherwise 
     * we could not ensure consistency of information 
     * between algorithms to be combined.
     */
    const AlgContaining& myContaining; 

  }; // end of class AlgBaseGraphElement

} // end of namespace 

#include "xaifBooster/system/inc/TemplateImpl/AlgBaseGraphElement.cpp"

#endif
