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
   */
#define BASE_ALG_FACTORY_DECL_MACRO(AlgContaining,BaseAlgorithm) \
  class AlgContaining##AlgFactory { \
 \
  public: \
 \
    static AlgContaining##AlgFactory* instance(); \
 \
    virtual ~AlgContaining##AlgFactory(){}; \
 \
    virtual BaseAlgorithm* makeNewAlg(AlgContaining& theContaining); \
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
  } 

#define DERIVED_ALG_FACTORY_DECL_MACRO(AlgContaining,BaseAlgorithm,BaseAlgFactory) \
  class AlgContaining##AlgFactory : public BaseAlgFactory{ \
 \
  public: \
 \
    static xaifBooster :: AlgContaining##AlgFactory* instance(); \
 \
    virtual ~AlgContaining##AlgFactory(){}; \
 \
    virtual BaseAlgorithm* makeNewAlg(xaifBooster :: AlgContaining& theContaining); \
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
  } 

#define ALG_FACTORY_DEF_MACRO(AlgContaining,BaseAlgorithm,Algorithm) \
  BaseAlgorithm* AlgContaining##AlgFactory::makeNewAlg(AlgContaining& theContaining) { \
    return (new Algorithm(theContaining)); \
  } \
 \
  xaifBooster :: AlgContaining##AlgFactory* \
  AlgContaining##AlgFactory::instance() { \
    return AlgFactoryManager::instance()->get##AlgContaining##AlgFactory(); \
  } 

#endif
