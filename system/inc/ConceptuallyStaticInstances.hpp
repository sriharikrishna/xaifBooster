#ifndef _CONCEPTUALLYSTATICINSTANCES_INCLUDE_
#define _CONCEPTUALLYSTATICINSTANCES_INCLUDE_

#include "xaifBooster/system/inc/InlinableIntrinsicsCatalogue.hpp"
#include "xaifBooster/system/inc/PrintVersion.hpp"

namespace xaifBooster { 

  class CallGraph;

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

    CallGraph& getCallGraph();

    InlinableIntrinsicsCatalogue& getInlinableIntrinsicsCatalogue();

    void createCallGraph(const std::string& aSchemaInstance,
			 const std::string& anXAIFInstance,
			 const std::string& aSchemaLocation,
			 const std::string& aPrefix);

    /**
     * instantiated as "VIRTUAL" meaning 
     * printXMLHierarchy uses the normal virtual 
     * invocation mechanism
     * modifiable through setPrintVersion
     */
    PrintVersion::PrintVersion_E getPrintVersion() const;

    /**
     * set PrintVersion to either 
     * VIRTUAL or SYSTEM_ONLY
     */
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
    
    /**
     * this class owns the CallGraph
     * it is created with createCallGraph
     * and deleted in the dtor
     */
    CallGraph* myCallGraph_p;

    InlinableIntrinsicsCatalogue myInlinableIntrinsicsCatalogue;

    /**
     * initialized to 
     * VIRTUAL 
     */
    PrintVersion::PrintVersion_E myPrintVersion;

  }; // end of ConceptuallyStaticInstances
  
} 

#endif 
