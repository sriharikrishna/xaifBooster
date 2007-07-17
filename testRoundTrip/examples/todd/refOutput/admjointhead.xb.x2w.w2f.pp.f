C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 14:02:52 2007
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
       subroutine head(X,OBJ)
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
      type(active) :: OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      type(active) :: OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      type(active) :: OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      type(active) :: OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      type(active) :: OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      type(active) :: OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      type(active) :: OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      type(active) :: OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      type(active) :: OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      type(active) :: OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      type(active) :: OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      type(active) :: OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      type(active) :: OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      type(active) :: OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      type(active) :: OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      type(active) :: OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      type(active) :: OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      type(active) :: OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      type(active) :: OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      type(active) :: OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      type(active) :: OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 6)
      type(active) :: OBJ(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) A
      REAL(w2f__8) D00
      type(active) :: D03
      REAL(w2f__8) D11
      type(active) :: D12
      type(active) :: F
      type(active) :: G
      type(active) :: LOC1
      type(active) :: M00
      type(active) :: M03
      type(active) :: M11
      type(active) :: M12
      type(active) :: M22
      type(active) :: M33
      type(active) :: MATR(0 : 3)
      REAL(w2f__8) SQRT3
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_140
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(OBJ)
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
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      MATR(0)%v = (X(2)%v-X(1)%v)
      MATR(1)%v = (SQRT3*(X(3)%v*2.0D00-X(2)%v-X(1)%v))
      MATR(2)%v = (X(5)%v-X(4)%v)
      MATR(3)%v = (SQRT3*(X(6)%v*2.0D00-X(5)%v-X(4)%v))
      M03%v = (MATR(0)%v*MATR(3)%v)
      M12%v = (MATR(1)%v*MATR(2)%v)
      G%v = (M03%v-M12%v)
      D00 = (M03%v*2.0D00)
      D11 = (M12%v*2.0D00)
      M00%v = (MATR(0)%v*MATR(0)%v)
      M11%v = (MATR(1)%v*MATR(1)%v)
      M22%v = (MATR(2)%v*MATR(2)%v)
      M33%v = (MATR(3)%v*MATR(3)%v)
      D12%v = (M00%v*M33%v)
      D03%v = (M11%v*M22%v)
      F%v = (D03%v+D12%v)
      LOC1%v = (A*(1.0D00/G%v))
      OBJ(1)%v = (F%v*LOC1%v)
      
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
      A = 5.0D-01
      SQRT3 = 5.77350258827209472656D-01
      MATR(0)%v = (X(2)%v-X(1)%v)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (X(3)%v*2.0D00-X(2)%v-X(1)%v)
      OpenAD_Symbol_11 = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      MATR(1)%v = OpenAD_Symbol_11
      MATR(2)%v = (X(5)%v-X(4)%v)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = (-1_w2f__i8)
      OpenAD_Symbol_14 = (X(6)%v*2.0D00-X(5)%v-X(4)%v)
      OpenAD_Symbol_23 = (SQRT3 * OpenAD_Symbol_14)
      OpenAD_Symbol_21 = 2.0D00
      OpenAD_Symbol_19 = 1_w2f__i8
      OpenAD_Symbol_20 = (-1_w2f__i8)
      OpenAD_Symbol_17 = 1_w2f__i8
      OpenAD_Symbol_18 = (-1_w2f__i8)
      OpenAD_Symbol_16 = SQRT3
      MATR(3)%v = OpenAD_Symbol_23
      OpenAD_Symbol_61 = (OpenAD_Symbol_17 * OpenAD_Symbol_16)
      OpenAD_Symbol_62 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
      OpenAD_Symbol_64 = (OpenAD_Symbol_5 * OpenAD_Symbol_4)
      OpenAD_Symbol_65 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_67 = (OpenAD_Symbol_19 * OpenAD_Symbol_61)
      OpenAD_Symbol_68 = (OpenAD_Symbol_20 * OpenAD_Symbol_61)
      OpenAD_Symbol_70 = (OpenAD_Symbol_7 * OpenAD_Symbol_64)
      OpenAD_Symbol_71 = (OpenAD_Symbol_8 * OpenAD_Symbol_64)
      OpenAD_Symbol_73 = (OpenAD_Symbol_21 * OpenAD_Symbol_67)
      OpenAD_Symbol_75 = (OpenAD_Symbol_9 * OpenAD_Symbol_70)
      OpenAD_Symbol_77 = OpenAD_Symbol_0
      OpenAD_Symbol_79 = OpenAD_Symbol_1
      OpenAD_Symbol_81 = OpenAD_Symbol_12
      OpenAD_Symbol_83 = OpenAD_Symbol_13
          double_tape(double_tape_pointer) = OpenAD_Symbol_62
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_65
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_68
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_71
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_73
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_75
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_77
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_79
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_81
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_83
          double_tape_pointer = double_tape_pointer+1
      OpenAD_Symbol_26 = (MATR(0)%v*MATR(3)%v)
      OpenAD_Symbol_24 = MATR(3)%v
      OpenAD_Symbol_25 = MATR(0)%v
      M03%v = OpenAD_Symbol_26
      OpenAD_Symbol_29 = (MATR(1)%v*MATR(2)%v)
      OpenAD_Symbol_27 = MATR(2)%v
      OpenAD_Symbol_28 = MATR(1)%v
      M12%v = OpenAD_Symbol_29
      G%v = (M03%v-M12%v)
      OpenAD_Symbol_30 = 1_w2f__i8
      OpenAD_Symbol_31 = (-1_w2f__i8)
      D00 = (M03%v*2.0D00)
      D11 = (M12%v*2.0D00)
      OpenAD_Symbol_34 = (MATR(0)%v*MATR(0)%v)
      OpenAD_Symbol_32 = MATR(0)%v
      OpenAD_Symbol_33 = MATR(0)%v
      M00%v = OpenAD_Symbol_34
      OpenAD_Symbol_37 = (MATR(1)%v*MATR(1)%v)
      OpenAD_Symbol_35 = MATR(1)%v
      OpenAD_Symbol_36 = MATR(1)%v
      M11%v = OpenAD_Symbol_37
      OpenAD_Symbol_40 = (MATR(2)%v*MATR(2)%v)
      OpenAD_Symbol_38 = MATR(2)%v
      OpenAD_Symbol_39 = MATR(2)%v
      M22%v = OpenAD_Symbol_40
      OpenAD_Symbol_43 = (MATR(3)%v*MATR(3)%v)
      OpenAD_Symbol_41 = MATR(3)%v
      OpenAD_Symbol_42 = MATR(3)%v
      M33%v = OpenAD_Symbol_43
      OpenAD_Symbol_46 = (M00%v*M33%v)
      OpenAD_Symbol_44 = M33%v
      OpenAD_Symbol_45 = M00%v
      D12%v = OpenAD_Symbol_46
      OpenAD_Symbol_49 = (M11%v*M22%v)
      OpenAD_Symbol_47 = M22%v
      OpenAD_Symbol_48 = M11%v
      D03%v = OpenAD_Symbol_49
      F%v = (D03%v+D12%v)
      OpenAD_Symbol_50 = 1_w2f__i8
      OpenAD_Symbol_51 = 1_w2f__i8
      OpenAD_Symbol_52 = (1.0D00/G%v)
      OpenAD_Symbol_57 = (A * OpenAD_Symbol_52)
      OpenAD_Symbol_56 = (-(1.0D00/(G%v*G%v)))
      OpenAD_Symbol_54 = A
      LOC1%v = OpenAD_Symbol_57
      OpenAD_Symbol_60 = (F%v*LOC1%v)
      OpenAD_Symbol_58 = LOC1%v
      OpenAD_Symbol_59 = F%v
      OBJ(1)%v = OpenAD_Symbol_60
      OpenAD_Symbol_85 = (OpenAD_Symbol_50 * OpenAD_Symbol_58)
      OpenAD_Symbol_86 = (OpenAD_Symbol_51 * OpenAD_Symbol_58)
      OpenAD_Symbol_87 = (OpenAD_Symbol_47 * OpenAD_Symbol_85)
      OpenAD_Symbol_88 = (OpenAD_Symbol_48 * OpenAD_Symbol_85)
      OpenAD_Symbol_89 = (OpenAD_Symbol_44 * OpenAD_Symbol_86)
      OpenAD_Symbol_90 = (OpenAD_Symbol_45 * OpenAD_Symbol_86)
      OpenAD_Symbol_91 = (OpenAD_Symbol_41 * OpenAD_Symbol_90)
      OpenAD_Symbol_93 = (OpenAD_Symbol_42 * OpenAD_Symbol_90)
      OpenAD_Symbol_95 = (OpenAD_Symbol_38 * OpenAD_Symbol_88)
      OpenAD_Symbol_97 = (OpenAD_Symbol_39 * OpenAD_Symbol_88)
      OpenAD_Symbol_99 = (OpenAD_Symbol_35 * OpenAD_Symbol_87)
      OpenAD_Symbol_101 = (OpenAD_Symbol_36 * OpenAD_Symbol_87)
      OpenAD_Symbol_103 = (OpenAD_Symbol_32 * OpenAD_Symbol_89)
      OpenAD_Symbol_105 = (OpenAD_Symbol_33 * OpenAD_Symbol_89)
      OpenAD_Symbol_107 = (OpenAD_Symbol_54 * OpenAD_Symbol_59)
      OpenAD_Symbol_108 = (OpenAD_Symbol_56 * OpenAD_Symbol_107)
      OpenAD_Symbol_109 = (OpenAD_Symbol_30 * OpenAD_Symbol_108)
      OpenAD_Symbol_110 = (OpenAD_Symbol_31 * OpenAD_Symbol_108)
      OpenAD_Symbol_111 = (OpenAD_Symbol_27 * OpenAD_Symbol_110)
      OpenAD_Symbol_113 = (OpenAD_Symbol_28 * OpenAD_Symbol_110)
      OpenAD_Symbol_115 = (OpenAD_Symbol_24 * OpenAD_Symbol_109)
      OpenAD_Symbol_117 = (OpenAD_Symbol_25 * OpenAD_Symbol_109)
          double_tape(double_tape_pointer) = OpenAD_Symbol_91
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_93
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_95
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_97
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_99
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_101
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_103
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_105
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_111
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_113
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_115
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_117
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
          OpenAD_Symbol_119 = double_tape(double_tape_pointer)
          OpenAD_Symbol_118%d = OpenAD_Symbol_118%d+OBJ(1)%d*OpenAD_Symb
     +ol_119
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_120 = double_tape(double_tape_pointer)
          OpenAD_Symbol_116%d = OpenAD_Symbol_116%d+OBJ(1)%d*OpenAD_Symb
     +ol_120
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_121 = double_tape(double_tape_pointer)
          OpenAD_Symbol_114%d = OpenAD_Symbol_114%d+OBJ(1)%d*OpenAD_Symb
     +ol_121
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_122 = double_tape(double_tape_pointer)
          OpenAD_Symbol_112%d = OpenAD_Symbol_112%d+OBJ(1)%d*OpenAD_Symb
     +ol_122
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_123 = double_tape(double_tape_pointer)
          OpenAD_Symbol_106%d = OpenAD_Symbol_106%d+OBJ(1)%d*OpenAD_Symb
     +ol_123
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_124 = double_tape(double_tape_pointer)
          OpenAD_Symbol_104%d = OpenAD_Symbol_104%d+OBJ(1)%d*OpenAD_Symb
     +ol_124
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_125 = double_tape(double_tape_pointer)
          OpenAD_Symbol_102%d = OpenAD_Symbol_102%d+OBJ(1)%d*OpenAD_Symb
     +ol_125
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_126 = double_tape(double_tape_pointer)
          OpenAD_Symbol_100%d = OpenAD_Symbol_100%d+OBJ(1)%d*OpenAD_Symb
     +ol_126
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_127 = double_tape(double_tape_pointer)
          OpenAD_Symbol_98%d = OpenAD_Symbol_98%d+OBJ(1)%d*OpenAD_Symbol
     +_127
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_128 = double_tape(double_tape_pointer)
          OpenAD_Symbol_96%d = OpenAD_Symbol_96%d+OBJ(1)%d*OpenAD_Symbol
     +_128
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_129 = double_tape(double_tape_pointer)
          OpenAD_Symbol_94%d = OpenAD_Symbol_94%d+OBJ(1)%d*OpenAD_Symbol
     +_129
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_130 = double_tape(double_tape_pointer)
          OpenAD_Symbol_92%d = OpenAD_Symbol_92%d+OBJ(1)%d*OpenAD_Symbol
     +_130
          OBJ(1)%d = 0.0d0
          MATR(3)%d = MATR(3)%d+OpenAD_Symbol_92%d
          OpenAD_Symbol_92%d = 0.0d0
          MATR(3)%d = MATR(3)%d+OpenAD_Symbol_94%d
          OpenAD_Symbol_94%d = 0.0d0
          MATR(2)%d = MATR(2)%d+OpenAD_Symbol_96%d
          OpenAD_Symbol_96%d = 0.0d0
          MATR(2)%d = MATR(2)%d+OpenAD_Symbol_98%d
          OpenAD_Symbol_98%d = 0.0d0
          MATR(1)%d = MATR(1)%d+OpenAD_Symbol_100%d
          OpenAD_Symbol_100%d = 0.0d0
          MATR(1)%d = MATR(1)%d+OpenAD_Symbol_102%d
          OpenAD_Symbol_102%d = 0.0d0
          MATR(0)%d = MATR(0)%d+OpenAD_Symbol_104%d
          OpenAD_Symbol_104%d = 0.0d0
          MATR(0)%d = MATR(0)%d+OpenAD_Symbol_106%d
          OpenAD_Symbol_106%d = 0.0d0
          MATR(1)%d = MATR(1)%d+OpenAD_Symbol_112%d
          OpenAD_Symbol_112%d = 0.0d0
          MATR(2)%d = MATR(2)%d+OpenAD_Symbol_114%d
          OpenAD_Symbol_114%d = 0.0d0
          MATR(0)%d = MATR(0)%d+OpenAD_Symbol_116%d
          OpenAD_Symbol_116%d = 0.0d0
          MATR(3)%d = MATR(3)%d+OpenAD_Symbol_118%d
          OpenAD_Symbol_118%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_131 = double_tape(double_tape_pointer)
          OpenAD_Symbol_84%d = OpenAD_Symbol_84%d+MATR(2)%d*OpenAD_Symbo
     +l_131
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_132 = double_tape(double_tape_pointer)
          OpenAD_Symbol_82%d = OpenAD_Symbol_82%d+MATR(2)%d*OpenAD_Symbo
     +l_132
          MATR(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_133 = double_tape(double_tape_pointer)
          OpenAD_Symbol_80%d = OpenAD_Symbol_80%d+MATR(0)%d*OpenAD_Symbo
     +l_133
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_134 = double_tape(double_tape_pointer)
          OpenAD_Symbol_78%d = OpenAD_Symbol_78%d+MATR(0)%d*OpenAD_Symbo
     +l_134
          MATR(0)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_135 = double_tape(double_tape_pointer)
          OpenAD_Symbol_76%d = OpenAD_Symbol_76%d+MATR(1)%d*OpenAD_Symbo
     +l_135
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_136 = double_tape(double_tape_pointer)
          OpenAD_Symbol_74%d = OpenAD_Symbol_74%d+MATR(3)%d*OpenAD_Symbo
     +l_136
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_137 = double_tape(double_tape_pointer)
          OpenAD_Symbol_72%d = OpenAD_Symbol_72%d+MATR(1)%d*OpenAD_Symbo
     +l_137
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_138 = double_tape(double_tape_pointer)
          OpenAD_Symbol_69%d = OpenAD_Symbol_69%d+MATR(3)%d*OpenAD_Symbo
     +l_138
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_139 = double_tape(double_tape_pointer)
          OpenAD_Symbol_66%d = OpenAD_Symbol_66%d+MATR(1)%d*OpenAD_Symbo
     +l_139
          MATR(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_140 = double_tape(double_tape_pointer)
          OpenAD_Symbol_63%d = OpenAD_Symbol_63%d+MATR(3)%d*OpenAD_Symbo
     +l_140
          MATR(3)%d = 0.0d0
          X(4)%d = X(4)%d+OpenAD_Symbol_63%d
          OpenAD_Symbol_63%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_66%d
          OpenAD_Symbol_66%d = 0.0d0
          X(5)%d = X(5)%d+OpenAD_Symbol_69%d
          OpenAD_Symbol_69%d = 0.0d0
          X(2)%d = X(2)%d+OpenAD_Symbol_72%d
          OpenAD_Symbol_72%d = 0.0d0
          X(6)%d = X(6)%d+OpenAD_Symbol_74%d
          OpenAD_Symbol_74%d = 0.0d0
          X(3)%d = X(3)%d+OpenAD_Symbol_76%d
          OpenAD_Symbol_76%d = 0.0d0
          X(2)%d = X(2)%d+OpenAD_Symbol_78%d
          OpenAD_Symbol_78%d = 0.0d0
          X(1)%d = X(1)%d+OpenAD_Symbol_80%d
          OpenAD_Symbol_80%d = 0.0d0
          X(5)%d = X(5)%d+OpenAD_Symbol_82%d
          OpenAD_Symbol_82%d = 0.0d0
          X(4)%d = X(4)%d+OpenAD_Symbol_84%d
          OpenAD_Symbol_84%d = 0.0d0
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
