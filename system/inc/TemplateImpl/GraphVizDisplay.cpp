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
#ifndef _GRAPHVIZDISPLAY_INCLUDE_
#include "xaifBooster/system/inc/GraphVizDisplay.hpp"
#endif

// #include "boost/graph/graphviz.hpp"
// In a later revision of this file the output was changed 
// such that the write method would use a vertex_index map to 
// create node identifiers for the dot file rather than 
// vertex_descriptor. The problem with vertex_descriptor is 
// that for storage format listS the descriptor is a hex 
// address which dot doesn't parse properly. Therefore the 
// hex addresses have to be modified so dot can parse. 
// The vertex_index map is always there if the storage format
// is vecS but not if it is listS.  All our graphs use listS 
// so in order to use the newer code we first would have to 
// create a vertex index map. We don't want to do that because of 
// the overhead so for the time being I chose to copy the older 
// code version here.
// BEGIN inserted file header file  -------------------------------------------------------

//=======================================================================
// Copyright 2001 University of Notre Dame.
// Author: Lie-Quan Lee
//
// This file is part of the Boost Graph Library
//
// You should have received a copy of the License Agreement for the
// Boost Graph Library along with the software; see the file LICENSE.
// If not, contact Office of Research, University of Notre Dame, Notre
// Dame, IN 46556.
//
// Permission to modify the code and to distribute modified code is
// granted, provided the text of this NOTICE is retained, a notice that
// the code was modified is included with the above COPYRIGHT NOTICE and
// with the COPYRIGHT NOTICE in the LICENSE file, and that the LICENSE
// file is distributed with the modified code.
//
// LICENSOR MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED.
// By way of example, but not limitation, Licensor MAKES NO
// REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY
// PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE COMPONENTS
// OR DOCUMENTATION WILL NOT INFRINGE ANY PATENTS, COPYRIGHTS, TRADEMARKS
// OR OTHER RIGHTS.
//=======================================================================
#ifndef BOOST_GRAPHVIZ_HPP
#define BOOST_GRAPHVIZ_HPP

#include <boost/config.hpp>
#include <string>
#include <map>
#include <iostream>
#include <fstream>
#include <stdio.h> // for FILE
#include <boost/property_map.hpp>
#include <boost/tuple/tuple.hpp>
#include <boost/graph/graph_traits.hpp>
#include <boost/graph/properties.hpp>
#include <boost/graph/subgraph.hpp>
#include <boost/graph/adjacency_list.hpp>

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

namespace boost {

  template <typename directed_category>
  struct graphviz_io_traits {
    static std::string name() {
      return "digraph";
    }
    static std::string delimiter() {
      return "->";
    }  };

  template <>  
  struct graphviz_io_traits <boost::undirected_tag> {
    static std::string name() {
      return "graph";
    }
    static std::string delimiter() {
      return "--";
    }
  };

  struct default_writer {
    void operator()(std::ostream&) const {
    }
    template <class VorE>
    void operator()(std::ostream&, const VorE&) const {
    }
  };

  template <class Name>
  class label_writer {
  public:
    label_writer(Name _name) : name(_name) {}
    template <class VertexOrEdge>
    void operator()(std::ostream& out, const VertexOrEdge& v) const {
      out << "[label=\"" << name[v] << "\"]";
    }
  private:
    Name name;
  };
  template <class Name>
  inline label_writer<Name>
  make_label_writer(Name n) {
    return label_writer<Name>(n);
  }

  enum edge_attribute_t        { edge_attribute        = 1111 };
  enum vertex_attribute_t      { vertex_attribute      = 2222 };
  enum graph_graph_attribute_t { graph_graph_attribute = 3333 };
  enum graph_vertex_attribute_t  { graph_vertex_attribute  = 4444 };
  enum graph_edge_attribute_t  { graph_edge_attribute  = 5555 };
  
  BOOST_INSTALL_PROPERTY(edge, attribute);
  BOOST_INSTALL_PROPERTY(vertex, attribute);
  BOOST_INSTALL_PROPERTY(graph, graph_attribute);
  BOOST_INSTALL_PROPERTY(graph, vertex_attribute);
  BOOST_INSTALL_PROPERTY(graph, edge_attribute);


