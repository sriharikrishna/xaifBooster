#ifndef _MEMOPSTRADEOFFPREACCUMULATIONCONCEPTUALLYSTATICINSTANCES_INCLUDE_
#define _MEMOPSTRADEOFFPREACCUMULATIONCONCEPTUALLYSTATICINSTANCES_INCLUDE_

#include <list>
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/BasicBlockAlg.hpp"

namespace MemOpsTradeoffPreaccumulation { 

  class ConceptuallyStaticInstances { 
 
  public : 

    static ConceptuallyStaticInstances* instance();

    ~ConceptuallyStaticInstances();

    enum Heuristic{VERTEX, EDGE, FACE, FORWARD, REVERSE, MARKOWITZ, SIBLING, SIBLING2, SUCCPRED, ABSORB};

    typedef std::list<Heuristic> HeuristicList;

    HeuristicList& getList();

  private: 
    
    ConceptuallyStaticInstances();
    
    /** 
     * no def
     */
    ConceptuallyStaticInstances(const ConceptuallyStaticInstances&);

    /** 
     * no def
     */
    ConceptuallyStaticInstances operator=(const ConceptuallyStaticInstances&);

    void createList();

    static ConceptuallyStaticInstances* ourInstance_p;

    HeuristicList* myList_p;
  
  }; // end of ConceptuallyStaticInstances
  
} 

#endif 
