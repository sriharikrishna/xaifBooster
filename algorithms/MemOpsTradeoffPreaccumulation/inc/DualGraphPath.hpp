/*******************************************************************************************
 * Andrew Lyons, MCS Division, Argonne National Laboratory
 * Under the supervision of Paul Hovland and Uwe Naumann
 * DualGraphPath.hpp          Last Updated: 03/16/04 13:56
 */

#ifndef _DUALGRAPHPATH_INCLUDE_
#define _DUALGRAPHPATH_INCLUDE_

#include <list>
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphPath.hpp"
#include "xaifBooster/algorithms/MemOpsTradeoffPreaccumulation/inc/DualGraphVertex.hpp"

using namespace MemOpsTradeoffPreaccumulation;

namespace MemOpsTradeoffPreaccumulation { 

  class DualGraphPath { 
    
  public: 

    DualGraphPath();
    ~DualGraphPath(){};

    typedef std::list<DualGraphVertex*> Path;
    Path myPath;

    void setComplete();
    bool isComplete() const;
    
  private:
    
    bool complete;

  }; // end of class

}// end of namespace

#endif 
