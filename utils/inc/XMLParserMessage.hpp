#ifndef _XMLPARSERMESSAGE_INCLUDE_
#define _XMLPARSERMESSAGE_INCLUDE_

#include "xercesc/util/XercesDefs.hpp"
#include <iostream>

namespace xaifBooster { 


  /**
   * helper class to transcode error messages according 
   * to the local codepage
   */
  class XMLParserMessage {
    
  public :
    
    /**
     * XMLCh is defined by xercesc but for some reason 
     * not in the xercesc namespace
     */
    XMLParserMessage(const XMLCh * const toTranscode);

    ~XMLParserMessage(); 
    
    const char* const toString() const;

    friend std::ostream& operator<<(std::ostream& os, 
				    const XMLParserMessage& theMessage);

  private :

    /**
     * the pointer to hold the transcoded reresentation 
     */
    char* fLocalForm;

  }; // end of class 

} // end of namespace

#endif

