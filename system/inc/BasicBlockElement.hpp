#ifndef _BASICBLOCKELEMENT_INCLUDE_
#define _BASICBLOCKELEMENT_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/utils/inc/GenericTraverseInvoke.hpp"

#include "xaifBooster/system/inc/BasicBlockElementAlgBase.hpp"

namespace xaifBooster { 

  /**
   * base class for elements found in a Basic Block
   */
  class BasicBlockElement : public XMLPrintable,
			    public ObjectWithId,
			    public GenericTraverseInvoke {
  public:
    
    BasicBlockElement ();

    ~BasicBlockElement();

    std::string debug() const ;

    /**
     * access the algorithm
     */
    BasicBlockElementAlgBase& getBasicBlockElementAlgBase() const;

    /**
     * actual implementation for printing xaif
     * always invoked by the graph
     */
    virtual void printXMLHierarchyImpl(std::ostream& os) const {};

  protected:
    /**
     * if required then an algorithm object is allocated dynamically
     * by the factory and the pointer is set
     */
    BasicBlockElementAlgBase* myBasicBlockElementAlgBase_p;

  }; // end of class BasicBlockElement
 
} // end of namespace xaifBooster
                                                                     
#endif

