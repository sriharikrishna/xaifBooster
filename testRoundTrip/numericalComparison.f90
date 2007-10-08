program numericalComparison

  implicit none
  character*(80) :: filedd, refdd, filead, refad, string1, string2, string3
  real(8) :: h, testRelativeError, maxRelativeError, relErr, ndd,rdd,nad,rad, compEps, maxCompEps
  integer :: n,m, i,j,k
  logical :: problem=.false., compProb=.false.
  logical :: debug=.false.

  read *, filedd, refdd, filead, refad


  open(5,action='read',file='params.conf')
  read(5,'(I5,/,I5,/,F8.1,/,F8.1)') n, m, h, testRelativeError
  close(5)

  if (debug) print *, filedd, refdd, filead, refad

  open(1,action='read',file=filedd)
  open(2,action='read',file=refdd)
  open(3,action='read',file=filead)
  open(4,action='read',file=refad)

  read(1,*) string1
  read(2,*) string1
  read(3,*) string1 
  read(4,*) string1
  compEps=1.E-16
  maxRelativeError=0.D0
  maxCompEps=0.D0
  do i=1,n*m
     read(1,'(A2,I3,A1,I3,A2,EN26.16E3)') string1, j, string2, k, string3, ndd
     read(2,'(A2,I3,A1,I3,A2,EN26.16E3)') string1, j, string2, k, string3, rdd
     read(3,'(A2,I3,A1,I3,A2,EN26.16E3)') string1, j, string2, k, string3, nad
     read(4,'(A2,I3,A1,I3,A2,EN26.16E3)') string1, j, string2, k, string3, rad
     if (debug) write(*,*) "reading entry ", i, compEps, abs(ndd),abs(rdd),abs(nad), abs(rad)
     if (abs(ndd)>compEps .or. abs(rdd)>compEps .or. abs(nad)>compEps .or. abs(rad)>compEps) then 
        if (abs(rdd)>0) then 
           relErr=abs(ndd-rdd)/abs(rdd)
        else
           relErr=abs(ndd)
        end if
        if (maxCompEps<relErr) maxCompEps=relErr
        if (relErr > compEps) then
           write(*,'(A, A,I3,A,I3,A,EN26.16E3,A,EN26.16E3,A,EN26.16E3)') "significant change for DD vs reference in ","F(",j,",",k,")=",&
&ndd, " vs ", rdd, " e:", relErr
           compProb=.true.
        end if
        if (debug) then
           write(*,'(A,EN26.16E3,A,EN26.16E3,A, A,I3,A,I3,A,EN26.16E3,A,EN26.16E3)') "relErr ", relErr, " and compEps ",&
&compEps," for DD vs reference in ","F(",j,",",k,")=",ndd, " vs ", rdd
        end if
        if (abs(rad)>0) then 
           relErr=abs(nad-rad)/abs(rad)
        else
           relErr=abs(nad)
        end if
        if (maxCompEps<relErr) maxCompEps=relErr
        if (relErr > compEps) then
           write(*,'(A, A,I3,A,I3,A,EN26.16E3,A,EN26.16E3,A,EN26.16E3)') "significant change for AD vs reference in ","F(",j,",",k,")=",&
&nad, " vs ", rad, " e:", relErr
           compProb=.true.
        end if
        if (debug) then
           write(*,'(A,EN26.16E3,A,EN26.16E3,A, A,I3,A,I3,A,EN26.16E3,A,EN26.16E3)') "relErr ", relErr, " and compEps ",&
&compEps," for AD vs reference in ","F(",j,",",k,")=",nad, " vs ", rad
        end if
        if (abs(nad)>0) then 
           relErr=abs(ndd-nad)/abs(nad)
        else
           relErr=abs(ndd)
        end if
        if (maxRelativeError<relErr) maxRelativeError=relErr
        if (relErr > testRelativeError) then
           write(*,'(A, A,I3,A,I3,A,EN26.16E3,A,EN26.16E3,A,EN26.16E3)') "significant change for AD vs DD in ","F(",j,",",k,")=",nad,&
& " vs ", ndd, " e:", relErr
           problem=.true.
        end if
        if (debug) then
           write(*,'(A,EN26.16E3,A,EN26.16E3,A, A,I3,A,I3,A,EN26.16E3,A,EN26.16E3)') "relErr ", relErr, " and testRelErr ",&
&testRelativeError," for AD vs reference in ","F(",j,",",k,")=",nad, " vs ", ndd
        end if
     end if
  end do
  if (compProb .or. debug) then 
    write(*,'(A,EN26.16E3,A,EN26.16E3)') "expected maximal computation discrepancy of ", compEps," and found " , maxCompEps
  end if
  if (problem .or. debug) then 
    write(*,'(A,EN26.16E3,A,EN26.16E3)') "expected maximal relative error of ", testRelativeError," and found " , maxRelativeError
  end if
  if (.not.(problem) .and. .not.(compProb)) then  
    write(*,'(A,EN26.16E3,A)',advance='no') "found maximal relative error of ", maxRelativeError, " "
  end if
  if (problem .or. compProb)   call exit(-1)
  close(1)
  close(2)
  close(3)
  close(4)
  call exit(0)
end program numericalComparison
  
