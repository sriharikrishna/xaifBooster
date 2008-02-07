
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
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
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
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
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
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      INTEGER(w2f__i8) OpenAD_Symbol_146
      INTEGER(w2f__i8) OpenAD_Symbol_147
      INTEGER(w2f__i8) OpenAD_Symbol_148
      INTEGER(w2f__i8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      INTEGER(w2f__i8) OpenAD_Symbol_150
      INTEGER(w2f__i8) OpenAD_Symbol_151
      INTEGER(w2f__i8) OpenAD_Symbol_152
      INTEGER(w2f__i8) OpenAD_Symbol_153
      INTEGER(w2f__i8) OpenAD_Symbol_154
      INTEGER(w2f__i8) OpenAD_Symbol_155
      INTEGER(w2f__i8) OpenAD_Symbol_156
      INTEGER(w2f__i8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
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
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      INTEGER(w2f__i8) OpenAD_Symbol_166
      INTEGER(w2f__i8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      REAL(w2f__8) OpenAD_Symbol_172
      REAL(w2f__8) OpenAD_Symbol_173
      REAL(w2f__8) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_176
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(FLDNOW)
C$OPENAD DEPENDENT(FLDNEW)
C
C     **** Statements ****
C

          integer iaddr
          external iaddr

         if (our_rev_mode%plain) then
! original function
C$OPENAD XXX Template ad_template.f
      VOL(1) = 1.0E+01
      VOL(2) = 1.2E+01
      VOL(3) = 1.4E+01
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
          end if
          if (our_rev_mode%tape) then
! taping
C$OPENAD XXX Template ad_template.f
      VOL(1) = 1.0E+01
      VOL(2) = 1.2E+01
      VOL(3) = 1.4E+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        OpenAD_Symbol_10 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_7 = (GAMMALOC * OpenAD_Symbol_10)
        OpenAD_Symbol_15 = (FLDNOW(3)%v-FLDNOW(1)%v)
        OpenAD_Symbol_0 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_7 +  UV
     +ELLOC * OpenAD_Symbol_15)
        DFLDDT(1)%v = (OpenAD_Symbol_0/VOL(1))
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
        OpenAD_Symbol_30 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_27 = (GAMMALOC * OpenAD_Symbol_30)
        OpenAD_Symbol_35 = (FLDNOW(1)%v-FLDNOW(2)%v)
        OpenAD_Symbol_20 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_27 +  
     +UVELLOC * OpenAD_Symbol_35)
        DFLDDT(2)%v = (OpenAD_Symbol_20/VOL(2))
        OpenAD_Symbol_34 = (-1_w2f__i8)
        OpenAD_Symbol_32 = GAMMALOC
        OpenAD_Symbol_29 = VOL(2)
        OpenAD_Symbol_26 = 1_w2f__i8
        OpenAD_Symbol_23 = 1_w2f__i8
        OpenAD_Symbol_38 = 1_w2f__i8
        OpenAD_Symbol_39 = (-1_w2f__i8)
        OpenAD_Symbol_37 = UVELLOC
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_21 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_43 = (FLDNOW(2)%v-FLDNOW(3)%v)
        OpenAD_Symbol_40 = (UVELLOC * OpenAD_Symbol_43)
        DFLDDT(3)%v = (OpenAD_Symbol_40/VOL(3))
        OpenAD_Symbol_46 = 1_w2f__i8
        OpenAD_Symbol_47 = (-1_w2f__i8)
        OpenAD_Symbol_45 = UVELLOC
        OpenAD_Symbol_41 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_102 = (OpenAD_Symbol_23 * OpenAD_Symbol_21)
        OpenAD_Symbol_103 = (OpenAD_Symbol_24 * OpenAD_Symbol_21)
        OpenAD_Symbol_104 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
        OpenAD_Symbol_105 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
        OpenAD_Symbol_106 = (OpenAD_Symbol_26 * OpenAD_Symbol_102)
        OpenAD_Symbol_107 = (OpenAD_Symbol_6 * OpenAD_Symbol_104)
        OpenAD_Symbol_108 = (OpenAD_Symbol_29 * OpenAD_Symbol_106)
        OpenAD_Symbol_109 = (OpenAD_Symbol_9 * OpenAD_Symbol_107)
        OpenAD_Symbol_110 = (OpenAD_Symbol_45 * OpenAD_Symbol_41)
        OpenAD_Symbol_111 = (OpenAD_Symbol_46 * OpenAD_Symbol_110)
        OpenAD_Symbol_112 = (OpenAD_Symbol_47 * OpenAD_Symbol_110)
        OpenAD_Symbol_113 = (OpenAD_Symbol_37 * OpenAD_Symbol_103)
        OpenAD_Symbol_114 = (OpenAD_Symbol_38 * OpenAD_Symbol_113)
        OpenAD_Symbol_115 = (OpenAD_Symbol_39 * OpenAD_Symbol_113)
        OpenAD_Symbol_116 = (OpenAD_Symbol_32 * OpenAD_Symbol_108)
        OpenAD_Symbol_117 = (OpenAD_Symbol_17 * OpenAD_Symbol_105)
        OpenAD_Symbol_118 = (OpenAD_Symbol_18 * OpenAD_Symbol_117)
        OpenAD_Symbol_119 = (OpenAD_Symbol_19 * OpenAD_Symbol_117)
        OpenAD_Symbol_120 = (OpenAD_Symbol_12 * OpenAD_Symbol_109)
        OpenAD_Symbol_121 = (OpenAD_Symbol_34 * OpenAD_Symbol_116)
        OpenAD_Symbol_122 = (OpenAD_Symbol_14 * OpenAD_Symbol_120)
          double_tape(double_tape_pointer) = OpenAD_Symbol_111
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_112
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_114
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_115
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_118
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_119
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_121
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_122
          double_tape_pointer = double_tape_pointer+1
        OpenAD_Symbol_149 = 1_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_149
          integer_tape_pointer = integer_tape_pointer+1
      ELSE
        OpenAD_Symbol_63 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_60 = (GAMMALOC * OpenAD_Symbol_63)
        OpenAD_Symbol_68 = (FLDNOW(2)%v-FLDNOW(1)%v)
        OpenAD_Symbol_53 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_60 -  
     +UVELLOC * OpenAD_Symbol_68)
        DFLDDT(1)%v = (OpenAD_Symbol_53/VOL(1))
        OpenAD_Symbol_67 = (-1_w2f__i8)
        OpenAD_Symbol_65 = GAMMALOC
        OpenAD_Symbol_62 = VOL(1)
        OpenAD_Symbol_59 = 1_w2f__i8
        OpenAD_Symbol_56 = 1_w2f__i8
        OpenAD_Symbol_71 = 1_w2f__i8
        OpenAD_Symbol_72 = (-1_w2f__i8)
        OpenAD_Symbol_70 = UVELLOC
        OpenAD_Symbol_57 = (-1_w2f__i8)
        OpenAD_Symbol_54 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_83 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_80 = (GAMMALOC * OpenAD_Symbol_83)
        OpenAD_Symbol_88 = (FLDNOW(3)%v-FLDNOW(2)%v)
        OpenAD_Symbol_73 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_80 -  
     +UVELLOC * OpenAD_Symbol_88)
        DFLDDT(2)%v = (OpenAD_Symbol_73/VOL(2))
        OpenAD_Symbol_87 = (-1_w2f__i8)
        OpenAD_Symbol_85 = GAMMALOC
        OpenAD_Symbol_82 = VOL(2)
        OpenAD_Symbol_79 = 1_w2f__i8
        OpenAD_Symbol_76 = 1_w2f__i8
        OpenAD_Symbol_91 = 1_w2f__i8
        OpenAD_Symbol_92 = (-1_w2f__i8)
        OpenAD_Symbol_90 = UVELLOC
        OpenAD_Symbol_77 = (-1_w2f__i8)
        OpenAD_Symbol_74 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_97 = (FLDNOW(1)%v-FLDNOW(3)%v)
        OpenAD_Symbol_94 = (UVELLOC * OpenAD_Symbol_97)
        DFLDDT(3)%v = (-(OpenAD_Symbol_94/VOL(3)))
        OpenAD_Symbol_100 = 1_w2f__i8
        OpenAD_Symbol_101 = (-1_w2f__i8)
        OpenAD_Symbol_99 = UVELLOC
        OpenAD_Symbol_95 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_93 = (-1_w2f__i8)
        OpenAD_Symbol_124 = (OpenAD_Symbol_76 * OpenAD_Symbol_74)
        OpenAD_Symbol_125 = (OpenAD_Symbol_77 * OpenAD_Symbol_74)
        OpenAD_Symbol_126 = (OpenAD_Symbol_56 * OpenAD_Symbol_54)
        OpenAD_Symbol_127 = (OpenAD_Symbol_57 * OpenAD_Symbol_54)
        OpenAD_Symbol_128 = (OpenAD_Symbol_79 * OpenAD_Symbol_124)
        OpenAD_Symbol_129 = (OpenAD_Symbol_59 * OpenAD_Symbol_126)
        OpenAD_Symbol_130 = (OpenAD_Symbol_95 * OpenAD_Symbol_93)
        OpenAD_Symbol_131 = (OpenAD_Symbol_82 * OpenAD_Symbol_128)
        OpenAD_Symbol_132 = (OpenAD_Symbol_62 * OpenAD_Symbol_129)
        OpenAD_Symbol_133 = (OpenAD_Symbol_99 * OpenAD_Symbol_130)
        OpenAD_Symbol_134 = (OpenAD_Symbol_100 * OpenAD_Symbol_133)
        OpenAD_Symbol_135 = (OpenAD_Symbol_101 * OpenAD_Symbol_133)
        OpenAD_Symbol_136 = (OpenAD_Symbol_90 * OpenAD_Symbol_125)
        OpenAD_Symbol_137 = (OpenAD_Symbol_91 * OpenAD_Symbol_136)
        OpenAD_Symbol_138 = (OpenAD_Symbol_92 * OpenAD_Symbol_136)
        OpenAD_Symbol_139 = (OpenAD_Symbol_85 * OpenAD_Symbol_131)
        OpenAD_Symbol_140 = (OpenAD_Symbol_70 * OpenAD_Symbol_127)
        OpenAD_Symbol_141 = (OpenAD_Symbol_71 * OpenAD_Symbol_140)
        OpenAD_Symbol_142 = (OpenAD_Symbol_72 * OpenAD_Symbol_140)
        OpenAD_Symbol_143 = (OpenAD_Symbol_65 * OpenAD_Symbol_132)
        OpenAD_Symbol_144 = (OpenAD_Symbol_87 * OpenAD_Symbol_139)
        OpenAD_Symbol_145 = (OpenAD_Symbol_67 * OpenAD_Symbol_143)
          double_tape(double_tape_pointer) = OpenAD_Symbol_134
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_135
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_137
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_138
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_141
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_142
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_144
          double_tape_pointer = double_tape_pointer+1
          double_tape(double_tape_pointer) = OpenAD_Symbol_145
          double_tape_pointer = double_tape_pointer+1
        OpenAD_Symbol_150 = 0_w2f__i8
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_150
          integer_tape_pointer = integer_tape_pointer+1
      ENDIF
      OpenAD_Symbol_151 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_50 = (DELTA_T * 2.0D00)
        FLDNEW(INT(L))%v = (FLDOLD(L)+DFLDDT(L)%v*OpenAD_Symbol_50)
        OpenAD_Symbol_51 = OpenAD_Symbol_50
        OpenAD_Symbol_49 = 1_w2f__i8
        OpenAD_Symbol_123 = (OpenAD_Symbol_51 * OpenAD_Symbol_49)
          double_tape(double_tape_pointer) = OpenAD_Symbol_123
          double_tape_pointer = double_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
          integer_tape(integer_tape_pointer) = L
          integer_tape_pointer = integer_tape_pointer+1
        OpenAD_Symbol_151 = (INT(OpenAD_Symbol_151) + INT(1_w2f__i8))
      END DO
          integer_tape(integer_tape_pointer) = OpenAD_Symbol_151
          integer_tape_pointer = integer_tape_pointer+1
          end if 
          if (our_rev_mode%adjoint) then
