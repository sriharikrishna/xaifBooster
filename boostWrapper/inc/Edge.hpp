#ifndef  _EDGE_INCLUDE_
#define  _EDGE_INCLUDE_

#include "xaifBooster/boostWrapper/inc/GraphElement.hpp" 
#include "xaifBooster/boostWrapper/inc/WrapperTypeDefs.hpp"

namespace xaifBooster { 

  /** 
   * this is an edge to be 
   * used with the GraphWrapper class 
   * which doesn't have capacity for traversal
   */ 
  typedef GraphElement<WrapperTypeDefs::InternalBoostEdgeDescriptorType> Edge;

} // end of namespace xaifBooster

#endif
