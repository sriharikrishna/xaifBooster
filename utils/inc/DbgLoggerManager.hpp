#ifndef _DBGLOGGERMANAGER_INCLUDE_
#define _DBGLOGGERMANAGER_INCLUDE_

#include <string>
#include <fstream>
#include "xaifBooster/utils/inc/DbgLogger.hpp"
#include "xaifBooster/utils/inc/DbgGroup.hpp"
#include "xaifBooster/utils/inc/Mutex.hpp"


namespace xaifBooster { 

  /**
   * use of preprocessor defined __FILE__ and __LINE__ requires 
   * use of a macro. We have to define a strange name 
   * for local variables to avoid accidental name matching - 
   * the niceties of macros!
   * Note the enclosing {} allowing for 
   * if (...) 
   *   DBG_MACRO(...);
   * without extra brackets but the compiler will complain 
   * about 
   * if (...) { 
   *   DBG_MACRO(...);
   * } 
   * because it doesn't know what to do with the extra ';' in the end;
   * make your choice.
   * the first argument is the DbgGroup the second an argument to an 
   * ostream << operator.
   */
#ifndef DBG_MACRO  
#define DBG_MACRO(Group,StreamArgs) \
  if (DbgLoggerManager::instance()->isSelected((Group))) { \
    std::ostringstream aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy; \
    aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy << StreamArgs << std::ends; \
    DbgLoggerManager::instance()->logDebug(__FILE__,__LINE__,(Group),aLoNgAnDwEiRdLoCaLnAmeFoRtHiSmAcRoOnLy); \
  }
#else
#error macro name for DBG_MACRO already in use
#endif

  /** 
   * the singleton class for 
   * logging debug information
   */
  class DbgLoggerManager { 

  public: 

    static DbgLoggerManager* instance();

    /** 
     * set the selection essentially as 
     * bitwise AND between the respective 
     * values from DbgGroup
     * or of course their sum.
     */
    void setSelection(unsigned int aSelection_c); 

    /** 
     * the name for a file. 
     * an empty string prompts use of std::cout
     */
    void setFile(const std::string& aFileName_c);

    unsigned int getSelection() const ; 

    std::string getFileName() const ;

    /** 
     * used in the DBG_MACRO, see there
     */
    void logDebug(const std::string aFileName_c,
		  int aLineNumber_c,
		  const DbgGroup::DbgGroup_E aGroup_c,
		  std::ostringstream& aMessage_r);

    /** 
     * is a certain category currently selected? 
     */
    bool isSelected(const DbgGroup::DbgGroup_E aGroup_c) const; 

  private: 

    DbgLoggerManager();

    virtual ~DbgLoggerManager();

    static DbgLoggerManager* ourInstance_p;

    /**
     * no def
     */
    DbgLoggerManager(const DbgLoggerManager&);

    /**
     * no def
     */
    DbgLoggerManager& operator=(const DbgLoggerManager&);

    /**
     * the mutex to protect the instance
     */
    static Mutex ourInstanceMutex;

    /**
     * the pointer to the DbgLogger
     */
    DbgLogger* myLogger_p;

    /** 
     * the holder of the file stream
     */
    std::ofstream myOutFileStream;

    /**
     * the file name
     * may be empty
     */
    std::string myDebugOutPutFileName; 

    /**
     * the current selection
     * ERROR=0 is always on
     */
    unsigned int mySelector;

    /**
     * previous timer seconds
     */
    long myPreviousS;

    /**
     * previous timer micro seconds
     */
    long myPreviousMS;

  }; // end of class DbgLoggerManager

}

#endif
