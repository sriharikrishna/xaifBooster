#ifndef _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_
#define _XAIFBOOSTERBASICBLOCKPREACCUMULATIONREVERSE_CALLGRAPHVERTEXALG_INCLUDE_

#include <list>

#include "xaifBooster/system/inc/CallGraphVertexAlgBase.hpp"

#include "xaifBooster/algorithms/CodeReplacement/inc/ReplacementList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationReverse {  

  /** 
   * class to implement algorithms relevant for the 
   * angel interface
   */
  class CallGraphVertexAlg : public CallGraphVertexAlgBase {
  public:
    
    CallGraphVertexAlg(CallGraphVertex& theContaining);

    virtual ~CallGraphVertexAlg(){};

    virtual void printXMLHierarchy(std::ostream& os) const;

    virtual std::string debug() const ;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c);

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