  template <class Attribute>
  inline void write_attributes(const Attribute& attr, std::ostream& out) {
    typename Attribute::const_iterator i, iend;
    i    = attr.begin();
    iend = attr.end();
    
    while ( i != iend ) {
      out << i->first << "=\"" << i->second << "\"";
      ++i;
      if ( i != iend ) 
        out << ", ";
    }
  }

  template<typename Attributes>
  inline void write_all_attributes(Attributes attributes, 
                                   const std::string& name,
                                   std::ostream& out)
  {
    typename Attributes::const_iterator i = attributes.begin(),
                                        end = attributes.end();
    if (i != end) {
      out << name << " [\n";
      write_attributes(attributes, out);
      out << "];\n";
    }
  }

  inline void write_all_attributes(detail::error_property_not_found,
                                   const std::string&,
                                   std::ostream&)
  {
    // Do nothing - no attributes exist
  }




  template <typename GraphGraphAttributes,
            typename GraphNodeAttributes,
            typename GraphEdgeAttributes>
  struct graph_attributes_writer
  {
    graph_attributes_writer(GraphGraphAttributes gg,
                            GraphNodeAttributes gn,
                            GraphEdgeAttributes ge)
      : g_attributes(gg), n_attributes(gn), e_attributes(ge) { }

    void operator()(std::ostream& out) const {
      write_all_attributes(g_attributes, "graph", out);
      write_all_attributes(n_attributes, "node", out);
      write_all_attributes(e_attributes, "edge", out);
    }
    GraphGraphAttributes g_attributes;
    GraphNodeAttributes n_attributes;
    GraphEdgeAttributes e_attributes;
  };

  template <typename GAttrMap, typename NAttrMap, typename EAttrMap>
  graph_attributes_writer<GAttrMap, NAttrMap, EAttrMap>
  make_graph_attributes_writer(const GAttrMap& g_attr, const NAttrMap& n_attr, 
                              const EAttrMap& e_attr) {
    return graph_attributes_writer<GAttrMap, NAttrMap, EAttrMap>
      (g_attr, n_attr, e_attr);
  }


  template <typename Graph>
  graph_attributes_writer
    <typename graph_property<Graph, graph_graph_attribute_t>::type,
     typename graph_property<Graph, graph_vertex_attribute_t>::type,
     typename graph_property<Graph, graph_edge_attribute_t>::type>
  make_graph_attributes_writer(const Graph& g)
  {
    typedef typename graph_property<Graph, graph_graph_attribute_t>::type 
      GAttrMap;
    typedef typename graph_property<Graph, graph_vertex_attribute_t>::type
      NAttrMap;
    typedef typename graph_property<Graph, graph_edge_attribute_t>::type
      EAttrMap;
    GAttrMap gam = get_property(g, graph_graph_attribute);
    NAttrMap nam = get_property(g, graph_vertex_attribute);
    EAttrMap eam = get_property(g, graph_edge_attribute);
    graph_attributes_writer<GAttrMap, NAttrMap, EAttrMap> writer(gam, nam, eam);
    return writer;
  }

  template <typename AttributeMap>
  struct attributes_writer {
    attributes_writer(AttributeMap attr)
      : attributes(attr) { }

    template <class VorE>
    void operator()(std::ostream& out, const VorE& e) const {
      this->write_attribute(out, attributes[e]);
    }

    private:
      template<typename AttributeSequence> 
      void write_attribute(std::ostream& out, 
                           const AttributeSequence& seq) const
      {
        if (!seq.empty()) {
          out << "[";
          write_attributes(seq, out);
          out << "]";
        }      
      }
  
      void write_attribute(std::ostream&, 
                           detail::error_property_not_found) const
      {
      }
    AttributeMap attributes;
  };

  template <typename Graph>
  attributes_writer
    <typename property_map<Graph, edge_attribute_t>::const_type>
  make_edge_attributes_writer(const Graph& g)
  {
    typedef typename property_map<Graph, edge_attribute_t>::const_type
      EdgeAttributeMap;
    return attributes_writer<EdgeAttributeMap>(get(edge_attribute, g));
  }

