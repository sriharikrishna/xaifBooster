

      SUBROUTINE box_timestep(GAMMALOC, FLDSTAR, EXTFORLOC, UVELLOC,
     >  FLDNOW, FLDOLD, FLDNEW)
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
      REAL(w2f__8) OpenAD_Symbol_18
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
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(FLDNOW)
C$OPENAD DEPENDENT(FLDNEW)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      VOL(1) = 1.0E+01
      VOL(2) = 1.2E+01
      VOL(3) = 1.4E+01
      DELTA_T = 2.0D+01
      IF(UVELLOC .GE. 0.0D00) THEN
        OpenAD_Symbol_10 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_7 = (GAMMALOC * OpenAD_Symbol_10)
        OpenAD_Symbol_15 = (FLDNOW(3)%v-FLDNOW(1)%v)
        OpenAD_Symbol_0 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_7 +
     >  UVELLOC * OpenAD_Symbol_15)
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
     >  UVELLOC * OpenAD_Symbol_36)
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
        CALL setderiv(OpenAD_Symbol_137,FLDNOW(1))
        CALL setderiv(OpenAD_Symbol_135,FLDNOW(2))
        CALL setderiv(OpenAD_Symbol_132,FLDNOW(1))
        CALL setderiv(OpenAD_Symbol_130,FLDNOW(3))
        CALL setderiv(OpenAD_Symbol_126,FLDNOW(2))
        CALL setderiv(OpenAD_Symbol_124,FLDNOW(1))
        CALL setderiv(OpenAD_Symbol_121,FLDNOW(3))
        CALL setderiv(OpenAD_Symbol_119,FLDNOW(2))
        CALL sax(OpenAD_Symbol_118,OpenAD_Symbol_119,DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_120,OpenAD_Symbol_121,DFLDDT(3))
        CALL sax(OpenAD_Symbol_123,OpenAD_Symbol_124,DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_125,OpenAD_Symbol_126,DFLDDT(2))
        CALL sax(OpenAD_Symbol_129,OpenAD_Symbol_130,DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_131,OpenAD_Symbol_132,DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_134,OpenAD_Symbol_135,DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_136,OpenAD_Symbol_137,DFLDDT(1))
      ELSE
        OpenAD_Symbol_67 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_64 = (GAMMALOC * OpenAD_Symbol_67)
        OpenAD_Symbol_72 = (FLDNOW(2)%v-FLDNOW(1)%v)
        OpenAD_Symbol_57 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_64 -
     >  UVELLOC * OpenAD_Symbol_72)
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
     >  UVELLOC * OpenAD_Symbol_93)
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
        CALL setderiv(OpenAD_Symbol_169,FLDNOW(1))
        CALL setderiv(OpenAD_Symbol_167,FLDNOW(2))
        CALL setderiv(OpenAD_Symbol_164,FLDNOW(1))
        CALL setderiv(OpenAD_Symbol_162,FLDNOW(2))
        CALL setderiv(OpenAD_Symbol_158,FLDNOW(2))
        CALL setderiv(OpenAD_Symbol_156,FLDNOW(3))
        CALL setderiv(OpenAD_Symbol_153,FLDNOW(3))
        CALL setderiv(OpenAD_Symbol_151,FLDNOW(1))
        CALL sax(OpenAD_Symbol_150,OpenAD_Symbol_151,DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_152,OpenAD_Symbol_153,DFLDDT(3))
        CALL sax(OpenAD_Symbol_155,OpenAD_Symbol_156,DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_157,OpenAD_Symbol_158,DFLDDT(2))
        CALL sax(OpenAD_Symbol_161,OpenAD_Symbol_162,DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_163,OpenAD_Symbol_164,DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_166,OpenAD_Symbol_167,DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_168,OpenAD_Symbol_169,DFLDDT(1))
      ENDIF
      DO L = 1, 3, 1
        OpenAD_Symbol_53 = (DELTA_T * 2.0D00)
        OpenAD_Symbol_56 = (FLDOLD(L)+DFLDDT(L)%v*OpenAD_Symbol_53)
        OpenAD_Symbol_54 = OpenAD_Symbol_53
        OpenAD_Symbol_52 = 1_w2f__i8
        FLDNEW(INT(L))%v = OpenAD_Symbol_56
        OpenAD_Symbol_138 = (OpenAD_Symbol_54 * OpenAD_Symbol_52)
        CALL setderiv(OpenAD_Symbol_139,DFLDDT(L))
        CALL sax(OpenAD_Symbol_138,OpenAD_Symbol_139,FLDNEW(L))
      END DO
      END SUBROUTINE
