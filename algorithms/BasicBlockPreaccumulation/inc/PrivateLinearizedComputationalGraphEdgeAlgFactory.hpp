#ifndef _PRIVATELINEARIZEDCOMPUTATIONALGRAPHEDGEALGFACTORY_INCLUDE_
#define _PRIVATELINEARIZEDCOMPUTAIIONALGRAPHEDGEALGFACTORY_INCLUDE_

#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/PrivateLinearizedComputationalGraphEdge.hpp"

namespace xaifBoosterBasicBlockPreaccumulation {
  
  class xaifBoosterBasicBlockPreaccumulation::PrivateLinearizedComputationalGraphEdgeAlgFactory : public xaifBooster::Debuggable {

  public:
    static  PrivateLinearizedComputationalGraphEdgeAlgFactory* instance();

    virtual ~PrivateLinearizedComputationalGraphEdgeAlgFactory(){};

    virtual PrivateLinearizedComputationalGraphEdge* makeNewPrivateLinearizedComputationalGraphEdge() {
      return new PrivateLinearizedComputationalGraphEdge();    
    };
  
    virtual std::string debug() const;

  protected:
    
    friend class BasicBlockAlg;

    PrivateLinearizedComputationalGraphEdgeAlgFactory(){};

  private:

    PrivateLinearizedComputationalGraphEdgeAlgFactory (const PrivateLinearizedComputationalGraphEdgeAlgFactory&);

    PrivateLinearizedComputationalGraphEdgeAlgFactory operator= (const PrivateLinearizedComputationalGraphEdgeAlgFactory&);
  };
}

#endif
