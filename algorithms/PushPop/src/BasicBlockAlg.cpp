#include "xaifBooster/algorithms/PushPop/inc/BasicBlockAlg.hpp"

#include "xaifBooster/algorithms/DerivativePropagator/inc/DerivativePropagator.hpp"

#include "xaifBooster/algorithms/RequiredValues/inc/RequiredValueSet.hpp"

using namespace xaifBooster;

namespace xaifBoosterPushPop {

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
    xaifBooster::BasicBlockAlgBase(theContaining),
    xaifBoosterAddressArithmetic::BasicBlockAlg(theContaining) {
  } // end BasicBlockAlg::BasicBlockAlg()

  BasicBlockAlg::~BasicBlockAlg() {
  } // end BasicBlockAlg::~BasicBlockAlg()

  std::string BasicBlockAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterPushPop::BasicBlockAlg[" << this
	<< "]" << std::ends;
    return out.str();
  } // end BasicBlockAlg::debug()

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end BasicBlockAlg::traverseToChildren()

  const BasicBlock&
  BasicBlockAlg::getContaining() const {
    return xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::getContaining();
  } // end BasicBlockAlg::getContaining()

} // end namespace xaifBoosterPushPop