  template <typename Graph>
  attributes_writer
    <typename property_map<Graph, vertex_attribute_t>::const_type>
  make_vertex_attributes_writer(const Graph& g)
  {
    typedef typename property_map<Graph, vertex_attribute_t>::const_type 
      VertexAttributeMap;
    return attributes_writer<VertexAttributeMap>(get(vertex_attribute, g));
  }

  template <typename Graph, typename VertexPropertiesWriter,
            typename EdgePropertiesWriter, typename GraphPropertiesWriter>

  inline void write_graphviz(std::ostream& out, const Graph& g,
                             VertexPropertiesWriter vpw,
                             EdgePropertiesWriter epw,
                             GraphPropertiesWriter gpw) {
    
    typedef typename boost::graph_traits<Graph>::directed_category cat_type;
    typedef graphviz_io_traits<cat_type> Traits;
    std::string name = "G";
    out << Traits::name() << " " << name << " {" << std::endl;

    gpw(out); //print graph properties
   
    typename boost::graph_traits<Graph>::vertex_iterator i, end;

    for(boost::tie(i,end) = boost::vertices(g); i != end; ++i) {
      out << *i;
      vpw(out, *i); //print vertex attributes 
      out << ";" << std::endl;
    }
    typename boost::graph_traits<Graph>::edge_iterator ei, edge_end;
    for(boost::tie(ei, edge_end) = boost::edges(g); ei != edge_end; ++ei) {
      out << source(*ei, g) << Traits::delimiter() << target(*ei, g) << " ";
      epw(out, *ei); //print edge attributes 
      out << ";" << std::endl;
    }
    out << "}" << std::endl;
  }

#if !defined(BOOST_MSVC) || BOOST_MSVC > 1300
  // ambiguous overload problem with VC++
  template <typename Graph>
  inline void 
  write_graphviz(std::ostream& out, const Graph& g) {
    default_writer dw;
    default_writer gw;
    write_graphviz(out, g, dw, dw, gw);
  }
#endif

  template <typename Graph, typename VertexWriter>
  inline void 
  write_graphviz(std::ostream& out, const Graph& g, VertexWriter vw) {
    default_writer dw;
    default_writer gw;
    write_graphviz(out, g, vw, dw, gw);
  }

  template <typename Graph, typename VertexWriter, typename EdgeWriter>
  inline void
  write_graphviz(std::ostream& out, const Graph& g, 
                 VertexWriter vw, EdgeWriter ew) {
    default_writer gw;
    write_graphviz(out, g, vw, ew, gw);
  }

  namespace detail {