! adjoint
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_146 = integer_tape(integer_tape_pointer)
      OpenAD_Symbol_147 = 1
      DO WHILE(INT(OpenAD_Symbol_147) .LE. INT(OpenAD_Symbol_146))
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_166 = integer_tape(integer_tape_pointer)
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_167 = integer_tape(integer_tape_pointer)
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_168 = double_tape(double_tape_pointer)
          DFLDDT(INT(OpenAD_Symbol_167))%d = DFLDDT(INT(OpenAD_Symbol_16
     +7))%d+FLDNEW(INT(OpenAD_Symbol_166))%d*OpenAD_Symbol_168
          FLDNEW(INT(OpenAD_Symbol_166))%d = 0.0d0
        OpenAD_Symbol_147 = INT(OpenAD_Symbol_147) + 1
      END DO
          integer_tape_pointer = integer_tape_pointer-1
          OpenAD_Symbol_148 = integer_tape(integer_tape_pointer)
      IF(OpenAD_Symbol_148 .ne. 0) THEN
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_158 = double_tape(double_tape_pointer)
          FLDNOW(1)%d = FLDNOW(1)%d+DFLDDT(1)%d*OpenAD_Symbol_158
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_159 = double_tape(double_tape_pointer)
          FLDNOW(2)%d = FLDNOW(2)%d+DFLDDT(2)%d*OpenAD_Symbol_159
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_160 = double_tape(double_tape_pointer)
          FLDNOW(1)%d = FLDNOW(1)%d+DFLDDT(1)%d*OpenAD_Symbol_160
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_161 = double_tape(double_tape_pointer)
          FLDNOW(3)%d = FLDNOW(3)%d+DFLDDT(1)%d*OpenAD_Symbol_161
          DFLDDT(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_162 = double_tape(double_tape_pointer)
          FLDNOW(2)%d = FLDNOW(2)%d+DFLDDT(2)%d*OpenAD_Symbol_162
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_163 = double_tape(double_tape_pointer)
          FLDNOW(1)%d = FLDNOW(1)%d+DFLDDT(2)%d*OpenAD_Symbol_163
          DFLDDT(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_164 = double_tape(double_tape_pointer)
          FLDNOW(3)%d = FLDNOW(3)%d+DFLDDT(3)%d*OpenAD_Symbol_164
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_165 = double_tape(double_tape_pointer)
          FLDNOW(2)%d = FLDNOW(2)%d+DFLDDT(3)%d*OpenAD_Symbol_165
          DFLDDT(3)%d = 0.0d0
      ELSE
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_169 = double_tape(double_tape_pointer)
          FLDNOW(1)%d = FLDNOW(1)%d+DFLDDT(1)%d*OpenAD_Symbol_169
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_170 = double_tape(double_tape_pointer)
          FLDNOW(2)%d = FLDNOW(2)%d+DFLDDT(2)%d*OpenAD_Symbol_170
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_171 = double_tape(double_tape_pointer)
          FLDNOW(1)%d = FLDNOW(1)%d+DFLDDT(1)%d*OpenAD_Symbol_171
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_172 = double_tape(double_tape_pointer)
          FLDNOW(2)%d = FLDNOW(2)%d+DFLDDT(1)%d*OpenAD_Symbol_172
          DFLDDT(1)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_173 = double_tape(double_tape_pointer)
          FLDNOW(2)%d = FLDNOW(2)%d+DFLDDT(2)%d*OpenAD_Symbol_173
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_174 = double_tape(double_tape_pointer)
          FLDNOW(3)%d = FLDNOW(3)%d+DFLDDT(2)%d*OpenAD_Symbol_174
          DFLDDT(2)%d = 0.0d0
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_175 = double_tape(double_tape_pointer)
          FLDNOW(3)%d = FLDNOW(3)%d+DFLDDT(3)%d*OpenAD_Symbol_175
          double_tape_pointer = double_tape_pointer-1
          OpenAD_Symbol_176 = double_tape(double_tape_pointer)
          FLDNOW(1)%d = FLDNOW(1)%d+DFLDDT(3)%d*OpenAD_Symbol_176
          DFLDDT(3)%d = 0.0d0
      ENDIF
          end if 
        end subroutine box_timestep
