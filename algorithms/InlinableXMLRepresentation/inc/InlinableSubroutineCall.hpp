#ifndef _XAIFBOOSTERINLINABLEXMLREPRESENTATION_INLINABLESUBROUTINECALL_INCLUDE_
#define _XAIFBOOSTERINLINABLEXMLREPRESENTATION_INLINABLESUBROUTINECALL_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/BasicBlockElement.hpp"

using namespace xaifBooster;

namespace xaifBoosterInlinableXMLRepresentation { 

  class ArgumentSubstitute;

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

    ArgumentSubstitute& addArgumentSubstitute(unsigned int aPosition);

    virtual void traverseToChildren(GenericAction::GenericAction_E){};

  private: 
    
    /** 
     * no def 
     */ 
    InlinableSubroutineCall();

    typedef std::list<ArgumentSubstitute*> ArgumentSubstitutePList;

    ArgumentSubstitutePList myArgumentSubstitutePList;

    const std::string mySubroutineName;
    
  }; // end of class InlinableSubroutineCall
 
} // end of namespace
                                                                     
#endif
