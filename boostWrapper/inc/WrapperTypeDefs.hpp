#ifndef  _WRAPPERTYPEDEFS_INCLUDE_
#define  _WRAPPERTYPEDEFS_INCLUDE_

#include "boost/graph/adjacency_list.hpp"
#include "boost/property_map.hpp"         

namespace xaifBooster { 

  struct WrapperTypeDefs { 
    /**
     * \todo JU make this a parameter of GraphWrapper
     */
    typedef boost::listS OutEdgeListType;
    typedef boost::listS VertexListType;
    typedef boost::bidirectionalS DiretionType;
    
    typedef boost::adjacency_list_traits<
      OutEdgeListType,
      VertexListType,
      DiretionType
      > ::vertex_descriptor 
    InternalBoostVertexDescriptorType;

    typedef boost::adjacency_list_traits<
      OutEdgeListType,
      VertexListType,
      DiretionType
      > ::edge_descriptor 
    InternalBoostEdgeDescriptorType;

 }; // end of struct 

} // end of namespace

#endif 
