#ifndef  _BOOSTVERTEXCONTENTTYPE_INCLUDE_
#define  _BOOSTVERTEXCONTENTTYPE_INCLUDE_

#include "boost/graph/adjacency_list.hpp"
#include "boost/property_map.hpp"         

namespace xaifBooster { 

  /** 
   * the following is required by boost
   * to give the vertex property map a unique ID
   * within the collection of the graph's maps
   */
  class BoostVertexContentType { 
  public: 
    enum { num=100 };
    typedef boost::vertex_property_tag kind;
  }; // end class

} // end of namespace

#endif
