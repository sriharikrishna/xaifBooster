#include "xaifBooster/utils/inc/Thread.hpp"

#ifdef POSIX_THREADS
#include <pthread.h>
#endif

namespace xaifBooster { 
  
  unsigned int Thread::threadId() { 
#ifdef POSIX_THREADS
    return pthread_self();
#else
    return 0;
#endif   
  } 
  
} // end of namespace xaifBooster

