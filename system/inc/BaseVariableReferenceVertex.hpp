#ifndef _BASEVARIABLEREFERENCEVERTEX_INCLUDE_
#define _BASEVARIABLEREFERENCEVERTEX_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include "utils/inc/ObjectWithId.hpp"
#include "system/inc/VertexTraversable.hpp"

namespace xaifBooster { 

  class BaseVariableReferenceVertex : public VertexTraversable, 
				      public XMLPrintable,
				      public ObjectWithId {
  public:
    
    BaseVariableReferenceVertex (){};
    
    ~BaseVariableReferenceVertex(){};

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    virtual std::string equivalenceSignature() const =0;

    virtual BaseVariableReferenceVertex& createCopyOfMyself() const =0;

    virtual bool isSymbol() const;

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
