#include "xaifBooster/system/inc/DuUdMapUseResult.hpp"

namespace xaifBooster { 

  DuUdMapUseResult::StatementIdLists::StatementIdLists(const DuUdMapUseResult::StatementIdList& aDependentStatementIdList,
						       const DuUdMapUseResult::StatementIdList& aPassiveStatementIdList) :
    myDependentStatementIdList(aDependentStatementIdList),
    myPassiveStatementIdList(aPassiveStatementIdList) {
  }
    
} // end of namespace  
