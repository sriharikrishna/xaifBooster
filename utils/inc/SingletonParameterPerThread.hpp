#ifndef _SINGLETONPARAMETERPERTHREAD_INCLUDE_
#define _SINGLETONPARAMETERPERTHREAD_INCLUDE_

#include <stack>

namespace xaifBooster {  

  /** 
   * \todo incomplete implementation
   */
  template <class ParameterType>
  class SingletonParameterPerThread { 

  public:

    static ParameterType& get();

    static void set(ParameterType&);

  private:

    SingletonParameterPerThread();

    ~SingletonParameterPerThread();

    SingletonParameterPerThread(const SingletonParameterPerThread&);

    SingletonParameterPerThread operator=(const SingletonParameterPerThread&);

    /**
     * static requires unique instance, 
     * hence no implied instantiation of the 
     * implementation
     * would have to be replace by a 
     * map keyed with the thread it ...
     */
    static ParameterType* ourInstance_p;

  }; // end of class SingletonParameterPerThread

} // end of namespace 

#endif
