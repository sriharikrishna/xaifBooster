#ifndef _ALGFACTORY_INCLUDE_
#define _ALGFACTORY_INCLUDE_

namespace xaifBooster {  

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
#define ALG_FACTORY_DECL_MACRO(AlgContaining,BaseAlgorithm,Algorithm) \
  class AlgContaining##AlgFactory { \
 \
  public: \
 \
    static AlgContaining##AlgFactory* instance(); \
 \
    ~AlgContaining##AlgFactory(){}; \
 \
    BaseAlgorithm* makeNewAlg(AlgContaining& theContaining); \
 \
  private: \
 \
    AlgContaining##AlgFactory(){}; \
 \
    AlgContaining##AlgFactory(const AlgContaining##AlgFactory&); \
 \
    AlgContaining##AlgFactory operator=(const AlgContaining##AlgFactory&); \
 \
    static AlgContaining##AlgFactory* ourInstance_p; \
 \
  } 



#define ALG_FACTORY_DEF_MACRO(AlgContaining,BaseAlgorithm,Algorithm) \
  AlgContaining##AlgFactory* AlgContaining##AlgFactory::ourInstance_p=0; \
 \
  BaseAlgorithm* AlgContaining##AlgFactory::makeNewAlg(AlgContaining& theContaining) { \
    return (new Algorithm(theContaining)); \
  } \
 \
  AlgContaining##AlgFactory* \
  AlgContaining##AlgFactory::instance() { \
    if (!ourInstance_p) \
      ourInstance_p=new AlgContaining##AlgFactory(); \
    return ourInstance_p; \
  } 


} // end of namespace 

#endif
