#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEXFACTORY_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTAIIONALGRAPHVERTEXFACTORY_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {
  
  class xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertexAlgFactory : public xaifBooster::Debuggable {

  public:
    static PrivateLinearizedComputationalGraphVertexAlgFactory* instance();

    virtual ~PrivateLinearizedComputationalGraphVertexAlgFactory(){};

    virtual PrivateLinearizedComputationalGraphVertex* makeNewPrivateLinearizedComputationalGraphVertex() {
      return new PrivateLinearizedComputationalGraphVertex(); 
    };

    virtual std::string debug() const;
   
  protected:
    
    friend class BasicBlockAlg;

    PrivateLinearizedComputationalGraphVertexAlgFactory(){};

  private:

    PrivateLinearizedComputationalGraphVertexAlgFactory (const PrivateLinearizedComputationalGraphVertexAlgFactory&);

    PrivateLinearizedComputationalGraphVertexAlgFactory operator= (const PrivateLinearizedComputationalGraphVertexAlgFactory&);
  };
}

#endif

