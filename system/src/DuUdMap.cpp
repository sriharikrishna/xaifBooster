#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"

#include "xaifBooster/system/inc/DuUdMap.hpp"
#include "xaifBooster/system/inc/DuUdMapKey.hpp"

namespace xaifBooster { 

  const std::string DuUdMap::ourXAIFName("xaif:DUUDSetList");

  DuUdMap::~DuUdMap() {
    for(DuUdMapEntryPVector::iterator it=myDuUdMapEntryPVector.begin();
	it!=myDuUdMapEntryPVector.end();
	it++)
      if (*it)
	delete (*it);
  } 

  std::string DuUdMap::debug() const {
    std::ostringstream out;
    out << "DuUdMap[" << this 
	<< "]" << std::ends; 
    return out.str();
  }

  void DuUdMap::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(DuUdMapEntryPVector::const_iterator it=myDuUdMapEntryPVector.begin();
	it!=myDuUdMapEntryPVector.end();
	it++)
      if (*it)
	(*it)->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } // end of  DuUdMap::printXMLHierarchy

  DuUdMapEntry& DuUdMap::addDuUdMapEntry(unsigned int theKey) { 
    if (theKey>=myDuUdMapEntryPVector.size())
      // resize and initialize to 0
      myDuUdMapEntryPVector.resize(theKey>myDuUdMapEntryPVector.size()+256?theKey:myDuUdMapEntryPVector.size()+256,0);
    DuUdMapEntry* aNewDuUdMapEntry_p=new DuUdMapEntry(theKey);
    myDuUdMapEntryPVector[theKey]=aNewDuUdMapEntry_p;
    return (*aNewDuUdMapEntry_p);
  } 

  const DuUdMapDefinitionResult DuUdMap::definition(const DuUdMapKey& aKey,
						    const DuUdMapDefinitionResult::StatementIdList& anIdList) const {
    DuUdMapDefinitionResult theResult;
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR)
      // obviously because the map doesn't contain any info on temporaries, 
      // the calling context should figure it out itself
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO) { 
      // we get the entry:
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size())  
	// have an explicit check here rather than using 'at' which 
	// wouldn't hint where the problem is...
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: key >" 
				   << aKey.getKey() 
				   << "< out of range");
      if (myDuUdMapEntryPVector[aKey.getKey()])
	return myDuUdMapEntryPVector[aKey.getKey()]->definition(anIdList);
      else 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::definition: key >" 
				   << aKey.getKey() 
				   << "< has no entry");
    } // end if
    return theResult;
  } 

  const DuUdMapUseResult DuUdMap::use(const DuUdMapKey& aKey,
				      const DuUdMapUseResult::StatementIdList& anIdList) const {
    DuUdMapUseResult theResult;
    // for now there is no difference
    DuUdMapDefinitionResult aDefinitionResult(definition(aKey,anIdList));
    theResult.myAnswer=aDefinitionResult.myAnswer;
    theResult.myStatementId=aDefinitionResult.myStatementId;
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
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size()
	  ||
	  anotherKey.getKey()<0 
	  || 
	  anotherKey.getKey()>=myDuUdMapEntryPVector.size()) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< out of range");
      }
      if (!myDuUdMapEntryPVector[aKey.getKey()] && 
	  !myDuUdMapEntryPVector[anotherKey.getKey()]) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< have null pointer map entry");
      }
      return (myDuUdMapEntryPVector[aKey.getKey()]->sameDefinitionAs(*(myDuUdMapEntryPVector[anotherKey.getKey()])));
    }
    return false;
  } 

  bool DuUdMap::disjointDefinition(const DuUdMapKey& aKey,
				   const DuUdMapKey& anotherKey) const {
    if (aKey.getKind()==DuUdMapKey::TEMP_VAR
	|| 
	anotherKey.getKind()==DuUdMapKey::TEMP_VAR)
      THROW_LOGICEXCEPTION_MACRO("DuUdMap::disjointDefinition: not supported for temporaries");
    if (aKey.getKind()!=DuUdMapKey::NO_INFO
	&&
	anotherKey.getKind()!=DuUdMapKey::NO_INFO) { 
      if (aKey.getKey()<0 
	  || 
	  aKey.getKey()>=myDuUdMapEntryPVector.size()
	  ||
	  anotherKey.getKey()<0 
	  || 
	  anotherKey.getKey()>=myDuUdMapEntryPVector.size()) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< out of range");
      }
      if (!myDuUdMapEntryPVector[aKey.getKey()] && 
	  !myDuUdMapEntryPVector[anotherKey.getKey()]) { 
	THROW_LOGICEXCEPTION_MACRO("DuUdMap::sameDefinition: key >" 
				   << aKey.getKey() 
				   << "< or key >"
				   << anotherKey.getKey()
				   << "< have null pointer map entry");
      }
      return (myDuUdMapEntryPVector[aKey.getKey()]->disjointDefinitionFrom(*(myDuUdMapEntryPVector[anotherKey.getKey()])));
    }
    return false;
  } 

} // end of namespace  
