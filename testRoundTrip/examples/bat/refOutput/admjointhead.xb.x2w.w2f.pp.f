C ***********************************************************
C Fortran file translated from WHIRL Thu Dec 21 09:33:17 2006
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
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
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
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      type(active) :: OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      type(active) :: OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      type(active) :: OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      type(active) :: OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
      type(active) :: T3
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
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
          call cp_store_real_vector(X,size(X),theArgFStack,theArgFStacko
     +ffset,theArgFStackSize)
          end if 
          if (our_rev_mode%arg_restore) then
C            print*, " arg_restore", our_rev_mode
C restore arguments
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
      T1%v = (X(1)%v/X(2)%v)
      T2%v = (X(3)%v*X(4)%v)
      T3%v = (T1%v*T2%v)
      Y(1)%v = (T1%v*T3%v)
      Y(2)%v = (1.0D00/T3%v)
      Y(3)%v = SIN(T3%v)
      Y(4)%v = (T2%v*T3%v)
      
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
      OpenAD_Symbol_2 = (X(1)%v/X(2)%v)
      OpenAD_Symbol_0 = (INT(1 _w2f__i8)/X(2)%v)
      OpenAD_Symbol_1 = (-(X(1)%v/(X(2)%v*X(2)%v)))
      T1%v = OpenAD_Symbol_2
      OpenAD_Symbol_5 = (X(3)%v*X(4)%v)
      OpenAD_Symbol_3 = X(4)%v
      OpenAD_Symbol_4 = X(3)%v
      T2%v = OpenAD_Symbol_5
      OpenAD_Symbol_8 = (T1%v*T2%v)
      OpenAD_Symbol_6 = T2%v
      OpenAD_Symbol_7 = T1%v
      T3%v = OpenAD_Symbol_8
      OpenAD_Symbol_11 = (T1%v*T3%v)
      OpenAD_Symbol_9 = T3%v
      OpenAD_Symbol_10 = T1%v
      Y(1)%v = OpenAD_Symbol_11
      OpenAD_Symbol_14 = (1.0D00/T3%v)
      OpenAD_Symbol_13 = (-(1.0D00/(T3%v*T3%v)))
      Y(2)%v = OpenAD_Symbol_14
      OpenAD_Symbol_16 = SIN(T3%v)
      OpenAD_Symbol_15 = COS(T3%v)
      Y(3)%v = OpenAD_Symbol_16
      OpenAD_Symbol_19 = (T2%v*T3%v)
      OpenAD_Symbol_17 = T3%v
      OpenAD_Symbol_18 = T2%v
      Y(4)%v = OpenAD_Symbol_19
      OpenAD_Symbol_20 = (OpenAD_Symbol_0 * OpenAD_Symbol_6)
      OpenAD_Symbol_21 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_22 = (OpenAD_Symbol_1 * OpenAD_Symbol_6)
      OpenAD_Symbol_23 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_24 = (OpenAD_Symbol_3 * OpenAD_Symbol_7)
      OpenAD_Symbol_25 = (OpenAD_Symbol_3 * OpenAD_Symbol_17)
      OpenAD_Symbol_26 = (OpenAD_Symbol_4 * OpenAD_Symbol_7)
      OpenAD_Symbol_27 = (OpenAD_Symbol_4 * OpenAD_Symbol_17)
      OpenAD_Symbol_28 = (OpenAD_Symbol_21 + OpenAD_Symbol_20 *  OpenAD_
     +Symbol_10)
      OpenAD_Symbol_30 = (OpenAD_Symbol_20 * OpenAD_Symbol_13)
      OpenAD_Symbol_31 = (OpenAD_Symbol_20 * OpenAD_Symbol_15)
      OpenAD_Symbol_32 = (OpenAD_Symbol_20 * OpenAD_Symbol_18)
      OpenAD_Symbol_33 = (OpenAD_Symbol_23 + OpenAD_Symbol_22 *  OpenAD_
     +Symbol_10)
      OpenAD_Symbol_35 = (OpenAD_Symbol_22 * OpenAD_Symbol_13)
      OpenAD_Symbol_36 = (OpenAD_Symbol_22 * OpenAD_Symbol_15)
      OpenAD_Symbol_37 = (OpenAD_Symbol_22 * OpenAD_Symbol_18)
      OpenAD_Symbol_38 = (OpenAD_Symbol_24 * OpenAD_Symbol_10)
      OpenAD_Symbol_40 = (OpenAD_Symbol_24 * OpenAD_Symbol_13)
      OpenAD_Symbol_41 = (OpenAD_Symbol_24 * OpenAD_Symbol_15)
      OpenAD_Symbol_42 = (OpenAD_Symbol_25 + OpenAD_Symbol_24 *  OpenAD_
     +Symbol_18)
      OpenAD_Symbol_43 = (OpenAD_Symbol_26 * OpenAD_Symbol_10)
      OpenAD_Symbol_45 = (OpenAD_Symbol_26 * OpenAD_Symbol_13)
      OpenAD_Symbol_46 = (OpenAD_Symbol_26 * OpenAD_Symbol_15)
      OpenAD_Symbol_47 = (OpenAD_Symbol_27 + OpenAD_Symbol_26 *  OpenAD_
     +Symbol_18)
          double_tape(double_tape_pointer) = OpenAD_Symbol_28
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_30
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_31
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_32
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_33
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_35
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_36
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_37
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_38
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_40
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_41
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_42
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_43
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_45
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_46
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_47
          double_tape_pointer = double_tape_pointer+1
      
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
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_48 = double_tape(double_tape_pointer)
          OpenAD_Symbol_44%d = OpenAD_Symbol_44%d+Y(4)%d*OpenAD_Symbol_4
     +8
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_49 = double_tape(double_tape_pointer)
          OpenAD_Symbol_44%d = OpenAD_Symbol_44%d+Y(3)%d*OpenAD_Symbol_4
     +9
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_50 = double_tape(double_tape_pointer)
          OpenAD_Symbol_44%d = OpenAD_Symbol_44%d+Y(2)%d*OpenAD_Symbol_5
     +0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_51 = double_tape(double_tape_pointer)
          OpenAD_Symbol_44%d = OpenAD_Symbol_44%d+Y(1)%d*OpenAD_Symbol_5
     +1
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_52 = double_tape(double_tape_pointer)
          OpenAD_Symbol_39%d = OpenAD_Symbol_39%d+Y(4)%d*OpenAD_Symbol_5
     +2
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_53 = double_tape(double_tape_pointer)
          OpenAD_Symbol_39%d = OpenAD_Symbol_39%d+Y(3)%d*OpenAD_Symbol_5
     +3
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_54 = double_tape(double_tape_pointer)
          OpenAD_Symbol_39%d = OpenAD_Symbol_39%d+Y(2)%d*OpenAD_Symbol_5
     +4
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_55 = double_tape(double_tape_pointer)
          OpenAD_Symbol_39%d = OpenAD_Symbol_39%d+Y(1)%d*OpenAD_Symbol_5
     +5
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_56 = double_tape(double_tape_pointer)
          OpenAD_Symbol_34%d = OpenAD_Symbol_34%d+Y(4)%d*OpenAD_Symbol_5
     +6
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_57 = double_tape(double_tape_pointer)
          OpenAD_Symbol_34%d = OpenAD_Symbol_34%d+Y(3)%d*OpenAD_Symbol_5
     +7
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_58 = double_tape(double_tape_pointer)
          OpenAD_Symbol_34%d = OpenAD_Symbol_34%d+Y(2)%d*OpenAD_Symbol_5
     +8
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_59 = double_tape(double_tape_pointer)
          OpenAD_Symbol_34%d = OpenAD_Symbol_34%d+Y(1)%d*OpenAD_Symbol_5
     +9
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_60 = double_tape(double_tape_pointer)
          OpenAD_Symbol_29%d = OpenAD_Symbol_29%d+Y(4)%d*OpenAD_Symbol_6
     +0
          Y(4)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_61 = double_tape(double_tape_pointer)
          OpenAD_Symbol_29%d = OpenAD_Symbol_29%d+Y(3)%d*OpenAD_Symbol_6
     +1
          Y(3)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_62 = double_tape(double_tape_pointer)
          OpenAD_Symbol_29%d = OpenAD_Symbol_29%d+Y(2)%d*OpenAD_Symbol_6
     +2
          Y(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_63 = double_tape(double_tape_pointer)
          OpenAD_Symbol_29%d = OpenAD_Symbol_29%d+Y(1)%d*OpenAD_Symbol_6
     +3
          Y(1)%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_29%d
          OpenAD_Symbol_29%d = 0.0d0
          X(2)%d = X(2)%d+OpenAD_Symbol_34%d
          OpenAD_Symbol_34%d = 0.0d0
          X(3)%d = X(3)%d+OpenAD_Symbol_39%d
          OpenAD_Symbol_39%d = 0.0d0
          X(4)%d = X(4)%d+OpenAD_Symbol_44%d
          OpenAD_Symbol_44%d = 0.0d0
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
