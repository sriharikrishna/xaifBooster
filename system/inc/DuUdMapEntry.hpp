#ifndef _DUUDMAPENTRY_INCLUDE_
#define _DUUDMAPENTRY_INCLUDE_

#include <string>
#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/DuUdMapDefinitionResult.hpp"

namespace xaifBooster{ 

  /**
   * contains the list of statement IDs
   */
  class DuUdMapEntry : public XMLPrintable{ 
    
  public: 
  
    DuUdMapEntry(unsigned int theKey); 
 
    ~DuUdMapEntry();

    std::string debug() const ; 

    static const std::string ourXAIFName;

    static const std::string our_myKey_XAIFName;

    static const std::string our_StatementId_XAIFName;

    static const std::string our_IdRef_XAIFName;

    void printXMLHierarchy(std::ostream& os) const; 

    const DuUdMapDefinitionResult::StatementIdList& getStatementIdList() const; 

    void appendToStatementIdList(const ObjectWithId::Id& anId);

    /** 
     * anIdList contains the Ids of all statements 
     * found in the scope of question so far
     * this applies only to UD chains and for this use 
     * we are looking for a definition
     */
    const DuUdMapDefinitionResult definition(const DuUdMapDefinitionResult::StatementIdList& anIdList) const;

    /** 
     * the name says it all
     * Note: sameDefinitionAs returning false does not 
     * imply the definitions are disjoint
     */
    bool sameDefinitionAs(const DuUdMapEntry& anotherEntry) const;

    /** 
     * the name says it all
     * Note: disjointDefinitionFrom returning false does not 
     * imply the definitions are the same
     */
    bool disjointDefinitionFrom(const DuUdMapEntry& anotherEntry) const;

  private:

    /**
     * keys start with 1
     * in XAIF schema the default is 0 
     * which refers to a dummy instance in the
     * DuUdMap
     */
    const unsigned int myKey;

    /**
     * no def
     */
    DuUdMapEntry();

    /**
     * no def
     */
    DuUdMapEntry(const DuUdMapEntry&);

    /**
     * no def
     */
    DuUdMapEntry operator=(const DuUdMapEntry&);

    DuUdMapDefinitionResult::StatementIdList myStatementIdList;
    
  }; // end of class DuUdMapEntry

} // end of namespace xaifBooster

#endif
