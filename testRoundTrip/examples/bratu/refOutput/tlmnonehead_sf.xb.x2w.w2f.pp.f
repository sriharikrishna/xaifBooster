C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:38:54 2006
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, F)
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
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      REAL(w2f__8) OpenAD_Symbol_172
      REAL(w2f__8) OpenAD_Symbol_173
      REAL(w2f__8) OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_176
      REAL(w2f__8) OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_180
      REAL(w2f__8) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      type(active) :: OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_190
      type(active) :: OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      type(active) :: OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      type(active) :: OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_200
      type(active) :: OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      type(active) :: OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      REAL(w2f__8) OpenAD_Symbol_205
      type(active) :: OpenAD_Symbol_206
      REAL(w2f__8) OpenAD_Symbol_207
      type(active) :: OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      type(active) :: OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      type(active) :: OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      type(active) :: OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      type(active) :: OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_220
      type(active) :: OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      type(active) :: OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      type(active) :: OpenAD_Symbol_228
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      type(active) :: OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      type(active) :: OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      type(active) :: OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      type(active) :: OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      type(active) :: OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_250
      type(active) :: OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      REAL(w2f__8) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      type(active) :: OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_256
      type(active) :: OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      type(active) :: OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_260
      type(active) :: OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      type(active) :: OpenAD_Symbol_263
      REAL(w2f__8) OpenAD_Symbol_264
      type(active) :: OpenAD_Symbol_265
      REAL(w2f__8) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      REAL(w2f__8) OpenAD_Symbol_268
      type(active) :: OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_270
      type(active) :: OpenAD_Symbol_271
      REAL(w2f__8) OpenAD_Symbol_272
      REAL(w2f__8) OpenAD_Symbol_273
      type(active) :: OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_275
      REAL(w2f__8) OpenAD_Symbol_276
      REAL(w2f__8) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
      type(active) :: OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_280
      type(active) :: OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      type(active) :: OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_284
      type(active) :: OpenAD_Symbol_285
      REAL(w2f__8) OpenAD_Symbol_286
      type(active) :: OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      REAL(w2f__8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_290
      REAL(w2f__8) OpenAD_Symbol_291
      REAL(w2f__8) OpenAD_Symbol_292
      REAL(w2f__8) OpenAD_Symbol_293
      type(active) :: OpenAD_Symbol_294
      REAL(w2f__8) OpenAD_Symbol_295
      REAL(w2f__8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      type(active) :: OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      type(active) :: OpenAD_Symbol_300
      REAL(w2f__8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      type(active) :: OpenAD_Symbol_303
      REAL(w2f__8) OpenAD_Symbol_304
      type(active) :: OpenAD_Symbol_305
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
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
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
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
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
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
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
      OpenAD_Symbol_9 = (H * H)
      OpenAD_Symbol_6 = (X(8)%v*OpenAD_Symbol_9)
      OpenAD_Symbol_2 = (OpenAD_Symbol_6 / 1.2D+01)
      OpenAD_Symbol_19 = (1.0D00+X(1)%v*X(9)%v)
      OpenAD_Symbol_17 = (X(1)%v/OpenAD_Symbol_19)
      OpenAD_Symbol_14 = EXP(OpenAD_Symbol_17)
      OpenAD_Symbol_3 = (1.0D00 + 1.0D+01 * OpenAD_Symbol_14)
      OpenAD_Symbol_28 = (OpenAD_Symbol_2*OpenAD_Symbol_3-2.0D00*X(1)%v)
      OpenAD_Symbol_10 = OpenAD_Symbol_9
      OpenAD_Symbol_7 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_4 = OpenAD_Symbol_3
      OpenAD_Symbol_20 = (INT(1_w2f__i8) / OpenAD_Symbol_19)
      OpenAD_Symbol_24 = X(9)%v
      OpenAD_Symbol_25 = X(1)%v
      OpenAD_Symbol_23 = 1_w2f__i8
      OpenAD_Symbol_21 = (-(X(1)%v/(OpenAD_Symbol_19*OpenAD_Symbol_19)))
      OpenAD_Symbol_18 = EXP(OpenAD_Symbol_17)
      OpenAD_Symbol_16 = 1.0D+01
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_5 = OpenAD_Symbol_2
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_27 = 2.0D00
      OpenAD_Symbol_1 = (-1_w2f__i8)
      F(1)%v = OpenAD_Symbol_28
      OpenAD_Symbol_37 = (1.0D00+X(1)%v*X(9)%v)
      OpenAD_Symbol_35 = (X(1)%v/OpenAD_Symbol_37)
      OpenAD_Symbol_31 = EXP(OpenAD_Symbol_35)
      OpenAD_Symbol_47 = (H * H)
      OpenAD_Symbol_44 = (X(8)%v*OpenAD_Symbol_47)
      OpenAD_Symbol_32 = (OpenAD_Symbol_44 / 1.2D+01)
      OpenAD_Symbol_50 = (X(1)%v+OpenAD_Symbol_31*OpenAD_Symbol_32)
      OpenAD_Symbol_29 = 1_w2f__i8
      OpenAD_Symbol_38 = (INT(1_w2f__i8) / OpenAD_Symbol_37)
      OpenAD_Symbol_42 = X(9)%v
      OpenAD_Symbol_43 = X(1)%v
      OpenAD_Symbol_41 = 1_w2f__i8
      OpenAD_Symbol_39 = (-(X(1)%v/(OpenAD_Symbol_37*OpenAD_Symbol_37)))
      OpenAD_Symbol_36 = EXP(OpenAD_Symbol_35)
      OpenAD_Symbol_33 = OpenAD_Symbol_32
      OpenAD_Symbol_48 = OpenAD_Symbol_47
      OpenAD_Symbol_45 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_34 = OpenAD_Symbol_31
      OpenAD_Symbol_30 = 1_w2f__i8
      F(2)%v = OpenAD_Symbol_50
      OpenAD_Symbol_179 = (OpenAD_Symbol_4 * OpenAD_Symbol_0)
      OpenAD_Symbol_180 = (OpenAD_Symbol_5 * OpenAD_Symbol_0)
      OpenAD_Symbol_181 = (OpenAD_Symbol_33 * OpenAD_Symbol_30)
      OpenAD_Symbol_182 = (OpenAD_Symbol_34 * OpenAD_Symbol_30)
      OpenAD_Symbol_183 = (OpenAD_Symbol_13 * OpenAD_Symbol_180)
      OpenAD_Symbol_184 = (OpenAD_Symbol_16 * OpenAD_Symbol_183)
      OpenAD_Symbol_185 = (OpenAD_Symbol_36 * OpenAD_Symbol_181)
      OpenAD_Symbol_186 = (OpenAD_Symbol_38 * OpenAD_Symbol_185)
      OpenAD_Symbol_188 = (OpenAD_Symbol_39 * OpenAD_Symbol_185)
      OpenAD_Symbol_189 = (OpenAD_Symbol_18 * OpenAD_Symbol_184)
      OpenAD_Symbol_190 = (OpenAD_Symbol_20 * OpenAD_Symbol_189)
      OpenAD_Symbol_192 = (OpenAD_Symbol_21 * OpenAD_Symbol_189)
      OpenAD_Symbol_193 = (OpenAD_Symbol_45 * OpenAD_Symbol_182)
      OpenAD_Symbol_194 = (OpenAD_Symbol_41 * OpenAD_Symbol_188)
      OpenAD_Symbol_195 = (OpenAD_Symbol_42 * OpenAD_Symbol_194)
      OpenAD_Symbol_197 = (OpenAD_Symbol_43 * OpenAD_Symbol_194)
      OpenAD_Symbol_199 = (OpenAD_Symbol_23 * OpenAD_Symbol_192)
      OpenAD_Symbol_200 = (OpenAD_Symbol_24 * OpenAD_Symbol_199)
      OpenAD_Symbol_202 = (OpenAD_Symbol_25 * OpenAD_Symbol_199)
      OpenAD_Symbol_204 = (OpenAD_Symbol_7 * OpenAD_Symbol_179)
      OpenAD_Symbol_205 = (OpenAD_Symbol_48 * OpenAD_Symbol_193)
      OpenAD_Symbol_207 = (OpenAD_Symbol_27 * OpenAD_Symbol_1)
      OpenAD_Symbol_209 = (OpenAD_Symbol_10 * OpenAD_Symbol_204)
      OpenAD_Symbol_211 = OpenAD_Symbol_29
      CALL setderiv(OpenAD_Symbol_212,X(1))
      CALL setderiv(OpenAD_Symbol_210,X(8))
      CALL setderiv(OpenAD_Symbol_208,X(1))
      CALL setderiv(OpenAD_Symbol_206,X(8))
      CALL setderiv(OpenAD_Symbol_203,X(9))
      CALL setderiv(OpenAD_Symbol_201,X(1))
      CALL setderiv(OpenAD_Symbol_198,X(9))
      CALL setderiv(OpenAD_Symbol_196,X(1))
      CALL setderiv(OpenAD_Symbol_191,X(1))
      CALL setderiv(OpenAD_Symbol_187,X(1))
      CALL sax(OpenAD_Symbol_186,OpenAD_Symbol_187,F(2))
      CALL sax(OpenAD_Symbol_190,OpenAD_Symbol_191,F(1))
      CALL saxpy(OpenAD_Symbol_195,OpenAD_Symbol_196,F(2))
      CALL saxpy(OpenAD_Symbol_197,OpenAD_Symbol_198,F(2))
      CALL saxpy(OpenAD_Symbol_200,OpenAD_Symbol_201,F(1))
      CALL saxpy(OpenAD_Symbol_202,OpenAD_Symbol_203,F(1))
      CALL saxpy(OpenAD_Symbol_205,OpenAD_Symbol_206,F(2))
      CALL saxpy(OpenAD_Symbol_207,OpenAD_Symbol_208,F(1))
      CALL saxpy(OpenAD_Symbol_209,OpenAD_Symbol_210,F(1))
      CALL saxpy(OpenAD_Symbol_211,OpenAD_Symbol_212,F(2))
      DO I = 2, 6, 1
        OpenAD_Symbol_61 = (1.0D00+X(I)%v*X(9)%v)
        OpenAD_Symbol_59 = (X(I)%v/OpenAD_Symbol_61)
        OpenAD_Symbol_55 = EXP(OpenAD_Symbol_59)
        OpenAD_Symbol_71 = (H * H)
        OpenAD_Symbol_68 = (X(8)%v*OpenAD_Symbol_71)
        OpenAD_Symbol_56 = (OpenAD_Symbol_68 / 1.2D+01)
        OpenAD_Symbol_74 = (X(I)%v+F(I+(-1))%v+OpenAD_Symbol_55*OpenAD_S
     +ymbol_56)
        OpenAD_Symbol_53 = 1_w2f__i8
        OpenAD_Symbol_54 = 1_w2f__i8
        OpenAD_Symbol_51 = 1_w2f__i8
        OpenAD_Symbol_62 = (INT(1_w2f__i8) / OpenAD_Symbol_61)
        OpenAD_Symbol_66 = X(9)%v
        OpenAD_Symbol_67 = X(I)%v
        OpenAD_Symbol_65 = 1_w2f__i8
        OpenAD_Symbol_63 = (-(X(I)%v/(OpenAD_Symbol_61*OpenAD_Symbol_61)
     +))
        OpenAD_Symbol_60 = EXP(OpenAD_Symbol_59)
        OpenAD_Symbol_57 = OpenAD_Symbol_56
        OpenAD_Symbol_72 = OpenAD_Symbol_71
        OpenAD_Symbol_69 = (INT(1_w2f__i8) / 1.2D+01)
        OpenAD_Symbol_58 = OpenAD_Symbol_55
        OpenAD_Symbol_52 = 1_w2f__i8
        F(INT(I+(-1)))%v = OpenAD_Symbol_74
        OpenAD_Symbol_213 = (OpenAD_Symbol_57 * OpenAD_Symbol_52)
        OpenAD_Symbol_214 = (OpenAD_Symbol_58 * OpenAD_Symbol_52)
        OpenAD_Symbol_215 = (OpenAD_Symbol_53 * OpenAD_Symbol_51)
        OpenAD_Symbol_217 = (OpenAD_Symbol_54 * OpenAD_Symbol_51)
        OpenAD_Symbol_219 = (OpenAD_Symbol_60 * OpenAD_Symbol_213)
        OpenAD_Symbol_220 = (OpenAD_Symbol_62 * OpenAD_Symbol_219)
        OpenAD_Symbol_222 = (OpenAD_Symbol_63 * OpenAD_Symbol_219)
        OpenAD_Symbol_223 = (OpenAD_Symbol_69 * OpenAD_Symbol_214)
        OpenAD_Symbol_224 = (OpenAD_Symbol_65 * OpenAD_Symbol_222)
        OpenAD_Symbol_225 = (OpenAD_Symbol_66 * OpenAD_Symbol_224)
        OpenAD_Symbol_227 = (OpenAD_Symbol_67 * OpenAD_Symbol_224)
        OpenAD_Symbol_229 = (OpenAD_Symbol_72 * OpenAD_Symbol_223)
        CALL setderiv(OpenAD_Symbol_230,X(8))
        CALL setderiv(OpenAD_Symbol_228,X(9))
        CALL setderiv(OpenAD_Symbol_226,X(I))
        CALL setderiv(OpenAD_Symbol_221,X(I))
        CALL setderiv(OpenAD_Symbol_218,F(I+(-1)))
        CALL setderiv(OpenAD_Symbol_216,X(I))
        CALL sax(OpenAD_Symbol_215,OpenAD_Symbol_216,F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_217,OpenAD_Symbol_218,F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_220,OpenAD_Symbol_221,F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_225,OpenAD_Symbol_226,F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_227,OpenAD_Symbol_228,F(I+(-1)))
        CALL saxpy(OpenAD_Symbol_229,OpenAD_Symbol_230,F(I+(-1)))
        OpenAD_Symbol_83 = (1.0D00+X(I)%v*X(9)%v)
        OpenAD_Symbol_81 = (X(I)%v/OpenAD_Symbol_83)
        OpenAD_Symbol_77 = EXP(OpenAD_Symbol_81)
        OpenAD_Symbol_93 = (H * H)
        OpenAD_Symbol_90 = (X(8)%v*OpenAD_Symbol_93)
        OpenAD_Symbol_78 = (OpenAD_Symbol_90 /
     >  1.20000004768371582031D00)
        OpenAD_Symbol_100 = (OpenAD_Symbol_77*OpenAD_Symbol_78+F(I)%v-2.
     +0D00*X(I)%v)
        OpenAD_Symbol_84 = (INT(1_w2f__i8) / OpenAD_Symbol_83)
        OpenAD_Symbol_88 = X(9)%v
        OpenAD_Symbol_89 = X(I)%v
        OpenAD_Symbol_87 = 1_w2f__i8
        OpenAD_Symbol_85 = (-(X(I)%v/(OpenAD_Symbol_83*OpenAD_Symbol_83)
     +))
        OpenAD_Symbol_82 = EXP(OpenAD_Symbol_81)
        OpenAD_Symbol_79 = OpenAD_Symbol_78
        OpenAD_Symbol_94 = OpenAD_Symbol_93
        OpenAD_Symbol_91 = (INT(1_w2f__i8) / 1.20000004768371582031D00)
        OpenAD_Symbol_80 = OpenAD_Symbol_77
        OpenAD_Symbol_75 = 1_w2f__i8
        OpenAD_Symbol_96 = 1_w2f__i8
        OpenAD_Symbol_99 = 2.0D00
        OpenAD_Symbol_97 = (-1_w2f__i8)
        OpenAD_Symbol_76 = 1_w2f__i8
        F(INT(I))%v = OpenAD_Symbol_100
        OpenAD_Symbol_109 = (1.0D00+X(I)%v*X(9)%v)
        OpenAD_Symbol_107 = (X(I)%v/OpenAD_Symbol_109)
        OpenAD_Symbol_103 = EXP(OpenAD_Symbol_107)
        OpenAD_Symbol_119 = (H * H)
        OpenAD_Symbol_116 = (X(8)%v*OpenAD_Symbol_119)
        OpenAD_Symbol_104 = (OpenAD_Symbol_116 / 1.2D+01)
        OpenAD_Symbol_122 = (X(I)%v+OpenAD_Symbol_103*OpenAD_Symbol_104)
        OpenAD_Symbol_101 = 1_w2f__i8
        OpenAD_Symbol_110 = (INT(1_w2f__i8) / OpenAD_Symbol_109)
        OpenAD_Symbol_114 = X(9)%v
        OpenAD_Symbol_115 = X(I)%v
        OpenAD_Symbol_113 = 1_w2f__i8
        OpenAD_Symbol_111 = (-(X(I)%v/(OpenAD_Symbol_109*OpenAD_Symbol_1
     +09)))
        OpenAD_Symbol_108 = EXP(OpenAD_Symbol_107)
        OpenAD_Symbol_105 = OpenAD_Symbol_104
        OpenAD_Symbol_120 = OpenAD_Symbol_119
        OpenAD_Symbol_117 = (INT(1_w2f__i8) / 1.2D+01)
        OpenAD_Symbol_106 = OpenAD_Symbol_103
        OpenAD_Symbol_102 = 1_w2f__i8
        F(INT(I+1))%v = OpenAD_Symbol_122
        OpenAD_Symbol_231 = (OpenAD_Symbol_105 * OpenAD_Symbol_102)
        OpenAD_Symbol_232 = (OpenAD_Symbol_106 * OpenAD_Symbol_102)
        OpenAD_Symbol_233 = (OpenAD_Symbol_79 * OpenAD_Symbol_75)
        OpenAD_Symbol_234 = (OpenAD_Symbol_80 * OpenAD_Symbol_75)
        OpenAD_Symbol_235 = (OpenAD_Symbol_96 * OpenAD_Symbol_76)
        OpenAD_Symbol_237 = (OpenAD_Symbol_97 * OpenAD_Symbol_76)
        OpenAD_Symbol_238 = (OpenAD_Symbol_108 * OpenAD_Symbol_231)
        OpenAD_Symbol_239 = (OpenAD_Symbol_110 * OpenAD_Symbol_238)
        OpenAD_Symbol_241 = (OpenAD_Symbol_111 * OpenAD_Symbol_238)
        OpenAD_Symbol_242 = (OpenAD_Symbol_82 * OpenAD_Symbol_233)
        OpenAD_Symbol_243 = (OpenAD_Symbol_84 * OpenAD_Symbol_242)
        OpenAD_Symbol_245 = (OpenAD_Symbol_85 * OpenAD_Symbol_242)
        OpenAD_Symbol_246 = (OpenAD_Symbol_117 * OpenAD_Symbol_232)
        OpenAD_Symbol_247 = (OpenAD_Symbol_113 * OpenAD_Symbol_241)
        OpenAD_Symbol_248 = (OpenAD_Symbol_114 * OpenAD_Symbol_247)
        OpenAD_Symbol_250 = (OpenAD_Symbol_115 * OpenAD_Symbol_247)
        OpenAD_Symbol_252 = (OpenAD_Symbol_91 * OpenAD_Symbol_234)
        OpenAD_Symbol_253 = (OpenAD_Symbol_87 * OpenAD_Symbol_245)
        OpenAD_Symbol_254 = (OpenAD_Symbol_88 * OpenAD_Symbol_253)
        OpenAD_Symbol_256 = (OpenAD_Symbol_89 * OpenAD_Symbol_253)
        OpenAD_Symbol_258 = (OpenAD_Symbol_120 * OpenAD_Symbol_246)
        OpenAD_Symbol_260 = (OpenAD_Symbol_99 * OpenAD_Symbol_237)
        OpenAD_Symbol_262 = (OpenAD_Symbol_94 * OpenAD_Symbol_252)
        OpenAD_Symbol_264 = OpenAD_Symbol_101
        CALL setderiv(OpenAD_Symbol_265,X(I))
        CALL setderiv(OpenAD_Symbol_263,X(8))
        CALL setderiv(OpenAD_Symbol_261,X(I))
        CALL setderiv(OpenAD_Symbol_259,X(8))
        CALL setderiv(OpenAD_Symbol_257,X(9))
        CALL setderiv(OpenAD_Symbol_255,X(I))
        CALL setderiv(OpenAD_Symbol_251,X(9))
        CALL setderiv(OpenAD_Symbol_249,X(I))
        CALL setderiv(OpenAD_Symbol_244,X(I))
        CALL setderiv(OpenAD_Symbol_240,X(I))
        CALL setderiv(OpenAD_Symbol_236,F(I))
        CALL sax(OpenAD_Symbol_235,OpenAD_Symbol_236,F(I))
        CALL sax(OpenAD_Symbol_239,OpenAD_Symbol_240,F(I+1))
        CALL saxpy(OpenAD_Symbol_243,OpenAD_Symbol_244,F(I))
        CALL saxpy(OpenAD_Symbol_248,OpenAD_Symbol_249,F(I+1))
        CALL saxpy(OpenAD_Symbol_250,OpenAD_Symbol_251,F(I+1))
        CALL saxpy(OpenAD_Symbol_254,OpenAD_Symbol_255,F(I))
        CALL saxpy(OpenAD_Symbol_256,OpenAD_Symbol_257,F(I))
        CALL saxpy(OpenAD_Symbol_258,OpenAD_Symbol_259,F(I+1))
        CALL saxpy(OpenAD_Symbol_260,OpenAD_Symbol_261,F(I))
        CALL saxpy(OpenAD_Symbol_262,OpenAD_Symbol_263,F(I))
        CALL saxpy(OpenAD_Symbol_264,OpenAD_Symbol_265,F(I+1))
      END DO
      OpenAD_Symbol_133 = (1.0D00+X(7)%v*X(9)%v)
      OpenAD_Symbol_131 = (X(7)%v/OpenAD_Symbol_133)
      OpenAD_Symbol_127 = EXP(OpenAD_Symbol_131)
      OpenAD_Symbol_143 = (H * H)
      OpenAD_Symbol_140 = (X(8)%v*OpenAD_Symbol_143)
      OpenAD_Symbol_128 = (OpenAD_Symbol_140 / 1.2D+01)
      OpenAD_Symbol_146 = (X(7)%v+F(6)%v+OpenAD_Symbol_127*OpenAD_Symbol
     +_128)
      OpenAD_Symbol_125 = 1_w2f__i8
      OpenAD_Symbol_126 = 1_w2f__i8
      OpenAD_Symbol_123 = 1_w2f__i8
      OpenAD_Symbol_134 = (INT(1_w2f__i8) / OpenAD_Symbol_133)
      OpenAD_Symbol_138 = X(9)%v
      OpenAD_Symbol_139 = X(7)%v
      OpenAD_Symbol_137 = 1_w2f__i8
      OpenAD_Symbol_135 = (-(X(7)%v/(OpenAD_Symbol_133*OpenAD_Symbol_133
     +)))
      OpenAD_Symbol_132 = EXP(OpenAD_Symbol_131)
      OpenAD_Symbol_129 = OpenAD_Symbol_128
      OpenAD_Symbol_144 = OpenAD_Symbol_143
      OpenAD_Symbol_141 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_130 = OpenAD_Symbol_127
      OpenAD_Symbol_124 = 1_w2f__i8
      F(6)%v = OpenAD_Symbol_146
      OpenAD_Symbol_266 = (OpenAD_Symbol_129 * OpenAD_Symbol_124)
      OpenAD_Symbol_267 = (OpenAD_Symbol_130 * OpenAD_Symbol_124)
      OpenAD_Symbol_268 = (OpenAD_Symbol_125 * OpenAD_Symbol_123)
      OpenAD_Symbol_270 = (OpenAD_Symbol_126 * OpenAD_Symbol_123)
      OpenAD_Symbol_272 = (OpenAD_Symbol_132 * OpenAD_Symbol_266)
      OpenAD_Symbol_273 = (OpenAD_Symbol_134 * OpenAD_Symbol_272)
      OpenAD_Symbol_275 = (OpenAD_Symbol_135 * OpenAD_Symbol_272)
      OpenAD_Symbol_276 = (OpenAD_Symbol_141 * OpenAD_Symbol_267)
      OpenAD_Symbol_277 = (OpenAD_Symbol_137 * OpenAD_Symbol_275)
      OpenAD_Symbol_278 = (OpenAD_Symbol_138 * OpenAD_Symbol_277)
      OpenAD_Symbol_280 = (OpenAD_Symbol_139 * OpenAD_Symbol_277)
      OpenAD_Symbol_282 = (OpenAD_Symbol_144 * OpenAD_Symbol_276)
      CALL setderiv(OpenAD_Symbol_283,X(8))
      CALL setderiv(OpenAD_Symbol_281,X(9))
      CALL setderiv(OpenAD_Symbol_279,X(7))
      CALL setderiv(OpenAD_Symbol_274,X(7))
      CALL setderiv(OpenAD_Symbol_271,F(6))
      CALL setderiv(OpenAD_Symbol_269,X(7))
      CALL sax(OpenAD_Symbol_268,OpenAD_Symbol_269,F(6))
      CALL saxpy(OpenAD_Symbol_270,OpenAD_Symbol_271,F(6))
      CALL saxpy(OpenAD_Symbol_273,OpenAD_Symbol_274,F(6))
      CALL saxpy(OpenAD_Symbol_278,OpenAD_Symbol_279,F(6))
      CALL saxpy(OpenAD_Symbol_280,OpenAD_Symbol_281,F(6))
      CALL saxpy(OpenAD_Symbol_282,OpenAD_Symbol_283,F(6))
      OpenAD_Symbol_151 = (F(7)%v-2.0D00*X(7)%v)
      OpenAD_Symbol_147 = 1_w2f__i8
      OpenAD_Symbol_150 = 2.0D00
      OpenAD_Symbol_148 = (-1_w2f__i8)
      F(7)%v = OpenAD_Symbol_151
      OpenAD_Symbol_284 = (OpenAD_Symbol_150 * OpenAD_Symbol_148)
      OpenAD_Symbol_286 = OpenAD_Symbol_147
      CALL setderiv(OpenAD_Symbol_287,F(7))
      CALL setderiv(OpenAD_Symbol_285,X(7))
      CALL sax(OpenAD_Symbol_284,OpenAD_Symbol_285,F(7))
      CALL saxpy(OpenAD_Symbol_286,OpenAD_Symbol_287,F(7))
      OpenAD_Symbol_161 = (H * H)
      OpenAD_Symbol_158 = (X(8)%v*OpenAD_Symbol_161)
      OpenAD_Symbol_154 = (OpenAD_Symbol_158 / 1.2D+01)
      OpenAD_Symbol_171 = (1.0D00+X(7)%v*X(9)%v)
      OpenAD_Symbol_169 = (X(7)%v/OpenAD_Symbol_171)
      OpenAD_Symbol_166 = EXP(OpenAD_Symbol_169)
      OpenAD_Symbol_155 = (1.0D00 + 1.0D+01 * OpenAD_Symbol_166)
      OpenAD_Symbol_178 = (F(7)%v+OpenAD_Symbol_154*OpenAD_Symbol_155)
      OpenAD_Symbol_152 = 1_w2f__i8
      OpenAD_Symbol_162 = OpenAD_Symbol_161
      OpenAD_Symbol_159 = (INT(1_w2f__i8) / 1.2D+01)
      OpenAD_Symbol_156 = OpenAD_Symbol_155
      OpenAD_Symbol_172 = (INT(1_w2f__i8) / OpenAD_Symbol_171)
      OpenAD_Symbol_176 = X(9)%v
      OpenAD_Symbol_177 = X(7)%v
      OpenAD_Symbol_175 = 1_w2f__i8
      OpenAD_Symbol_173 = (-(X(7)%v/(OpenAD_Symbol_171*OpenAD_Symbol_171
     +)))
      OpenAD_Symbol_170 = EXP(OpenAD_Symbol_169)
      OpenAD_Symbol_168 = 1.0D+01
      OpenAD_Symbol_165 = 1_w2f__i8
      OpenAD_Symbol_157 = OpenAD_Symbol_154
      OpenAD_Symbol_153 = 1_w2f__i8
      F(7)%v = OpenAD_Symbol_178
      OpenAD_Symbol_288 = (OpenAD_Symbol_156 * OpenAD_Symbol_153)
      OpenAD_Symbol_289 = (OpenAD_Symbol_157 * OpenAD_Symbol_153)
      OpenAD_Symbol_290 = (OpenAD_Symbol_165 * OpenAD_Symbol_289)
      OpenAD_Symbol_291 = (OpenAD_Symbol_168 * OpenAD_Symbol_290)
      OpenAD_Symbol_292 = (OpenAD_Symbol_170 * OpenAD_Symbol_291)
      OpenAD_Symbol_293 = (OpenAD_Symbol_172 * OpenAD_Symbol_292)
      OpenAD_Symbol_295 = (OpenAD_Symbol_173 * OpenAD_Symbol_292)
      OpenAD_Symbol_296 = (OpenAD_Symbol_175 * OpenAD_Symbol_295)
      OpenAD_Symbol_297 = (OpenAD_Symbol_176 * OpenAD_Symbol_296)
      OpenAD_Symbol_299 = (OpenAD_Symbol_177 * OpenAD_Symbol_296)
      OpenAD_Symbol_301 = (OpenAD_Symbol_159 * OpenAD_Symbol_288)
      OpenAD_Symbol_302 = (OpenAD_Symbol_162 * OpenAD_Symbol_301)
      OpenAD_Symbol_304 = OpenAD_Symbol_152
      CALL setderiv(OpenAD_Symbol_305,F(7))
      CALL setderiv(OpenAD_Symbol_303,X(8))
      CALL setderiv(OpenAD_Symbol_300,X(9))
      CALL setderiv(OpenAD_Symbol_298,X(7))
      CALL setderiv(OpenAD_Symbol_294,X(7))
      CALL sax(OpenAD_Symbol_293,OpenAD_Symbol_294,F(7))
      CALL saxpy(OpenAD_Symbol_297,OpenAD_Symbol_298,F(7))
      CALL saxpy(OpenAD_Symbol_299,OpenAD_Symbol_300,F(7))
      CALL saxpy(OpenAD_Symbol_302,OpenAD_Symbol_303,F(7))
      CALL saxpy(OpenAD_Symbol_304,OpenAD_Symbol_305,F(7))
      RETURN
      END SUBROUTINE
