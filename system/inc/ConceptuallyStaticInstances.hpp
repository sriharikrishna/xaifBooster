#ifndef _CONCEPTUALLYSTATICINSTANCES_INCLUDE_
#define _CONCEPTUALLYSTATICINSTANCES_INCLUDE_

#include "system/inc/InlinableIntrinsicsCatalogue.hpp"

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

  }; // end of ConceptuallyStaticInstances
  
} 

#endif 
