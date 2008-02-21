

      SUBROUTINE head(X, F)
      use w2f__types
      use active_module
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
      REAL(w2f__8) OpenAD_Symbol_189
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_190
      REAL(w2f__8) OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      type(active) :: OpenAD_Symbol_199
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
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      type(active) :: OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      REAL(w2f__8) OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      REAL(w2f__8) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      type(active) :: OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      type(active) :: OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      REAL(w2f__8) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_256
      REAL(w2f__8) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      REAL(w2f__8) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      type(active) :: OpenAD_Symbol_262
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
      type(active) :: X(1 : 9)
      type(active) :: F(1 : 7)
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
      OpenAD_Symbol_8 = (X(8)%v*OpenAD_Symbol_11)
      OpenAD_Symbol_4 = (OpenAD_Symbol_8 / 1.2D+01)
      OpenAD_Symbol_21 = (X(1)%v*X(9)%v+1.0D00)
      OpenAD_Symbol_19 = (X(1)%v/OpenAD_Symbol_21)
      OpenAD_Symbol_16 = EXP(OpenAD_Symbol_19)
      OpenAD_Symbol_5 = (OpenAD_Symbol_16 * 1.0D+01 + 1.0D00)
      F(1)%v = (X(1)%v*(-2.0D00)+OpenAD_Symbol_4*OpenAD_Symbol_5)
      OpenAD_Symbol_2 = (-2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_12 = OpenAD_Symbol_11
      OpenAD_Symbol_9 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_6 = OpenAD_Symbol_5
      OpenAD_Symbol_22 = (INT(1_w2f__i8) / OpenAD_Symbol_21)
      OpenAD_Symbol_26 = X(9)%v
      OpenAD_Symbol_27 = X(1)%v
      OpenAD_Symbol_24 = 1_w2f__i8
      OpenAD_Symbol_23 = (-(X(1)%v/(OpenAD_Symbol_21*OpenAD_Symbol_21)))
      OpenAD_Symbol_20 = EXP(OpenAD_Symbol_19)
      OpenAD_Symbol_17 = 1.0D+01
      OpenAD_Symbol_14 = 1_w2f__i8
      OpenAD_Symbol_7 = OpenAD_Symbol_4
      OpenAD_Symbol_1 = 1_w2f__i8
      OpenAD_Symbol_36 = (X(1)%v*X(9)%v+1.0D00)
      OpenAD_Symbol_34 = (X(1)%v/OpenAD_Symbol_36)
      OpenAD_Symbol_30 = EXP(OpenAD_Symbol_34)
      OpenAD_Symbol_46 = (H * H)
      OpenAD_Symbol_43 = (X(8)%v*OpenAD_Symbol_46)
      OpenAD_Symbol_31 = (OpenAD_Symbol_43 / 1.2D+01)
      F(2)%v = (X(1)%v+OpenAD_Symbol_30*OpenAD_Symbol_31)
      OpenAD_Symbol_28 = 1_w2f__i8
      OpenAD_Symbol_37 = (INT(1_w2f__i8) / OpenAD_Symbol_36)
      OpenAD_Symbol_41 = X(9)%v
      OpenAD_Symbol_42 = X(1)%v
      OpenAD_Symbol_39 = 1_w2f__i8
      OpenAD_Symbol_38 = (-(X(1)%v/(OpenAD_Symbol_36*OpenAD_Symbol_36)))
      OpenAD_Symbol_35 = EXP(OpenAD_Symbol_34)
      OpenAD_Symbol_32 = OpenAD_Symbol_31
      OpenAD_Symbol_47 = OpenAD_Symbol_46
      OpenAD_Symbol_44 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_33 = OpenAD_Symbol_30
      OpenAD_Symbol_29 = 1_w2f__i8
      OpenAD_Symbol_171 = (OpenAD_Symbol_6 * OpenAD_Symbol_1)
      OpenAD_Symbol_172 = (OpenAD_Symbol_7 * OpenAD_Symbol_1)
      OpenAD_Symbol_173 = (OpenAD_Symbol_32 * OpenAD_Symbol_29)
      OpenAD_Symbol_174 = (OpenAD_Symbol_33 * OpenAD_Symbol_29)
      OpenAD_Symbol_175 = (OpenAD_Symbol_14 * OpenAD_Symbol_172)
      OpenAD_Symbol_176 = (OpenAD_Symbol_17 * OpenAD_Symbol_175)
      OpenAD_Symbol_177 = (OpenAD_Symbol_35 * OpenAD_Symbol_173)
      OpenAD_Symbol_178 = (OpenAD_Symbol_37 * OpenAD_Symbol_177)
      OpenAD_Symbol_179 = (OpenAD_Symbol_38 * OpenAD_Symbol_177)
      OpenAD_Symbol_180 = (OpenAD_Symbol_20 * OpenAD_Symbol_176)
      OpenAD_Symbol_181 = (OpenAD_Symbol_22 * OpenAD_Symbol_180)
      OpenAD_Symbol_182 = (OpenAD_Symbol_23 * OpenAD_Symbol_180)
      OpenAD_Symbol_183 = (OpenAD_Symbol_44 * OpenAD_Symbol_174)
      OpenAD_Symbol_184 = (OpenAD_Symbol_39 * OpenAD_Symbol_179)
      OpenAD_Symbol_185 = (OpenAD_Symbol_41 * OpenAD_Symbol_184)
      OpenAD_Symbol_186 = (OpenAD_Symbol_42 * OpenAD_Symbol_184)
      OpenAD_Symbol_187 = (OpenAD_Symbol_24 * OpenAD_Symbol_182)
      OpenAD_Symbol_188 = (OpenAD_Symbol_26 * OpenAD_Symbol_187)
      OpenAD_Symbol_189 = (OpenAD_Symbol_27 * OpenAD_Symbol_187)
      OpenAD_Symbol_190 = (OpenAD_Symbol_9 * OpenAD_Symbol_171)
      OpenAD_Symbol_191 = (OpenAD_Symbol_47 * OpenAD_Symbol_183)
      OpenAD_Symbol_192 = (OpenAD_Symbol_12 * OpenAD_Symbol_190)
      OpenAD_Symbol_193 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
      OpenAD_Symbol_194 = OpenAD_Symbol_28
      CALL sax(OpenAD_Symbol_178,X(1),F(2))
      CALL sax(OpenAD_Symbol_181,X(1),F(1))
      CALL saxpy(OpenAD_Symbol_185,X(1),F(2))
      CALL saxpy(OpenAD_Symbol_186,X(9),F(2))
      CALL saxpy(OpenAD_Symbol_188,X(1),F(1))
      CALL saxpy(OpenAD_Symbol_189,X(9),F(1))
      CALL saxpy(OpenAD_Symbol_191,X(8),F(2))
      CALL saxpy(OpenAD_Symbol_192,X(8),F(1))
      CALL saxpy(OpenAD_Symbol_193,X(1),F(1))
      CALL saxpy(OpenAD_Symbol_194,X(1),F(2))
      DO I = 2, 6, 1
        OpenAD_Symbol_59 = (X(I)%v*X(9)%v+1.0D00)
        OpenAD_Symbol_57 = (X(I)%v/OpenAD_Symbol_59)
        OpenAD_Symbol_53 = EXP(OpenAD_Symbol_57)
        OpenAD_Symbol_69 = (H * H)
        OpenAD_Symbol_66 = (X(8)%v*OpenAD_Symbol_69)
        OpenAD_Symbol_54 = (OpenAD_Symbol_66 / 1.2D+01)
        F(INT(I+(-1)))%v = (X(I)%v+F(I+(-1))%v+OpenAD_Symbol_53*OpenAD_S
     +ymbol_54)
        OpenAD_Symbol_51 = 1_w2f__i8
        OpenAD_Symbol_52 = 1_w2f__i8
        OpenAD_Symbol_49 = 1_w2f__i8
        OpenAD_Symbol_60 = (INT(1_w2f__i8) / OpenAD_Symbol_59)
        OpenAD_Symbol_64 = X(9)%v
        OpenAD_Symbol_65 = X(I)%v
        OpenAD_Symbol_62 = 1_w2f__i8
        OpenAD_Symbol_61 = (-(X(I)%v/(OpenAD_Symbol_59*OpenAD_Symbol_59)
     +))
        OpenAD_Symbol_58 = EXP(OpenAD_Symbol_57)
        OpenAD_Symbol_55 = OpenAD_Symbol_54
        OpenAD_Symbol_70 = OpenAD_Symbol_69
        OpenAD_Symbol_67 = (INT(1_w2f__i8) / 1.2D+01)
        OpenAD_Symbol_56 = OpenAD_Symbol_53
        OpenAD_Symbol_50 = 1_w2f__i8
        OpenAD_Symbol_195 = (OpenAD_Symbol_55 * OpenAD_Symbol_50)
        OpenAD_Symbol_196 = (OpenAD_Symbol_56 * OpenAD_Symbol_50)
        OpenAD_Symbol_197 = (OpenAD_Symbol_51 * OpenAD_Symbol_49)
        OpenAD_Symbol_198 = (OpenAD_Symbol_52 * OpenAD_Symbol_49)
        OpenAD_Symbol_200 = (OpenAD_Symbol_58 * OpenAD_Symbol_195)
        OpenAD_Symbol_201 = (OpenAD_Symbol_60 * OpenAD_Symbol_200)
        OpenAD_Symbol_202 = (OpenAD_Symbol_61 * OpenAD_Symbol_200)
        OpenAD_Symbol_203 = (OpenAD_Symbol_67 * OpenAD_Symbol_196)
        OpenAD_Symbol_204 = (OpenAD_Symbol_62 * OpenAD_Symbol_202)
        OpenAD_Symbol_205 = (OpenAD_Symbol_64 * OpenAD_Symbol_204)
        OpenAD_Symbol_206 = (OpenAD_Symbol_65 * OpenAD_Symbol_204)
        OpenAD_Symbol_207 = (OpenAD_Symbol_70 * OpenAD_Symbol_203)
        CALL setderiv(OpenAD_Symbol_199,F(I+(-1)))
        CALL sax(OpenAD_Symbol_197,X(I),F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_198,OpenAD_Symbol_199,F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_201,X(I),F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_205,X(I),F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_206,X(9),F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_207,X(8),F(I+(-1)))
        OpenAD_Symbol_80 = (X(I)%v*X(9)%v+1.0D00)
        OpenAD_Symbol_78 = (X(I)%v/OpenAD_Symbol_80)
        OpenAD_Symbol_74 = EXP(OpenAD_Symbol_78)
        OpenAD_Symbol_90 = (H * H)
        OpenAD_Symbol_87 = (X(8)%v*OpenAD_Symbol_90)
        OpenAD_Symbol_75 = (OpenAD_Symbol_87 /
     >  1.20000004768371582031D00)
        F(INT(I))%v = (OpenAD_Symbol_74*OpenAD_Symbol_75+F(I)%v-X(I)%v*2
     +.0D00)
        OpenAD_Symbol_81 = (INT(1_w2f__i8) / OpenAD_Symbol_80)
        OpenAD_Symbol_85 = X(9)%v
        OpenAD_Symbol_86 = X(I)%v
        OpenAD_Symbol_83 = 1_w2f__i8
        OpenAD_Symbol_82 = (-(X(I)%v/(OpenAD_Symbol_80*OpenAD_Symbol_80)
     +))
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
        OpenAD_Symbol_105 = (X(I)%v*X(9)%v+1.0D00)
        OpenAD_Symbol_103 = (X(I)%v/OpenAD_Symbol_105)
        OpenAD_Symbol_99 = EXP(OpenAD_Symbol_103)
        OpenAD_Symbol_115 = (H * H)
        OpenAD_Symbol_112 = (X(8)%v*OpenAD_Symbol_115)
        OpenAD_Symbol_100 = (OpenAD_Symbol_112 / 1.2D+01)
        F(INT(I+1))%v = (X(I)%v+OpenAD_Symbol_99*OpenAD_Symbol_100)
        OpenAD_Symbol_97 = 1_w2f__i8
        OpenAD_Symbol_106 = (INT(1_w2f__i8) / OpenAD_Symbol_105)
        OpenAD_Symbol_110 = X(9)%v
        OpenAD_Symbol_111 = X(I)%v
        OpenAD_Symbol_108 = 1_w2f__i8
        OpenAD_Symbol_107 = (-(X(I)%v/(OpenAD_Symbol_105*OpenAD_Symbol_1
     +05)))
        OpenAD_Symbol_104 = EXP(OpenAD_Symbol_103)
        OpenAD_Symbol_101 = OpenAD_Symbol_100
        OpenAD_Symbol_116 = OpenAD_Symbol_115
        OpenAD_Symbol_113 = (INT(1_w2f__i8) / 1.2D+01)
        OpenAD_Symbol_102 = OpenAD_Symbol_99
        OpenAD_Symbol_98 = 1_w2f__i8
        OpenAD_Symbol_208 = (OpenAD_Symbol_101 * OpenAD_Symbol_98)
        OpenAD_Symbol_209 = (OpenAD_Symbol_102 * OpenAD_Symbol_98)
        OpenAD_Symbol_210 = (OpenAD_Symbol_76 * OpenAD_Symbol_72)
        OpenAD_Symbol_211 = (OpenAD_Symbol_77 * OpenAD_Symbol_72)
        OpenAD_Symbol_212 = (OpenAD_Symbol_93 * OpenAD_Symbol_73)
        OpenAD_Symbol_214 = (OpenAD_Symbol_94 * OpenAD_Symbol_73)
        OpenAD_Symbol_215 = (OpenAD_Symbol_104 * OpenAD_Symbol_208)
        OpenAD_Symbol_216 = (OpenAD_Symbol_106 * OpenAD_Symbol_215)
        OpenAD_Symbol_217 = (OpenAD_Symbol_107 * OpenAD_Symbol_215)
        OpenAD_Symbol_218 = (OpenAD_Symbol_79 * OpenAD_Symbol_210)
        OpenAD_Symbol_219 = (OpenAD_Symbol_81 * OpenAD_Symbol_218)
        OpenAD_Symbol_220 = (OpenAD_Symbol_82 * OpenAD_Symbol_218)
        OpenAD_Symbol_221 = (OpenAD_Symbol_113 * OpenAD_Symbol_209)
        OpenAD_Symbol_222 = (OpenAD_Symbol_108 * OpenAD_Symbol_217)
        OpenAD_Symbol_223 = (OpenAD_Symbol_110 * OpenAD_Symbol_222)
        OpenAD_Symbol_224 = (OpenAD_Symbol_111 * OpenAD_Symbol_222)
        OpenAD_Symbol_225 = (OpenAD_Symbol_88 * OpenAD_Symbol_211)
        OpenAD_Symbol_226 = (OpenAD_Symbol_83 * OpenAD_Symbol_220)
        OpenAD_Symbol_227 = (OpenAD_Symbol_85 * OpenAD_Symbol_226)
        OpenAD_Symbol_228 = (OpenAD_Symbol_86 * OpenAD_Symbol_226)
        OpenAD_Symbol_229 = (OpenAD_Symbol_116 * OpenAD_Symbol_221)
        OpenAD_Symbol_230 = (OpenAD_Symbol_95 * OpenAD_Symbol_214)
        OpenAD_Symbol_231 = (OpenAD_Symbol_91 * OpenAD_Symbol_225)
        OpenAD_Symbol_232 = OpenAD_Symbol_97
        CALL setderiv(OpenAD_Symbol_213,F(I))
        CALL sax(OpenAD_Symbol_212,OpenAD_Symbol_213,F(I))
        CALL sax(OpenAD_Symbol_216,X(I),F(I+1))
        CALL saxpy(OpenAD_Symbol_219,X(I),F(I))
        CALL saxpy(OpenAD_Symbol_223,X(I),F(I+1))
        CALL saxpy(OpenAD_Symbol_224,X(9),F(I+1))
        CALL saxpy(OpenAD_Symbol_227,X(I),F(I))
        CALL saxpy(OpenAD_Symbol_228,X(9),F(I))
        CALL saxpy(OpenAD_Symbol_229,X(8),F(I+1))
        CALL saxpy(OpenAD_Symbol_230,X(I),F(I))
        CALL saxpy(OpenAD_Symbol_231,X(8),F(I))
        CALL saxpy(OpenAD_Symbol_232,X(I),F(I+1))
      END DO
      OpenAD_Symbol_128 = (X(7)%v*X(9)%v+1.0D00)
      OpenAD_Symbol_126 = (X(7)%v/OpenAD_Symbol_128)
      OpenAD_Symbol_122 = EXP(OpenAD_Symbol_126)
      OpenAD_Symbol_138 = (H * H)
      OpenAD_Symbol_135 = (X(8)%v*OpenAD_Symbol_138)
      OpenAD_Symbol_123 = (OpenAD_Symbol_135 / 1.2D+01)
      F(6)%v = (X(7)%v+F(6)%v+OpenAD_Symbol_122*OpenAD_Symbol_123)
      OpenAD_Symbol_120 = 1_w2f__i8
      OpenAD_Symbol_121 = 1_w2f__i8
      OpenAD_Symbol_118 = 1_w2f__i8
      OpenAD_Symbol_129 = (INT(1_w2f__i8) / OpenAD_Symbol_128)
      OpenAD_Symbol_133 = X(9)%v
      OpenAD_Symbol_134 = X(7)%v
      OpenAD_Symbol_131 = 1_w2f__i8
      OpenAD_Symbol_130 = (-(X(7)%v/(OpenAD_Symbol_128*OpenAD_Symbol_128
     +)))
      OpenAD_Symbol_127 = EXP(OpenAD_Symbol_126)
      OpenAD_Symbol_124 = OpenAD_Symbol_123
      OpenAD_Symbol_139 = OpenAD_Symbol_138
      OpenAD_Symbol_136 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_125 = OpenAD_Symbol_122
      OpenAD_Symbol_119 = 1_w2f__i8
      OpenAD_Symbol_233 = (OpenAD_Symbol_124 * OpenAD_Symbol_119)
      OpenAD_Symbol_234 = (OpenAD_Symbol_125 * OpenAD_Symbol_119)
      OpenAD_Symbol_235 = (OpenAD_Symbol_120 * OpenAD_Symbol_118)
      OpenAD_Symbol_236 = (OpenAD_Symbol_121 * OpenAD_Symbol_118)
      OpenAD_Symbol_238 = (OpenAD_Symbol_127 * OpenAD_Symbol_233)
      OpenAD_Symbol_239 = (OpenAD_Symbol_129 * OpenAD_Symbol_238)
      OpenAD_Symbol_240 = (OpenAD_Symbol_130 * OpenAD_Symbol_238)
      OpenAD_Symbol_241 = (OpenAD_Symbol_136 * OpenAD_Symbol_234)
      OpenAD_Symbol_242 = (OpenAD_Symbol_131 * OpenAD_Symbol_240)
      OpenAD_Symbol_243 = (OpenAD_Symbol_133 * OpenAD_Symbol_242)
      OpenAD_Symbol_244 = (OpenAD_Symbol_134 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_139 * OpenAD_Symbol_241)
      CALL setderiv(OpenAD_Symbol_237,F(6))
      CALL sax(OpenAD_Symbol_235,X(7),F(6))
      CALL saxpy(OpenAD_Symbol_236,OpenAD_Symbol_237,F(6))
      CALL saxpy(OpenAD_Symbol_239,X(7),F(6))
      CALL saxpy(OpenAD_Symbol_243,X(7),F(6))
      CALL saxpy(OpenAD_Symbol_244,X(9),F(6))
      CALL saxpy(OpenAD_Symbol_245,X(8),F(6))
      F(7)%v = (F(7)%v-X(7)%v*2.0D00)
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 2.0D00
      OpenAD_Symbol_142 = (-1_w2f__i8)
      OpenAD_Symbol_246 = (OpenAD_Symbol_143 * OpenAD_Symbol_142)
      OpenAD_Symbol_247 = OpenAD_Symbol_141
      CALL setderiv(OpenAD_Symbol_248,F(7))
      CALL sax(OpenAD_Symbol_246,X(7),F(7))
      CALL saxpy(OpenAD_Symbol_247,OpenAD_Symbol_248,F(7))
      OpenAD_Symbol_154 = (H * H)
      OpenAD_Symbol_151 = (X(8)%v*OpenAD_Symbol_154)
      OpenAD_Symbol_147 = (OpenAD_Symbol_151 / 1.2D+01)
      OpenAD_Symbol_164 = (X(7)%v*X(9)%v+1.0D00)
      OpenAD_Symbol_162 = (X(7)%v/OpenAD_Symbol_164)
      OpenAD_Symbol_159 = EXP(OpenAD_Symbol_162)
      OpenAD_Symbol_148 = (OpenAD_Symbol_159 * 1.0D+01 + 1.0D00)
      F(7)%v = (F(7)%v+OpenAD_Symbol_147*OpenAD_Symbol_148)
      OpenAD_Symbol_145 = 1_w2f__i8
      OpenAD_Symbol_155 = OpenAD_Symbol_154
      OpenAD_Symbol_152 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_149 = OpenAD_Symbol_148
      OpenAD_Symbol_165 = (INT(1_w2f__i8) / OpenAD_Symbol_164)
      OpenAD_Symbol_169 = X(9)%v
      OpenAD_Symbol_170 = X(7)%v
      OpenAD_Symbol_167 = 1_w2f__i8
      OpenAD_Symbol_166 = (-(X(7)%v/(OpenAD_Symbol_164*OpenAD_Symbol_164
     +)))
      OpenAD_Symbol_163 = EXP(OpenAD_Symbol_162)
      OpenAD_Symbol_160 = 1.0D+01
      OpenAD_Symbol_157 = 1_w2f__i8
      OpenAD_Symbol_150 = OpenAD_Symbol_147
      OpenAD_Symbol_146 = 1_w2f__i8
      OpenAD_Symbol_249 = (OpenAD_Symbol_149 * OpenAD_Symbol_146)
      OpenAD_Symbol_250 = (OpenAD_Symbol_150 * OpenAD_Symbol_146)
      OpenAD_Symbol_251 = (OpenAD_Symbol_157 * OpenAD_Symbol_250)
      OpenAD_Symbol_252 = (OpenAD_Symbol_160 * OpenAD_Symbol_251)
      OpenAD_Symbol_253 = (OpenAD_Symbol_163 * OpenAD_Symbol_252)
      OpenAD_Symbol_254 = (OpenAD_Symbol_165 * OpenAD_Symbol_253)
      OpenAD_Symbol_255 = (OpenAD_Symbol_166 * OpenAD_Symbol_253)
      OpenAD_Symbol_256 = (OpenAD_Symbol_167 * OpenAD_Symbol_255)
      OpenAD_Symbol_257 = (OpenAD_Symbol_169 * OpenAD_Symbol_256)
      OpenAD_Symbol_258 = (OpenAD_Symbol_170 * OpenAD_Symbol_256)
      OpenAD_Symbol_259 = (OpenAD_Symbol_152 * OpenAD_Symbol_249)
      OpenAD_Symbol_260 = (OpenAD_Symbol_155 * OpenAD_Symbol_259)
      OpenAD_Symbol_261 = OpenAD_Symbol_145
      CALL setderiv(OpenAD_Symbol_262,F(7))
      CALL sax(OpenAD_Symbol_254,X(7),F(7))
      CALL saxpy(OpenAD_Symbol_257,X(7),F(7))
      CALL saxpy(OpenAD_Symbol_258,X(9),F(7))
      CALL saxpy(OpenAD_Symbol_260,X(8),F(7))
      CALL saxpy(OpenAD_Symbol_261,OpenAD_Symbol_262,F(7))
      END SUBROUTINE
