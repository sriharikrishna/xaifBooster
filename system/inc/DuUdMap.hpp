#ifndef _DUUDMAP_INCLUDE_
#define _DUUDMAP_INCLUDE_

#include <vector>
#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  class DuUdMapKey;


  /**
   * map to hold DuUdMapEntry information 
   * \todo is incomplete
   */
  class DuUdMap {

  public:
    
    DuUdMap(){};

    ~DuUdMap();

    enum DuUdMapDefinition_E { UNIQUE_INSIDE,
			       UNIQUE_OUTSIDE,
			       AMBIGUOUS_INSIDE,
			       AMBIGUOUS_OUTSIDE,
			       AMBIGUOUS_BOTHSIDES,
			       DONT_KNOW };

    /** 
     * \todo change this once we figure out how to represent it
     */
    typedef unsigned int StatementId;

    typedef std::list<StatementId> StatementIdList;

    class DuUdMapDefinitionResult {

    public: 
      DuUdMapDefinitionResult() :
	myAnswer(DONT_KNOW),
	myStatementId(0) { 
      };

      ~DuUdMapDefinitionResult(){};
      
      DuUdMapDefinition_E myAnswer;

      StatementId myStatementId;
      
    };

    /** 
     * \todo incomplete
     */
    const DuUdMapDefinitionResult definition(const DuUdMapKey& aKey,
					     StatementIdList anIdList) const;

    /** 
     * \todo incomplete
     */
    bool sameDefinition(const DuUdMapKey& aKey,
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

  }; // end of class DuUdMap

} // end of namespace 
                                                                     
#endif
