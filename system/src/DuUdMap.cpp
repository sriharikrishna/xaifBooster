#include "xaifBooster/system/inc/DuUdMap.hpp"
#include "xaifBooster/system/inc/DuUdMapKey.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster { 

  DuUdMap::~DuUdMap() {
  } 

  const DuUdMap::DuUdMapDefinitionResult DuUdMap::definition(const DuUdMapKey& aKey,
							     DuUdMap::StatementIdList anIdList) const {
    DuUdMapDefinitionResult theResult;
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR)
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO) { 
      for (DuUdMap::StatementIdList::const_iterator li=anIdList.begin();
	   li!=anIdList.end();
	   ++li) { 
	// here comes the shortcut: 
	if (aKey.getKey()==*li) { 
	  theResult.myAnswer=UNIQUE_INSIDE;
	  theResult.myStatementId=*li;
	  break;
	} // end if
      } // end for
    } // end if
    return theResult;
  } 

  bool DuUdMap::sameDefinition(const DuUdMapKey& aKey,
			       const DuUdMapKey& anotherKey) const {
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR
	|| 
	anotherKey.getKind()==DuUdMapKey::TEMP_VAR)
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO
	&&
	anotherKey.getKind()!=DuUdMapKey::NO_INFO) { 
      // here comes the shortcut: 
      return (aKey.getKey()==anotherKey.getKey())?true:false;
    }
    return false;
  } 

} // end of namespace  
