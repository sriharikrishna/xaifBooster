#ifndef _ARRAYACCESS_INCLUDE_
#define _ARRAYACCESS_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/BaseVariableReferenceVertex.hpp"
#include "xaifBooster/system/inc/Expression.hpp"

namespace xaifBooster { 

  /**
   * class to identify an array access operation, 
   * e.g. [] operator in C++ that is represented 
   * as a graph defined as BaseVariableRerefence
   * used on LHS of assignments and in expressions
   */
  class ArrayAccess : public BaseVariableReferenceVertex {
  public:

    ArrayAccess (){};

    ~ArrayAccess(){};

    void printXMLHierarchy(std::ostream& os) const;

    void printXMLHierarchyIndex(std::ostream& os,
				const Expression& theIndex) const;

    /** 
     * \todo implementation incomplete
     */
    std::string debug() const { return std::string("ArrayAccess");} ;

    /** 
     * \todo implementation incomplete
     */
    virtual std::string equivalenceSignature() const;

    static const std::string ourXAIFName;
    static const std::string our_myIndex_XAIFName;
    static const std::string our_myId_XAIFName;

    virtual BaseVariableReferenceVertex& createCopyOfMyself() const ;

    typedef std::list<Expression*> IndexListType;

    /**
     * access index list
     */
    const IndexListType& getIndexList() const ;
    
    /** 
     * add a new expression to the list 
     */
    Expression& addIndex();

  private:
    
    /**
     * no def
     */
    ArrayAccess(const ArrayAccess&);

    /**
     * no def
     */
    ArrayAccess operator=(const ArrayAccess&);

    /**
     * Array indeces
     */
    IndexListType myIndexList;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
