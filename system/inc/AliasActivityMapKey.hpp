#ifndef _ALIASACTIVITYMAPKEY_INCLUDE_
#define _ALIASACTIVITYMAPKEY_INCLUDE_

namespace xaifBooster { 

  /** 
   * class to represent generic key 
   * into AliasActivityMap also covering 
   * special cases which don't have an instance
   * in AliasActivityMap
   */
  class AliasActivityMapKey { 

  public:
    
    AliasActivityMapKey();

    ~AliasActivityMapKey() {};

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

    enum AliasActivityMapKey_E {NOT_SET,   // not initialized
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
    AliasActivityMapKey_E getKind() const;

  private:

    /**
     * key into AliasActivityMap
     * initialized to invalid value 0
     */
    unsigned int myKey;

    /**
     * key kind initialized to NOT_SET
     */
    AliasActivityMapKey_E myKind;
    
  }; // end of class AliasActivityMapKey

} // end of namespace xaifBooster
                                                                     
#endif
