#ifndef _CALLGRAPH_INCLUDE_
#define _CALLGRAPH_INCLUDE_

#include "xaifBooster/utils/inc/XMLPrintable.hpp"
#include "xaifBooster/boostWrapper/inc/GraphWrapper.hpp"
#include "xaifBooster/system/inc/CallGraphVertex.hpp"
#include "xaifBooster/system/inc/CallGraphEdge.hpp"
#include "xaifBooster/system/inc/Scopes.hpp"
#include "xaifBooster/system/inc/AliasActivityMap.hpp"
#include "xaifBooster/system/inc/ConceptuallyStaticInstances.hpp"

namespace xaifBooster { 

  /**
   * the CallGraph is the top level structure in the XAIF 
   * representation. It describes targets of calls (subroutines)
   * as vertices and the calls being made as edges
   */
  class CallGraph : public GraphWrapper<CallGraphVertex, CallGraphEdge> , 
		    public XMLPrintable { 
  public:
    
    /**
     * print XML hierarchy
     */
    virtual void printXMLHierarchy(std::ostream& os) const;

    /**
     * print debug information
     */
    virtual std::string debug() const ;

    /**
     * name as specified in XAIF schema
     */
    static const std::string ourXAIFName;

    /**
     * name for mySchemaInstance as specified in XAIF schema
     */
    static const std::string our_mySchemaInstance_XAIFName;

    /**
     * name for myXAIFInstance as specified in XAIF schema
     */
    static const std::string our_myXAIFInstance_XAIFName;

    /**
     * name for mySchemaLocation as specified in XAIF schema
     */
    static const std::string our_mySchemaLocation_XAIFName;

    /**
     * name for myProgramName as specified in XAIF schema
     */
    static const std::string our_myProgramName_XAIFName;

    /**
     * name for myPrefix as specified in XAIF schema
     */
    static const std::string our_myPrefix_XAIFName;

    /**
     * get the scope tree
     */
    Scopes& getScopeTree();

    /**
     * get the AliasActivityMap
     */
    AliasActivityMap& getAliasActivityMap();

    /**
     * get the AliasActivityMap
     */
    const AliasActivityMap& getAliasActivityMap() const;

    void setProgramName(const std::string& aProgramName);

    const std::string& getSchemaLocation() const;

    void resetSchemaLocation(const std::string& aNewLocation);

    const std::string& getPrefix() const; 

  private:

    /**
     * CallGraphs are supposed to be created 
     * through ConceptuallyStaticInstances::createCallGraph
     */
    CallGraph(const std::string& aSchemaInstance,
	      const std::string& anXAIFInstance,
	      const std::string& aSchemaLocation,
	      const std::string& aPrefix);

    /**
     * in order to access the ctor
     */
    friend  void ConceptuallyStaticInstances::createCallGraph(const std::string& aSchemaInstance,
							      const std::string& anXAIFInstance,
							      const std::string& aSchemaLocation,
							      const std::string& aPrefix);

    
    /** 
     * no def
     */
    CallGraph();

    /**
     * the CallGraph has a handle to the 
     * scope tree
     */
    Scopes myScopeTree;

    /**
     * the CallGraph owns the map for 
     * alias and activity information
     */
    AliasActivityMap myAliasActivityMap;

    /**
     * the schema instance 
     */
    const std::string mySchemaInstance;

    /**
     * the XAIF instance 
     */
    const std::string myXAIFInstance;

    /**
     * the schema location 
     */
    std::string mySchemaLocation;

    /**
     * an optional program name 
     */
    std::string myProgramName;

    /**
     * the prefix 
     */
    const std::string myPrefix;

  }; // end of class CallGraph

} // end of namespace xaifBooster
                                                                     
#endif
