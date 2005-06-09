#ifndef _DIMENSIONBOUNDS_INCLUDE_
#define _DIMENSIONBOUNDS_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"

namespace xaifBooster { 

  /** 
   * DimensionBounds for a single dimension of vectors
   * matrices, etc.
   */
  class DimensionBounds : public XMLPrintable {
  public:

    DimensionBounds (int aLower, 
		     int anUpper);

    ~DimensionBounds(){};

    /**
     * print XML hierarchy
     */
    void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    std::string debug() const ;

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for myLower as specified in XAIF schema
     */
    static const std::string our_myLower_XAIFName;

    /**
     * name for myUpper as specified in XAIF schema
     */
    static const std::string our_myUpper_XAIFName;

    int getLower()const;
    int getUpper()const;

  private: 

    /** 
     * no def
     */
    DimensionBounds ();

    const int myLower;

    const int myUpper;

  }; // end of class DimensionBounds
 
} // end of namespace xaifBooster
                                                                     
#endif
