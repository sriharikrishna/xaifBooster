#ifndef _INLINABLESUBROUTINECALL_INCLUDE_
#define _INLINABLESUBROUTINECALL_INCLUDE_

#include <list>
#include "xaifBooster/utils/inc/ObjectWithId.hpp"
#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  class ArgumentSubstitute;

  class InlinableSubroutineCall : public XMLPrintable, public ObjectWithId {
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

  private: 
    
    /** 
     * no def 
     */ 
    InlinableSubroutineCall();

    typedef std::list<ArgumentSubstitute*> ArgumentSubstitutePList;

    ArgumentSubstitutePList myArgumentSubstitutePList;

    const std::string mySubroutineName;
    
  }; // end of class InlinableSubroutineCall
 
} // end of namespace xaifBooster
                                                                     
#endif
