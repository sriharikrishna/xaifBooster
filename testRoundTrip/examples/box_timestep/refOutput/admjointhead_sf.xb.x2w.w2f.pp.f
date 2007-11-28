
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
       subroutine box_timestep(GAMMALOC,FLDSTAR,EXTFORLOC,UVELLOC,FLDNOW
     +,FLDOLD,FLDNEW)
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
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      type(active) :: OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      type(active) :: OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      type(active) :: OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      type(active) :: OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      type(active) :: OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      type(active) :: OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      type(active) :: OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      type(active) :: OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      type(active) :: OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      type(active) :: OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      type(active) :: OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      type(active) :: OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      type(active) :: OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      type(active) :: OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      type(active) :: OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      type(active) :: OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
      type(active) :: OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      INTEGER(w2f__i8) OpenAD_Symbol_170
      INTEGER(w2f__i8) OpenAD_Symbol_171
      INTEGER(w2f__i8) OpenAD_Symbol_172
      INTEGER(w2f__i8) OpenAD_Symbol_173
      INTEGER(w2f__i8) OpenAD_Symbol_174
      INTEGER(w2f__i8) OpenAD_Symbol_175
      INTEGER(w2f__i8) OpenAD_Symbol_176
      INTEGER(w2f__i8) OpenAD_Symbol_177
      INTEGER(w2f__i8) OpenAD_Symbol_178
      INTEGER(w2f__i8) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_18
      INTEGER(w2f__i8) OpenAD_Symbol_180
      INTEGER(w2f__i8) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      REAL(w2f__8) GAMMALOC
      REAL(w2f__8) FLDSTAR(1 : 2)
      REAL(w2f__8) EXTFORLOC(1 : 2)
      REAL(w2f__8) UVELLOC
      type(active) :: FLDNOW(1 : 3)
      REAL(w2f__8) FLDOLD(1 : 3)
      type(active) :: FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) DELTA_T
      type(active) :: DFLDDT(1 : 3)
      INTEGER(w2f__i4) L
      REAL(w2f__8) VOL(1 : 3)
      REAL(w2f__8) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      INTEGER(w2f__i8) OpenAD_Symbol_190
      REAL(w2f__8) OpenAD_Symbol_191
      INTEGER(w2f__i8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_200
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(FLDNOW)
C$OPENAD DEPENDENT(FLDNEW)
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
      VOL(1) = 1.0D+01
      VOL(2) = 1.2D+01
      VOL(3) = 1.4D+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        DFLDDT(1)%v = ((EXTFORLOC(1)+VOL(1)*GAMMALOC*(FLDSTAR(1)-FLDNOW(
     +1)%v)+UVELLOC*(FLDNOW(3)%v-FLDNOW(1)%v))/VOL(1))
        DFLDDT(2)%v = ((EXTFORLOC(2)+VOL(2)*GAMMALOC*(FLDSTAR(2)-FLDNOW(
     +2)%v)+UVELLOC*(FLDNOW(1)%v-FLDNOW(2)%v))/VOL(2))
        DFLDDT(3)%v = ((UVELLOC*(FLDNOW(2)%v-FLDNOW(3)%v))/VOL(3))
      ELSE
        DFLDDT(1)%v = ((EXTFORLOC(1)+VOL(1)*GAMMALOC*(FLDSTAR(1)-FLDNOW(
     +1)%v)-UVELLOC*(FLDNOW(2)%v-FLDNOW(1)%v))/VOL(1))
        DFLDDT(2)%v = ((EXTFORLOC(2)+VOL(2)*GAMMALOC*(FLDSTAR(2)-FLDNOW(
     +2)%v)-UVELLOC*(FLDNOW(3)%v-FLDNOW(2)%v))/VOL(2))
        DFLDDT(3)%v = (-((UVELLOC*(FLDNOW(1)%v-FLDNOW(3)%v))/VOL(3)))
      ENDIF
      DO L = 1, 3, 1
        FLDNEW(INT(L))%v = (FLDOLD(L)+DFLDDT(L)%v*DELTA_T*2.0D00)
      END DO
      RETURN
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
      VOL(1) = 1.0D+01
      VOL(2) = 1.2D+01
      VOL(3) = 1.4D+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        OpenAD_Symbol_10 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_7 = (GAMMALOC * OpenAD_Symbol_10)
        OpenAD_Symbol_15 = (FLDNOW(3)%v-FLDNOW(1)%v)
        OpenAD_Symbol_0 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_7 +  UV
     +ELLOC * OpenAD_Symbol_15)
        OpenAD_Symbol_20 = (OpenAD_Symbol_0 / VOL(1))
        OpenAD_Symbol_14 = (-1_w2f__i8)
        OpenAD_Symbol_12 = GAMMALOC
        OpenAD_Symbol_9 = VOL(1)
        OpenAD_Symbol_6 = 1_w2f__i8
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_18 = 1_w2f__i8
        OpenAD_Symbol_19 = (-1_w2f__i8)
        OpenAD_Symbol_17 = UVELLOC
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_1 = (INT(1_w2f__i8) / VOL(1))
        DFLDDT(1)%v = OpenAD_Symbol_20
        OpenAD_Symbol_31 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_28 = (GAMMALOC * OpenAD_Symbol_31)
        OpenAD_Symbol_36 = (FLDNOW(1)%v-FLDNOW(2)%v)
        OpenAD_Symbol_21 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_28 +  
     +UVELLOC * OpenAD_Symbol_36)
        OpenAD_Symbol_41 = (OpenAD_Symbol_21 / VOL(2))
        OpenAD_Symbol_35 = (-1_w2f__i8)
        OpenAD_Symbol_33 = GAMMALOC
        OpenAD_Symbol_30 = VOL(2)
        OpenAD_Symbol_27 = 1_w2f__i8
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_39 = 1_w2f__i8
        OpenAD_Symbol_40 = (-1_w2f__i8)
        OpenAD_Symbol_38 = UVELLOC
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = (INT(1_w2f__i8) / VOL(2))
        DFLDDT(2)%v = OpenAD_Symbol_41
        OpenAD_Symbol_45 = (FLDNOW(2)%v-FLDNOW(3)%v)
        OpenAD_Symbol_42 = (UVELLOC * OpenAD_Symbol_45)
        OpenAD_Symbol_50 = (OpenAD_Symbol_42 / VOL(3))
        OpenAD_Symbol_48 = 1_w2f__i8
        OpenAD_Symbol_49 = (-1_w2f__i8)
        OpenAD_Symbol_47 = UVELLOC
        OpenAD_Symbol_43 = (INT(1_w2f__i8) / VOL(3))
        DFLDDT(3)%v = OpenAD_Symbol_50
        OpenAD_Symbol_109 = (OpenAD_Symbol_24 * OpenAD_Symbol_22)
        OpenAD_Symbol_110 = (OpenAD_Symbol_25 * OpenAD_Symbol_22)
        OpenAD_Symbol_111 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
        OpenAD_Symbol_112 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
        OpenAD_Symbol_113 = (OpenAD_Symbol_27 * OpenAD_Symbol_109)
        OpenAD_Symbol_114 = (OpenAD_Symbol_6 * OpenAD_Symbol_111)
        OpenAD_Symbol_115 = (OpenAD_Symbol_30 * OpenAD_Symbol_113)
        OpenAD_Symbol_116 = (OpenAD_Symbol_9 * OpenAD_Symbol_114)
        OpenAD_Symbol_117 = (OpenAD_Symbol_47 * OpenAD_Symbol_43)
        OpenAD_Symbol_118 = (OpenAD_Symbol_48 * OpenAD_Symbol_117)
        OpenAD_Symbol_120 = (OpenAD_Symbol_49 * OpenAD_Symbol_117)
        OpenAD_Symbol_122 = (OpenAD_Symbol_38 * OpenAD_Symbol_110)
        OpenAD_Symbol_123 = (OpenAD_Symbol_39 * OpenAD_Symbol_122)
        OpenAD_Symbol_125 = (OpenAD_Symbol_40 * OpenAD_Symbol_122)
        OpenAD_Symbol_127 = (OpenAD_Symbol_33 * OpenAD_Symbol_115)
        OpenAD_Symbol_128 = (OpenAD_Symbol_17 * OpenAD_Symbol_112)
        OpenAD_Symbol_129 = (OpenAD_Symbol_18 * OpenAD_Symbol_128)
        OpenAD_Symbol_131 = (OpenAD_Symbol_19 * OpenAD_Symbol_128)
        OpenAD_Symbol_133 = (OpenAD_Symbol_12 * OpenAD_Symbol_116)
        OpenAD_Symbol_134 = (OpenAD_Symbol_35 * OpenAD_Symbol_127)
        OpenAD_Symbol_136 = (OpenAD_Symbol_14 * OpenAD_Symbol_133)
          double_tape(double_tape_pointer) = OpenAD_Symbol_118
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_120
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_123
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_125
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_129
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_131
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_134
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_136
          double_tape_pointer = double_tape_pointer+1
        OpenAD_Symbol_173 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_173
          integer_tape_pointer = integer_tape_pointer+1
      ELSE
        OpenAD_Symbol_67 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_64 = (GAMMALOC * OpenAD_Symbol_67)
        OpenAD_Symbol_72 = (FLDNOW(2)%v-FLDNOW(1)%v)
        OpenAD_Symbol_57 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_64 -  
     +UVELLOC * OpenAD_Symbol_72)
        OpenAD_Symbol_77 = (OpenAD_Symbol_57 / VOL(1))
        OpenAD_Symbol_71 = (-1_w2f__i8)
        OpenAD_Symbol_69 = GAMMALOC
        OpenAD_Symbol_66 = VOL(1)
        OpenAD_Symbol_63 = 1_w2f__i8
        OpenAD_Symbol_60 = 1_w2f__i8
        OpenAD_Symbol_75 = 1_w2f__i8
        OpenAD_Symbol_76 = (-1_w2f__i8)
        OpenAD_Symbol_74 = UVELLOC
        OpenAD_Symbol_61 = (-1_w2f__i8)
        OpenAD_Symbol_58 = (INT(1_w2f__i8) / VOL(1))
        DFLDDT(1)%v = OpenAD_Symbol_77
        OpenAD_Symbol_88 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_85 = (GAMMALOC * OpenAD_Symbol_88)
        OpenAD_Symbol_93 = (FLDNOW(3)%v-FLDNOW(2)%v)
        OpenAD_Symbol_78 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_85 -  
     +UVELLOC * OpenAD_Symbol_93)
        OpenAD_Symbol_98 = (OpenAD_Symbol_78 / VOL(2))
        OpenAD_Symbol_92 = (-1_w2f__i8)
        OpenAD_Symbol_90 = GAMMALOC
        OpenAD_Symbol_87 = VOL(2)
        OpenAD_Symbol_84 = 1_w2f__i8
        OpenAD_Symbol_81 = 1_w2f__i8
        OpenAD_Symbol_96 = 1_w2f__i8
        OpenAD_Symbol_97 = (-1_w2f__i8)
        OpenAD_Symbol_95 = UVELLOC
        OpenAD_Symbol_82 = (-1_w2f__i8)
        OpenAD_Symbol_79 = (INT(1_w2f__i8) / VOL(2))
        DFLDDT(2)%v = OpenAD_Symbol_98
        OpenAD_Symbol_103 = (FLDNOW(1)%v-FLDNOW(3)%v)
        OpenAD_Symbol_100 = (UVELLOC * OpenAD_Symbol_103)
        OpenAD_Symbol_108 = (-(OpenAD_Symbol_100 / VOL(3)))
        OpenAD_Symbol_106 = 1_w2f__i8
        OpenAD_Symbol_107 = (-1_w2f__i8)
        OpenAD_Symbol_105 = UVELLOC
        OpenAD_Symbol_101 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_99 = (-1_w2f__i8)
        DFLDDT(3)%v = OpenAD_Symbol_108
        OpenAD_Symbol_140 = (OpenAD_Symbol_81 * OpenAD_Symbol_79)
        OpenAD_Symbol_141 = (OpenAD_Symbol_82 * OpenAD_Symbol_79)
        OpenAD_Symbol_142 = (OpenAD_Symbol_60 * OpenAD_Symbol_58)
        OpenAD_Symbol_143 = (OpenAD_Symbol_61 * OpenAD_Symbol_58)
        OpenAD_Symbol_144 = (OpenAD_Symbol_84 * OpenAD_Symbol_140)
        OpenAD_Symbol_145 = (OpenAD_Symbol_63 * OpenAD_Symbol_142)
        OpenAD_Symbol_146 = (OpenAD_Symbol_101 * OpenAD_Symbol_99)
        OpenAD_Symbol_147 = (OpenAD_Symbol_87 * OpenAD_Symbol_144)
        OpenAD_Symbol_148 = (OpenAD_Symbol_66 * OpenAD_Symbol_145)
        OpenAD_Symbol_149 = (OpenAD_Symbol_105 * OpenAD_Symbol_146)
        OpenAD_Symbol_150 = (OpenAD_Symbol_106 * OpenAD_Symbol_149)
        OpenAD_Symbol_152 = (OpenAD_Symbol_107 * OpenAD_Symbol_149)
        OpenAD_Symbol_154 = (OpenAD_Symbol_95 * OpenAD_Symbol_141)
        OpenAD_Symbol_155 = (OpenAD_Symbol_96 * OpenAD_Symbol_154)
        OpenAD_Symbol_157 = (OpenAD_Symbol_97 * OpenAD_Symbol_154)
        OpenAD_Symbol_159 = (OpenAD_Symbol_90 * OpenAD_Symbol_147)
        OpenAD_Symbol_160 = (OpenAD_Symbol_74 * OpenAD_Symbol_143)
        OpenAD_Symbol_161 = (OpenAD_Symbol_75 * OpenAD_Symbol_160)
        OpenAD_Symbol_163 = (OpenAD_Symbol_76 * OpenAD_Symbol_160)
        OpenAD_Symbol_165 = (OpenAD_Symbol_69 * OpenAD_Symbol_148)
        OpenAD_Symbol_166 = (OpenAD_Symbol_92 * OpenAD_Symbol_159)
        OpenAD_Symbol_168 = (OpenAD_Symbol_71 * OpenAD_Symbol_165)
          double_tape(double_tape_pointer) = OpenAD_Symbol_150
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_152
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_155
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_157
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_161
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_163
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_166
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_168
          double_tape_pointer = double_tape_pointer+1
        OpenAD_Symbol_174 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_174
          integer_tape_pointer = integer_tape_pointer+1
      ENDIF
      OpenAD_Symbol_175 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_53 = (DELTA_T * 2.0D00)
        OpenAD_Symbol_56 = (FLDOLD(L)+DFLDDT(L)%v*OpenAD_Symbol_53)
        OpenAD_Symbol_54 = OpenAD_Symbol_53
        OpenAD_Symbol_52 = 1_w2f__i8
        FLDNEW(INT(L))%v = OpenAD_Symbol_56
        OpenAD_Symbol_138 = (OpenAD_Symbol_54 * OpenAD_Symbol_52)
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_138
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_175 = (INT(OpenAD_Symbol_175) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_175
          integer_tape_pointer = integer_tape_pointer+1
      RETURN
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
          OpenAD_Symbol_170 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_171 = 1
      DO WHILE(INT(OpenAD_Symbol_171) .LE. INT(OpenAD_Symbol_170))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_190 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_191 = double_tape(double_tape_pointer)
          OpenAD_Symbol_139%d = OpenAD_Symbol_139%d+FLDNEW(INT(OpenAD_Sy
     +mbol_190))%d*OpenAD_Symbol_191
          FLDNEW(INT(OpenAD_Symbol_190))%d = 0.0d0
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_192 = integer_tape(integer_tape_pointer)
          DFLDDT(INT(OpenAD_Symbol_192))%d = DFLDDT(INT(OpenAD_Symbol_19
     +2))%d+OpenAD_Symbol_139%d
          OpenAD_Symbol_139%d = 0.0d0
        OpenAD_Symbol_171 = INT(OpenAD_Symbol_171) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_172 = integer_tape(integer_tape_pointer)
      IF(OpenAD_Symbol_172 .ne. 0) THEN
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_182 = double_tape(double_tape_pointer)
          OpenAD_Symbol_137%d = OpenAD_Symbol_137%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_182
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_183 = double_tape(double_tape_pointer)
          OpenAD_Symbol_135%d = OpenAD_Symbol_135%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_183
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_184 = double_tape(double_tape_pointer)
          OpenAD_Symbol_132%d = OpenAD_Symbol_132%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_184
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_185 = double_tape(double_tape_pointer)
          OpenAD_Symbol_130%d = OpenAD_Symbol_130%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_185
          DFLDDT(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_186 = double_tape(double_tape_pointer)
          OpenAD_Symbol_126%d = OpenAD_Symbol_126%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_186
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_187 = double_tape(double_tape_pointer)
          OpenAD_Symbol_124%d = OpenAD_Symbol_124%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_187
          DFLDDT(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_188 = double_tape(double_tape_pointer)
          OpenAD_Symbol_121%d = OpenAD_Symbol_121%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_188
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_189 = double_tape(double_tape_pointer)
          OpenAD_Symbol_119%d = OpenAD_Symbol_119%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_189
          DFLDDT(3)%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_119%d
          OpenAD_Symbol_119%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_121%d
          OpenAD_Symbol_121%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_124%d
          OpenAD_Symbol_124%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_126%d
          OpenAD_Symbol_126%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_130%d
          OpenAD_Symbol_130%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_132%d
          OpenAD_Symbol_132%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_135%d
          OpenAD_Symbol_135%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_137%d
          OpenAD_Symbol_137%d = 0.0d0
      ELSE
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_193 = double_tape(double_tape_pointer)
          OpenAD_Symbol_169%d = OpenAD_Symbol_169%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_193
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_194 = double_tape(double_tape_pointer)
          OpenAD_Symbol_167%d = OpenAD_Symbol_167%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_194
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_195 = double_tape(double_tape_pointer)
          OpenAD_Symbol_164%d = OpenAD_Symbol_164%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_195
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_196 = double_tape(double_tape_pointer)
          OpenAD_Symbol_162%d = OpenAD_Symbol_162%d+DFLDDT(1)%d*OpenAD_S
     +ymbol_196
          DFLDDT(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_197 = double_tape(double_tape_pointer)
          OpenAD_Symbol_158%d = OpenAD_Symbol_158%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_197
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_198 = double_tape(double_tape_pointer)
          OpenAD_Symbol_156%d = OpenAD_Symbol_156%d+DFLDDT(2)%d*OpenAD_S
     +ymbol_198
          DFLDDT(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_199 = double_tape(double_tape_pointer)
          OpenAD_Symbol_153%d = OpenAD_Symbol_153%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_199
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_200 = double_tape(double_tape_pointer)
          OpenAD_Symbol_151%d = OpenAD_Symbol_151%d+DFLDDT(3)%d*OpenAD_S
     +ymbol_200
          DFLDDT(3)%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_151%d
          OpenAD_Symbol_151%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_153%d
          OpenAD_Symbol_153%d = 0.0d0
          FLDNOW(3)%d = FLDNOW(3)%d+OpenAD_Symbol_156%d
          OpenAD_Symbol_156%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_158%d
          OpenAD_Symbol_158%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_162%d
          OpenAD_Symbol_162%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_164%d
          OpenAD_Symbol_164%d = 0.0d0
          FLDNOW(2)%d = FLDNOW(2)%d+OpenAD_Symbol_167%d
          OpenAD_Symbol_167%d = 0.0d0
          FLDNOW(1)%d = FLDNOW(1)%d+OpenAD_Symbol_169%d
          OpenAD_Symbol_169%d = 0.0d0
      ENDIF
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
        end subroutine box_timestep
