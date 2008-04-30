
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE
C ========== begin copyright notice ==============
C This file is part of 
C ---------------
C xaifBooster
C ---------------
C Distributed under the BSD license as follows:
C Copyright (c) 2005, The University of Chicago
C All rights reserved.
C
C Redistribution and use in source and binary forms, 
C with or without modification, are permitted provided that the following conditions are met:
C
C    - Redistributions of source code must retain the above copyright notice, 
C      this list of conditions and the following disclaimer.
C    - Redistributions in binary form must reproduce the above copyright notice, 
C      this list of conditions and the following disclaimer in the documentation 
C      and/or other materials provided with the distribution.
C    - Neither the name of The University of Chicago nor the names of its contributors 
C      may be used to endorse or promote products derived from this software without 
C      specific prior written permission.
C
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
C EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
C OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
C SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
C INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
C PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
C INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
C LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C 
C General Information:
C xaifBooster is intended for the transformation of 
C numerical programs represented as xml files according 
C to the XAIF schema. It is part of the OpenAD framework. 
C The main application is automatic 
C differentiation, i.e. the generation of code for 
C the computation of derivatives. 
C The following people are the principal authors of the 
C current version: 
C 	Uwe Naumann
C	Jean Utke
C Additional contributors are: 
C	Andrew Lyons
C	Peter Fine
C
C For more details about xaifBooster and its use in OpenAD please visit:
C   http://www.mcs.anl.gov/openad
C
C This work is partially supported by:
C 	NSF-ITR grant OCE-0205590
C ========== end copyright notice ==============
       subroutine head(X,Y)
          use OpenAD_dct
          use OpenAD_tape
          use OpenAD_rev
          use OpenAD_checkpoints
