#ifndef _VERTEXIDENTIFICATIONLIST_INCLUDE_
#define _VERTEXIDENTIFICATIONLIST_INCLUDE_

#include "xaifBooster/utils/inc/Debuggable.hpp"
#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/system/inc/AliasMap.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is the list against which we will check 
   * for identities with other Variable and Argument instances
   */
  class VertexIdentificationList : public Debuggable {

  public:

    VertexIdentificationList();

    ~VertexIdentificationList(){};

    virtual std::string debug() const;

    /** 
     * the result of an identification attempt
     */
    enum IdentificationResult_E{ NOT_IDENTIFIED,
				 POSSIBLY_ALIASED,
				 UNIQUELY_IDENTIFIED };

    class IdentificationResult {

    public: 

      IdentificationResult(IdentificationResult_E,
			   const PrivateLinearizedComputationalGraphVertex*);

      ~IdentificationResult(){};

      IdentificationResult_E getAnswer() const;

      /**
       *this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      const PrivateLinearizedComputationalGraphVertex* getVertexP() const;

    private:

      /** 
       * no def 
       */
      IdentificationResult();

      IdentificationResult_E myAnswer;

      /**
       * this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      const PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;

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
		    const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

    /** 
     * \todo JU incomplete, no handling for du info
     */
    void replaceOrAddElement(const Variable& theVariable,
			     const PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

    /** 
     * \todo JU incomplete, no handling for du info
     */
    void removeIfAliased(const Variable& theVariable);
    
  private:

    /** 
     * an entry in the list 
     */
    struct ListItem { 
      
      ListItem();

      /**
       * the pointer to a vertex in the PrivateLinearizedComputationalGraph
       * always set
       */ 
      const PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;
      
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
    
    typedef std::list<ListItem> ListType;

    ListType myList;

    /** 
     * just for convenience we keep a list of 
     * all keys in ListItem for use with 
     * AliasMap methods
     */
    AliasMap::AliasMapKeyList myAliasMapKeyList;

  }; // end of class VertexIdentificationList  
   
} // end namespace 
                                                                  
#endif
