#ifndef _ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGEALGFACTORY_INCLUDE_
#define _ENHANCEDPRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGEALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/ConstantFolding/inc/EnhancedPrivateLinearizedComputationalGraphEdge.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdgeAlgFactory.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"
using namespace xaifBooster;

namespace xaifBoosterConstantFolding {

  class EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory : public xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdgeAlgFactory {

  public:
    
    static EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory *instance();

    virtual ~EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory(){};

    virtual EnhancedPrivateLinearizedComputationalGraphEdge * makeNewPrivateLinearizedComputationalGraphEdge();
 
    virtual std::string debug() const;

  protected:
    
    friend class BasicBlockAlg;
    
    EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory(){};

  private:

    static EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory* ourPrivateLinearizedComputationalGraphEdgeAlgFactoryInstance_p;

    EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory (const EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory&);

    EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory operator= (const EnhancedPrivateLinearizedComputationalGraphEdgeAlgFactory&);
  };
}
#endif
