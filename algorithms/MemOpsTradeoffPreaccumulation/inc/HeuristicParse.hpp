/********************************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * HeuristicParse.hpp          Last Updated: 04/22/04 11:57
 */

#ifndef _HEURISTICPARSE_INCLUDE_
#define _HEURISTICPARSE_INCLUDE_

#include <string>
#include <list>
#include <boost/tokenizer.hpp>
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/ConceptuallyStaticInstances.hpp"

namespace MemOpsTradeoffPreaccumulation { 

  class HeuristicParse {

  public:

    static MemOpsTradeoffPreaccumulation::ConceptuallyStaticInstances::Heuristic stringToEnum(const std::string& theHeuristic);

    static void fromString(const std::string& theHeuristicString);

  private:

  }; // end of class HeuristicParse

} // end of namespace MemOpsTradeoffPreaccumulation
                                                                     
#endif
