#include "xaifBooster/utils/inc/XMLParserMessage.hpp"
#include "xercesc/util/XMLString.hpp"

namespace xaifBooster { 

  XMLParserMessage::XMLParserMessage(const XMLCh* const toTranscode) {
    // Call the private transcoding method
    fLocalForm = xercesc::XMLString::transcode(toTranscode);
  }

  XMLParserMessage::~XMLParserMessage() {
    xercesc::XMLString::release(&fLocalForm);
  }

  const char* const 
  XMLParserMessage::toString() const {
    return fLocalForm;
  }

  std::ostream& operator<<(std::ostream& os,
			   const XMLParserMessage& theMessage) {
    os << theMessage.fLocalForm;
    return os;
  }

} // end of namespace 
