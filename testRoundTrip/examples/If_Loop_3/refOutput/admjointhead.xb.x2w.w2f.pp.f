
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
      REAL(w2f__8) OpenAD_Symbol_10
      type(active) :: OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      type(active) :: OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      type(active) :: OpenAD_Symbol_17
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
      INTEGER(w2f__i8) OpenAD_Symbol_38
      INTEGER(w2f__i8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      INTEGER(w2f__i8) OpenAD_Symbol_40
      INTEGER(w2f__i8) OpenAD_Symbol_41
      INTEGER(w2f__i8) OpenAD_Symbol_42
      INTEGER(w2f__i8) OpenAD_Symbol_43
      INTEGER(w2f__i8) OpenAD_Symbol_44
      INTEGER(w2f__i8) OpenAD_Symbol_45
      INTEGER(w2f__i8) OpenAD_Symbol_46
      INTEGER(w2f__i8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
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
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
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

	  ! call external C function used in inlined code
          integer iaddr
          external iaddr

C          write(*,'(A,I6,A,I6,A,I5,A,I5)')
C     +"b:AF:", theArgFStackoffset, 
C     +" AI:",theArgIStackoffset, 
C     +" DT:",double_tape_pointer, 
C     +" IT:",integer_tape_pointer
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
          Y(1)%v = X(1)%v
          DO J = 1, 3, 1
            Y(1)%v = X(1)%v
            DO K = 1, 3, 1
              Y(1)%v = X(1)%v
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
      OpenAD_Symbol_26 = 0_w2f__i8
      DO I = 1, 1, 1
        Y(1)%v = X(1)%v
        IF (Y(1)%v .GT. 0.0D00) THEN
          Y(1)%v = X(1)%v
          OpenAD_Symbol_27 = 0_w2f__i8
          DO J = 1, 3, 1
            Y(1)%v = X(1)%v
            OpenAD_Symbol_28 = 0_w2f__i8
            DO K = 1, 3, 1
              Y(1)%v = X(1)%v
              IF (X(1)%v .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (X(1)%v*Y(1)%v)
                OpenAD_Symbol_0 = Y(1)%v
                OpenAD_Symbol_1 = X(1)%v
                Y(1)%v = OpenAD_Symbol_2
                OpenAD_Symbol_10 = OpenAD_Symbol_0
                OpenAD_Symbol_12 = OpenAD_Symbol_1
          double_tape(double_tape_pointer) = OpenAD_Symbol_10
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_12
          double_tape_pointer = double_tape_pointer+1
                OpenAD_Symbol_29 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_29
          integer_tape_pointer = integer_tape_pointer+1
              ELSE
                OpenAD_Symbol_30 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_30
          integer_tape_pointer = integer_tape_pointer+1
              ENDIF
              OpenAD_Symbol_28 = (INT(OpenAD_Symbol_28) + INT(1_w2f__i8 
     +))
            END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_28
          integer_tape_pointer = integer_tape_pointer+1
            OpenAD_Symbol_27 = (INT(OpenAD_Symbol_27) + INT(1_w2f__i8))
          END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_27
          integer_tape_pointer = integer_tape_pointer+1
          OpenAD_Symbol_32 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_32
          integer_tape_pointer = integer_tape_pointer+1
        ELSE
          OpenAD_Symbol_5 = (Y(1)%v/X(1)%v)
          OpenAD_Symbol_3 = (INT(1 _w2f__i8)/X(1)%v)
          OpenAD_Symbol_4 = (-(Y(1)%v/(X(1)%v*X(1)%v)))
          Y(1)%v = OpenAD_Symbol_5
          OpenAD_Symbol_14 = OpenAD_Symbol_3
          OpenAD_Symbol_16 = OpenAD_Symbol_4
          double_tape(double_tape_pointer) = OpenAD_Symbol_14
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_16
          double_tape_pointer = double_tape_pointer+1
          OpenAD_Symbol_31 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_31
          integer_tape_pointer = integer_tape_pointer+1
        ENDIF
        OpenAD_Symbol_26 = (INT(OpenAD_Symbol_26) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_26
          integer_tape_pointer = integer_tape_pointer+1
      
            our_rev_mode%arg_store=.FALSE.
            our_rev_mode%arg_restore=.FALSE.
            our_rev_mode%res_store=.FALSE.
            our_rev_mode%res_restore=.FALSE.
            our_rev_mode%plain=.FALSE.
            our_rev_mode%tape=.FALSE.
            our_rev_mode%adjoint=.TRUE.
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
          OpenAD_Symbol_18 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_19 = 1
      DO WHILE(INT(OpenAD_Symbol_19) .LE. INT(OpenAD_Symbol_18))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_20 = integer_tape(integer_tape_pointer)
        IF(OpenAD_Symbol_20 .ne. 0) THEN
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_21 = integer_tape(integer_tape_pointer)
          OpenAD_Symbol_22 = 1
          DO WHILE(INT(OpenAD_Symbol_22) .LE. INT(OpenAD_Symbol_21))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_23 = integer_tape(integer_tape_pointer)
            OpenAD_Symbol_24 = 1
            DO WHILE(INT(OpenAD_Symbol_24) .LE. INT(OpenAD_Symbol_23))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_25 = integer_tape(integer_tape_pointer)
              IF(OpenAD_Symbol_25 .ne. 0) THEN
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_48 = double_tape(double_tape_pointer)
          OpenAD_Symbol_13%d = OpenAD_Symbol_13%d+Y(1)%d*OpenAD_Symbol_4
     +8
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_49 = double_tape(double_tape_pointer)
          OpenAD_Symbol_11%d = OpenAD_Symbol_11%d+Y(1)%d*OpenAD_Symbol_4
     +9
          Y(1)%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_11%d
          OpenAD_Symbol_11%d = 0.0d0
          Y(1)%d = Y(1)%d+OpenAD_Symbol_13%d
          OpenAD_Symbol_13%d = 0.0d0
              ENDIF
          if (iaddr(Y(1)) .ne. iaddr(OpenAD_Symbol_9)) then
            OpenAD_Symbol_9%d = OpenAD_Symbol_9%d+Y(1)%d
            Y(1)%d = 0
          end if
          X(1)%d = X(1)%d+OpenAD_Symbol_9%d
          OpenAD_Symbol_9%d = 0.0d0
              OpenAD_Symbol_24 = INT(OpenAD_Symbol_24) + 1
            END DO
          if (iaddr(Y(1)) .ne. iaddr(OpenAD_Symbol_8)) then
            OpenAD_Symbol_8%d = OpenAD_Symbol_8%d+Y(1)%d
            Y(1)%d = 0
          end if
          X(1)%d = X(1)%d+OpenAD_Symbol_8%d
          OpenAD_Symbol_8%d = 0.0d0
            OpenAD_Symbol_22 = INT(OpenAD_Symbol_22) + 1
          END DO
          if (iaddr(Y(1)) .ne. iaddr(OpenAD_Symbol_7)) then
            OpenAD_Symbol_7%d = OpenAD_Symbol_7%d+Y(1)%d
            Y(1)%d = 0
          end if
          X(1)%d = X(1)%d+OpenAD_Symbol_7%d
          OpenAD_Symbol_7%d = 0.0d0
        ELSE
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_50 = double_tape(double_tape_pointer)
          OpenAD_Symbol_17%d = OpenAD_Symbol_17%d+Y(1)%d*OpenAD_Symbol_5
     +0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_51 = double_tape(double_tape_pointer)
          OpenAD_Symbol_15%d = OpenAD_Symbol_15%d+Y(1)%d*OpenAD_Symbol_5
     +1
          Y(1)%d = 0.0d0
          Y(1)%d = Y(1)%d+OpenAD_Symbol_15%d
          OpenAD_Symbol_15%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_17%d
          OpenAD_Symbol_17%d = 0.0d0
        ENDIF
          if (iaddr(Y(1)) .ne. iaddr(OpenAD_Symbol_6)) then
            OpenAD_Symbol_6%d = OpenAD_Symbol_6%d+Y(1)%d
            Y(1)%d = 0
          end if
          X(1)%d = X(1)%d+OpenAD_Symbol_6%d
          OpenAD_Symbol_6%d = 0.0d0
        OpenAD_Symbol_19 = INT(OpenAD_Symbol_19) + 1
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
        end subroutine head
