#include <sstream>
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"

#include "xaifBooster/system/inc/GraphVizDisplay.hpp"

#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"
#include "xaifBooster/system/inc/BasicBlock.hpp"

using namespace xaifBooster;

namespace xaifBoosterMemOpsTradeoffPreaccumulation { 

  void BasicBlockAlg::compute_elimination_sequence(
      const xaifBoosterCrossCountryInterface::LinearizedComputationalGraph&
      theLinearizedComputationalGraph,
      int mode,
      xaifBoosterCrossCountryInterface::JacobianAccumulationExpressionList&
      theJacobianAccumulationExpressionList) {
    //ANDREW: This is where your stuff goes. For the time being
    //ANDREW: I simply visualize theLinearizedComputationalGraph
    std::cout << "MY COMPUTE ELIM SEQ!!!!\n";
    GraphVizDisplay::show(theLinearizedComputationalGraph,"flattened");
  }

  BasicBlockAlg::BasicBlockAlg(BasicBlock& theContaining) :
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg(theContaining) {
      xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::compute_elimination_sequence=&compute_elimination_sequence; 
  }

  void
  BasicBlockAlg::algorithm_action_2() {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_2();
  }

  void
  BasicBlockAlg::algorithm_action_3() {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::algorithm_action_3();
  }

  void
  BasicBlockAlg::printXMLHierarchy(std::ostream& os) const {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::printXMLHierarchy(os);
  }

  std::string
  BasicBlockAlg::debug() const {
    return xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::debug();
  }

  void BasicBlockAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
    xaifBoosterBasicBlockPreaccumulation::BasicBlockAlg::traverseToChildren(anAction_c);
  }

} // end of namespace

