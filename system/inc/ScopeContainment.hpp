#ifndef _SCOPECONTAINMENT_INCLUDE_
#define _SCOPECONTAINMENT_INCLUDE_

#include "utils/inc/XMLPrintable.hpp"
#include "utils/inc/ObjectWithId.hpp"
#include "system/inc/EdgeTraversable.hpp"

namespace xaifBooster { 

  class Scopes;

  /** 
   * ScopeContainment represents the parent-child relationship 
   * between scopes 
   */
  class ScopeContainment : public EdgeTraversable, 
			   public XMLPrintable,
			   public ObjectWithId {
  public:

    ScopeContainment (){};

    ~ScopeContainment(){};

    void printXMLHierarchy(std::ostream& os,
			   const Scopes& theScopes) const;

    void printXMLHierarchy(std::ostream& os) const {};

    std::string debug() const ;

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

    /**
     * name for source as represented in XAIF schema
     */
    static const std::string our_source_XAIFName;

    /**
     * name for target as represented in XAIF schema
     */
    static const std::string our_target_XAIFName;

  }; // end of class ScopeContainment
 
} // end of namespace xaifBooster
                                                                     
#endif
