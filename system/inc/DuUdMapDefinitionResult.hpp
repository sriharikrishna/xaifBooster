#ifndef _DUUDMAPDEFINITIONRESULT_INCLUDE_
#define _DUUDMAPDEFINITIONRESULT_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/ObjectWithId.hpp"

namespace xaifBooster { 

  class DuUdMapDefinitionResult {
    
  public: 
      enum DuUdMapDefinition_E { UNIQUE_INSIDE,
				 UNIQUE_OUTSIDE,
				 AMBIGUOUS_INSIDE,
				 AMBIGUOUS_OUTSIDE,
				 AMBIGUOUS_BOTHSIDES,
				 DONT_KNOW };
    DuUdMapDefinitionResult();
    
    ~DuUdMapDefinitionResult();
    
    DuUdMapDefinition_E myAnswer;
    
    ObjectWithId::Id myStatementId;
    
    /** 
     * convenience definition here
     * used in DuUdMap(Entry)
     */ 
    typedef std::list<ObjectWithId::Id> StatementIdList;
    
  };

} // end of namespace 
                                                                     
#endif
