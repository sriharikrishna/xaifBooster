#ifndef _ALGFACTORY_INCLUDE_
#define _ALGFACTORY_INCLUDE_

#include "xaifBooster/system/inc/AlgFactoryManager.hpp"

  /** 
   * factory interface for an algorithm class 
   * associated with Containing
   * the algorithm implementer has to derive the 
   * algorithm class from AlgBase
   * and also provide an implemetation of 
   * AlgFactory that instantiates the
   * derived algorithm class.
   * in system/src/srcDummyFactories
   * we provide a dummy implementation
   * we cannot use a template here 
   * since we want to be able to switch factory 
   * implementations while maintaining the same 
   * interface. Therefore the template parameters
   * change and method invocations run into problems
   * due to mismatched template specializations.
   * Base classes with virtual functions cannot solve the problem since
   * the template parameter is in the signature. 
   * Hence the macro :-( 
   * NAMING CONVENTION: AlgContaing = class for which me declare the algorithm
   *                  : <AlgContaining>AlgBase = base algorithm class
   */
#define BASE_ALG_FACTORY_DECL_MACRO(AlgContaining) \
namespace xaifBooster { \
 \
  class AlgContaining; \
 \
  class AlgContaining##AlgFactory : public Debuggable { \
 \
  public: \
 \
    static AlgContaining##AlgFactory* instance(); \
 \
    virtual ~AlgContaining##AlgFactory(){}; \
 \
    virtual AlgContaining##AlgBase* makeNewAlg(AlgContaining& theContaining); \
 \
    virtual std::string debug() const; \
 \
  protected: \
 \
    friend class AlgFactoryManager; \
 \
    AlgContaining##AlgFactory(){}; \
 \
  private: \
 \
    AlgContaining##AlgFactory(const AlgContaining##AlgFactory&); \
 \
    AlgContaining##AlgFactory operator=(const AlgContaining##AlgFactory&); \
 \
  }; \
}

  /** 
   * NAMING CONVENTION: AlgContaining = as above, the class for which we declare the algorithm
   *                    ParentAlgFactory = the parent class in the inheritance hierarchy with(!) its namespace
   *                    OurNameSpace  = our own namespace
   *                    This class is named <AlgContaining>AlgFactory
   */
#define DERIVED_ALG_FACTORY_DECL_MACRO(AlgContaining,ParentAlgFactory,OurNameSpace) \
using namespace xaifBooster; \
 \
namespace OurNameSpace { \
 \
  class AlgContaining##AlgFactory : public ParentAlgFactory{ \
 \
  public: \
 \
    static xaifBooster :: AlgContaining##AlgFactory* instance(); \
 \
    virtual ~AlgContaining##AlgFactory(){}; \
 \
    virtual AlgContaining##AlgBase* makeNewAlg(xaifBooster :: AlgContaining& theContaining); \
 \
    virtual std::string debug() const; \
 \
  protected: \
 \
    friend class AlgFactoryManager; \
 \
    AlgContaining##AlgFactory(){}; \
 \
  private: \
 \
    AlgContaining##AlgFactory(const AlgContaining##AlgFactory&); \
 \
    AlgContaining##AlgFactory operator=(const AlgContaining##AlgFactory&); \
 \
  }; \
}  

  /** 
   * NAMING CONVENTION: AlgContaining = as above, the class for which we declare the algorithm
   *                    This class is named <AlgContaining>AlgFactory
   *                    The algorithm class is assumed to be named <AlgContaining>AlgBase
   */
#define BASE_ALG_FACTORY_DEF_MACRO(AlgContaining) \
namespace xaifBooster { \
 \
  AlgContaining##AlgBase* AlgContaining##AlgFactory::makeNewAlg(AlgContaining& theContaining) { \
    return (new AlgContaining##AlgBase(theContaining)); \
  } \
 \
  xaifBooster :: AlgContaining##AlgFactory* \
  AlgContaining##AlgFactory::instance() { \
    return AlgFactoryManager::instance()->get##AlgContaining##AlgFactory(); \
  } \
  std::string AlgContaining##AlgFactory::debug() const {  \
    std::ostringstream out; \
    out << "xaifBooster::" \
        << #AlgContaining \
        << "AlgFactory[" \
         << this \
	<< "]" << std::ends; \
    return out.str(); \
  } \
}

  /** 
   * NAMING CONVENTION: AlgContaining = as above, the class for which we declare the algorithm
   *                    OurNameSpace  = our own namespace  
   *                    This class is named <AlgContaining>AlgFactory
   *                    The algorithm class is assumed to be named <AlgContaining>Alg
   */
#define DERIVED_ALG_FACTORY_DEF_MACRO(AlgContaining,OurNameSpace) \
namespace OurNameSpace { \
 \
  AlgContaining##AlgBase* AlgContaining##AlgFactory::makeNewAlg(AlgContaining& theContaining) { \
    return (new AlgContaining##Alg(theContaining)); \
  } \
 \
  xaifBooster :: AlgContaining##AlgFactory* \
  AlgContaining##AlgFactory::instance() { \
    return AlgFactoryManager::instance()->get##AlgContaining##AlgFactory(); \
  } \
  std::string AlgContaining##AlgFactory::debug() const {  \
    std::ostringstream out; \
    out << #OurNameSpace \
        << "::" \
        << #AlgContaining \
        << "AlgFactory[" \
         << this \
	<< "]" << std::ends; \
    return out.str(); \
  } \
}

#endif
