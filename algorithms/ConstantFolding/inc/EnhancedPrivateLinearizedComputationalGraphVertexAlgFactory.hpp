#ifndef _ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEXALGFACTORY_INCLUDE_
#define _ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHVERTEXALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphVertex.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertexAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphVertex.hpp"
using namespace xaifBooster;

namespace xaifBoosterConstantFolding {

  class EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory : public xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphVertexAlgFactory {

  public:
    
    static EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory *instance();

    virtual ~EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory(){};

    virtual EnhancedPrivateLinearizedComputationalGraphVertex * makeNewPrivateLinearizedComputationalGraphVertex();

    virtual std::string debug() const;

  protected:
    
    friend class BasicBlockAlg;
    
    EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory(){};

  private:
  
    static EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory* ourPrivateLinearizedComputationalGraphVertexAlgFactoryInstance_p;

    EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory (const EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory&);

    EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory operator= (const EnhancedPrivateLinearizedComputationalGraphVertexAlgFactory&);
  };
}
#endif
