#ifndef _DUUD_INCLUDE_
#define _DUUD_INCLUDE_

#include <string>

namespace xaifBooster { 

  /** 
   * this class is supposed to represent 
   * def-use and use-def information. 
   * The format is not finalized yet
   * \todo fix this format
   */

  class DuUd  {
  public:

    DuUd();

    ~DuUd() {};

    /**
     * name for inherited member myId as represented in XAIF schema
     */
    static const std::string our_myDuUdReference_XAIFName;

    void setReference(int aReference); 

    int getReference() const ; 

  private:
    
    /**
     * this is preliminary
     */
    int myDuUdReference;
    

  };
 
} // end of namespace xaifBooster
                                                                     
#endif
