#ifndef  _VERTEX_INCLUDE_
#define  _VERTEX_INCLUDE_

#include "xaifBooster/system/inc/GraphElement.hpp" 
#include "xaifBooster/system/inc/WrapperTypeDefs.hpp"

namespace xaifBooster { 

  /** 
   * this is a vertex to be 
   * used with the GraphWrapper class 
   * which doesn't have capacity for traversal
   */ 
  typedef GraphElement<WrapperTypeDefs::InternalBoostVertexDescriptorType> Vertex;

} // end of namespace xaifBooster

#endif
