C ***********************************************************
C Fortran file translated from WHIRL Fri Jul 21 11:38:40 2006
C ***********************************************************
C ***********************************************************

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
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      INTEGER(w2f__i8) OpenAD_Symbol_8
      INTEGER(w2f__i8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      INTEGER(w2f__i8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_21
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C


          ! checkpointing stacks and offsets
          integer :: cp_loop_variable_1,cp_loop_variable_2,
     +cp_loop_variable_3,cp_loop_variable_4,cp_loop_variable_5
          ! floats 'F'
          double precision, dimension(:), allocatable, save :: 
     +theArgFStack
          integer, save :: theArgFStackoffset=0, theArgFStackSize=0
          double precision, dimension(:), allocatable, save :: 
     +theResFStack
          integer, save :: theResFStackoffset=0, theResFStackSize=0
          ! integers 'I'
          integer, dimension(:), allocatable, save :: 
     +theArgIStack
          integer, save :: theArgIStackoffset=0, theArgIStackSize=0
          integer, dimension(:), allocatable, save :: 
     +theResIStack
          integer, save :: theResIStackoffset=0, theResIStackSize=0
          ! booleans 'B'
          logical, dimension(:), allocatable, save :: 
     +theArgBStack
          integer, save :: theArgBStackoffset=0, theArgBStackSize=0
          logical, dimension(:), allocatable, save :: 
     +theResBStack
          integer, save :: theResBStackoffset=0, theResBStackSize=0
          ! strings 'S'
          character*(80), dimension(:), allocatable, save :: 
     +theArgSStack
          integer, save :: theArgSStackoffset=0, theArgSStackSize=0
          character*(80), dimension(:), allocatable, save :: 
     +theResSStack
          integer, save :: theResSStackoffset=0, theResSStackSize=0

          type(modeType) :: our_orig_mode

	  ! call external C function used in inlined code
          integer iaddr
          external iaddr

C          write(*,'(A,I6,A,I6,A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" RF:",theResFStackoffset, 
C     +" RI:",theResIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer
          if (our_rev_mode%arg_store) then 
C            print*, " arg_store  ", our_rev_mode
C store arguments
          call cp_store_real_vector(X,size(X),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          call cp_store_real_vector(Y,size(Y),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
          do cp_loop_variable_1 = ubound(Y,1),lbound(Y,1),-1
             Y(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+Y(cp_loop_variable_1)%v
          end do
          do cp_loop_variable_1 = ubound(X,1),lbound(X,1),-1
             X(cp_loop_variable_1)%v = theArgFStack(theArgFStackoffset)
             theArgFStackoffset = theArgFStackoffset-1
C write(*,'(A,EN26.16E3)')"restore(v)  ",
C+X(cp_loop_variable_1)%v
          end do
          end if
          if (our_rev_mode%plain) then
C            print*, " plain      ", our_rev_mode
            our_orig_mode=our_rev_mode
            our_rev_mode%arg_store=.FALSE.
C original function
C$OPENAD XXX Template ad_template.f
      DO I = 1, 2, 1
        Y(INT(I))%v = X(I)%v
      END DO
      DO I = 1, 2, 1
        Y(INT(I))%v = (X(I)%v*Y(I)%v)
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
      OpenAD_Symbol_12 = 0_w2f__i8
      DO I = 1, 2, 1
        Y(INT(I))%v = X(I)%v
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_12 = (INT(OpenAD_Symbol_12) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_12
          integer_tape_pointer = integer_tape_pointer+1
      OpenAD_Symbol_13 = 0_w2f__i8
      DO I = 1, 2, 1
        OpenAD_Symbol_2 = (X(I)%v*Y(I)%v)
        OpenAD_Symbol_0 = Y(I)%v
        OpenAD_Symbol_1 = X(I)%v
        Y(INT(I))%v = OpenAD_Symbol_2
        OpenAD_Symbol_4 = OpenAD_Symbol_0
        OpenAD_Symbol_6 = OpenAD_Symbol_1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_4
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_6
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_13 = (INT(OpenAD_Symbol_13) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_13
          integer_tape_pointer = integer_tape_pointer+1
      
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.
          end if 
          if (our_rev_mode%res_restore) then
C restore results
          do cp_loop_variable_1 = lbound(Y,1),ubound(Y,1),1
             Y(cp_loop_variable_1)%v = theResFStack(theResFStackoffset)
             theResFStackoffset = theResFStackoffset+1
          end do
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
          OpenAD_Symbol_16 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_17 = double_tape(double_tape_pointer)
          OpenAD_Symbol_7%d = OpenAD_Symbol_7%d+Y(INT(OpenAD_Symbol_16))
     +%d*OpenAD_Symbol_17
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_18 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_19 = double_tape(double_tape_pointer)
          OpenAD_Symbol_5%d = OpenAD_Symbol_5%d+Y(INT(OpenAD_Symbol_18))
     +%d*OpenAD_Symbol_19
          Y(INT(OpenAD_Symbol_18))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_20 = integer_tape(integer_tape_pointer)
          X(INT(OpenAD_Symbol_20))%d = X(INT(OpenAD_Symbol_20))%d+OpenAD
     +_Symbol_5%d
          OpenAD_Symbol_5%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_21 = integer_tape(integer_tape_pointer)
          Y(INT(OpenAD_Symbol_21))%d = Y(INT(OpenAD_Symbol_21))%d+OpenAD
     +_Symbol_7%d
          OpenAD_Symbol_7%d = 0.0d0
        OpenAD_Symbol_9 = INT(OpenAD_Symbol_9) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_10 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_11 = 1
      DO WHILE(INT(OpenAD_Symbol_11) .LE. INT(OpenAD_Symbol_10))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_14 = integer_tape(integer_tape_pointer)
          if (iaddr(Y(INT(OpenAD_Symbol_14))) .ne. iaddr(OpenAD_Symbol_3
     +)) then
            OpenAD_Symbol_3%d = OpenAD_Symbol_3%d+Y(INT(OpenAD_Symbol_14
     +))%d
            Y(INT(OpenAD_Symbol_14))%d = 0
          end if
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_15 = integer_tape(integer_tape_pointer)
          X(INT(OpenAD_Symbol_15))%d = X(INT(OpenAD_Symbol_15))%d+OpenAD
     +_Symbol_3%d
          OpenAD_Symbol_3%d = 0.0d0
        OpenAD_Symbol_11 = INT(OpenAD_Symbol_11) + 1
      END DO
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.TRUE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.TRUE.
            our_rev_mode%adjoint=.FALSE.
          end if 
          if (our_rev_mode%res_store) then
C store results
C            print*, " res_store  ", our_rev_mode
          call cp_store_real_vector(Y,size(Y),theResFStack,theResFStacko
     +ffset,theResFStackSize)
          end if 
C          write(*,'(A,I6,A,I6,A,I6,A,I6,A,I5,A,I5)')
C     +"a:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" RF:",theResFStackoffset, 
C     +" RI:",theResIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer
        end subroutine head
