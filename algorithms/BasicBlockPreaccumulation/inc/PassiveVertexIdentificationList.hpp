#ifndef _PASSIVEVERTEXIDENTIFICATIONLIST_INCLUDE_
#define _PASSIVEVERTEXIDENTIFICATIONLIST_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is for the identification fo Passive variables   
   */
  class PassiveVertexIdentificationList : public VertexIdentificationList {

  public:

    PassiveVertexIdentificationList();

    ~PassiveVertexIdentificationList(){};

    virtual std::string debug() const;

    /**
     * \todo JU incomplete, no handling for du info
     */
    IdentificationResult_E canIdentify(const Variable& theVariable) const;

    /** 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     * \todo JU incomplete, no handling for du info
     */
    void addElement(const Variable& theVariable);

    /** 
     * \todo JU incomplete, no handling for du info
     */
    void replaceOrAddElement(const Variable& theVariable);

    void PassiveVertexIdentificationList::removeIfAliased(const Variable& theVariable); 

  private:

    typedef std::list<ListItem> ListType;

    ListType myList;

  }; // end of class PassiveVertexIdentificationList  
   
} // end namespace 
                                                                  
#endif