    template <class Graph_, class RandomAccessIterator>
    void write_graphviz_subgraph (std::ostream& out, 
                                  const subgraph<Graph_>& g, 
                                  RandomAccessIterator vertex_marker,
                                  RandomAccessIterator edge_marker)
    {
      typedef subgraph<Graph_> Graph;
      typedef typename boost::graph_traits<Graph>::vertex_descriptor Vertex;
      typedef typename boost::graph_traits<Graph>::directed_category cat_type;
      typedef graphviz_io_traits<cat_type> Traits;

      typedef typename graph_property<Graph, graph_name_t>::type NameType;
      const NameType& g_name = get_property(g, graph_name);

      if ( g.is_root() )
        out << Traits::name() ;
      else
        out << "subgraph";

      out << " " << g_name << " {" << std::endl;

      typename Graph::const_children_iterator i_child, j_child;

      //print graph/node/edge attributes
#if defined(BOOST_MSVC) && BOOST_MSVC <= 1300
      typedef typename graph_property<Graph, graph_graph_attribute_t>::type 
        GAttrMap;
      typedef typename graph_property<Graph, graph_vertex_attribute_t>::type
        NAttrMap;
      typedef typename graph_property<Graph, graph_edge_attribute_t>::type
        EAttrMap;
      GAttrMap gam = get_property(g, graph_graph_attribute);
      NAttrMap nam = get_property(g, graph_vertex_attribute);
      EAttrMap eam = get_property(g, graph_edge_attribute);
      graph_attributes_writer<GAttrMap, NAttrMap, EAttrMap> writer(gam, nam, eam);
      writer(out);
#else
      make_graph_attributes_writer(g)(out);
#endif

      //print subgraph
      for ( boost::tie(i_child,j_child) = g.children();
            i_child != j_child; ++i_child )
        write_graphviz_subgraph(out, *i_child, vertex_marker, edge_marker);

      // Print out vertices and edges not in the subgraphs.

      typename boost::graph_traits<Graph>::vertex_iterator i, end;
      typename boost::graph_traits<Graph>::edge_iterator ei, edge_end;

      typename property_map<Graph, vertex_index_t>::const_type 
        indexmap = get(vertex_index, g.root());

      for(boost::tie(i,end) = boost::vertices(g); i != end; ++i) {
        Vertex v = g.local_to_global(*i);
        int pos = get(indexmap, v);
        if ( vertex_marker[pos] ) {
          vertex_marker[pos] = false;
          out << v;
#if defined(BOOST_MSVC) && BOOST_MSVC <= 1300
          typedef typename property_map<Graph, vertex_attribute_t>::const_type 
            VertexAttributeMap;
          attributes_writer<VertexAttributeMap> vawriter(get(vertex_attribute, 
                                                             g.root()));
          vawriter(out, v);
#else
          make_vertex_attributes_writer(g.root())(out, v);
#endif
          out << ";" << std::endl;
        }
      }

      for (boost::tie(ei, edge_end) = edges(g); ei != edge_end; ++ei) {
        Vertex u = g.local_to_global(source(*ei,g)),
          v = g.local_to_global(target(*ei, g));
        int pos = get(get(edge_index, g.root()), g.local_to_global(*ei));
        if ( edge_marker[pos] ) {
          edge_marker[pos] = false;
          out << u << " " << Traits::delimiter() << " " << v;
#if defined(BOOST_MSVC) && BOOST_MSVC <= 1300
          typedef typename property_map<Graph, edge_attribute_t>::const_type
            EdgeAttributeMap;
          attributes_writer<EdgeAttributeMap> eawriter(get(edge_attribute, g));
          eawriter(out, *ei);
#else
          make_edge_attributes_writer(g)(out, *ei); //print edge properties
#endif
          out << ";" << std::endl;
        }
      }
      out << "}" << std::endl;
    }
  } // namespace detail

  // requires graph_name graph property
  template <typename Graph>
  void write_graphviz(std::ostream& out, const subgraph<Graph>& g) {
    std::vector<bool> edge_marker(num_edges(g), true);
    std::vector<bool> vertex_marker(num_vertices(g), true);

    detail::write_graphviz_subgraph(out, g,
                                    vertex_marker.begin(),
                                    edge_marker.begin());
  }
  
  template <typename Graph>
  void write_graphviz(const std::string& filename, const subgraph<Graph>& g) {
    std::ofstream out(filename.c_str());
    std::vector<bool> edge_marker(num_edges(g), true);
    std::vector<bool> vertex_marker(num_vertices(g), true);

    detail::write_graphviz_subgraph(out, g,
                                    vertex_marker.begin(),
                                    edge_marker.begin());
  }

  typedef std::map<std::string, std::string> GraphvizAttrList;

  typedef property<boost::vertex_attribute_t, GraphvizAttrList> 
          GraphvizVertexProperty;

  typedef property<boost::edge_attribute_t, GraphvizAttrList, 
                   property<boost::edge_index_t, int> >
          GraphvizEdgeProperty;
  
  typedef property<boost::graph_graph_attribute_t, GraphvizAttrList, 
                   property<boost::graph_vertex_attribute_t, GraphvizAttrList, 
                   property<boost::graph_edge_attribute_t, GraphvizAttrList, 
                   property<boost::graph_name_t, std::string> > > >
          GraphvizGraphProperty;
    
