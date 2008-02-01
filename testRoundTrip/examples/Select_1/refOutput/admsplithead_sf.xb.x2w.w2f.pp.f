
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
      INTEGER(w2f__i8) OpenAD_Symbol_10
      INTEGER(w2f__i8) OpenAD_Symbol_11
      INTEGER(w2f__i8) OpenAD_Symbol_12
      INTEGER(w2f__i8) OpenAD_Symbol_13
      INTEGER(w2f__i8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      INTEGER(w2f__i8) OpenAD_Symbol_7
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
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
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
      I = 1
      Y(1)%v = 2.0
      IF ( I  .EQ.  1)  GO TO  4
      IF ( I  .EQ.  2)  GO TO  8
      GO TO 9
9     CONTINUE
      Y(1)%v = X(1)%v
      GO TO 6
4     CONTINUE
      Y(1)%v = X(1)%v
      GO TO 6
8     CONTINUE
      Y(1)%v = X(1)%v
      GO TO 6
6     CONTINUE
      Y(1)%v = (Y(1)%v*Y(1)%v)
          end if
          if (our_rev_mode%tape) then
! taping
C$OPENAD XXX Template ad_template.f
      I = 1
      Y(1)%v = 2.0
      IF ( I  .EQ.  1)  GO TO  40
      IF ( I  .EQ.  2)  GO TO  44
      GO TO 45
45    CONTINUE
      Y(1)%v = X(1)%v
      OpenAD_Symbol_10 = 3_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_10
          integer_tape_pointer = integer_tape_pointer+1
      GO TO 49
40    CONTINUE
      Y(1)%v = X(1)%v
      OpenAD_Symbol_8 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_8
          integer_tape_pointer = integer_tape_pointer+1
      GO TO 49
44    CONTINUE
      Y(1)%v = X(1)%v
      OpenAD_Symbol_9 = 2_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_9
          integer_tape_pointer = integer_tape_pointer+1
      GO TO 49
49    CONTINUE
      OpenAD_Symbol_2 = (Y(1)%v*Y(1)%v)
      OpenAD_Symbol_0 = Y(1)%v
      OpenAD_Symbol_1 = Y(1)%v
      Y(1)%v = OpenAD_Symbol_2
      OpenAD_Symbol_3 = OpenAD_Symbol_0
      OpenAD_Symbol_5 = OpenAD_Symbol_1
          double_tape(double_tape_pointer) = OpenAD_Symbol_3
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_5
          double_tape_pointer = double_tape_pointer+1
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_15 = double_tape(double_tape_pointer)
          OpenAD_Symbol_6%d = OpenAD_Symbol_6%d+Y(1)%d*OpenAD_Symbol_15
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_16 = double_tape(double_tape_pointer)
          OpenAD_Symbol_4%d = OpenAD_Symbol_4%d+Y(1)%d*OpenAD_Symbol_16
          Y(1)%d = 0.0d0
          Y(1)%d = Y(1)%d+OpenAD_Symbol_4%d
          OpenAD_Symbol_4%d = 0.0d0
          Y(1)%d = Y(1)%d+OpenAD_Symbol_6%d
          OpenAD_Symbol_6%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_7 = integer_tape(integer_tape_pointer)
      IF ( OpenAD_Symbol_7  .EQ.  1)  GO TO  94
      IF ( OpenAD_Symbol_7  .EQ.  2)  GO TO  93
      IF ( OpenAD_Symbol_7  .EQ.  3)  GO TO  92
94    CONTINUE
          X(1)%d = X(1)%d+Y(1)%d
          Y(1)%d = 0.0d0
      GO TO 96
93    CONTINUE
          X(1)%d = X(1)%d+Y(1)%d
          Y(1)%d = 0.0d0
      GO TO 96
92    CONTINUE
          X(1)%d = X(1)%d+Y(1)%d
          Y(1)%d = 0.0d0
      GO TO 96
96    CONTINUE
          Y(1)%d = 0.0d0
          end if 
        end subroutine head
