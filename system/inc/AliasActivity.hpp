#ifndef _ALIASACTIVITY_INCLUDE_
#define _ALIASACTIVITY_INCLUDE_

#include "xaifBooster/system/inc/AliasSet.hpp"
#include "xaifBooster/utils/inc/XMLPrintable.hpp"


namespace xaifBooster{ 

  /**
   * class to hold alias sets and activity 
   * information referred to by a BaseVariableReference
   * through AliasActivityMap
   * For the time being we assume that there is not 
   * a big difference in the quality of the alias and the 
   * activity information, i.e. the granularity is about 
   * the same allowing them to be store with the same key.
   */
  class AliasActivity : public XMLPrintable { 
    
  public: 
  
    AliasActivity(unsigned int theKey) : 
      myActiveFlag(true),
      myKey(theKey) {}; 
 
    ~AliasActivity(){};

    std::string debug() const ; 

    void printXMLHierarchy(std::ostream& os) const; 

    const AliasSet& getAliasSet() const;

    AliasSet& getAliasSet();

    bool getActivity() const;

    /**
     * default is active
     */
    void setPassive();

    /**
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for member myKey as represented in XAIF schema
     */
    static const std::string our_myKey_XAIFName;

    /**
     * name for member myActiveFlag as represented in XAIF schema
     */
    static const std::string our_myActiveFlag_XAIFName;

  private:

    /** 
     * set of aliases for this BaseVariableReference
     */
    AliasSet myAliasSet;

    /**
     * default is active (conservative)
     */
    bool myActiveFlag;

    /**
     * keys start with 1
     * in XAIF schema the default is 0 
     * but does not have an instance in 
     * AliasActivityMap
     */
    const unsigned int myKey;

    /**
     * no def
     */
    AliasActivity();

    /**
     * no def
     */
    AliasActivity(const AliasActivity&);

    /**
     * no def
     */
    AliasActivity operator=(const AliasActivity&);
    
  }; // end of class AliasActivity

} // end of namespace xaifBooster

#endif
