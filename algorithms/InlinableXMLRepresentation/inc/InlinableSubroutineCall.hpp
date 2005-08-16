#ifndef _XAIFBOOSTERINLINABLEXMLREPRESENTATION_INLINABLESUBROUTINECALL_INCLUDE_
#define _XAIFBOOSTERINLINABLEXMLREPRESENTATION_INLINABLESUBROUTINECALL_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/BasicBlockElement.hpp"
#include "xaifBooster/system/inc/SubroutineCall.hpp"

using namespace xaifBooster;

namespace xaifBoosterInlinableXMLRepresentation { 

  class InlinableSubroutineCall : public BasicBlockElement {
  public:

    InlinableSubroutineCall(const std::string& aSubroutineName);

    ~InlinableSubroutineCall();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    static const std::string our_mySubroutineName_XAIFName;

    static const std::string our_myId_XAIFName;

    ConcreteArgument& addConcreteArgument(unsigned int aPosition);

    virtual void traverseToChildren(GenericAction::GenericAction_E){};

    const SubroutineCall::ConcreteArgumentPList&  getArgumentList() const;

    const std::string& getSubroutineName() const;
    
  private: 
    
    /** 
     * no def 
     */ 
    InlinableSubroutineCall();

    /** 
     * the list of concrete arguments for this call
     * these are owned by this instance and 
     * will be deleted in the dtor 
     */
    SubroutineCall::ConcreteArgumentPList myConcreteArgumentPList;

    const std::string mySubroutineName;
    
  }; // end of class InlinableSubroutineCall
 
} // end of namespace
                                                                     
#endif
