#ifndef _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENT_INCLUDE_
#define _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENT_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphCommonAttributes.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"

using namespace xaifBooster;

namespace xaifBoosterCodeReplacement { 

  class Replacement : public XMLPrintable,
		      public ControlFlowGraphBase {
  public:

    Replacement (unsigned int aPlaceHolder);

    ~Replacement ();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for myPlaceHolder member as represented in XAIF schema
     */
    static const std::string our_myPlaceHolder_XAIFName;

    const unsigned int getPlaceHolder() const; 

  private: 

    /** 
     * no def
     */ 
    Replacement();
    
    const unsigned int myPlaceHolder;

  }; // end of class Replacement
 
} // end of namespace xaifBooster
                                                                     
#endif
