#ifndef _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENT_INCLUDE_
#define _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENT_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/system/inc/ControlFlowGraphBase.hpp"

using namespace xaifBooster;

namespace xaifBoosterCodeReplacement { 

  class Replacement : public XMLPrintable {
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

    /** 
     * use this if we are building 
     * a new one in this instance rather than
     * referring to another ControlFlowGraphBase 
     * which lives somewhere else  
     */
    ControlFlowGraphBase& makeNewControlFlowGraphBase();

    /** 
     * use this if we are referring to another ControlFlowGraphBase 
     * which lives somewhere else rather than building 
     * a new one in this instance
     */
    void setControlFlowGraphBase(const ControlFlowGraphBase& theOtherControlFlowGraphBase); 

    const ControlFlowGraphBase& getControlFlowGraphBase() const; 

  private: 

    /** 
     * no def
     */ 
    Replacement();
    
    const unsigned int myPlaceHolder;

    /**
     * indicator if we own the ControlFlowGraphBase or not
     */
    bool myControlFlowGraphBaseOwnerFlag;

    const ControlFlowGraphBase* myControlFlowGraphBase_p;

  }; // end of class Replacement
 
} // end of namespace xaifBooster
                                                                     
#endif
