#ifndef _THREAD_INCLUDE_
#define _THREAD_INCLUDE_

namespace xaifBooster { 

  /** 
   * our own wrapper class for the 
   * the different thread libraries
   * for now provides only an identifier
   */
  class Thread { 

  public: 

    /**
     * unless we have threads
     * this just returns 0
     */
    static unsigned int threadId();

  }; // end of class Thread 

}

#endif
