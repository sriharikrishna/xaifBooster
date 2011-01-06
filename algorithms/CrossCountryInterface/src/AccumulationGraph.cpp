// ========== begin copyright notice ===================
// This file is part of
// ---------------
// xaifBooster
// ---------------
// which is distributed under the BSD license.
// The full COPYRIGHT notice can be found in the top
// level directory of the xaifBooster distribution.
// ========== end copyright notice =====================

#include "xaifBooster/algorithms/CrossCountryInterface/inc/AccumulationGraph.hpp"

using namespace xaifBooster;

namespace xaifBoosterCrossCountryInterface {  

  AccumulationGraph::AccumulationGraph() {}
  AccumulationGraph::~AccumulationGraph() {} 

  std::string AccumulationGraph::debug() const {
    std::ostringstream out;
    out << "AccumulationGraph[" << this
        << "]" << std::ends;
    return out.str();
  } // end AccumulationGraph::debug()

} // end namespace xaifBoosterCrossCountryInterface

