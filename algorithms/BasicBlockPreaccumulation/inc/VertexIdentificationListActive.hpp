#ifndef _VERTEXIDENTIFICATIONLISTACTIVE_INCLUDE_
#define _VERTEXIDENTIFICATIONLISTACTIVE_INCLUDE_

#include "xaifBooster/system/inc/Variable.hpp"
#include "xaifBooster/algorithms/BasicBlockPreaccumulation/inc/VertexIdentificationList.hpp"

using namespace xaifBooster;

namespace xaifBoosterBasicBlockPreaccumulation { 

  class PrivateLinearizedComputationalGraphVertex;

  /**
   * this is for the identification fo active variables   
   */
  class VertexIdentificationListActive : public VertexIdentificationList {

  public:

    VertexIdentificationListActive();

    ~VertexIdentificationListActive(){};

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
       * this is valid only if myAnswer!=NOT_IDENTIFIED
       */
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;

    };

    /**
     * this is a fall back method utilizing only alias information 
     * as opposed to the overwriting methods which look at DuUd information 
     * this method should not ever be invoked for duud based lists
     * it is overwritten in the derived classes
     */
    virtual IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * in case of duud information present we do nothing
     * in case of duud information absent we have use canIdentify to 
     * check and remove all list elements may aliased to theVariable
     */
    virtual void removeIfIdentifiable(const Variable& theVariable); 

    // JU: I don't believe ListItem should have to be
    // public (as opposed to be protected) but SUN CC 5.6 insists. 
    // this may have something to do with 2 stage lookup.
    //  protected:
    
    /** 
     * an entry in the list 
     */
    class ListItem: public VertexIdentificationList::ListItem { 

    public: 
      
      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey,
	       PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p);

      virtual std::string debug() const;

      /**
       * the pointer to a vertex in the PrivateLinearizedComputationalGraph
       * always set, 
       * we don't own this pointer
       */ 
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;
      
    };
    
  }; // end of class VertexIdentificationListActive  
   
} // end namespace 
                                                                  
#endif
