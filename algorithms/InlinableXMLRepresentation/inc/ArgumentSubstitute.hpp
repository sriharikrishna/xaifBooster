#ifndef _ARGUMENTSUBSTITUTE_INCLUDE_
#define _ARGUMENTSUBSTITUTE_INCLUDE_

#include <list>

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

#include "xaifBooster/system/inc/Variable.hpp"

namespace xaifBooster { 

  class ArgumentSubstitute : public XMLPrintable {
  public:

    ArgumentSubstitute (unsigned aPosition);

    ~ArgumentSubstitute ();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for myPosition member as represented in XAIF schema
     */
    static const std::string our_myPosition_XAIFName;

    Variable& getVariable();

    const unsigned int getPosition() const; 

  private: 

    /** 
     * no def
     */ 
    ArgumentSubstitute();
    
    const unsigned int myPosition; 

    Variable myVariable; 
    
  }; // end of class ArgumentSubstitute
 
} // end of namespace xaifBooster
                                                                     
#endif
