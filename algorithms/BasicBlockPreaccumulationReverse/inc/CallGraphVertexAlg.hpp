#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_

#include <list>

#include "xaifBooster/system/inc/CallGraphVertexAlgBase.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"

namespace xaifBooster { 
  class ExpressionVertex;
  class Assignment;
  class BasicBlockElement;
}

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class CallGraphVertexAlg : public CallGraphVertexAlgBase {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    virtual ~CallGraphVertexAlg();

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

    /**
     * flatten the Assignment level graphs found here into a graph held by 
     * myFlattenedSequence per sequence of consecutive Assignment instances
     */
    virtual void algorithm_action_2();

    /**
     * generate code for the elimination sequence returned by Angel
     */
    virtual void algorithm_action_3();

  private:
    
    /** 
     * no def
     */
    CallGraphVertexAlg();

    /** 
     * no def
     */
    CallGraphVertexAlg(const CallGraphVertexAlg&);

    /** 
     * no def
     */
    CallGraphVertexAlg operator=(const CallGraphVertexAlg&);

    xaifBoosterCodeReplacement::ReplacementList myReplacementList;
    
  };
 
} // end of namespace xaifBoosterAngelInterfaceAlgorithms
                                                                     
#endif
