#!/usr/bin/python

import os
import sys

def showGraphs(errDict,errLimDict,name):
    import tempfile
    plotFileName=tempfile.mktemp()
    plotFile=open(plotFileName,"w")
    plotFile.write('set multiplot layout 2, 3 title \"'+str(name)+'\"\n')
    plotFile.write('set noxlabel\n')
    plotFile.write('set noxtics\n')
    plotFile.write('set noylabel\n')
    plotFile.write('set logscale y\n')
    plotFile.write('set nokey\n')
    datFileNames=[]
    for errName in sorted(errDict.keys()):
	errValList=errDict[errName]
        plotFile.write('set title \"'+errName+'\"\n')
        datFileName=tempfile.mktemp()
        datFileNames.append(datFileName)
        datFile=open(datFileName,"w")
        for (x,y) in enumerate(errValList):
            datFile.write(str(x)+' '+str(y)+'\n')
        datFile.close()
        plotFile.write('plot \"'+datFileName+'\" with points pt 3, \\\n')
        plotFile.write(str(errLimDict[errName])+' with lines lt 1\n')
    plotFile.close()
    rc=os.system("gnuplot -persist "+plotFileName+" 2>/dev/null")
    if (rc) :
        sys.stderr.write("gnuplot failed\n")
    os.remove(plotFileName)
    map(os.remove,datFileNames)

def compareFiles (fileDict,doBatch, graphs,name, verbose):
    paramsFile=open("params.conf","r")
    n=int(paramsFile.readline())
    m=int(paramsFile.readline())
    h=float(paramsFile.readline())
    relErrorMax=float(paramsFile.readline())
    paramsFile.close()
    numbers={}
    # order is given in usage
    for fileKey, fileName in fileDict.items() :
        numbers[fileKey]=[]
        numberFile=open(fileName,"r")
        for theLine in numberFile:
            if (theLine[0] == "F"):
                fElementString,fValueString = theLine.split('=')
                numbers[fileKey].append(float(fValueString))
    errDict={}
    for key in ['absErrADDD','relErrADDD','absErrCvR_AD','relErrCvR_AD','absErrCvR_DD','relErrCvR_DD'] :
      errDict[key]=[]
    for i in range(0,n*m):
        # current AD vs DD
        errDict['absErrADDD'].append(abs(numbers['curDD'][i]-numbers['curAD'][i]))
        if (numbers['curAD'][i]!=0) :
            errDict['relErrADDD'].append(abs((numbers['curDD'][i]-numbers['curAD'][i])/numbers['curAD'][i]))
        else:
            errDict['relErrADDD'].append(errDict['absErrADDD'][-1])
        # AD current vs. ref
        errDict['absErrCvR_AD'].append(abs(numbers['curAD'][i]-numbers['refAD'][i]))
        if (numbers['refAD'][i]!=0) :
            errDict['relErrCvR_AD'].append(abs((numbers['curAD'][i]-numbers['refAD'][i])/numbers['refAD'][i]))
        else:
            errDict['relErrCvR_AD'].append(errDict['absErrCvR_AD'][-1])
        # DD current vs. ref
        errDict['absErrCvR_DD'].append(abs(numbers['curDD'][i]-numbers['refDD'][i]))
        if (numbers['refDD'][i]!=0) :
            errDict['relErrCvR_DD'].append(abs((numbers['curDD'][i]-numbers['refDD'][i])/numbers['refDD'][i]))
        else:
            errDict['relErrCvR_DD'].append(errDict['absErrCvR_DD'][-1])
    errLimDict={}
    maxRelErrADDD=max(errDict['relErrADDD'])
    maxAbsErrADDD=max(errDict['absErrADDD'])
    errLimDict['relErrADDD']=relErrorMax
    errLimDict['absErrADDD']=relErrorMax
    returnValue=0
    if (maxRelErrADDD>relErrorMax and maxAbsErrADDD>relErrorMax):
        returnValue=1
        if not doBatch : 
            sys.stderr.write(" max discrepancy current AD vs. DD abs: %s rel %s\n" % (maxAbsErrADDD,maxAbsErrADDD))
    compEps=1.E-16
    maxAbsDiscrCurRef=max([max(errDict['absErrCvR_AD']),max(errDict['absErrCvR_DD'])])
    maxRelDiscrCurRef=max([max(errDict['relErrCvR_AD']),max(errDict['relErrCvR_DD'])])
    errLimDict['absErrCvR_AD']=compEps
    errLimDict['absErrCvR_DD']=compEps
    errLimDict['relErrCvR_AD']=compEps
    errLimDict['relErrCvR_DD']=compEps
    if (maxRelDiscrCurRef>compEps and maxAbsDiscrCurRef>compEps):
        returnValue=1
        if not doBatch : 
            sys.stderr.write(" max discrepancy cur. vs. ref. abs: %s rel %s\n" % (maxRelDiscrCurRef,maxAbsDiscrCurRef))
    if (returnValue and verbose) :
        for errKey, errList in errDict.items():
           if (max(errDict[errKey]) > errLimDict[errKey]) :
             sys.stderr.write(" "+errKey+" > "+str(errLimDict[errKey])+" for:\n")     
             for index,val in enumerate(errDict[errKey]) :
                if (val > errLimDict[errKey]) :
                  sys.stderr.write("  F["+str(index/m+1)+"]["+str(index%m)+"]: %r\n" % (val))
    if (returnValue and graphs) :
        showGraphs(errDict,errLimDict,name)
    return returnValue
          
def main():
    from optparse import OptionParser
    keyList=["curDD","refDD","curAD","refAD"]
    usage = '%prog [options] '
    for i in keyList :
        usage=usage+'<'+i+'_file> '
    opt = OptionParser(usage=usage)
    opt.add_option('-b','--batchMode',dest='batchMode',
                   help="run in batchMode suppressing output",
                   action='store_true',default=False)
    opt.add_option('-g','--graphs',dest='graphs',
                   help="if limits are exceeded display the discrepancies with gnuplot",
                   action='store_true',default=False)
    opt.add_option('-n','--name',dest='name', type="string",
                   help="the name of the test",
                   action='store',default="")
    opt.add_option('-v','--verbose',dest='verbose',
                   help="if limits are exceeded show verbose output",
                   action='store_true',default=False)
    (options, args) = opt.parse_args()
    returnValue=0
    try:
        if len(args)!=4 :
            opt.error("expect 4 input file arguments, found " + str(len(args))+" : " + str(args))
        if options.batchMode and (options.graphs or options.verbose) :
            opt.error("options for batchMode and graphs/verbose are mutually exclusive")
        fileDict={}    
        for i in range(0,len(keyList)):
            fileDict[keyList[i]]=args[i]
        returnValue=compareFiles(fileDict,options.batchMode, options.graphs,options.name, options.verbose)
    except RuntimeError, e:
        print 'caught excetion: ',e
        return -1
    return returnValue

if __name__ == "__main__":
    sys.exit(main())
