#ifndef _PRINTMANAGER_INCLUDE_
#define _PRINTMANAGER_INCLUDE_

#include <string>

namespace xaifBooster { 

  /** 
   * this class deals with indentation
   */
  class PrintManager {
  public: 

    /**
     * get an instance and increase the indent
     * to be used in a pair with releaseInstance
     */
    static PrintManager& getInstance();

    /**
     * release the instance and decrease the indent
     * to be used in a pair with getInstance
     */
    void releaseInstance();

    /** 
     * produces a string with spaces according to the 
     * current indentation
     */
    std::string indent();

    /** 
     * produces a string with spaces according to the 
     * current indentation + additionalIndent spances
     */
    std::string indent(unsigned int additionalIndent);

    static const unsigned int ourDefaultIndentation;

  private:

    static PrintManager* ourPrintManagerInstance_p;

    unsigned int my_indentation;

    PrintManager();

    /** 
     * no def
     */
    PrintManager(const PrintManager&);

    /** 
     * no def
     */
    PrintManager operator=(const PrintManager&);

    ~PrintManager(){};

  }; // end of class PrintManager

} // end of namespace xaifBooster

#endif
