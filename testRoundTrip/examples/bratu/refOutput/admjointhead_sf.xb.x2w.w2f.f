
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
      TYPE (OpenADTy_active) OpenAD_Symbol_199
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
      TYPE (OpenADTy_active) OpenAD_Symbol_213
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
      TYPE (OpenADTy_active) OpenAD_Symbol_237
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
      TYPE (OpenADTy_active) OpenAD_Symbol_248
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
      TYPE (OpenADTy_active) OpenAD_Symbol_262
      INTEGER(w2f__i8) OpenAD_Symbol_263
      INTEGER(w2f__i8) OpenAD_Symbol_264
      INTEGER(w2f__i8) OpenAD_Symbol_265
      INTEGER(w2f__i8) OpenAD_Symbol_266
      INTEGER(w2f__i8) OpenAD_Symbol_267
      INTEGER(w2f__i8) OpenAD_Symbol_268
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
      INTEGER(w2f__i8) OpenAD_Symbol_269
      INTEGER(w2f__i8) OpenAD_Symbol_270
      INTEGER(w2f__i8) OpenAD_Symbol_271
      INTEGER(w2f__i8) OpenAD_Symbol_272
      INTEGER(w2f__i8) OpenAD_Symbol_273
      INTEGER(w2f__i8) OpenAD_Symbol_274
      INTEGER(w2f__i8) OpenAD_Symbol_275
      INTEGER(w2f__i8) OpenAD_Symbol_276
      INTEGER(w2f__i8) OpenAD_Symbol_277
      INTEGER(w2f__i8) OpenAD_Symbol_278
      INTEGER(w2f__i8) OpenAD_Symbol_279
      INTEGER(w2f__i8) OpenAD_Symbol_280
      REAL(w2f__8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      REAL(w2f__8) OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_284
      REAL(w2f__8) OpenAD_Symbol_285
      REAL(w2f__8) OpenAD_Symbol_286
      REAL(w2f__8) OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      REAL(w2f__8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_290
      INTEGER(w2f__i8) OpenAD_Symbol_291
      INTEGER(w2f__i8) OpenAD_Symbol_292
      REAL(w2f__8) OpenAD_Symbol_293
      INTEGER(w2f__i8) OpenAD_Symbol_294
      REAL(w2f__8) OpenAD_Symbol_295
      INTEGER(w2f__i8) OpenAD_Symbol_296
      INTEGER(w2f__i8) OpenAD_Symbol_297
      REAL(w2f__8) OpenAD_Symbol_298
      INTEGER(w2f__i8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_300
      INTEGER(w2f__i8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      INTEGER(w2f__i8) OpenAD_Symbol_303
      INTEGER(w2f__i8) OpenAD_Symbol_304
      REAL(w2f__8) OpenAD_Symbol_305
      INTEGER(w2f__i8) OpenAD_Symbol_306
      REAL(w2f__8) OpenAD_Symbol_307
      INTEGER(w2f__i8) OpenAD_Symbol_308
      INTEGER(w2f__i8) OpenAD_Symbol_309
      REAL(w2f__8) OpenAD_Symbol_310
      INTEGER(w2f__i8) OpenAD_Symbol_311
      INTEGER(w2f__i8) OpenAD_Symbol_312
      REAL(w2f__8) OpenAD_Symbol_313
      INTEGER(w2f__i8) OpenAD_Symbol_314
      INTEGER(w2f__i8) OpenAD_Symbol_315
      REAL(w2f__8) OpenAD_Symbol_316
      INTEGER(w2f__i8) OpenAD_Symbol_317
      REAL(w2f__8) OpenAD_Symbol_318
      INTEGER(w2f__i8) OpenAD_Symbol_319
      INTEGER(w2f__i8) OpenAD_Symbol_320
      REAL(w2f__8) OpenAD_Symbol_321
      INTEGER(w2f__i8) OpenAD_Symbol_322
      REAL(w2f__8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      INTEGER(w2f__i8) OpenAD_Symbol_325
      REAL(w2f__8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
      REAL(w2f__8) OpenAD_Symbol_329
      INTEGER(w2f__i8) OpenAD_Symbol_330
      REAL(w2f__8) OpenAD_Symbol_331
      INTEGER(w2f__i8) OpenAD_Symbol_332
      INTEGER(w2f__i8) OpenAD_Symbol_333
      REAL(w2f__8) OpenAD_Symbol_334
      INTEGER(w2f__i8) OpenAD_Symbol_335
      REAL(w2f__8) OpenAD_Symbol_336
      REAL(w2f__8) OpenAD_Symbol_337
      REAL(w2f__8) OpenAD_Symbol_338
      REAL(w2f__8) OpenAD_Symbol_339
      REAL(w2f__8) OpenAD_Symbol_340
      REAL(w2f__8) OpenAD_Symbol_341
      REAL(w2f__8) OpenAD_Symbol_342
      REAL(w2f__8) OpenAD_Symbol_343
      REAL(w2f__8) OpenAD_Symbol_344
      REAL(w2f__8) OpenAD_Symbol_345
      REAL(w2f__8) OpenAD_Symbol_346
      REAL(w2f__8) OpenAD_Symbol_347
      REAL(w2f__8) OpenAD_Symbol_348
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(F)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      H = 2.5D-01
      __value__(F(1)) = (__value__(X(1)) *(-2.0D00) +((__value__(X(8))
     >  * H * H) / 1.2D+01) *(EXP(__value__(X(1)) /(__value__(X(1)) *
     >  __value__(X(9)) + 1.0D00)) * 1.0D+01 + 1.0D00))
      __value__(F(2)) = (__value__(X(1)) + EXP(__value__(X(1)) /(
     > __value__(X(1)) * __value__(X(9)) + 1.0D00)) *((__value__(X(8))
     >  * H * H) / 1.2D+01))
      DO I = 2, 6, 1
        __value__(F(INT(I +(-1)))) = (__value__(X(I)) + __value__(F(I +
     >  (-1))) + EXP(__value__(X(I)) /(__value__(X(I)) * __value__(X(9)
     > ) + 1.0D00)) *((__value__(X(8)) * H * H) / 1.2D+01))
        __value__(F(INT(I))) = (EXP(__value__(X(I)) /(__value__(X(I)) *
     >  __value__(X(9)) + 1.0D00)) *((__value__(X(8)) * H * H) /
     >  1.20000004768371582031D00) + __value__(F(I)) - __value__(X(I))
     >  * 2.0D00)
        __value__(F(INT(I + 1))) = (__value__(X(I)) + EXP(__value__(X(I
     > )) /(__value__(X(I)) * __value__(X(9)) + 1.0D00)) *((__value__(X
     > (8)) * H * H) / 1.2D+01))
      END DO
      __value__(F(6)) = (__value__(X(7)) + __value__(F(6)) + EXP(
     > __value__(X(7)) /(__value__(X(7)) * __value__(X(9)) + 1.0D00)) *
     > ((__value__(X(8)) * H * H) / 1.2D+01))
      __value__(F(7)) = (__value__(F(7)) - __value__(X(7)) * 2.0D00)
      __value__(F(7)) = (__value__(F(7)) +((__value__(X(8)) * H * H) /
     >  1.2D+01) *(EXP(__value__(X(7)) /(__value__(X(7)) * __value__(X(
     > 9)) + 1.0D00)) * 1.0D+01 + 1.0D00))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
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
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_178)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_181)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_185)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_186)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_188)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_189)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_191)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_192)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_193)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_194)
      OpenAD_Symbol_265 = 0_w2f__i8
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
        OpenAD_Symbol_269 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_269)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_197)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_270 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_270)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_198)
        OpenAD_Symbol_271 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_271)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_201)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_272 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_272)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_205)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_273 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_273)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_206)
        OpenAD_Symbol_274 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_274)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_207)
        OpenAD_Symbol_275 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_275)
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
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_212)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_216)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_276 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_276)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_219)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_223)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_277 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_277)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_224)
        OpenAD_Symbol_278 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_278)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_227)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_228)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_229)
        OpenAD_Symbol_279 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_279)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_230)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_231)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_232)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_280 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_280)
        OpenAD_Symbol_265 = (INT(OpenAD_Symbol_265) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_265)
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
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_235)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_236)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_239)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_243)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_244)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_245)
      __value__(F(7)) = (__value__(F(7)) - __value__(X(7)) * 2.0D00)
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 2.0D00
      OpenAD_Symbol_142 = (-1_w2f__i8)
      OpenAD_Symbol_246 = (OpenAD_Symbol_143 * OpenAD_Symbol_142)
      OpenAD_Symbol_247 = OpenAD_Symbol_141
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_246)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
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
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_254)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_257)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_258)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_260)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_261)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_336)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_336, __deriv__(F(7)), __deriv__(
     > OpenAD_Symbol_262))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_337)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_337, __deriv__(F(7)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_338)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_338, __deriv__(F(7)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_339)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_339, __deriv__(F(7)), __deriv__(X(7)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_340)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_340, __deriv__(F(7)), __deriv__(X(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(7)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_262), __deriv__(F(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_262))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_341)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_341, __deriv__(F(7)), __deriv__(
     > OpenAD_Symbol_248))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_342)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_342, __deriv__(F(7)), __deriv__(X(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(7)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_248), __deriv__(F(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_248))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_343)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_343, __deriv__(F(6)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_344)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_344, __deriv__(F(6)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_345)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_345, __deriv__(F(6)), __deriv__(X(7)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_346)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_346, __deriv__(F(6)), __deriv__(X(7)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_347)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_347, __deriv__(F(6)), __deriv__(
     > OpenAD_Symbol_237))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_348)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_348, __deriv__(F(6)), __deriv__(X(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(6)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_237), __deriv__(F(6)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_237))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_263)
      OpenAD_Symbol_264 = 1
      DO WHILE(INT(OpenAD_Symbol_264) .LE. INT(OpenAD_Symbol_263))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_291)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_292)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_293)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_293, __deriv__(F(INT(OpenAD_Symbol_291
     > ))), __deriv__(X(INT(OpenAD_Symbol_292))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_294)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_295)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_295, __deriv__(F(INT(OpenAD_Symbol_294
     > ))), __deriv__(X(8)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_296)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_297)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_298)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_298, __deriv__(F(INT(OpenAD_Symbol_296
     > ))), __deriv__(X(INT(OpenAD_Symbol_297))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_299)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_300)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_300, __deriv__(F(INT(OpenAD_Symbol_299
     > ))), __deriv__(X(8)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_301)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_302)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_302, __deriv__(F(INT(OpenAD_Symbol_301
     > ))), __deriv__(X(9)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_303)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_304)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_305)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_305, __deriv__(F(INT(OpenAD_Symbol_303
     > ))), __deriv__(X(INT(OpenAD_Symbol_304))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_306)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_307)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_307, __deriv__(F(INT(OpenAD_Symbol_306
     > ))), __deriv__(X(9)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_308)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_309)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_310)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_310, __deriv__(F(INT(OpenAD_Symbol_308
     > ))), __deriv__(X(INT(OpenAD_Symbol_309))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_311)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_312)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_313)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_313, __deriv__(F(INT(OpenAD_Symbol_311
     > ))), __deriv__(X(INT(OpenAD_Symbol_312))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_314)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_315)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_316)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_316, __deriv__(F(INT(OpenAD_Symbol_314
     > ))), __deriv__(X(INT(OpenAD_Symbol_315))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(F(INT(OpenAD_Symbol_314))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_317)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_318)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_318, __deriv__(F(INT(OpenAD_Symbol_317
     > ))), __deriv__(OpenAD_Symbol_213))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(F(INT(OpenAD_Symbol_317))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_319)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_213), __deriv__(F(INT(
     > OpenAD_Symbol_319))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_213))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_320)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_321)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_321, __deriv__(F(INT(OpenAD_Symbol_320
     > ))), __deriv__(X(8)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_322)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_323)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_323, __deriv__(F(INT(OpenAD_Symbol_322
     > ))), __deriv__(X(9)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_324)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_325)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_326)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_326, __deriv__(F(INT(OpenAD_Symbol_324
     > ))), __deriv__(X(INT(OpenAD_Symbol_325))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_327)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_328)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_329)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_329, __deriv__(F(INT(OpenAD_Symbol_327
     > ))), __deriv__(X(INT(OpenAD_Symbol_328))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_330)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_331)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_331, __deriv__(F(INT(OpenAD_Symbol_330
     > ))), __deriv__(OpenAD_Symbol_199))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_332)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_333)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_334)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_334, __deriv__(F(INT(OpenAD_Symbol_332
     > ))), __deriv__(X(INT(OpenAD_Symbol_333))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(F(INT(OpenAD_Symbol_332))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_335)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_199), __deriv__(F(INT(
     > OpenAD_Symbol_335))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_199))
        OpenAD_Symbol_264 = INT(OpenAD_Symbol_264) + 1
      END DO
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_281)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_281, __deriv__(F(2)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_282)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_282, __deriv__(F(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_283)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_283, __deriv__(F(1)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_284)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_284, __deriv__(F(2)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_285)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_285, __deriv__(F(1)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_286)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_286, __deriv__(F(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_287)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_287, __deriv__(F(2)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_288)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_288, __deriv__(F(2)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_289)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_289, __deriv__(F(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_290)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_290, __deriv__(F(2)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(2)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
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
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_178)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_181)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_185)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_186)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_188)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_189)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_191)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_192)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_193)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_194)
      OpenAD_Symbol_268 = 0_w2f__i8
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
        OpenAD_Symbol_269 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_269)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_197)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_270 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_270)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_198)
        OpenAD_Symbol_271 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_271)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_201)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_272 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_272)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_205)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_273 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_273)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_206)
        OpenAD_Symbol_274 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_274)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_207)
        OpenAD_Symbol_275 = (I +(-1))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_275)
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
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_212)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_216)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_276 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_276)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_219)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_223)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_277 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_277)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_224)
        OpenAD_Symbol_278 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_278)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_227)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_228)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_229)
        OpenAD_Symbol_279 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_279)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_230)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_231)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_232)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(I)
        OpenAD_Symbol_280 = (I + 1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_280)
        OpenAD_Symbol_268 = (INT(OpenAD_Symbol_268) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_268)
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
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_235)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_236)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_239)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_243)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_244)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_245)
      __value__(F(7)) = (__value__(F(7)) - __value__(X(7)) * 2.0D00)
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 2.0D00
      OpenAD_Symbol_142 = (-1_w2f__i8)
      OpenAD_Symbol_246 = (OpenAD_Symbol_143 * OpenAD_Symbol_142)
      OpenAD_Symbol_247 = OpenAD_Symbol_141
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_246)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
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
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_254)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_257)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_258)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_260)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_261)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_336)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_336, __deriv__(F(7)), __deriv__(
     > OpenAD_Symbol_262))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_337)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_337, __deriv__(F(7)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_338)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_338, __deriv__(F(7)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_339)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_339, __deriv__(F(7)), __deriv__(X(7)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_340)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_340, __deriv__(F(7)), __deriv__(X(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(7)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_262), __deriv__(F(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_262))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_341)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_341, __deriv__(F(7)), __deriv__(
     > OpenAD_Symbol_248))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_342)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_342, __deriv__(F(7)), __deriv__(X(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(7)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_248), __deriv__(F(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_248))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_343)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_343, __deriv__(F(6)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_344)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_344, __deriv__(F(6)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_345)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_345, __deriv__(F(6)), __deriv__(X(7)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_346)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_346, __deriv__(F(6)), __deriv__(X(7)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_347)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_347, __deriv__(F(6)), __deriv__(
     > OpenAD_Symbol_237))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_348)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_348, __deriv__(F(6)), __deriv__(X(7)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(6)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_237), __deriv__(F(6)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_237))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_266)
      OpenAD_Symbol_267 = 1
      DO WHILE(INT(OpenAD_Symbol_267) .LE. INT(OpenAD_Symbol_266))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_291)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_292)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_293)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_293, __deriv__(F(INT(OpenAD_Symbol_291
     > ))), __deriv__(X(INT(OpenAD_Symbol_292))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_294)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_295)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_295, __deriv__(F(INT(OpenAD_Symbol_294
     > ))), __deriv__(X(8)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_296)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_297)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_298)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_298, __deriv__(F(INT(OpenAD_Symbol_296
     > ))), __deriv__(X(INT(OpenAD_Symbol_297))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_299)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_300)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_300, __deriv__(F(INT(OpenAD_Symbol_299
     > ))), __deriv__(X(8)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_301)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_302)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_302, __deriv__(F(INT(OpenAD_Symbol_301
     > ))), __deriv__(X(9)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_303)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_304)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_305)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_305, __deriv__(F(INT(OpenAD_Symbol_303
     > ))), __deriv__(X(INT(OpenAD_Symbol_304))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_306)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_307)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_307, __deriv__(F(INT(OpenAD_Symbol_306
     > ))), __deriv__(X(9)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_308)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_309)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_310)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_310, __deriv__(F(INT(OpenAD_Symbol_308
     > ))), __deriv__(X(INT(OpenAD_Symbol_309))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_311)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_312)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_313)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_313, __deriv__(F(INT(OpenAD_Symbol_311
     > ))), __deriv__(X(INT(OpenAD_Symbol_312))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_314)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_315)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_316)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_316, __deriv__(F(INT(OpenAD_Symbol_314
     > ))), __deriv__(X(INT(OpenAD_Symbol_315))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(F(INT(OpenAD_Symbol_314))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_317)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_318)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_318, __deriv__(F(INT(OpenAD_Symbol_317
     > ))), __deriv__(OpenAD_Symbol_213))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(F(INT(OpenAD_Symbol_317))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_319)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_213), __deriv__(F(INT(
     > OpenAD_Symbol_319))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_213))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_320)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_321)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_321, __deriv__(F(INT(OpenAD_Symbol_320
     > ))), __deriv__(X(8)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_322)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_323)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_323, __deriv__(F(INT(OpenAD_Symbol_322
     > ))), __deriv__(X(9)))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_324)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_325)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_326)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_326, __deriv__(F(INT(OpenAD_Symbol_324
     > ))), __deriv__(X(INT(OpenAD_Symbol_325))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_327)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_328)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_329)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_329, __deriv__(F(INT(OpenAD_Symbol_327
     > ))), __deriv__(X(INT(OpenAD_Symbol_328))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_330)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_331)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_331, __deriv__(F(INT(OpenAD_Symbol_330
     > ))), __deriv__(OpenAD_Symbol_199))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_332)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_333)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_334)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_334, __deriv__(F(INT(OpenAD_Symbol_332
     > ))), __deriv__(X(INT(OpenAD_Symbol_333))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(F(INT(OpenAD_Symbol_332))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_335)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_199), __deriv__(F(INT(
     > OpenAD_Symbol_335))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_199))
        OpenAD_Symbol_267 = INT(OpenAD_Symbol_267) + 1
      END DO
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_281)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_281, __deriv__(F(2)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_282)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_282, __deriv__(F(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_283)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_283, __deriv__(F(1)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_284)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_284, __deriv__(F(2)), __deriv__(X(8)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_285)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_285, __deriv__(F(1)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_286)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_286, __deriv__(F(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_287)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_287, __deriv__(F(2)), __deriv__(X(9)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_288)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_288, __deriv__(F(2)), __deriv__(X(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_289)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_289, __deriv__(F(1)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_290)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_290, __deriv__(F(2)), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F(2)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
