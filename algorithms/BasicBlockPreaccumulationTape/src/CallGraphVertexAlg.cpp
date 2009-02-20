#include <sstream>

#include "xaifBooster/algorithms/BasicBlockPreaccumulationTape/inc/CallGraphVertexAlg.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulationTape {

  CallGraphVertexAlg::CallGraphVertexAlg(CallGraphVertex& theContaining) : 
    CallGraphVertexAlgBase(theContaining) {
  }

  CallGraphVertexAlg::~CallGraphVertexAlg() {
  }

  std::string
  CallGraphVertexAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterBasicBlockPreaccumulationTape::CallGraphVertexAlg[" << this
	<< ",myContaining=" << getContaining().debug().c_str()
        << ",myRequiredValueSets=";
    for(RequiredValueSetsList::const_iterator rvsI = myRequiredValueSetsList.begin();
        rvsI != myRequiredValueSetsList.end(); ++rvsI) {
      out << rvsI->debug().c_str();
    }
    out << "]" << std::ends;
    return out.str();
  } // end CallGraphVertexAlg::debug()

  void
  CallGraphVertexAlg::traverseToChildren(const GenericAction::GenericAction_E anAction_c) {
  } // end CallGraphVertexAlg::traverseToChildren()

} // end namespace xaifBoosterBasicBlockPreaccumulationTape

