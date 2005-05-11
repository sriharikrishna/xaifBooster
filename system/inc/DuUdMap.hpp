#ifndef _DUUDMAP_INCLUDE_
#define _DUUDMAP_INCLUDE_

#include <vector>
#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/DuUdMapDefinitionResult.hpp"
#include "xaifBooster/system/inc/DuUdMapUseResult.hpp"
#include "xaifBooster/system/inc/DuUdMapEntry.hpp"

namespace xaifBooster { 

  class DuUdMapKey;


  /**
   * map to hold DuUdMapEntry information 
   */
  class DuUdMap {

  public:
    
    DuUdMap(){};

    ~DuUdMap();

    static const std::string ourXAIFName;

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    typedef std::vector<DuUdMapEntry*> DuUdMapEntryPVector;

    DuUdMapEntry& addDuUdMapEntry(unsigned int theKey); 

    /** 
     * aKey is the key of a right-hand-side variable
     * which is to be checked for definitions in
     * statements listed in anIdList
     */
    const DuUdMapDefinitionResult definition(const DuUdMapKey& aKey,
					     const DuUdMapDefinitionResult::StatementIdList& anIdList) const;

    /** 
     * aKey is the key of a left-hand-side variable
     * which is to be checked for uses in
     * statements listed in the idLists
     */
    const DuUdMapUseResult use(const DuUdMapKey& aKey,
			       const DuUdMapUseResult::StatementIdLists& idLists) const;
    
    /** 
     * this returns true if the use-def chains for both 
     * keys are provably identical and false otherwise;
     * the keys have to come from the same ControlFlowGraph
     * as we don't require global uniqueness of statement ids
     * Note: sameDefinition returning false does not 
     * imply the definitions are disjoint
     */
    bool sameDefinition(const DuUdMapKey& aKey,
			const DuUdMapKey& anotherKey) const;


    /** 
     * this returns true if the use-def chains for both 
     * keys are provably disjoint and false otherwise;
     * the keys have to come from the same ControlFlowGraph
     * as we don't require global uniqueness of statement ids
     * Note: disjointDefinition returning false does not 
     * imply the definitions are the same
     */
    bool disjointDefinition(const DuUdMapKey& aKey,
			    const DuUdMapKey& anotherKey) const;

  private: 

    /**
     * no def
     */
    DuUdMap(const DuUdMap&);

    /**
     * no def
     */
    DuUdMap operator=(const DuUdMap&);

    /** 
     * the vector containing all the entries
     */
    DuUdMapEntryPVector myDuUdMapEntryPVector;

  }; // end of class DuUdMap

} // end of namespace 
                                                                     
#endif
