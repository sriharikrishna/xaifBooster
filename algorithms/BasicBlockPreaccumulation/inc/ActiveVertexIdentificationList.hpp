#ifndef _ACTIVEVERTEXIDENTIFICATIONLIST_INCLUDE_
#define _ACTIVEVERTEXIDENTIFICATIONLIST_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is for the identification fo active variables   
   */
  class ActiveVertexIdentificationList : public VertexIdentificationList {

  public:

    ActiveVertexIdentificationList();

    ~ActiveVertexIdentificationList(){};

    virtual std::string debug() const;

    class IdentificationResult {

    public: 

      IdentificationResult(IdentificationResult_E,
			   PrivateLinearizedComputationalGraphVertex*);

      ~IdentificationResult(){};

      IdentificationResult_E getAnswer() const;

      /**
       *this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      const PrivateLinearizedComputationalGraphVertex* getVertexP() const;

      /**
       *this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      PrivateLinearizedComputationalGraphVertex* getVertexP();

    private:

      /** 
       * no def 
       */
      IdentificationResult();

      IdentificationResult_E myAnswer;

      /**
       * this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;

    };

    /**
     * \todo JU incomplete, no handling for du info
     */
    IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     * \todo JU incomplete, no handling for du info
     */
    void addElement(const Variable& theVariable,
		    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

    /** 
     * \todo JU incomplete, no handling for du info
     */
    void replaceOrAddElement(const Variable& theVariable,
			     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

    void ActiveVertexIdentificationList::removeIfAliased(const Variable& theVariable); 

  private:

    /** 
     * an entry in the list 
     */
    class ListItem: public VertexIdentificationList::ListItem { 

    public: 
      
      ListItem();

      /**
       * the pointer to a vertex in the PrivateLinearizedComputationalGraph
       * always set
       */ 
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;
      
    };
    
    typedef std::list<ListItem> ListType;

    ListType myList;

  }; // end of class ActiveVertexIdentificationList  
   
} // end namespace 
                                                                  
#endif
