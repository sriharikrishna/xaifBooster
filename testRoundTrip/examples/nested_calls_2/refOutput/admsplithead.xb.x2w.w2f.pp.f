C ***********************************************************
C Fortran file translated from WHIRL Mon Jul 23 11:18:41 2007
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
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      type(active) :: OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      type(active) :: OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      type(active) :: OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
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
      CALL foo(X(1),X(2),Y(1))
      CALL foo(X(1),X(2),Y(1))
      Y(2)%v = SIN(X(1)%v*X(2)%v)
      Y(3)%v = SIN(X(3)%v)
      Y(4)%v = COS(X(4)%v)
      
          end if
          if (our_rev_mode%tape) then
! taping
C$OPENAD XXX Template ad_template.f
      CALL foo(X(1),X(2),Y(1))
      CALL foo(X(1),X(2),Y(1))
      OpenAD_Symbol_0 = (X(1)%v*X(2)%v)
      OpenAD_Symbol_4 = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = X(2)%v
      OpenAD_Symbol_3 = X(1)%v
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      Y(2)%v = OpenAD_Symbol_4
      OpenAD_Symbol_6 = SIN(X(3)%v)
      OpenAD_Symbol_5 = COS(X(3)%v)
      Y(3)%v = OpenAD_Symbol_6
      OpenAD_Symbol_8 = COS(X(4)%v)
      OpenAD_Symbol_7 = (-SIN(X(4)%v))
      Y(4)%v = OpenAD_Symbol_8
      OpenAD_Symbol_19 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      OpenAD_Symbol_21 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      OpenAD_Symbol_23 = OpenAD_Symbol_5
      OpenAD_Symbol_25 = OpenAD_Symbol_7
          double_tape(double_tape_pointer) = OpenAD_Symbol_19
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_21
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_23
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_25
          double_tape_pointer = double_tape_pointer+1
      
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_35 = double_tape(double_tape_pointer)
          OpenAD_Symbol_26%d = OpenAD_Symbol_26%d+Y(4)%d*OpenAD_Symbol_3
     +5
          Y(4)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_36 = double_tape(double_tape_pointer)
          OpenAD_Symbol_24%d = OpenAD_Symbol_24%d+Y(3)%d*OpenAD_Symbol_3
     +6
          Y(3)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_37 = double_tape(double_tape_pointer)
          OpenAD_Symbol_22%d = OpenAD_Symbol_22%d+Y(2)%d*OpenAD_Symbol_3
     +7
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_38 = double_tape(double_tape_pointer)
          OpenAD_Symbol_20%d = OpenAD_Symbol_20%d+Y(2)%d*OpenAD_Symbol_3
     +8
          Y(2)%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_20%d
          OpenAD_Symbol_20%d = 0.0d0
          X(2)%d = X(2)%d+OpenAD_Symbol_22%d
          OpenAD_Symbol_22%d = 0.0d0
          X(3)%d = X(3)%d+OpenAD_Symbol_24%d
          OpenAD_Symbol_24%d = 0.0d0
          X(4)%d = X(4)%d+OpenAD_Symbol_26%d
          OpenAD_Symbol_26%d = 0.0d0
      CALL foo(X(1),X(2),Y(1))
      CALL foo(X(1),X(2),Y(1))
          end if 
        end subroutine head
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
       subroutine foo(A,B,C)
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
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_27
      type(active) :: OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      type(active) :: OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: A
      type(active) :: B
      type(active) :: C
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
C
C     **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
C$OPENAD XXX Template ad_template.f
      CALL bar(B)
      C%v = (B%v+A%v*A%v)
      
          end if
          if (our_rev_mode%tape) then
! taping
C$OPENAD XXX Template ad_template.f
      CALL bar(B)
      OpenAD_Symbol_13 = (B%v+A%v*A%v)
      OpenAD_Symbol_9 = 1_w2f__i8
      OpenAD_Symbol_11 = A%v
      OpenAD_Symbol_12 = A%v
      OpenAD_Symbol_10 = 1_w2f__i8
      C%v = OpenAD_Symbol_13
      OpenAD_Symbol_27 = (OpenAD_Symbol_11 * OpenAD_Symbol_10)
      OpenAD_Symbol_29 = (OpenAD_Symbol_12 * OpenAD_Symbol_10)
      OpenAD_Symbol_30 = OpenAD_Symbol_9
          double_tape(double_tape_pointer) = OpenAD_Symbol_27
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_29
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_30
          double_tape_pointer = double_tape_pointer+1
      
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_39 = double_tape(double_tape_pointer)
          OpenAD_Symbol_31%d = OpenAD_Symbol_31%d+C%d*OpenAD_Symbol_39
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_40 = double_tape(double_tape_pointer)
          OpenAD_Symbol_28%d = OpenAD_Symbol_28%d+C%d*OpenAD_Symbol_40
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_41 = double_tape(double_tape_pointer)
          OpenAD_Symbol_28%d = OpenAD_Symbol_28%d+C%d*OpenAD_Symbol_41
          C%d = 0.0d0
          A%d = A%d+OpenAD_Symbol_28%d
          OpenAD_Symbol_28%d = 0.0d0
          B%d = B%d+OpenAD_Symbol_31%d
          OpenAD_Symbol_31%d = 0.0d0
      CALL bar(B)
          end if 
        end subroutine foo
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
       subroutine bar(A)
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
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_32
      type(active) :: OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
C
C     **** Parameters and Result ****
C
      type(active) :: A
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
C
C     **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
C$OPENAD XXX Template ad_template.f
      A%v = COS(A%v*A%v)
      
          end if
          if (our_rev_mode%tape) then
! taping
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_14 = (A%v*A%v)
      OpenAD_Symbol_18 = COS(OpenAD_Symbol_14)
      OpenAD_Symbol_16 = A%v
      OpenAD_Symbol_17 = A%v
      OpenAD_Symbol_15 = (- SIN(OpenAD_Symbol_14))
      A%v = OpenAD_Symbol_18
      OpenAD_Symbol_32 = (OpenAD_Symbol_16 * OpenAD_Symbol_15)
      OpenAD_Symbol_34 = (OpenAD_Symbol_17 * OpenAD_Symbol_15)
          double_tape(double_tape_pointer) = OpenAD_Symbol_32
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_34
          double_tape_pointer = double_tape_pointer+1
      
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_42 = double_tape(double_tape_pointer)
          OpenAD_Symbol_33%d = OpenAD_Symbol_33%d+A%d*OpenAD_Symbol_42
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_43 = double_tape(double_tape_pointer)
          OpenAD_Symbol_33%d = OpenAD_Symbol_33%d+A%d*OpenAD_Symbol_43
          A%d = 0.0d0
          A%d = A%d+OpenAD_Symbol_33%d
          OpenAD_Symbol_33%d = 0.0d0
          end if 
        end subroutine bar
