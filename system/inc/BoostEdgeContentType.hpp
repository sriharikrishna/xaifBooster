#ifndef  _BOOSTEDGECONTENTTYPE_INCLUDE_
#define  _BOOSTEDGECONTENTTYPE_INCLUDE_

#include "boost/graph/adjacency_list.hpp"
#include "boost/property_map.hpp"         

namespace xaifBooster { 

  /** 
   * the following is required by boost
   * to give the edge property map a unique ID
   * within the collection of the graph's maps
   */
  class BoostEdgeContentType { 
  public: 
    enum { num=101 };
    typedef boost::edge_property_tag kind;
  }; // end class

} // end of namespace

#endif