C          use checkpoint_module
          use graph_module

          ! original arguments get inserted before version
          ! and declared here together with all local variables
          ! generated by xaifBooster

      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      INTEGER(w2f__i8) OpenAD_Symbol_10
      INTEGER(w2f__i8) OpenAD_Symbol_11
      INTEGER(w2f__i8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      INTEGER(w2f__i8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      INTEGER(w2f__i8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      INTEGER(w2f__i8) OpenAD_Symbol_30
      INTEGER(w2f__i8) OpenAD_Symbol_31
      INTEGER(w2f__i8) OpenAD_Symbol_32
      INTEGER(w2f__i8) OpenAD_Symbol_33
      INTEGER(w2f__i8) OpenAD_Symbol_34
      INTEGER(w2f__i8) OpenAD_Symbol_35
      INTEGER(w2f__i8) OpenAD_Symbol_36
      INTEGER(w2f__i8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C


          !counters
          integer, save :: theSwitch = 0

          !Graph variables
          integer, save :: prevint = 1
          integer, save :: prevdouble = 1
          integer, save :: prevBStack = 0
          integer, save :: prevIStack = 0
          integer, save :: prevFStack = 0
          
          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0

          type(modeType) :: our_orig_mode

          !Variables for making graphs

         type (list), pointer :: prev => NULL()
         integer :: ierror, counter, counter2, counter3
         
         character (len = 20) itoa 
         character (len = 20) itoa2

         !end graph varibables

	  ! call external C function used in inlined code
          !integer iaddr
          !external iaddr

           ! call external Fortran function used in inlined code
          external makelines

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

!function to make graphs
          if (our_rev_mode%tape) then
            Call makelinks('head', prev)
          endif
!end function to make graphs
       
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO I = 1, 1, 1
        Y(1)%v = X(1)%v
        IF (Y(1)%v .GT. 0.0D00) THEN
          DO J = 1, 3, 1
            DO K = 1, 3, 1
              IF (X(1)%v .GT. 0.0D00) THEN
                Y(1)%v = (X(1)%v*Y(1)%v)
              ENDIF
            END DO
          END DO
        ELSE
          Y(1)%v = (Y(1)%v/X(1)%v)
        ENDIF
      END DO
            our_rev_mode=our_orig_mode
          end if 
          if (our_rev_mode%tape) then
C            print*, " tape       ", our_rev_mode
            our_rev_mode%arg_store=.TRUE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.TRUE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.FALSE.
C taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_16 = 0_w2f__i8
      DO I = 1, 1, 1
        Y(1)%v = X(1)%v
        IF (Y(1)%v .GT. 0.0D00) THEN
          OpenAD_Symbol_17 = 0_w2f__i8
          DO J = 1, 3, 1
            OpenAD_Symbol_18 = 0_w2f__i8
            DO K = 1, 3, 1
              IF (X(1)%v .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (X(1)%v*Y(1)%v)
                OpenAD_Symbol_0 = Y(1)%v
                OpenAD_Symbol_1 = X(1)%v
                Y(1)%v = OpenAD_Symbol_2
          double_tape(double_tape_pointer) = OpenAD_Symbol_0
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_1
          double_tape_pointer = double_tape_pointer+1
                OpenAD_Symbol_19 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_19
          integer_tape_pointer = integer_tape_pointer+1
              ELSE
                OpenAD_Symbol_20 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_20
          integer_tape_pointer = integer_tape_pointer+1
              ENDIF
              OpenAD_Symbol_18 = (INT(OpenAD_Symbol_18) + INT(1_w2f__i8 
     +))
            END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_18
          integer_tape_pointer = integer_tape_pointer+1
            OpenAD_Symbol_17 = (INT(OpenAD_Symbol_17) + INT(1_w2f__i8))
          END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_17
          integer_tape_pointer = integer_tape_pointer+1
          OpenAD_Symbol_22 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_22
          integer_tape_pointer = integer_tape_pointer+1
        ELSE
          OpenAD_Symbol_5 = (Y(1)%v/X(1)%v)
          OpenAD_Symbol_3 = (INT(1 _w2f__i8)/X(1)%v)
          OpenAD_Symbol_4 = (-(Y(1)%v/(X(1)%v*X(1)%v)))
          Y(1)%v = OpenAD_Symbol_5
          double_tape(double_tape_pointer) = OpenAD_Symbol_3
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_4
          double_tape_pointer = double_tape_pointer+1
          OpenAD_Symbol_21 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_21
          integer_tape_pointer = integer_tape_pointer+1
        ENDIF
        OpenAD_Symbol_16 = (INT(OpenAD_Symbol_16) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_16
          integer_tape_pointer = integer_tape_pointer+1
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.

            !Part of making graphs
              if (.not. associated(prev)) then
                tree%doubles = double_tape_pointer - prevdouble-1
                tree%integers = integer_tape_pointer - prevint-1
                tree%argInts = -1*(theArgIStackOffset - prevIStack)
                tree%argFloats = -1*(theArgFStackOffset - prevFStack)
                tree%argBools =  -1*(theArgBStackOffset - prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset                
              else
                prev%called%doubles = double_tape_pointer - prevdouble
                prev%called%integers = integer_tape_pointer- prevint
                prev%called%argInts =-1*(theArgIStackOffset-prevIStack)
                prev%called%argFloats=-1*(theArgFStackOffset-prevFStack)
                prev%called%argBools= -1*(theArgBStackOffset-prevBStack)
                prevdouble = integer_tape_pointer
                prevint = double_tape_pointer
                prevBStack = -1*theArgBStackOffset
                prevIStack = -1*theArgIStackOffset
                prevFStack = -1*theArgFStackOffset
              endif
             !end Graph code
C                call diff tape storage only once flag
          end if 
          if (our_rev_mode%adjoint) then
C            print*, " adjoint    ", our_rev_mode
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
C adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_8 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_9 = 1
      DO WHILE(INT(OpenAD_Symbol_9) .LE. INT(OpenAD_Symbol_8))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_10 = integer_tape(integer_tape_pointer)
        IF(OpenAD_Symbol_10 .ne. 0) THEN
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_11 = integer_tape(integer_tape_pointer)
          OpenAD_Symbol_12 = 1
          DO WHILE(INT(OpenAD_Symbol_12) .LE. INT(OpenAD_Symbol_11))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_13 = integer_tape(integer_tape_pointer)
            OpenAD_Symbol_14 = 1
            DO WHILE(INT(OpenAD_Symbol_14) .LE. INT(OpenAD_Symbol_13))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_15 = integer_tape(integer_tape_pointer)
              IF(OpenAD_Symbol_15 .ne. 0) THEN
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_38 = double_tape(double_tape_pointer)
          OpenAD_Symbol_6%d = OpenAD_Symbol_6%d+Y(1)%d*OpenAD_Symbol_38
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_39 = double_tape(double_tape_pointer)
          X(1)%d = X(1)%d+Y(1)%d*OpenAD_Symbol_39
          Y(1)%d = 0.0d0
          Y(1)%d = Y(1)%d+OpenAD_Symbol_6%d
          OpenAD_Symbol_6%d = 0.0d0
              ENDIF
              OpenAD_Symbol_14 = INT(OpenAD_Symbol_14) + 1
            END DO
            OpenAD_Symbol_12 = INT(OpenAD_Symbol_12) + 1
          END DO
        ELSE
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_40 = double_tape(double_tape_pointer)
          X(1)%d = X(1)%d+Y(1)%d*OpenAD_Symbol_40
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_41 = double_tape(double_tape_pointer)
          OpenAD_Symbol_7%d = OpenAD_Symbol_7%d+Y(1)%d*OpenAD_Symbol_41
          Y(1)%d = 0.0d0
          Y(1)%d = Y(1)%d+OpenAD_Symbol_7%d
          OpenAD_Symbol_7%d = 0.0d0
        ENDIF
          X(1)%d = X(1)%d+Y(1)%d
          Y(1)%d = 0.0d0
        OpenAD_Symbol_9 = INT(OpenAD_Symbol_9) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer

         !graph code
         prevint = integer_tape_pointer
         prevdouble = double_tape_pointer
         prevBStack = theArgBStackOffset
         prevIStack = theArgIStackOffset
         prevFStack = theArgFStackOffset
         if (our_rev_mode%tape) then
          if( associated(prev)) then
             cur => prev
           else  
             !if(tree%first%called%value .eq. cur%called%value) then
           Open (Unit=10, File='/tmp/calltree.out', status='replace', 
     + action='write', iostat=ierror)
           write(10, *) 'digraph G {'
           write(10, *) 'nodesep=.05;'
           write(10, *) 'ranksep=.05;'
           graph%value = tree%value
           graph%doubles = tree%doubles
           graph%integers = tree%integers
           write(itoa, '(I)') tree%doubles
           itoa = adjustl(itoa)
           write(itoa2, '(I)') tree%integers
           itoa2 = adjustl(itoa2)
           write(10, '(I, A, A, A, A, A, A, A)'), iaddr(tree),
     + '[shape="box" height=.25 label="', trim(tree%value), ' ', 
     + trim(itoa), ':', trim(itoa2), '"];'
            Call graphprint(tree)
            write(10, *) '1[ height=.25 label="SubroutineName',
     + ' double:integer"];'
            write(10, '(A,A)') '2[height=.25 label="Edge checkpoint',
     + ' double:integer:boolean"];'
            write(10, *) '}'
            close(10)
            Open (Unit=11, File='/tmp/callgraph.out', status='replace',
     + action='write', iostat=ierror)
            write(11, *) 'digraph G {'
            write(11, *) 'nodesep=.05;'
            write(11, *) 'ranksep=.05;'
            call graph2print()
            write(11, '(A,A)') '1[ height=.25 label="SubroutineName',
     + ' tape double:integer checkpoint double:integer:boolean"];'
            write(11, *) '}'
            close(11)
             !read *, five
             !endif
             endif
           endif    
         !end graph code

        end subroutine head
