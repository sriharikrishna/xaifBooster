#ifndef _ALIASMAPKEY_INCLUDE_
#define _ALIASMAPKEY_INCLUDE_

#include "xaifBooster/utils/inc/Debuggable.hpp"

namespace xaifBooster { 

  /** 
   * class to represent generic key 
   * into AliasMap also covering 
   * special cases which don't have an instance
   * in AliasMap
   */
  class AliasMapKey : public Debuggable { 

  public:
    
    AliasMapKey();

    ~AliasMapKey() {};

    /** 
     * indicate there is a regular key
     * or indicate there is no information, i.e. key  is 0
     */
    void setReference(unsigned int key);

    /** 
     * use for internally created temporaries
     * which will never be aliased
     */
    void setTemporary();

    enum AliasMapKey_E {NOT_SET,   // not initialized
			SET,       // has regular key
			NO_INFO,   // has 0 key
			TEMP_VAR}; // temporary
    /**
     * get the key, if no regular key throws exception
     */
    unsigned int getKey() const;

    /**
     * return the kind of key
     */
    AliasMapKey_E getKind() const;

    std::string debug() const ;

  private:

    /**
     * key into AliasMap
     * initialized to invalid value 0
     */
    unsigned int myKey;

    /**
     * key kind initialized to NOT_SET
     */
    AliasMapKey_E myKind;

  }; // end of class AliasMapKey

} // end of namespace xaifBooster
                                                                     
#endif
