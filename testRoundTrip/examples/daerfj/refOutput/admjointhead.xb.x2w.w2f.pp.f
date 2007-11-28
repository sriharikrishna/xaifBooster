
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
       subroutine head(X,FVEC)
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
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      type(active) :: OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      type(active) :: OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      type(active) :: OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      type(active) :: OpenAD_Symbol_35
      INTEGER(w2f__i8) OpenAD_Symbol_36
      INTEGER(w2f__i8) OpenAD_Symbol_37
      INTEGER(w2f__i8) OpenAD_Symbol_38
      INTEGER(w2f__i8) OpenAD_Symbol_39
      INTEGER(w2f__i8) OpenAD_Symbol_40
      INTEGER(w2f__i8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: FVEC(1 : 11)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      type(active) :: TEMP1
      type(active) :: TEMP2
      REAL(w2f__8) V(1 : 11)
      REAL(w2f__8) Y(1 : 11)
      INTEGER(w2f__i8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      INTEGER(w2f__i8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      INTEGER(w2f__i8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      INTEGER(w2f__i8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(FVEC)
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
      V(1) = 4.0D00
      V(2) = 2.0D00
      V(3) = 1.0D00
      V(4) = 5.0D-01
      V(5) = 2.5D-01
      V(6) = 1.67000000000000009548D-01
      V(7) = 1.25D-01
      V(8) = 1.00000000000000005551D-01
      V(9) = 8.32999999999999990452D-02
      V(10) = 7.14000000000000051292D-02
      V(11) = 6.25D-02
      Y(1) = 1.95700000000000012834D-01
      Y(2) = 1.94700000000000011946D-01
      Y(3) = 1.73499999999999987566D-01
      Y(4) = 1.60000000000000003331D-01
      Y(5) = 8.44000000000000027978D-02
      Y(6) = 6.27000000000000057288D-02
      Y(7) = 4.56000000000000016431D-02
      Y(8) = 3.42000000000000012323D-02
      Y(9) = 3.23000000000000023204D-02
      Y(10) = 2.35000000000000000555D-02
      Y(11) = 2.46000000000000003386D-02
      DO I = 1, 11, 1
        TEMP1%v = (V(I)*(X(2)%v+V(I)))
        TEMP2%v = (X(4)%v+V(I)*(X(3)%v+V(I)))
        FVEC(INT(I))%v = (Y(I)-((X(1)%v*TEMP1%v)/TEMP2%v))
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
      V(1) = 4.0D00
      V(2) = 2.0D00
      V(3) = 1.0D00
      V(4) = 5.0D-01
      V(5) = 2.5D-01
      V(6) = 1.67000000000000009548D-01
      V(7) = 1.25D-01
      V(8) = 1.00000000000000005551D-01
      V(9) = 8.32999999999999990452D-02
      V(10) = 7.14000000000000051292D-02
      V(11) = 6.25D-02
      Y(1) = 1.95700000000000012834D-01
      Y(2) = 1.94700000000000011946D-01
      Y(3) = 1.73499999999999987566D-01
      Y(4) = 1.60000000000000003331D-01
      Y(5) = 8.44000000000000027978D-02
      Y(6) = 6.27000000000000057288D-02
      Y(7) = 4.56000000000000016431D-02
      Y(8) = 3.42000000000000012323D-02
      Y(9) = 3.23000000000000023204D-02
      Y(10) = 2.35000000000000000555D-02
      Y(11) = 2.46000000000000003386D-02
      OpenAD_Symbol_38 = 0_w2f__i8
      DO I = 1, 11, 1
        OpenAD_Symbol_0 = (X(2)%v+V(I))
        OpenAD_Symbol_5 = (V(I) * OpenAD_Symbol_0)
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_2 = V(I)
        TEMP1%v = OpenAD_Symbol_5
        OpenAD_Symbol_8 = (X(3)%v+V(I))
        OpenAD_Symbol_13 = (X(4)%v+V(I)*OpenAD_Symbol_8)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_11 = 1_w2f__i8
        OpenAD_Symbol_10 = V(I)
        OpenAD_Symbol_7 = 1_w2f__i8
        TEMP2%v = OpenAD_Symbol_13
        OpenAD_Symbol_16 = (X(1)%v*TEMP1%v)
        OpenAD_Symbol_21 = (Y(I)-(OpenAD_Symbol_16/TEMP2%v))
        OpenAD_Symbol_19 = TEMP1%v
        OpenAD_Symbol_20 = X(1)%v
        OpenAD_Symbol_17 = (INT(1 _w2f__i8)/TEMP2%v)
        OpenAD_Symbol_18 = (-(OpenAD_Symbol_16/(TEMP2%v*TEMP2%v)))
        OpenAD_Symbol_15 = (-1_w2f__i8)
        FVEC(INT(I))%v = OpenAD_Symbol_21
        OpenAD_Symbol_22 = (OpenAD_Symbol_17 * OpenAD_Symbol_15)
        OpenAD_Symbol_23 = (OpenAD_Symbol_18 * OpenAD_Symbol_15)
        OpenAD_Symbol_24 = (OpenAD_Symbol_6 * OpenAD_Symbol_23)
        OpenAD_Symbol_26 = (OpenAD_Symbol_7 * OpenAD_Symbol_23)
        OpenAD_Symbol_27 = (OpenAD_Symbol_19 * OpenAD_Symbol_22)
        OpenAD_Symbol_29 = (OpenAD_Symbol_20 * OpenAD_Symbol_22)
        OpenAD_Symbol_30 = (OpenAD_Symbol_10 * OpenAD_Symbol_26)
        OpenAD_Symbol_31 = (OpenAD_Symbol_2 * OpenAD_Symbol_29)
        OpenAD_Symbol_32 = (OpenAD_Symbol_11 * OpenAD_Symbol_30)
        OpenAD_Symbol_34 = (OpenAD_Symbol_3 * OpenAD_Symbol_31)
          double_tape(double_tape_pointer) = OpenAD_Symbol_24
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_27
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_32
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_34
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_38 = (INT(OpenAD_Symbol_38) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_38
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
          OpenAD_Symbol_36 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_37 = 1
      DO WHILE(INT(OpenAD_Symbol_37) .LE. INT(OpenAD_Symbol_36))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_42 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_43 = double_tape(double_tape_pointer)
          OpenAD_Symbol_35%d = OpenAD_Symbol_35%d+FVEC(INT(OpenAD_Symbol
     +_42))%d*OpenAD_Symbol_43
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_44 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_45 = double_tape(double_tape_pointer)
          OpenAD_Symbol_33%d = OpenAD_Symbol_33%d+FVEC(INT(OpenAD_Symbol
     +_44))%d*OpenAD_Symbol_45
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_46 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_47 = double_tape(double_tape_pointer)
          OpenAD_Symbol_28%d = OpenAD_Symbol_28%d+FVEC(INT(OpenAD_Symbol
     +_46))%d*OpenAD_Symbol_47
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_48 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_49 = double_tape(double_tape_pointer)
          OpenAD_Symbol_25%d = OpenAD_Symbol_25%d+FVEC(INT(OpenAD_Symbol
     +_48))%d*OpenAD_Symbol_49
          FVEC(INT(OpenAD_Symbol_48))%d = 0.0d0
          X(4)%d = X(4)%d+OpenAD_Symbol_25%d
          OpenAD_Symbol_25%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_28%d
          OpenAD_Symbol_28%d = 0.0d0
          X(3)%d = X(3)%d+OpenAD_Symbol_33%d
          OpenAD_Symbol_33%d = 0.0d0
          X(2)%d = X(2)%d+OpenAD_Symbol_35%d
          OpenAD_Symbol_35%d = 0.0d0
        OpenAD_Symbol_37 = INT(OpenAD_Symbol_37) + 1
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
