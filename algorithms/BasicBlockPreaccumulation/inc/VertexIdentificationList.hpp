#ifndef _VERTEXIDENTIFICATIONLIST_INCLUDE_
#define _VERTEXIDENTIFICATIONLIST_INCLUDE_

#include "xaifBooster/utils/inc/Debuggable.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"
#include "xaifBooster/system/inc/DuUdMap.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is the list against which we will check 
   * for identities with other Variable and Argument instances
   */
  class VertexIdentificationList : public Debuggable {

  public:

    VertexIdentificationList();

    virtual ~VertexIdentificationList();

    virtual std::string debug() const;

    /** 
     * the result of an identification attempt
     */
    enum IdentificationResult_E{ NOT_IDENTIFIED,
				 AMBIGUOUSLY_IDENTIFIED,
				 UNIQUELY_IDENTIFIED };

  // JU: I don't believe ListItem should have to be 
  // public but SUN CC 5.6 insists. Moved protected down
  //  protected:

    /** 
     * an entry in the list 
     */
    class ListItem : public Debuggable { 
      
    public: 

      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey);

      virtual ~ListItem(){};

      const AliasMapKey& getAliasMapKey()const;

      const DuUdMapKey& getDuUdMapKey()const;
      
      virtual std::string debug() const;
      
    private: 

      /**
       * no def
       */
      ListItem();

      /**
       * no def
       */
      ListItem(const ListItem&);

      /**
       * no def
       */
      ListItem& operator=(const ListItem&);

      const AliasMapKey& myAliasMapKey;
      const DuUdMapKey& myDuUdMapKey;
      
    };
   
   protected: 
 
    /** 
     * retrieves the alias keys found in myList
     */
    void getAliasMapKeyPList(AliasMap::AliasMapKeyPList& anAliasMapKeyPList) const;

    /**
     * defining this here requires us
     * to do dynamic casts unless we
     * want to start deriving our own list classes...
     */
    typedef std::list<ListItem*> ListItemPList;

    /**
     * this list owns all the items in it
     */
    ListItemPList myList;

  }; // end of class VertexIdentificationList  
   
} // end namespace 
                                                                  
#endif