  typedef subgraph<adjacency_list<boost::vecS, 
                   boost::vecS, boost::directedS, 
                   GraphvizVertexProperty,
                   GraphvizEdgeProperty,
                   GraphvizGraphProperty> >
          GraphvizDigraph;

  typedef subgraph<adjacency_list<boost::vecS, 
                   boost::vecS, boost::undirectedS, 
                   GraphvizVertexProperty,
                   GraphvizEdgeProperty,
                   GraphvizGraphProperty> >
          GraphvizGraph;
  

  // These four require linking the BGL-Graphviz library: libbgl-viz.a
  // from the /src directory.
  extern void read_graphviz(const std::string& file, GraphvizDigraph& g);
  extern void read_graphviz(FILE* file, GraphvizDigraph& g);

  extern void read_graphviz(const std::string& file, GraphvizGraph& g);
  extern void read_graphviz(FILE* file, GraphvizGraph& g);

} // namespace boost
  
#endif // BOOST_GRAPHVIZ_HPP
// END inserted file header file  -------------------------------------------------------

#include <fstream>
#include <cerrno>
#include <cstring>

namespace xaifBooster {

  template <class Graph>
  void GraphVizDisplay::show(const Graph& g,
			     const std::string& aFileName) {
    show(g, aFileName, DefaultVertexLabelWriter());
  }

  template <class Graph, class VertexLabelWriter>
  void GraphVizDisplay::show(const Graph& g,
			     const std::string& aFileName,
			     const VertexLabelWriter& aVertexLabelWriter) {
    show(g, aFileName, aVertexLabelWriter, DefaultEdgeLabelWriter());
  }

  template <class Graph, class VertexLabelWriter, class EdgeLabelWriter>
  void GraphVizDisplay::show(const Graph& g,
			     const std::string& aFileName,
			     const VertexLabelWriter& aVertexLabelWriter,
			     const EdgeLabelWriter& anEdgeLabelWriter) {
    show(g, aFileName, aVertexLabelWriter, anEdgeLabelWriter, DefaultGraphPropertiesWriter());
  }

  template <class Graph, class VertexLabelWriter, class EdgeLabelWriter, class GraphPropertiesWriter>
  void GraphVizDisplay::show(const Graph& g,
			     const std::string& aFileName,
			     const VertexLabelWriter& aVertexLabelWriter,
			     const EdgeLabelWriter& anEdgeLabelWriter,
			     const GraphPropertiesWriter& aGraphPropertiesWriter) {
    std::string theFileName("/tmp/GraphVizDisplay.dot");
    if (!aFileName.empty())
      theFileName="/tmp/"+aFileName+".dot";
    std::ofstream anOutFileStream;
    errno=0;
    anOutFileStream.open(theFileName.c_str(),std::ios::out);
    if(!anOutFileStream)
      THROW_LOGICEXCEPTION_MACRO("GraphVizDisplay<Vertex,Edge>::show : cannot open file >"
				 << theFileName.c_str()
				 << "< , system error: "
				 << strerror(errno));
    boost::write_graphviz(anOutFileStream,
			  g.getInternalBoostGraph(),
			  aVertexLabelWriter,
			  anEdgeLabelWriter,
			  aGraphPropertiesWriter);
    anOutFileStream.close();

    std::string drawString = (DbgLoggerManager::instance()->getGraphicsFormat() == DbgLoggerManager::PS_FORMAT)
     ? " dot -q -Tps " + theFileName + ".2 >| " + theFileName + ".ps ; gv " + theFileName + ".ps"
     : " dot -q -Tsvg " + theFileName + ".2 >| " + theFileName + ".svg ; firefox " + theFileName + ".svg";

    // in case of listS there are hex identifiers in the dot file which dot cannot interpret
    // as a hex number so we need to make it a 'name' pre prepending HEX
    std::string commandString(" sed \"s/0x/HEX/g\" " + theFileName + " >| " + theFileName + ".1;"  +
			      " sed \"s/digraph G/digraph " + aFileName + "/g\" " + theFileName + ".1" + " >| " + theFileName + ".2;" +
                              drawString);
    system(commandString.c_str());
  }

} // end namespace xaifBooster

