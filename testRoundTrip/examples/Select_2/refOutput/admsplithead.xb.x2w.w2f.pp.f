C ***********************************************************
C Fortran file translated from WHIRL Fri Jul 21 11:22:24 2006
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
          use OpenAD_tape
          use OpenAD_rev

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
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      type(active) :: OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      INTEGER(w2f__i8) OpenAD_Symbol_14
      INTEGER(w2f__i8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_16
      INTEGER(w2f__i8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 3)
      type(active) :: Y(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) select_expr_temp_0
      INTEGER(w2f__i8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_22
      INTEGER(w2f__i8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_25
      INTEGER(w2f__i8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_28
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
C$OPENAD XXX Template ad_template.f
      DO I = 1, 3, 1
        select_expr_temp_0 = I
        IF ( select_expr_temp_0  .EQ.  1)  GO TO  19
        IF ( select_expr_temp_0  .EQ.  2)  GO TO  23
        GO TO 24
24      CONTINUE
        Y(INT(I))%v = (X(I)%v*2.0D00)
        GO TO 21
19      CONTINUE
        Y(INT(I))%v = SIN(X(I)%v)
        GO TO 21
23      CONTINUE
        Y(INT(I))%v = COS(X(I)%v)
        GO TO 21
21      CONTINUE
      END DO
      
          end if
          if (our_rev_mode%tape) then
! taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_16 = 0_w2f__i8
      DO I = 1, 3, 1
        select_expr_temp_0 = I
        IF ( select_expr_temp_0  .EQ.  1)  GO TO  98
        IF ( select_expr_temp_0  .EQ.  2)  GO TO  93
        GO TO 85
85      CONTINUE
        OpenAD_Symbol_6 = (X(I)%v*2.0D00)
        OpenAD_Symbol_4 = 2.0D00
        Y(INT(I))%v = OpenAD_Symbol_6
        OpenAD_Symbol_11 = OpenAD_Symbol_4
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_11
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_19 = 3_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_19
          integer_tape_pointer = integer_tape_pointer+1
        GO TO 91
98      CONTINUE
        OpenAD_Symbol_1 = SIN(X(I)%v)
        OpenAD_Symbol_0 = COS(X(I)%v)
        Y(INT(I))%v = OpenAD_Symbol_1
        OpenAD_Symbol_7 = OpenAD_Symbol_0
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_7
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_17 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_17
          integer_tape_pointer = integer_tape_pointer+1
        GO TO 91
93      CONTINUE
        OpenAD_Symbol_3 = COS(X(I)%v)
        OpenAD_Symbol_2 = (-SIN(X(I)%v))
        Y(INT(I))%v = OpenAD_Symbol_3
        OpenAD_Symbol_9 = OpenAD_Symbol_2
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_9
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = I
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_18 = 2_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_18
          integer_tape_pointer = integer_tape_pointer+1
        GO TO 91
91      CONTINUE
        OpenAD_Symbol_16 = (INT(OpenAD_Symbol_16) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_16
          integer_tape_pointer = integer_tape_pointer+1
      
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_13 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_14 = 1
      DO WHILE(INT(OpenAD_Symbol_14) .LE. INT(OpenAD_Symbol_13))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_15 = integer_tape(integer_tape_pointer)
        IF ( OpenAD_Symbol_15  .EQ.  1)  GO TO  183
        IF ( OpenAD_Symbol_15  .EQ.  2)  GO TO  182
        IF ( OpenAD_Symbol_15  .EQ.  3)  GO TO  181
183     CONTINUE
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_20 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_21 = double_tape(double_tape_pointer)
          OpenAD_Symbol_8%d = OpenAD_Symbol_8%d+Y(INT(OpenAD_Symbol_20))
     +%d*OpenAD_Symbol_21
          Y(INT(OpenAD_Symbol_20))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_22 = integer_tape(integer_tape_pointer)
          X(INT(OpenAD_Symbol_22))%d = X(INT(OpenAD_Symbol_22))%d+OpenAD
     +_Symbol_8%d
          OpenAD_Symbol_8%d = 0.0d0
        GO TO 185
182     CONTINUE
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_23 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_24 = double_tape(double_tape_pointer)
          OpenAD_Symbol_10%d = OpenAD_Symbol_10%d+Y(INT(OpenAD_Symbol_23
     +))%d*OpenAD_Symbol_24
          Y(INT(OpenAD_Symbol_23))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_25 = integer_tape(integer_tape_pointer)
          X(INT(OpenAD_Symbol_25))%d = X(INT(OpenAD_Symbol_25))%d+OpenAD
     +_Symbol_10%d
          OpenAD_Symbol_10%d = 0.0d0
        GO TO 185
181     CONTINUE
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_26 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_27 = double_tape(double_tape_pointer)
          OpenAD_Symbol_12%d = OpenAD_Symbol_12%d+Y(INT(OpenAD_Symbol_26
     +))%d*OpenAD_Symbol_27
          Y(INT(OpenAD_Symbol_26))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_28 = integer_tape(integer_tape_pointer)
          X(INT(OpenAD_Symbol_28))%d = X(INT(OpenAD_Symbol_28))%d+OpenAD
     +_Symbol_12%d
          OpenAD_Symbol_12%d = 0.0d0
        GO TO 185
        OpenAD_Symbol_14 = INT(OpenAD_Symbol_14) + 1
185     CONTINUE
      END DO
          end if 
        end subroutine head
