#ifndef  _VERTEXTRAVERSABLE_INCLUDE_
#define  _VERTEXTRAVERSABLE_INCLUDE_

#include "xaifBooster/boostWrapper/inc/Vertex.hpp" 
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"

namespace xaifBooster { 

  /** 
   * this is an extension of Vertex
   * which can be part of data structure traversals
   */ 
  class VertexTraversable : public Vertex,
			    public GenericTraverseInvoke { 
  public: 

    /**
     * virtual in GenericTraverseInvoke
     * this will have to be overriden for vertices which actually 
     * have children, e.g. data members considered to be children
     * in terms of the traversal
     */
    void traverseToChildren(const GenericAction::GenericAction_E anAction_c){}; 

  }; // end of class VertexTraversable

} // end of namespace xaifBooster

#endif
