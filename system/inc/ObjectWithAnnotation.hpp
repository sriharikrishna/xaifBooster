#ifndef _OBJECTWITHANNOTATION_INCLUDE_
#define _OBJECTWITHANNOTATION_INCLUDE_

#include "utils/inc/Debuggable.hpp"
#include <string>

namespace xaifBooster { 

  /**
   * an abstract base class of classes with an annotation
   */

  class ObjectWithAnnotation : virtual public Debuggable {
  public:

    ObjectWithAnnotation();

    virtual ~ObjectWithAnnotation() {};
    
    /**
     * Debug routine
     */    
    virtual std::string debug() const;

    /**
     * Get annotation if set
     */    
    const std::string& getAnnotation() const;
    
    /**
     * set annotation once
     */
    void setAnnotation(const std::string& anAnnotation);

    /**
     * name for member myAnnotation as represented in XAIF schema
     */
    static const std::string our_myAnnotation_XAIFName;

  private:

    /**
     * the annotation
     */
    std::string myAnnotation;
    
    /**
     * prevent annotation from changing once it is set
     */
    bool myAnnotationFlag;

  };  // end  of class ObjectWithAnnotation 

} // end of namespace xaifBooster
                                                                     
#endif

