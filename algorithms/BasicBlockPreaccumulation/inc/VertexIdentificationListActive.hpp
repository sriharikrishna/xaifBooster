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
       * this will be valid only if myAnswer!=NOT_IDENTIFIED
       */
      PrivateLinearizedComputationalGraphVertex* myPrivateLinearizedComputationalGraphVertex_p;

    };

    virtual IdentificationResult canIdentify(const Variable& theVariable) const;

    /** 
     * this will only work if canIdentify returns
     * NOT_IDENTIFIED 
     */
    virtual void addElement(const Variable& theVariable,
			    PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

    /** 
     * \todo JU incomplete, no handling for du info
     */
    void replaceOrAddElement(const Variable& theVariable,
			     PrivateLinearizedComputationalGraphVertex* thePrivateLinearizedComputationalGraphVertex_p);

    void VertexIdentificationListActive::removeIfIdentifiable(const Variable& theVariable); 

  protected:

    /** 
     * an entry in the list 
     */
    class ListItem: public VertexIdentificationList::ListItem { 

    public: 
      
      ListItem(const AliasMapKey& anAliasMapKey,
	       const DuUdMapKey& aDuUdMapKey,
	       PrivateLinearizedComputationalGraphVertex* aPrivateLinearizedComputationalGraphVertex_p);

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
