#ifndef _XAIFBOOSTERCODEREPLACEMENT_CONCEPTUALLYSTATICINSTANCES_INCLUDE_
#define _XAIFBOOSTERCODEREPLACEMENT_CONCEPTUALLYSTATICINSTANCES_INCLUDE_

#include "xaifBooster/algoritms/CodeReplacement/inc/PrintVersion.hpp"

namespace xaifBoosterCodeReplacement { 

  /** 
   * class to contain 'globally static'
   * instances. This can later be extended 
   * to instances that are threadspecific 
   * if we decide to opt for a multithreaded 
   * implementation
   */
  class ConceptuallyStaticInstances { 
 
  public : 

    static ConceptuallyStaticInstances* instance();

    ~ConceptuallyStaticInstances();

    PrintVersion::PrintVersion_E getPrintVersion() const;

    void setPrintVersion(PrintVersion::PrintVersion_E aPrintVersion);

  private: 
    
    ConceptuallyStaticInstances();
    
    /** 
     * no def
     */
    ConceptuallyStaticInstances(const ConceptuallyStaticInstances&);

    /** 
     * no def
     */
    ConceptuallyStaticInstances operator=(const ConceptuallyStaticInstances&);

    static ConceptuallyStaticInstances* ourInstance_p;
    
    PrintVersion::PrintVersion_E myPrintVersion

  }; // end of ConceptuallyStaticInstances
  
} 

#endif 
