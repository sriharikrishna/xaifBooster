#ifndef  _GRAPHELEMENT_INCLUDE_
#define  _GRAPHELEMENT_INCLUDE_
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

namespace xaifBooster { 

  /** 
   * this is a GraphElement wrapper for vertices 
   * or edges to be 
   * used with the GraphWrapper class 
   * which doesn't have capacity for traversal
   * BTW, an attempt for a back reference to the 
   * containing graph leads to circular template 
   * definitions...
   * the template parameter is the boost descriptor type
   * \todo fix access issue with ctor an getDescriptor
   */ 
  template <class VertexOrEdgeDescriptor>
  class GraphElement : public virtual Debuggable { 
  public: 

    virtual ~GraphElement(){};

    std::string debug() const;

    /** 
     * ctor  and init need to be accessible from GraphWrapper
     * but currently both are public because of a compiler bug 
     *
     * template<class VertexType,class EdgeType> friend class GraphWrapper; 
     */

    /**
     * explicit construction only in derived classes
     * or in GraphWrapper
     * \todo this should be protected but we have a compiler error that causes 
     * the friend declaration to be ignored
     */
    GraphElement();

    /**
     * \todo this should be protected but we have a compiler error that causes 
     * the friend declaration to be ignored
     */
    const VertexOrEdgeDescriptor& 
    getDescriptor() const; 

    /**
     * set the descriptor only in GraphWrapper
     * \todo this should be protected but we have a compiler error that causes 
     * the friend declaration to be ignored
     */
    void init(const VertexOrEdgeDescriptor& aDescriptor);

  protected:

    
  private:

    /**
     * disallow copy ctor for now
     */
    GraphElement(const GraphElement&);

    /**
     * disallow assignment, same rationale as with copy constructor
     */
    GraphElement& operator=(const GraphElement&);

    /** 
     * flag to determine if 
     * the descriptor has been initialized
     */
    bool myInitFlag;

    /** 
     * the internal back reference to the boost descriptor
     * which is initialized by init();
     */
    VertexOrEdgeDescriptor myBoostDescriptor;
    
  }; // end of class GraphElement

} // end of namespace xaifBooster

#include "xaifBooster/boostWrapper/inc/TemplateImpl/GraphElement.cpp"

#endif
