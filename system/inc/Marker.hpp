#ifndef _MARKER_INCLUDE_
#define _MARKER_INCLUDE_

#include "system/inc/BasicBlockElement.hpp"
#include <string>

namespace xaifBooster { 

  /**
   * nop statement with an annotation
   */

  class Marker : public BasicBlockElement {
  public:

    Marker();

    virtual ~Marker() {};
    
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

    virtual void printXMLHierarchy(std::ostream& os) const;

    /**
     * Actual implementation for printing XAIF
     * of this expression
     */
    void printXMLHierarchyImpl(std::ostream& os) const;

    virtual void traverseToChildren(const GenericAction::GenericAction_E anAction_c) {};

    /** 
     * name for this class as represented in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myId_XAIFName;

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

  };  // end  of class Marker 

} // end of namespace xaifBooster
                                                                     
#endif

