#ifndef _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENTLIST_INCLUDE_
#define _XAIFBOOSTERCODEREPLACEMENT_REPLACEMENTLIST_INCLUDE_

#include <list>
#include "xaifBooster/system/inc/ControlFlowGraphCommonAttributes.hpp"

using namespace xaifBooster;

namespace xaifBoosterCodeReplacement { 

  class Replacement;

  class ReplacementList : public ControlFlowGraphCommonAttributes {
  public:

    ReplacementList(const Symbol& theSymbol,
		    const Scope& theScope,
		    const std::string& aTemplateName);

    ~ReplacementList();

    void printXMLHierarchy(std::ostream& os) const;

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;
    
    /** 
     * name for myTemplateName attribute in XAIF schema
     */
    static const std::string our_myTemplateName_XAIFName;

    Replacement& addReplacement(unsigned int aPlaceHolder);

    const std::string& getTemplateName() const;

  private: 
    
    /** 
     * no def 
     */ 
    ReplacementList();

    typedef std::list<Replacement*> ReplacementPList;

    ReplacementPList myReplacementPList;

    std::string myTemplateName;

  }; // end of class ReplacementList
 
} // end of namespace xaifBoosterCodeReplacement
                                                                     
#endif
