#ifndef _DUUDMAPUSERESULT_INCLUDE_
#define _DUUDMAPUSERESULT_INCLUDE_

#include "xaifBooster/system/inc/DuUdMapDefinitionResult.hpp"

namespace xaifBooster { 

  class DuUdMapUseResult : public DuUdMapDefinitionResult {
    
  public: 

    /** 
     * helper container for use queries
     */
    class StatementIdLists { 

    public: 
 
     StatementIdLists(const StatementIdList& myDependentStatementIdList,
		       const StatementIdList& myPassiveStatementIdList);
      /** 
       * this is to contain
       * xaifBooster::BasicBlockPreaccumulation::PrivateLinearizedComputationalGraph::myDependentStatementIdList
       */
      const StatementIdList& myDependentStatementIdList;

      /** 
       * this is to contain
       * xaifBooster::BasicBlockPreaccumulation::PrivateLinearizedComputationalGraph::myPassiveStatementIdList
       */
      const StatementIdList& myPassiveStatementIdList;

    private:
      /** 
       * no def
       */
      StatementIdLists();
    };

  };

} // end of namespace 
                                                                     
#endif
