#ifndef _GRAPHVIZDISPLAY_INCLUDE_
#define _GRAPHVIZDISPLAY_INCLUDE_
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

#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"

namespace xaifBooster { 

  /** 
   * a wrapper for the graphviz output, 
   * uses graphviz's dot and 'xv' to display 
   * graph structures
   */
  class GraphVizDisplay { 
    
  public: 
    
    /** 
     * labels vertices with the boost descriptors, 
     * i.e. either integers for vecS containers 
     * or hex addresses for listS containers
     */
    class DefaultVertexLabelWriter { 
    public: 
      DefaultVertexLabelWriter(){};
      template <class BoostInternalVertexDescriptor>
      void operator()(std::ostream& out, const BoostInternalVertexDescriptor& v) const { 
	out << "[label=\"V_" << v << "\"]"; // the 'dot' utility cannot parse hex addresses as labels
      }
    };
    
    /**
     * labels edges with nothing 
     */
    class DefaultEdgeLabelWriter { 
    public: 
      DefaultEdgeLabelWriter(){};
      template <class BoostInternalEdgeDescriptor>
      void operator()(std::ostream& out, const BoostInternalEdgeDescriptor& v) const { 
	//	out << "[label=\"" << v << "\"]"; // we don't want to clutter the picture
      }
    };

//     
//   // examples: 
//     
//   class EdgeLabelWriter {
//   public:
//     EdgeLabelWriter(const Expression& e) : myE(e) {};
//     template <class BoostIntenalEdgeDescriptor>
//     void operator()(std::ostream& out, const BoostIntenalEdgeDescriptor& v) const {
//       out << "[label=\"" << PartialDerivativeKind::toString(boost::get(boost::get(BoostEdgeContentType(),
//                                                                                   myE.getInternalBoostGraph()),
//                                                                        v)->getPartialDerivativeKind()).c_str() << "\"]";
//     };
//     const Expression& myE;
//   };


//   class VertexLabelWriter {
//   public:
//     VertexLabelWriter(const Expression& e) : myE(e) {};
//     template <class BoostIntenalVertexDescriptor>
//     void operator()(std::ostream& out, const BoostIntenalVertexDescriptor& v) const {
//       out << "[label=\"" << boost::get(boost::get(BoostVertexContentType(),
//                                                   myE.getInternalBoostGraph()),
//                                        v)->equivalenceSignature().c_str() << "\"]";
//     };
//     const Expression& myE;
//   };

//   // usage: 
//   if (DbgLoggerManager::instance()->isSelected(DbgGroup::GRAPHICS))
//     GraphVizDisplay::show(getRHS(),"analyzed",
//                           VertexLabelWriter(getRHS()),
//                           EdgeLabelWriter(getRHS()));


    /** 
     * the name supplied here is the base name 
     * of a file to be created in /tmp
     */
    template <class Graph>
    static void show(const Graph& g, 
		     const std::string& aFileName);

    /** 
     * the name supplied here is the base name 
     * of a file to be created in /tmp
     * the label writer can be like the default label writer 
     * used in this implementation
     */
    template <class Graph, class VertexLabelWriter>
    static void show(const Graph& g,
		     const std::string& aFileName, 
		     const VertexLabelWriter&);

    /** 
     * the name supplied here is the base name 
     * of a file to be created in /tmp
     * the label writer can be like the default label writer 
     * used in this implementation
     */
    template <class Graph, class VertexLabelWriter, class EdgeLabelWriter>
    static void show(const Graph& g,
		     const std::string& aFileName, 
		     const VertexLabelWriter&, 
		     const EdgeLabelWriter&);
  }; 

} 

#include "xaifBooster/system/inc/TemplateImpl/GraphVizDisplay.cpp"

#endif 
