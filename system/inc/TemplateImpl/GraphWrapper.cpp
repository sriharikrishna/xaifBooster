#ifndef  _GRAPHWRAPPER_INCLUDE_
#include "xaifBooster/system/inc/GraphWrapper.hpp"
#endif

#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

namespace xaifBooster { 

  template <class Vertex, class Edge>
  GraphWrapper<Vertex, Edge>::GraphWrapper() :
    myNextVertexId(0),
    myNextEdgeId(0) {
  } 

  template <class Vertex, class Edge>
  GraphWrapper<Vertex,Edge>::~GraphWrapper() { 
    // delete all the edges
    std::pair < 
      InternalBoostEdgeIteratorType,
      InternalBoostEdgeIteratorType 
      > 
      theEdgeEnds=boost::edges(myBoostGraph);
    InternalBoostEdgeIteratorType ei_begin(theEdgeEnds.first), ei_end(theEdgeEnds.second);
    for (;ei_begin!=ei_end;++ei_begin) { 
      Edge* anEdge_p=boost::get(boost::get(BoostEdgeContentType(),
					   myBoostGraph), // get the Edge property map
				*(ei_begin)); // get the descriptor
      if ( anEdge_p) // this should always be true
	delete anEdge_p;
    } // end for
    // delete all the vertices
    std::pair < 
      InternalBoostVertexIteratorType,
      InternalBoostVertexIteratorType 
      > 
      theVertexEnds=boost::vertices(myBoostGraph);
    InternalBoostVertexIteratorType vi_begin(theVertexEnds.first), vi_end(theVertexEnds.second);
    for (;vi_begin!=vi_end;++vi_begin) { 
      Vertex* aVertex_p=boost::get(boost::get(BoostVertexContentType(),
					      myBoostGraph), // get the Vertex property map
				   *(vi_begin)); // get the descriptor
      if ( aVertex_p) // this should always be true
	delete aVertex_p;
    }
  } // end of GraphWrapper<Vertex,Edge>::~GraphWrapper

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::VertexIteratorPair
  GraphWrapper<Vertex,Edge>::vertices() { 
    std::pair < 
      InternalBoostVertexIteratorType,
      InternalBoostVertexIteratorType 
      > 
      theEnds=boost::vertices(myBoostGraph);
    return VertexIteratorPair(VertexIterator(myBoostGraph,theEnds.first),
			      VertexIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::vertices

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::ConstVertexIteratorPair
  GraphWrapper<Vertex,Edge>::vertices() const { 
    std::pair < 
      InternalBoostVertexIteratorType,
      InternalBoostVertexIteratorType 
      > 
      theEnds=boost::vertices(myBoostGraph);
    // the following cons_casts are the compromise due to boost not having 
    // const iterators
    return ConstVertexIteratorPair(ConstVertexIterator(myBoostGraph,theEnds.first),
				   ConstVertexIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::vertices
  
  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::EdgeIteratorPair
  GraphWrapper<Vertex,Edge>::edges() { 
    std::pair < 
      InternalBoostEdgeIteratorType,
      InternalBoostEdgeIteratorType
      > 
      theEnds=boost::edges(myBoostGraph);
    return EdgeIteratorPair(EdgeIterator(myBoostGraph,theEnds.first),
			    EdgeIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::edges

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::ConstEdgeIteratorPair
  GraphWrapper<Vertex,Edge>::edges() const { 
    std::pair < 
      InternalBoostEdgeIteratorType,
      InternalBoostEdgeIteratorType
      > 
      theEnds=boost::edges(myBoostGraph);
    return ConstEdgeIteratorPair(ConstEdgeIterator(myBoostGraph,theEnds.first),
				 ConstEdgeIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::edges

  template <class Vertex, class Edge>
  Vertex&
  GraphWrapper<Vertex,Edge>::addVertex() { 
    // make a new vertex, owned by this graph's map.
    Vertex* internalVertex_p = new Vertex();
    // initialize with new vertex descriptor
    // see Vertex
    internalVertex_p->init(boost::add_vertex(myBoostGraph));
    boost::put(boost::get(BoostVertexContentType(),myBoostGraph), // get the Vertex property map
	       internalVertex_p->getDescriptor(), 
	       // get the new vertex descriptor
	       // see Vertex
	       internalVertex_p);
    return *(boost::get(boost::get(BoostVertexContentType(),
				   myBoostGraph), // get the Vertex property map
			internalVertex_p->getDescriptor()));
  }; // end of GraphWrapper<Vertex,Edge>::addVertex

  template <class Vertex, class Edge>
  void
  GraphWrapper<Vertex,Edge>::supplyAndAddVertexInstance(Vertex& theVertex) { 
    // initialize with new vertex descriptor
    // see Vertex
    theVertex.init(boost::add_vertex(myBoostGraph));
    boost::put(boost::get(BoostVertexContentType(),myBoostGraph), // get the Vertex property map
	       theVertex.getDescriptor(), 
	       // get the new vertex descriptor
	       // see Vertex
	       &theVertex);
  }; // end of GraphWrapper<Vertex,Edge>::supplyAndAddVertexInstance

  template <class Vertex, class Edge>
  void
  GraphWrapper<Vertex,Edge>::removeAndDeleteVertex(const Vertex& aVertex_cr) { 
    DBG_MACRO(DbgGroup::TEMPORARY, "GraphWrapper<Vertex,Edge>::removeAndDeleteVertex : start removing vertex "
	      << aVertex_cr.debug().c_str()
	      << " with "
	      << numOutEdgesOf(aVertex_cr)
	      << " out edges " 
	      << " and " 
	      << numInEdgesOf(aVertex_cr)
	      << " in edges");
    // remove out edges: 
    std::pair < 
      InternalBoostOutEdgeIteratorType,
      InternalBoostOutEdgeIteratorType 
      > 
      theOutEdgeEnds=boost::out_edges(aVertex_cr.getDescriptor(),
				      myBoostGraph);
    InternalBoostOutEdgeIteratorType oei_begin(theOutEdgeEnds.first), 
      oei_next(theOutEdgeEnds.first),
      oei_end(theOutEdgeEnds.second);
    for (;oei_begin!=oei_end;oei_begin=oei_next) { 
      ++oei_next;
      Edge* anEdge_p=boost::get(boost::get(BoostEdgeContentType(),
					   myBoostGraph), // get the Edge property map
				*(oei_begin)); // get the descriptor
      boost::remove_edge(*(oei_begin), 
			 myBoostGraph);
      if ( anEdge_p) {  // this should always be true
	DBG_MACRO(DbgGroup::TEMPORARY, "GraphWrapper<Vertex,Edge>::removeAndDeleteVertex : removing out_edge "
		  << anEdge_p->debug().c_str());
	delete anEdge_p;
      } 
    } // end for
    // remove in edges: 
    std::pair < 
      InternalBoostInEdgeIteratorType,
      InternalBoostInEdgeIteratorType 
      > 
      theInEdgeEnds=boost::in_edges(aVertex_cr.getDescriptor(),
				    myBoostGraph);
    InternalBoostInEdgeIteratorType iei_begin(theInEdgeEnds.first), 
      iei_end(theInEdgeEnds.second);
    for (;iei_begin!=iei_end;++iei_begin) { 
      DBG_MACRO(DbgGroup::TEMPORARY, "GraphWrapper<Vertex,Edge>::removeAndDeleteVertex : found an in_edge ");
      Edge* anEdge_p=boost::get(boost::get(BoostEdgeContentType(),
					   myBoostGraph), // get the Edge property map
				*(iei_begin)); // get the descriptor
      boost::remove_edge(*(iei_begin), 
			 myBoostGraph);
      if ( anEdge_p) { // this should always be true
	DBG_MACRO(DbgGroup::TEMPORARY, "GraphWrapper<Vertex,Edge>::removeAndDeleteVertex : removing in_edge "
		  << anEdge_p->debug().c_str());
	delete anEdge_p;
      } 
    } // end for
    // now remove the vertex
    boost::remove_vertex(aVertex_cr.getDescriptor(),
			 myBoostGraph);
    DBG_MACRO(DbgGroup::TEMPORARY, "GraphWrapper<Vertex,Edge>::removeAndDeleteVertex : removing vertex "
	      << aVertex_cr.debug().c_str());
    delete &aVertex_cr;
  }; // end of GraphWrapper<Vertex,Edge>::removeAndDeleteVertex

  template <class Vertex, class Edge>
  Edge&
  GraphWrapper<Vertex,Edge>::addEdge(const Vertex& theSource_cr,
				     const Vertex& theTarget_cr) { 
    // make a new edge owned by this graph's map
    Edge* internalEdge_p = new Edge();
    std::pair<
      WrapperTypeDefs::InternalBoostEdgeDescriptorType,
      bool
      > p = boost::add_edge(theSource_cr.getDescriptor(),
			    theTarget_cr.getDescriptor(),
			    myBoostGraph);
    if (!p.second) // the edge already exists
      THROW_LOGICEXCEPTION_MACRO("GraphWrapper::addEdge: there is already an Edge from source " 
				 << theSource_cr.debug().c_str() 
				 << " to  target " 
				 << theTarget_cr.debug().c_str());
    // initialize with new vertex descriptor
    // see Edge
    internalEdge_p->init(p.first);
    boost::put(boost::get(BoostEdgeContentType(),myBoostGraph), // get the Edge property map
	       internalEdge_p->getDescriptor(), 
	       // get the new vertex descriptor
	       // see Edge
	       internalEdge_p);
    return *(boost::get(boost::get(BoostEdgeContentType(),
				   myBoostGraph), // get the Vertex property map
			internalEdge_p->getDescriptor())); // 
  }; // end of GraphWrapper<Vertex,Edge>::addEdge
  
  template <class Vertex, class Edge>
  void
  GraphWrapper<Vertex,Edge>::supplyAndAddEdgeInstance(Edge& theEdge,
						      const Vertex& theSource_cr,
						      const Vertex& theTarget_cr) { 
    std::pair<
      WrapperTypeDefs::InternalBoostEdgeDescriptorType,
      bool
      > p = boost::add_edge(theSource_cr.getDescriptor(),
			    theTarget_cr.getDescriptor(),
			    myBoostGraph);
    if (!p.second) // the edge already exists
      THROW_LOGICEXCEPTION_MACRO("GraphWrapper::addEdge: there is already an Edge from source " 
				 << theSource_cr.debug().c_str() 
				 << " to  target " 
				 << theTarget_cr.debug().c_str());
    // initialize with new vertex descriptor
    // see Edge
    theEdge.init(p.first);
    boost::put(boost::get(BoostEdgeContentType(),myBoostGraph), // get the Edge property map
	       theEdge.getDescriptor(), 
	       // get the new vertex descriptor
	       // see Edge
	       &theEdge);
  }; // end of GraphWrapper<Vertex,Edge>::supplyAndAddEdgeInstance

  template <class Vertex, class Edge>
  void
  GraphWrapper<Vertex,Edge>::removeAndDeleteEdge(const Edge& anEdge_cr) { 
    // now remove the vertex
    boost::remove_edge(anEdge_cr.getDescriptor(),
		       myBoostGraph);
    delete &anEdge_cr;
  }; // end of GraphWrapper<Vertex,Edge>::removeAndDeleteEdge

  template <class Vertex, class Edge>
  Vertex&
  GraphWrapper<Vertex,Edge>::getSourceOf(const Edge& anEdge_cr) { 
    return *(boost::get(boost::get(BoostVertexContentType(),
				   myBoostGraph), // vertex map
			boost::source(anEdge_cr.getDescriptor(),
				      myBoostGraph))); // vertex descr.
  }; // end of GraphWrapper<Vertex,Edge>::getSourceOf

  template <class Vertex, class Edge>
  const Vertex&
  GraphWrapper<Vertex,Edge>::getSourceOf(const Edge& anEdge_cr) const { 
    return *(boost::get(boost::get(BoostVertexContentType(),
				   myBoostGraph), // vertex map
			boost::source(anEdge_cr.getDescriptor(),
				      myBoostGraph))); // vertex descr.
  }; // end of GraphWrapper<Vertex,Edge>::getSourceOf

  template <class Vertex, class Edge>
  Vertex&
  GraphWrapper<Vertex,Edge>::getTargetOf(const Edge& anEdge_cr) { 
    return *(boost::get(boost::get(BoostVertexContentType(),
				   myBoostGraph), // vertex map
			boost::target(anEdge_cr.getDescriptor(),
				      myBoostGraph))); // vertex descr.
  }; // end of GraphWrapper<Vertex,Edge>::getTargetOf

  template <class Vertex, class Edge>
  const Vertex&
  GraphWrapper<Vertex,Edge>::getTargetOf(const Edge& anEdge_cr) const  { 
    return *(boost::get(boost::get(BoostVertexContentType(),
				   myBoostGraph), // vertex map
			boost::target(anEdge_cr.getDescriptor(),
				      myBoostGraph))); // vertex descr.
  }; // end of GraphWrapper<Vertex,Edge>::getTargetOf

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::OutEdgeIteratorPair
  GraphWrapper<Vertex,Edge>::getOutEdgesOf(const Vertex& aVertex_cr) { 
    std::pair < 
      InternalBoostOutEdgeIteratorType,
      InternalBoostOutEdgeIteratorType 
      > 
      theEnds=boost::out_edges(aVertex_cr.getDescriptor(),
			       myBoostGraph);
    return OutEdgeIteratorPair(OutEdgeIterator(myBoostGraph,theEnds.first),
			       OutEdgeIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::getOutEdgesOf

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::ConstOutEdgeIteratorPair
  GraphWrapper<Vertex,Edge>::getOutEdgesOf(const Vertex& aVertex_cr) const { 
    std::pair < 
      InternalBoostOutEdgeIteratorType,
      InternalBoostOutEdgeIteratorType 
      > 
      theEnds=boost::out_edges(aVertex_cr.getDescriptor(),
			       myBoostGraph);
    return ConstOutEdgeIteratorPair(ConstOutEdgeIterator(myBoostGraph,theEnds.first),
				    ConstOutEdgeIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::getOutEdgesOf

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::InEdgeIteratorPair
  GraphWrapper<Vertex,Edge>::getInEdgesOf(const Vertex& aVertex_cr) { 
    std::pair < 
      InternalBoostInEdgeIteratorType,
      InternalBoostInEdgeIteratorType 
      > 
      theEnds=boost::in_edges(aVertex_cr.getDescriptor(),
			      myBoostGraph);
    return InEdgeIteratorPair(InEdgeIterator(myBoostGraph,theEnds.first),
			      InEdgeIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::getInEdgesOf

  template <class Vertex, class Edge>
  typename GraphWrapper<Vertex,Edge>::ConstInEdgeIteratorPair
  GraphWrapper<Vertex,Edge>::getInEdgesOf(const Vertex& aVertex_cr) const { 
    std::pair < 
      InternalBoostInEdgeIteratorType,
      InternalBoostInEdgeIteratorType 
      > 
      theEnds=boost::in_edges(aVertex_cr.getDescriptor(),
			      myBoostGraph);
    return ConstInEdgeIteratorPair(ConstInEdgeIterator(myBoostGraph,theEnds.first),
				   ConstInEdgeIterator(myBoostGraph,theEnds.second));
  }; // end of  GraphWrapper<Vertex,Edge>::getInEdgesOf

  template <class Vertex, class Edge>
  unsigned int 
  GraphWrapper<Vertex,Edge>::numOutEdgesOf(const Vertex& aVertex)const { 
    return boost::out_degree(aVertex.getDescriptor(),
			     myBoostGraph);
  } // end of GraphWrapper<Vertex,Edge>::numOutEdgesOf 

  template <class Vertex, class Edge>
  unsigned int 
  GraphWrapper<Vertex,Edge>::numInEdgesOf(const Vertex& aVertex)const { 
    return boost::in_degree(aVertex.getDescriptor(),
			    myBoostGraph);
  } // end of GraphWrapper<Vertex,Edge>::numInEdgesOf 

  template <class Vertex, class Edge>
  unsigned int 
  GraphWrapper<Vertex,Edge>::getNextVertexId() { 
    return ++myNextVertexId;
  } // end of GraphWrapper<Vertex,Edge>::getNextVertexId

  template <class Vertex, class Edge>
  unsigned int 
  GraphWrapper<Vertex,Edge>::getNextEdgeId() { 
    return ++myNextEdgeId;
  } // end of GraphWrapper<Vertex,Edge>::getNextEdgeId 

} // end of namespace