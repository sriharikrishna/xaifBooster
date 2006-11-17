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
#ifndef  _GRAPHELEMENT_INCLUDE_
#include "xaifBooster/boostWrapper/inc/GraphElement.hpp"
#endif

#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  template <class VertexOrEdgeDescriptor>
  GraphElement<VertexOrEdgeDescriptor>::GraphElement() : 
    myInitFlag(false),
    myVisitedFlag(false) {
  }
  
  template <class VertexOrEdgeDescriptor>
  void 
  GraphElement<VertexOrEdgeDescriptor>::init(const VertexOrEdgeDescriptor& aDescriptor) { 
    if (myInitFlag) 
      THROW_LOGICEXCEPTION_MACRO("GraphElement<VertexOrEdgeDescriptor>::init already initialized"); 
    myInitFlag=true;
    myBoostDescriptor=aDescriptor;
  } // end of GraphElement<VertexOrEdgeDescriptor>::init
  
  template <class VertexOrEdgeDescriptor>
  const VertexOrEdgeDescriptor& 
  GraphElement<VertexOrEdgeDescriptor>::getDescriptor() const { 
    if (!myInitFlag) 
      THROW_LOGICEXCEPTION_MACRO("GraphElement<VertexOrEdgeDescriptor>::getDescriptor not initialized"); 
    return myBoostDescriptor;
  } // end of GraphElement<VertexOrEdgeDescriptor>::getDescriptor
  
  template <class VertexOrEdgeDescriptor>
  std::string GraphElement<VertexOrEdgeDescriptor>::debug() const { 
    std::ostringstream out;
    out << "GraphElement[" << this 
	<< ",myInitFlag=" << myInitFlag 
	<< ",myBoostDescriptor=" << myBoostDescriptor
	<< "]" << std::ends;  
    return out.str();
  } // end of GraphElement<VertexOrEdgeDescriptor>::debug

  template <class VertexOrEdgeDescriptor>
  void   
  GraphElement<VertexOrEdgeDescriptor>::setVisited() const { 
    myVisitedFlag=true;
  }

  template <class VertexOrEdgeDescriptor>
  bool   
  GraphElement<VertexOrEdgeDescriptor>::wasVisited() const { 
    return myVisitedFlag;
  }

  template <class VertexOrEdgeDescriptor>
  void   
  GraphElement<VertexOrEdgeDescriptor>::resetVisited() const { 
    myVisitedFlag=false;
  }

} // end of namespace
