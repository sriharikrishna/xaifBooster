#ifndef  _ITERATORWRAPPER_INCLUDE_
#define  _ITERATORWRAPPER_INCLUDE_
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

namespace xaifBooster { 

  template<class,class> class GraphWrapper;

  /**
   * wrapper around boost  iterator
   * with the main purpose of returning 
   * property map contents which should hide 
   * the bypass through the descriptor and 
   * map lookup
   * where BoostGraphType and BoostIteratorType
   * are to be specified along with the 
   * value, i.e. the respective vertex or edge
   * we don't bother with postfix in/decrement
   */
  template <class BoostGraphType,
	    class BoostIteratorType,
	    class BoostContentType,
	    class Value>
  class IteratorWrapper { 
  public:

    ~IteratorWrapper() {};

    IteratorWrapper& operator++();

    IteratorWrapper& operator--();

    /** 
     * the dereference operator
     * the main reason for the wrapper class returning 
     * the contents of the map rather than the descriptor
     * which would need a subsequent lookup 
     * in the property maps which we like to hide
     */
    Value& operator*() const;

    bool operator==(const IteratorWrapper& rhs) const;

    bool operator!=(const IteratorWrapper& rhs) const; 

  protected:
    
    template<class,class> friend class GraphWrapper;

    /** 
     * private representation of the boost iterator
     */
    BoostIteratorType myBoostIterator;

    /** 
     * private reference to the boost graph
     * needed to look up the property map 
     * (JU: s we want to store a reference to the map directly?)
     */
    BoostGraphType& myBoostGraph;
    
    /** 
     * internal state to determine proper initialization 
     */
    bool myInitFlag;
    
    /**
     * the ctor not to be called directly but only from 
     * GraphWrapper which is a friend
     */
    IteratorWrapper(BoostGraphType& aBoostGraph,
		    BoostIteratorType& aBoostIterator);

  }; // end of class IteratorWrapper

} // end of namespace

#include "xaifBooster/boostWrapper/inc/TemplateImpl/IteratorWrapper.cpp"

#endif
