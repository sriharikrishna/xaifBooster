#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/PrintManager.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"
#include "xaifBooster/system/inc/AliasMapKey.hpp"
#include "xaifBooster/system/inc/AliasMapEntry.hpp"

namespace xaifBooster { 

  const std::string AliasMap::ourXAIFName("xaif:AliasSetList");
  
  AliasMap::~AliasMap() {
    for(AAVector::const_iterator it=myAAVector.begin();
	it!=myAAVector.end();
	it++)
      if (*it)
	delete (*it);
  } 

  AliasMapEntry& 
  AliasMap::addAliasMapEntry(const std::string& aKey) { 
    unsigned int intKey = atoi(aKey.c_str());
    if (!intKey)
      THROW_LOGICEXCEPTION_MACRO("AliasMap::addAliasMapEntry: cannot add key >" << aKey.c_str() << "<");
    if (intKey>=myAAVector.size())
      // resize and initialize to 0
      myAAVector.resize(intKey>myAAVector.size()+256?intKey:myAAVector.size()+256,0);
    AliasMapEntry* aNewAliasMapEntry_p=new AliasMapEntry(intKey);
    myAAVector[intKey]=aNewAliasMapEntry_p;
    return (*aNewAliasMapEntry_p);
  } // end of AliasMap::addAliasMapEntry

  std::string AliasMap::debug() const {
    std::ostringstream out;
    out << "AliasMap[" << this 
	<< "]" << std::ends; 
    return out.str();
  } // end of AliasMap::debug
  
  void AliasMap::printXMLHierarchy(std::ostream& os) const {
    PrintManager& pm=PrintManager::getInstance();
    os << pm.indent() 
       << "<" 
       << ourXAIFName 
       << ">" 
       << std::endl; 
    for(AAVector::const_iterator it=myAAVector.begin();
	it!=myAAVector.end();
	it++)
      if (*it)
	(*it)->printXMLHierarchy(os);       
    os << pm.indent() 
       << "</"
       << ourXAIFName
       << ">" << std::endl;
    pm.releaseInstance();
  } // end of  AliasMap::printXMLHierarchy

  bool AliasMap::isAliased(const AliasMapKey& theKey, 
			   const AliasMap::AliasMapKeyList& theList) const { 
    // some obvious things first
    if (!theList.size()) 
      return false; 
    if (theKey.getKind()==AliasMapKey::TEMP_VAR)
      // by agreed usage patterns, i.e. a single 
      // relevant assignment within a given scope
      return false; 
    if (theKey.getKind()!=AliasMapKey::NO_INFO) {
      AliasMapKeyList::const_iterator i=theList.begin();
      for (;i!=theList.end();
	   ++i)
	if (haveNonEmptyIntersection(theKey,**i))
	  break;
      if(i==theList.end())
	return false;
    } 
    return true;
  }

  bool AliasMap::haveNonEmptyIntersection(const AliasMapKey& thisKey,
					  const AliasMapKey& theOtherKey) const { 
    if (theOtherKey.getKind()==AliasMapKey::TEMP_VAR)
      // by agreed usage patterns, i.e. a single 
      // relevant assignment within a given scope
      return false; 
    if (theOtherKey.getKind()!=AliasMapKey::NO_INFO) {
      if (thisKey.getKey()!=theOtherKey.getKey()) { 
	if (myAAVector[thisKey.getKey()]->disjointFrom(*myAAVector[theOtherKey.getKey()]))
	  return false;
      }
    } 
    return true;
  } 

} // end of namespace  
