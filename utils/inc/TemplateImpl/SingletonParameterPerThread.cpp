#ifndef  _SINGLETONPARAMETERPERTHREAD_INCLUDE_
#include "xaifBooster/utils/inc/SingletonParameterPerThread.hpp"
#endif

#include "xaifBooster/utils/inc/LogicException.hpp"

namespace xaifBooster {  

  /**
   * static requires unique instance, 
   * hence no implied instantiation of the 
   * implementation
   */
  template <class ParameterType> 
  ParameterType* SingletonParameterPerThread<ParameterType>::ourInstance_p=0;

  template <class ParameterType>
  ParameterType& 
  SingletonParameterPerThread<ParameterType>::get() { 
    if (!ourInstance_p)
      THROW_LOGICEXCEPTION_MACRO("SingletonParameterPerThread<ParameterType>::get: not set");
    return *ourInstance_p;
  } 

  template <class ParameterType>
  void
  SingletonParameterPerThread<ParameterType>::set(ParameterType& theParameter) { 
    ourInstance_p=&theParameter;
  }

}
