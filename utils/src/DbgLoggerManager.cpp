#include "xaifBooster/utils/inc/DbgLoggerManager.hpp"
#include "xaifBooster/utils/inc/LogicException.hpp"
#include "xaifBooster/utils/inc/Thread.hpp"
#include <cerrno>

namespace xaifBooster { 

  DbgLoggerManager* DbgLoggerManager::ourInstance_p=0;
  Mutex DbgLoggerManager::ourInstanceMutex;

  DbgLoggerManager* 
  DbgLoggerManager::instance() { 
    if (ourInstance_p)
      return ourInstance_p;
    ourInstanceMutex.lock();
    try { 
      if (!ourInstance_p)
	ourInstance_p=new DbgLoggerManager();
      if (!ourInstance_p) { 
	THROW_LOGICEXCEPTION_MACRO("DbgLoggerManager::instance");
      } // end if 
    } // end try 
    catch (...) { 
      ourInstanceMutex.unlock();
      throw;
    } // end catch
    ourInstanceMutex.unlock();
    return ourInstance_p;
  } // end of DbgLoggerManager::instance

  void
  DbgLoggerManager::setSelection(unsigned int aSelection) { 
    ourInstanceMutex.lock();
    if (aSelection==0) {
      if(myLogger_p) { 
	delete myLogger_p;
	myLogger_p=NULL; 
      } // end if 
    } // end if
    mySelector=aSelection;
    ourInstanceMutex.unlock();
  } // end of DbgLoggerManager::setSelection

  void
  DbgLoggerManager::setFile(const std::string& aFileName_c) { 
    ourInstanceMutex.lock();
    try { 
      if (aFileName_c!=myDebugOutPutFileName) {  
	if (myLogger_p) { 
	  delete myLogger_p;
	  myLogger_p=NULL; 
	}
	myOutFileStream.close();
	myOutFileStream.clear();
	errno=0;
	myOutFileStream.open(aFileName_c.c_str(), 
			     std::ios::app);
	int keepErrno=errno;
	if(! myOutFileStream || keepErrno) {
	  ourInstanceMutex.unlock();
	  THROW_LOGICEXCEPTION_MACRO("Cannot open " 
				     << aFileName_c.c_str() 
				     << " for server debug. System message: "
				     << strerror(keepErrno));
	} 
	myDebugOutPutFileName=aFileName_c;
      }  // end if 
    } // end try 
    catch (LogicException& e) { 
      throw e;
    }
    catch (...) {
      ourInstanceMutex.unlock();
      THROW_LOGICEXCEPTION_MACRO("Exception in DbgLoggerManager::setFile"); 
    } // end catch 
    ourInstanceMutex.unlock();
  } // end of DbgLoggerManager::setFile

  unsigned int
  DbgLoggerManager::getSelection() const {
    return(mySelector);
  }

  std::string
  DbgLoggerManager::getFileName() const {
    return(myDebugOutPutFileName);
  }

  DbgLoggerManager::DbgLoggerManager() : 
    myLogger_p(NULL), 
    myDebugOutPutFileName(""),
    mySelector(0) { 
  } // end of DbgLoggerManager::DbgLoggerManager
  
  DbgLoggerManager::~DbgLoggerManager() { 
    if (myLogger_p)
      delete myLogger_p;
    if (!(myOutFileStream.fail()))
      myOutFileStream.close();
  } // end of DbgLoggerManager::~DbgLoggerManager

  bool 
  DbgLoggerManager::isSelected(const DbgGroup::DbgGroup_E aGroup_c) const { 
    if ((aGroup_c & mySelector) || aGroup_c == DbgGroup::ERROR)
      return (true);
    else
      return (false);

  } // end of DbgLoggerManager::isSelected

  void 
  DbgLoggerManager::logDebug(const std::string aFileName_c,
			     const int aLineNumber_c,
			     const DbgGroup::DbgGroup_E aGroup_c, 
			     std::ostringstream& aMessage_r) { 
    if (isSelected(aGroup_c)) { 
      std::ostringstream message; 
      message << Thread::threadId()  
	      << ":" 
	      << aFileName_c.c_str()
	      << ":"
	      << aLineNumber_c
	      << ":"
	      << DbgGroup::toString(aGroup_c)
	      << ":";
      message << aMessage_r.str().c_str();
      if (myLogger_p) { 
	myLogger_p->logMessage(message);
	return; 
      } 
      ourInstanceMutex.lock();
      try { 
	if (!myLogger_p) { 
	  if (myDebugOutPutFileName.empty())
	    myLogger_p=new DbgLogger(std::cout);
	  else {
	    myOutFileStream.close();
	    myOutFileStream.open(myDebugOutPutFileName.c_str(),
				 std::ios::app);
	    if(!myOutFileStream) {
	      std::cerr << "DbgLoggerManager::logDebug unable to open " 
			<< myDebugOutPutFileName 
			<< std::endl;
	      ourInstanceMutex.unlock();
	      return; 
	    } 
	    myLogger_p=new DbgLogger(myOutFileStream);
	  } // end else 
	  if (!myLogger_p) 
	    std::cerr << "DbgLoggerManager::logDebug: out of memory"
		      << std::endl;
	  else { 
	    // startup message
	    std::ostringstream startupMessage;
	    startupMessage << "========================================== reset log"; 
	    myLogger_p->logMessage(startupMessage);
	  } // end else 
	} // end if 
      } // end try 
      catch (...) {
	std::cerr << "DbgLoggerManager::logDebug: unexpected exception"
		  << std::endl; 
      } // end catch
      ourInstanceMutex.unlock();
      if (myLogger_p) 
	myLogger_p->logMessage(message);
    } // end if  
  } // end of DbgLoggerManager::logDebug
    
}


 
