
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, F)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
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
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      REAL(w2f__8) OpenAD_Symbol_172
      REAL(w2f__8) OpenAD_Symbol_173
      REAL(w2f__8) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_176
      REAL(w2f__8) OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_180
      REAL(w2f__8) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      TYPE (OpenADTy_active) OpenAD_Symbol_189
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_190
      REAL(w2f__8) OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      TYPE (OpenADTy_active) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_200
      REAL(w2f__8) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      REAL(w2f__8) OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      REAL(w2f__8) OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      REAL(w2f__8) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      TYPE (OpenADTy_active) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      TYPE (OpenADTy_active) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      REAL(w2f__8) OpenAD_Symbol_216
      TYPE (OpenADTy_active) OpenAD_Symbol_217
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
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
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
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
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 9)
      TYPE (OpenADTy_active) F(1 : 7)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) H
      INTEGER(w2f__i4) I
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(F)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      H = 2.5D-01
      OpenAD_Symbol_11 = (H * H)
      OpenAD_Symbol_8 = (__value__(X(8)) * OpenAD_Symbol_11)
      OpenAD_Symbol_4 = (OpenAD_Symbol_8 / 1.2D+01)
      OpenAD_Symbol_21 = (__value__(X(1)) * __value__(X(9)) + 1.0D00)
      OpenAD_Symbol_19 = (__value__(X(1)) / OpenAD_Symbol_21)
      OpenAD_Symbol_16 = EXP(OpenAD_Symbol_19)
      OpenAD_Symbol_5 = (OpenAD_Symbol_16 * 1.0D+01 + 1.0D00)
      __value__(F(1)) = (__value__(X(1)) *(-2.0D00) + OpenAD_Symbol_4 *
     >  OpenAD_Symbol_5)
      OpenAD_Symbol_2 = (-2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_12 = OpenAD_Symbol_11
      OpenAD_Symbol_9 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_6 = OpenAD_Symbol_5
      OpenAD_Symbol_22 = (INT(1_w2f__i8) / OpenAD_Symbol_21)
      OpenAD_Symbol_26 = __value__(X(9))
      OpenAD_Symbol_27 = __value__(X(1))
      OpenAD_Symbol_24 = 1_w2f__i8
      OpenAD_Symbol_23 = (-(__value__(X(1)) /(OpenAD_Symbol_21 *
     >  OpenAD_Symbol_21)))
      OpenAD_Symbol_20 = EXP(OpenAD_Symbol_19)
      OpenAD_Symbol_17 = 1.0D+01
      OpenAD_Symbol_14 = 1_w2f__i8
      OpenAD_Symbol_7 = OpenAD_Symbol_4
      OpenAD_Symbol_1 = 1_w2f__i8
      OpenAD_Symbol_171 = (OpenAD_Symbol_20 * 1.0D+01 * OpenAD_Symbol_7
     > )
      OpenAD_Symbol_172 = (OpenAD_Symbol_22 * OpenAD_Symbol_171)
      OpenAD_Symbol_173 = (OpenAD_Symbol_23 * OpenAD_Symbol_171)
      OpenAD_Symbol_174 = (OpenAD_Symbol_26 * OpenAD_Symbol_173)
      OpenAD_Symbol_175 = (OpenAD_Symbol_27 * OpenAD_Symbol_173)
      OpenAD_Symbol_176 = (OpenAD_Symbol_12 * OpenAD_Symbol_9 *
     >  OpenAD_Symbol_6)
      CALL sax(OpenAD_Symbol_172, __deriv__(X(1)), __deriv__(F(1)))
      CALL saxpy(OpenAD_Symbol_174, __deriv__(X(1)), __deriv__(F(1)))
      CALL saxpy(OpenAD_Symbol_175, __deriv__(X(9)), __deriv__(F(1)))
      CALL saxpy(OpenAD_Symbol_176, __deriv__(X(8)), __deriv__(F(1)))
      CALL saxpy(-2.0D00, __deriv__(X(1)), __deriv__(F(1)))
      OpenAD_Symbol_36 = (__value__(X(1)) * __value__(X(9)) + 1.0D00)
      OpenAD_Symbol_34 = (__value__(X(1)) / OpenAD_Symbol_36)
      OpenAD_Symbol_30 = EXP(OpenAD_Symbol_34)
      OpenAD_Symbol_46 = (H * H)
      OpenAD_Symbol_43 = (__value__(X(8)) * OpenAD_Symbol_46)
      OpenAD_Symbol_31 = (OpenAD_Symbol_43 / 1.2D+01)
      __value__(F(2)) = (__value__(X(1)) + OpenAD_Symbol_30 *
     >  OpenAD_Symbol_31)
      OpenAD_Symbol_28 = 1_w2f__i8
      OpenAD_Symbol_37 = (INT(1_w2f__i8) / OpenAD_Symbol_36)
      OpenAD_Symbol_41 = __value__(X(9))
      OpenAD_Symbol_42 = __value__(X(1))
      OpenAD_Symbol_39 = 1_w2f__i8
      OpenAD_Symbol_38 = (-(__value__(X(1)) /(OpenAD_Symbol_36 *
     >  OpenAD_Symbol_36)))
      OpenAD_Symbol_35 = EXP(OpenAD_Symbol_34)
      OpenAD_Symbol_32 = OpenAD_Symbol_31
      OpenAD_Symbol_47 = OpenAD_Symbol_46
      OpenAD_Symbol_44 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_33 = OpenAD_Symbol_30
      OpenAD_Symbol_29 = 1_w2f__i8
      OpenAD_Symbol_177 = (OpenAD_Symbol_35 * OpenAD_Symbol_32)
      OpenAD_Symbol_178 = (OpenAD_Symbol_37 * OpenAD_Symbol_177)
      OpenAD_Symbol_179 = (OpenAD_Symbol_38 * OpenAD_Symbol_177)
      OpenAD_Symbol_180 = (OpenAD_Symbol_41 * OpenAD_Symbol_179)
      OpenAD_Symbol_181 = (OpenAD_Symbol_42 * OpenAD_Symbol_179)
      OpenAD_Symbol_182 = (OpenAD_Symbol_47 * OpenAD_Symbol_44 *
     >  OpenAD_Symbol_33)
      CALL sax(OpenAD_Symbol_178, __deriv__(X(1)), __deriv__(F(2)))
      CALL saxpy(OpenAD_Symbol_180, __deriv__(X(1)), __deriv__(F(2)))
      CALL saxpy(OpenAD_Symbol_181, __deriv__(X(9)), __deriv__(F(2)))
      CALL saxpy(OpenAD_Symbol_182, __deriv__(X(8)), __deriv__(F(2)))
      CALL saxpy(1_w2f__i8, __deriv__(X(1)), __deriv__(F(2)))
      DO I = 2, 6, 1
        OpenAD_Symbol_59 = (__value__(X(I)) * __value__(X(9)) + 1.0D00)
        OpenAD_Symbol_57 = (__value__(X(I)) / OpenAD_Symbol_59)
        OpenAD_Symbol_53 = EXP(OpenAD_Symbol_57)
        OpenAD_Symbol_69 = (H * H)
        OpenAD_Symbol_66 = (__value__(X(8)) * OpenAD_Symbol_69)
        OpenAD_Symbol_54 = (OpenAD_Symbol_66 / 1.2D+01)
        __value__(F(INT(I +(-1)))) = (__value__(X(I)) + __value__(F(I +
     >  (-1))) + OpenAD_Symbol_53 * OpenAD_Symbol_54)
        OpenAD_Symbol_51 = 1_w2f__i8
        OpenAD_Symbol_52 = 1_w2f__i8
        OpenAD_Symbol_49 = 1_w2f__i8
        OpenAD_Symbol_60 = (INT(1_w2f__i8) / OpenAD_Symbol_59)
        OpenAD_Symbol_64 = __value__(X(9))
        OpenAD_Symbol_65 = __value__(X(I))
        OpenAD_Symbol_62 = 1_w2f__i8
        OpenAD_Symbol_61 = (-(__value__(X(I)) /(OpenAD_Symbol_59 *
     >  OpenAD_Symbol_59)))
        OpenAD_Symbol_58 = EXP(OpenAD_Symbol_57)
        OpenAD_Symbol_55 = OpenAD_Symbol_54
        OpenAD_Symbol_70 = OpenAD_Symbol_69
        OpenAD_Symbol_67 = (INT(1_w2f__i8) / 1.2D+01)
        OpenAD_Symbol_56 = OpenAD_Symbol_53
        OpenAD_Symbol_50 = 1_w2f__i8
        OpenAD_Symbol_183 = (OpenAD_Symbol_58 * OpenAD_Symbol_55)
        OpenAD_Symbol_184 = (OpenAD_Symbol_60 * OpenAD_Symbol_183)
        OpenAD_Symbol_185 = (OpenAD_Symbol_61 * OpenAD_Symbol_183)
        OpenAD_Symbol_186 = (OpenAD_Symbol_64 * OpenAD_Symbol_185)
        OpenAD_Symbol_187 = (OpenAD_Symbol_65 * OpenAD_Symbol_185)
        OpenAD_Symbol_188 = (OpenAD_Symbol_70 * OpenAD_Symbol_67 *
     >  OpenAD_Symbol_56)
        CALL setderiv(__deriv__(OpenAD_Symbol_189), __deriv__(F(I + (-1
     > ))))
        CALL sax(1_w2f__i8, __deriv__(X(I)), __deriv__(F(I + (-1))))
        CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_189), __deriv__(F
     > (I + (-1))))
        CALL saxpy(OpenAD_Symbol_184, __deriv__(X(I)), __deriv__(F(I +
     >  (-1))))
        CALL saxpy(OpenAD_Symbol_186, __deriv__(X(I)), __deriv__(F(I +
     >  (-1))))
        CALL saxpy(OpenAD_Symbol_187, __deriv__(X(9)), __deriv__(F(I +
     >  (-1))))
        CALL saxpy(OpenAD_Symbol_188, __deriv__(X(8)), __deriv__(F(I +
     >  (-1))))
        OpenAD_Symbol_80 = (__value__(X(I)) * __value__(X(9)) + 1.0D00)
        OpenAD_Symbol_78 = (__value__(X(I)) / OpenAD_Symbol_80)
        OpenAD_Symbol_74 = EXP(OpenAD_Symbol_78)
        OpenAD_Symbol_90 = (H * H)
        OpenAD_Symbol_87 = (__value__(X(8)) * OpenAD_Symbol_90)
        OpenAD_Symbol_75 = (OpenAD_Symbol_87 /
     >  1.20000004768371582031D00)
        __value__(F(INT(I))) = (OpenAD_Symbol_74 * OpenAD_Symbol_75 +
     >  __value__(F(I)) - __value__(X(I)) * 2.0D00)
        OpenAD_Symbol_81 = (INT(1_w2f__i8) / OpenAD_Symbol_80)
        OpenAD_Symbol_85 = __value__(X(9))
        OpenAD_Symbol_86 = __value__(X(I))
        OpenAD_Symbol_83 = 1_w2f__i8
        OpenAD_Symbol_82 = (-(__value__(X(I)) /(OpenAD_Symbol_80 *
     >  OpenAD_Symbol_80)))
        OpenAD_Symbol_79 = EXP(OpenAD_Symbol_78)
        OpenAD_Symbol_76 = OpenAD_Symbol_75
        OpenAD_Symbol_91 = OpenAD_Symbol_90
        OpenAD_Symbol_88 = (INT(1_w2f__i8) / 1.20000004768371582031D00)
        OpenAD_Symbol_77 = OpenAD_Symbol_74
        OpenAD_Symbol_72 = 1_w2f__i8
        OpenAD_Symbol_93 = 1_w2f__i8
        OpenAD_Symbol_95 = 2.0D00
        OpenAD_Symbol_94 = (-1_w2f__i8)
        OpenAD_Symbol_73 = 1_w2f__i8
        OpenAD_Symbol_190 = (OpenAD_Symbol_79 * OpenAD_Symbol_76)
        OpenAD_Symbol_191 = (OpenAD_Symbol_81 * OpenAD_Symbol_190)
        OpenAD_Symbol_192 = (OpenAD_Symbol_82 * OpenAD_Symbol_190)
        OpenAD_Symbol_193 = (OpenAD_Symbol_85 * OpenAD_Symbol_192)
        OpenAD_Symbol_194 = (OpenAD_Symbol_86 * OpenAD_Symbol_192)
        OpenAD_Symbol_195 = (OpenAD_Symbol_91 * OpenAD_Symbol_88 *
     >  OpenAD_Symbol_77)
        CALL setderiv(__deriv__(OpenAD_Symbol_196), __deriv__(F(I)))
        CALL sax(1_w2f__i8, __deriv__(OpenAD_Symbol_196), __deriv__(F(I
     > )))
        CALL saxpy(OpenAD_Symbol_191, __deriv__(X(I)), __deriv__(F(I)))
        CALL saxpy(OpenAD_Symbol_193, __deriv__(X(I)), __deriv__(F(I)))
        CALL saxpy(OpenAD_Symbol_194, __deriv__(X(9)), __deriv__(F(I)))
        CALL saxpy(-2.0D00, __deriv__(X(I)), __deriv__(F(I)))
        CALL saxpy(OpenAD_Symbol_195, __deriv__(X(8)), __deriv__(F(I)))
        OpenAD_Symbol_105 = (__value__(X(I)) * __value__(X(9)) + 1.0D00
     > )
        OpenAD_Symbol_103 = (__value__(X(I)) / OpenAD_Symbol_105)
        OpenAD_Symbol_99 = EXP(OpenAD_Symbol_103)
        OpenAD_Symbol_115 = (H * H)
        OpenAD_Symbol_112 = (__value__(X(8)) * OpenAD_Symbol_115)
        OpenAD_Symbol_100 = (OpenAD_Symbol_112 / 1.2D+01)
        __value__(F(INT(I + 1))) = (__value__(X(I)) + OpenAD_Symbol_99
     >  * OpenAD_Symbol_100)
        OpenAD_Symbol_97 = 1_w2f__i8
        OpenAD_Symbol_106 = (INT(1_w2f__i8) / OpenAD_Symbol_105)
        OpenAD_Symbol_110 = __value__(X(9))
        OpenAD_Symbol_111 = __value__(X(I))
        OpenAD_Symbol_108 = 1_w2f__i8
        OpenAD_Symbol_107 = (-(__value__(X(I)) /(OpenAD_Symbol_105 *
     >  OpenAD_Symbol_105)))
        OpenAD_Symbol_104 = EXP(OpenAD_Symbol_103)
        OpenAD_Symbol_101 = OpenAD_Symbol_100
        OpenAD_Symbol_116 = OpenAD_Symbol_115
        OpenAD_Symbol_113 = (INT(1_w2f__i8) / 1.2D+01)
        OpenAD_Symbol_102 = OpenAD_Symbol_99
        OpenAD_Symbol_98 = 1_w2f__i8
        OpenAD_Symbol_197 = (OpenAD_Symbol_104 * OpenAD_Symbol_101)
        OpenAD_Symbol_198 = (OpenAD_Symbol_106 * OpenAD_Symbol_197)
        OpenAD_Symbol_199 = (OpenAD_Symbol_107 * OpenAD_Symbol_197)
        OpenAD_Symbol_200 = (OpenAD_Symbol_110 * OpenAD_Symbol_199)
        OpenAD_Symbol_201 = (OpenAD_Symbol_111 * OpenAD_Symbol_199)
        OpenAD_Symbol_202 = (OpenAD_Symbol_116 * OpenAD_Symbol_113 *
     >  OpenAD_Symbol_102)
        CALL sax(OpenAD_Symbol_198, __deriv__(X(I)), __deriv__(F(I + 1)
     > ))
        CALL saxpy(OpenAD_Symbol_200, __deriv__(X(I)), __deriv__(F(I +
     >  1)))
        CALL saxpy(OpenAD_Symbol_201, __deriv__(X(9)), __deriv__(F(I +
     >  1)))
        CALL saxpy(OpenAD_Symbol_202, __deriv__(X(8)), __deriv__(F(I +
     >  1)))
        CALL saxpy(1_w2f__i8, __deriv__(X(I)), __deriv__(F(I + 1)))
      END DO
      OpenAD_Symbol_128 = (__value__(X(7)) * __value__(X(9)) + 1.0D00)
      OpenAD_Symbol_126 = (__value__(X(7)) / OpenAD_Symbol_128)
      OpenAD_Symbol_122 = EXP(OpenAD_Symbol_126)
      OpenAD_Symbol_138 = (H * H)
      OpenAD_Symbol_135 = (__value__(X(8)) * OpenAD_Symbol_138)
      OpenAD_Symbol_123 = (OpenAD_Symbol_135 / 1.2D+01)
      __value__(F(6)) = (__value__(X(7)) + __value__(F(6)) +
     >  OpenAD_Symbol_122 * OpenAD_Symbol_123)
      OpenAD_Symbol_120 = 1_w2f__i8
      OpenAD_Symbol_121 = 1_w2f__i8
      OpenAD_Symbol_118 = 1_w2f__i8
      OpenAD_Symbol_129 = (INT(1_w2f__i8) / OpenAD_Symbol_128)
      OpenAD_Symbol_133 = __value__(X(9))
      OpenAD_Symbol_134 = __value__(X(7))
      OpenAD_Symbol_131 = 1_w2f__i8
      OpenAD_Symbol_130 = (-(__value__(X(7)) /(OpenAD_Symbol_128 *
     >  OpenAD_Symbol_128)))
      OpenAD_Symbol_127 = EXP(OpenAD_Symbol_126)
      OpenAD_Symbol_124 = OpenAD_Symbol_123
      OpenAD_Symbol_139 = OpenAD_Symbol_138
      OpenAD_Symbol_136 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_125 = OpenAD_Symbol_122
      OpenAD_Symbol_119 = 1_w2f__i8
      OpenAD_Symbol_203 = (OpenAD_Symbol_127 * OpenAD_Symbol_124)
      OpenAD_Symbol_204 = (OpenAD_Symbol_129 * OpenAD_Symbol_203)
      OpenAD_Symbol_205 = (OpenAD_Symbol_130 * OpenAD_Symbol_203)
      OpenAD_Symbol_206 = (OpenAD_Symbol_133 * OpenAD_Symbol_205)
      OpenAD_Symbol_207 = (OpenAD_Symbol_134 * OpenAD_Symbol_205)
      OpenAD_Symbol_208 = (OpenAD_Symbol_139 * OpenAD_Symbol_136 *
     >  OpenAD_Symbol_125)
      CALL setderiv(__deriv__(OpenAD_Symbol_209), __deriv__(F(6)))
      CALL sax(1_w2f__i8, __deriv__(X(7)), __deriv__(F(6)))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_209), __deriv__(F(6
     > )))
      CALL saxpy(OpenAD_Symbol_204, __deriv__(X(7)), __deriv__(F(6)))
      CALL saxpy(OpenAD_Symbol_206, __deriv__(X(7)), __deriv__(F(6)))
      CALL saxpy(OpenAD_Symbol_207, __deriv__(X(9)), __deriv__(F(6)))
      CALL saxpy(OpenAD_Symbol_208, __deriv__(X(8)), __deriv__(F(6)))
      __value__(F(7)) = (__value__(F(7)) - __value__(X(7)) * 2.0D00)
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 2.0D00
      OpenAD_Symbol_142 = (-1_w2f__i8)
      CALL setderiv(__deriv__(OpenAD_Symbol_210), __deriv__(F(7)))
      CALL sax(-2.0D00, __deriv__(X(7)), __deriv__(F(7)))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_210), __deriv__(F(7
     > )))
      OpenAD_Symbol_154 = (H * H)
      OpenAD_Symbol_151 = (__value__(X(8)) * OpenAD_Symbol_154)
      OpenAD_Symbol_147 = (OpenAD_Symbol_151 / 1.2D+01)
      OpenAD_Symbol_164 = (__value__(X(7)) * __value__(X(9)) + 1.0D00)
      OpenAD_Symbol_162 = (__value__(X(7)) / OpenAD_Symbol_164)
      OpenAD_Symbol_159 = EXP(OpenAD_Symbol_162)
      OpenAD_Symbol_148 = (OpenAD_Symbol_159 * 1.0D+01 + 1.0D00)
      __value__(F(7)) = (__value__(F(7)) + OpenAD_Symbol_147 *
     >  OpenAD_Symbol_148)
      OpenAD_Symbol_145 = 1_w2f__i8
      OpenAD_Symbol_155 = OpenAD_Symbol_154
      OpenAD_Symbol_152 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_149 = OpenAD_Symbol_148
      OpenAD_Symbol_165 = (INT(1_w2f__i8) / OpenAD_Symbol_164)
      OpenAD_Symbol_169 = __value__(X(9))
      OpenAD_Symbol_170 = __value__(X(7))
      OpenAD_Symbol_167 = 1_w2f__i8
      OpenAD_Symbol_166 = (-(__value__(X(7)) /(OpenAD_Symbol_164 *
     >  OpenAD_Symbol_164)))
      OpenAD_Symbol_163 = EXP(OpenAD_Symbol_162)
      OpenAD_Symbol_160 = 1.0D+01
      OpenAD_Symbol_157 = 1_w2f__i8
      OpenAD_Symbol_150 = OpenAD_Symbol_147
      OpenAD_Symbol_146 = 1_w2f__i8
      OpenAD_Symbol_211 = (OpenAD_Symbol_163 * 1.0D+01 *
     >  OpenAD_Symbol_150)
      OpenAD_Symbol_212 = (OpenAD_Symbol_165 * OpenAD_Symbol_211)
      OpenAD_Symbol_213 = (OpenAD_Symbol_166 * OpenAD_Symbol_211)
      OpenAD_Symbol_214 = (OpenAD_Symbol_169 * OpenAD_Symbol_213)
      OpenAD_Symbol_215 = (OpenAD_Symbol_170 * OpenAD_Symbol_213)
      OpenAD_Symbol_216 = (OpenAD_Symbol_155 * OpenAD_Symbol_152 *
     >  OpenAD_Symbol_149)
      CALL setderiv(__deriv__(OpenAD_Symbol_217), __deriv__(F(7)))
      CALL sax(OpenAD_Symbol_212, __deriv__(X(7)), __deriv__(F(7)))
      CALL saxpy(OpenAD_Symbol_214, __deriv__(X(7)), __deriv__(F(7)))
      CALL saxpy(OpenAD_Symbol_215, __deriv__(X(9)), __deriv__(F(7)))
      CALL saxpy(OpenAD_Symbol_216, __deriv__(X(8)), __deriv__(F(7)))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_217), __deriv__(F(7
     > )))
      END SUBROUTINE
