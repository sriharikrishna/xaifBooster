#ifndef _OBJECTWITHID_INCLUDE_
#define _OBJECTWITHID_INCLUDE_

#include "utils/inc/Debuggable.hpp"
#include <string>

namespace xaifBooster { 

  /**
   * an abstract base class of classes with an id
   * that can be set once and throws an exception 
   * if we try to get an Id that has not been set
   * There is on purpose no default!
   */
  class ObjectWithId : virtual public Debuggable {
  public:

    ObjectWithId();

    virtual ~ObjectWithId() {};
    
    /**
     * Debug routine
     */    
    virtual std::string debug() const;

    /**
     * Get id if set
     */    
    const std::string& getId() const;
    
    /**
     * set Id once
     */
    void setId(const std::string& anId);

    /**
     * set Id once
     */
    void setId(int Id);
    
    /** 
     * when copying vertices from 
     * one graph into another.
     * this should be used with a lot of caution. 
     * E.g. the boost edges rely on internal descriptors 
     * but the XAIF edges rely on this Id
     */
    void overWriteId(const std::string& anId);

    /** 
     * when copying vertices from 
     * one graph into another.
     * this should be used with a lot of caution. 
     * E.g. the boost edges rely on internal descriptors 
     * but the XAIF edges rely on this Id
     */
    void overWriteId(unsigned int anId);

  private:

    /**
     * the Id
     */
    std::string myId;
    
    /**
     * prevent Id from changing once it is set
     */
    bool myIdFlag;

  };  // end  of class ObjectWithId 

} // end of namespace xaifBooster
                                                                     
#endif

