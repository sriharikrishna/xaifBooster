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
