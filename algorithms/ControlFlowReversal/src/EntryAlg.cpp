#include <sstream>

#include "xaifBooster/algorithms/ControlFlowReversal/inc/EntryAlg.hpp"
#include "xaifBooster/system/inc/Entry.hpp"

using namespace xaifBooster;

namespace xaifBoosterControlFlowReversal { 

  EntryAlg::EntryAlg(Entry& theContaining) : EntryAlgBase(theContaining), ControlFlowGraphVertexAlg(theContaining) {}

  EntryAlg::~EntryAlg() {}

  std::string
  EntryAlg::debug() const {
    std::ostringstream out;
    out << "xaifBoosterControlFlowReversal::EntryAlg[" << this
        << "]" << std::ends;
    return out.str();
  }

} // end of namespace

