#ifndef _VERTEXIDENTIFICATIONLIST_INCLUDE_
#define _VERTEXIDENTIFICATIONLIST_INCLUDE_

#include "xaifBooster/utils/inc/Debuggable.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  /**
   * this is the list against which we will check 
   * for identities with other Variable and Argument instances
   */
  class VertexIdentificationList : public Debuggable {

  public:

    VertexIdentificationList();

    virtual ~VertexIdentificationList(){};

    virtual std::string debug() const;

    /** 
     * the result of an identification attempt
     */
    enum IdentificationResult_E{ NOT_IDENTIFIED,
				 POSSIBLY_ALIASED,
				 UNIQUELY_IDENTIFIED };

  protected:

    /** 
     * an entry in the list 
     */
    class ListItem { 
      
    public: 

      ListItem();

      /** 
       * if set pointing to an entry in the AliasMap
       */
      const AliasMapKey* myAliasMapKey_p;
      
      /**
       * if set, it is the statement id of the assignment in which this 
       * vertex represents the LHS, i.e. this is usefull only in the 
       * presence of ud-chain information
       */
      std::string myStatementId;
    };
    
    /** 
     * just for convenience we keep a list of 
     * all keys in ListItem for use with 
     * AliasMap methods
     */
    AliasMap::AliasMapKeyList myAliasMapKeyList;

  }; // end of class VertexIdentificationList  
   
} // end namespace 
                                                                  
#endif
