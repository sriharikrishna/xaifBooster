#ifndef _ALIASACTIVITYMAP_INCLUDE_
#define _ALIASACTIVITYMAP_INCLUDE_

#include <vector>
#include <list>
#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  class AliasActivity;
  class AliasActivityMapKey;


  /**
   * map to hold alias and activity information 
   * supplied from the front end through XML
   * For the time being we assume that there is not 
   * a big difference in the quality of the alias and the 
   * activity information, i.e. the granularity is about 
   * the same allowing them to be store with the same key.
   */
  class AliasActivityMap : public XMLPrintable {

  public:
    
    AliasActivityMap(){};

    ~AliasActivityMap();

    /**
     * adds the AliasActivity to the table, 
     * the key is supposed to be an integer
     * given as a string that will be converted
     */
    AliasActivity&  
    addAliasActivity(const std::string& aKey);

    /**
     * get acitivity information based in the AliasActivityMapKey
     * this returns the correct defaults for the keys
     * that don't actually have an item in the map
     */
    bool isActive(const AliasActivityMapKey& theKey) const;

    /**
     * check disjunction of alias sets 
     */

    typedef std::list<const AliasActivityMapKey*> AliasActivityMapKeyList;
    bool isAliased(const AliasActivityMapKey& theKey, const AliasActivityMapKeyList& theList) const;

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

  private: 

    /**
     * since this map is potentially large
     * and has random access so
     * we use a vector as representation
     * and convert all XML integer key strings into 
     * ints.
     */
    typedef std::vector<AliasActivity*> AAVector;

    AAVector myAAVector;

    /**
     * no def
     */
    AliasActivityMap(const AliasActivityMap&);

    /**
     * no def
     */
    AliasActivityMap operator=(const AliasActivityMap&);

  }; // end of class AliasActivityMap

} // end of namespace 
                                                                     
#endif
