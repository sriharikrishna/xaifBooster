#ifndef  _EDGETRAVERSABLE_INCLUDE_
#define  _EDGETRAVERSABLE_INCLUDE_

#include "xaifBooster/system/inc/Edge.hpp"
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"

namespace xaifBooster { 

  /** 
   * this is an extension of Edge
   * which can be part of data structure traversals
   */ 
  class EdgeTraversable : public Edge,
			  public GenericTraverseInvoke { 
  public: 

    /**
     * virtual in GenericTraverseInvoke
     * this will have to be overriden for edges which actually 
     * have children, e.g. data members considered to be children
     * in terms of the traversal
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c) {}; 

  }; // end of class EdgeTraversable

} // end of namespace xaifBooster

#endif