
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(NX, NY, X, FVEC, R)
      use w2f__types
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
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
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
      REAL(w2f__8) OpenAD_Symbol_18
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
      INTEGER(w2f__i8) OpenAD_Symbol_191
      INTEGER(w2f__i8) OpenAD_Symbol_192
      INTEGER(w2f__i8) OpenAD_Symbol_193
      INTEGER(w2f__i8) OpenAD_Symbol_194
      INTEGER(w2f__i8) OpenAD_Symbol_195
      INTEGER(w2f__i8) OpenAD_Symbol_196
      INTEGER(w2f__i8) OpenAD_Symbol_197
      INTEGER(w2f__i8) OpenAD_Symbol_198
      INTEGER(w2f__i8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      INTEGER(w2f__i8) OpenAD_Symbol_200
      INTEGER(w2f__i8) OpenAD_Symbol_201
      INTEGER(w2f__i8) OpenAD_Symbol_202
      INTEGER(w2f__i8) OpenAD_Symbol_203
      INTEGER(w2f__i8) OpenAD_Symbol_204
      INTEGER(w2f__i8) OpenAD_Symbol_205
      INTEGER(w2f__i8) OpenAD_Symbol_206
      INTEGER(w2f__i8) OpenAD_Symbol_207
      INTEGER(w2f__i8) OpenAD_Symbol_208
      INTEGER(w2f__i8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      INTEGER(w2f__i8) OpenAD_Symbol_210
      INTEGER(w2f__i8) OpenAD_Symbol_211
      INTEGER(w2f__i8) OpenAD_Symbol_212
      INTEGER(w2f__i8) OpenAD_Symbol_213
      INTEGER(w2f__i8) OpenAD_Symbol_214
      INTEGER(w2f__i8) OpenAD_Symbol_215
      INTEGER(w2f__i8) OpenAD_Symbol_216
      INTEGER(w2f__i8) OpenAD_Symbol_217
      INTEGER(w2f__i8) OpenAD_Symbol_218
      INTEGER(w2f__i8) OpenAD_Symbol_219
      INTEGER(w2f__i8) OpenAD_Symbol_220
      INTEGER(w2f__i8) OpenAD_Symbol_221
      INTEGER(w2f__i8) OpenAD_Symbol_222
      INTEGER(w2f__i8) OpenAD_Symbol_223
      INTEGER(w2f__i8) OpenAD_Symbol_224
      INTEGER(w2f__i8) OpenAD_Symbol_225
      INTEGER(w2f__i8) OpenAD_Symbol_226
      INTEGER(w2f__i8) OpenAD_Symbol_227
      INTEGER(w2f__i8) OpenAD_Symbol_228
      INTEGER(w2f__i8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_230
      INTEGER(w2f__i8) OpenAD_Symbol_231
      INTEGER(w2f__i8) OpenAD_Symbol_232
      INTEGER(w2f__i8) OpenAD_Symbol_233
      INTEGER(w2f__i8) OpenAD_Symbol_234
      INTEGER(w2f__i8) OpenAD_Symbol_235
      INTEGER(w2f__i8) OpenAD_Symbol_236
      INTEGER(w2f__i8) OpenAD_Symbol_237
      INTEGER(w2f__i8) OpenAD_Symbol_238
      INTEGER(w2f__i8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      INTEGER(w2f__i8) OpenAD_Symbol_240
      INTEGER(w2f__i8) OpenAD_Symbol_241
      INTEGER(w2f__i8) OpenAD_Symbol_242
      INTEGER(w2f__i8) OpenAD_Symbol_243
      INTEGER(w2f__i8) OpenAD_Symbol_244
      INTEGER(w2f__i8) OpenAD_Symbol_245
      INTEGER(w2f__i8) OpenAD_Symbol_246
      INTEGER(w2f__i8) OpenAD_Symbol_247
      INTEGER(w2f__i8) OpenAD_Symbol_248
      INTEGER(w2f__i8) OpenAD_Symbol_249
      INTEGER(w2f__i8) OpenAD_Symbol_250
      INTEGER(w2f__i8) OpenAD_Symbol_251
      INTEGER(w2f__i8) OpenAD_Symbol_252
      INTEGER(w2f__i8) OpenAD_Symbol_253
      INTEGER(w2f__i8) OpenAD_Symbol_254
      INTEGER(w2f__i8) OpenAD_Symbol_255
      INTEGER(w2f__i8) OpenAD_Symbol_256
      INTEGER(w2f__i8) OpenAD_Symbol_257
      INTEGER(w2f__i8) OpenAD_Symbol_258
      INTEGER(w2f__i8) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_26
      INTEGER(w2f__i8) OpenAD_Symbol_260
      INTEGER(w2f__i8) OpenAD_Symbol_261
      INTEGER(w2f__i8) OpenAD_Symbol_262
      INTEGER(w2f__i8) OpenAD_Symbol_263
      INTEGER(w2f__i8) OpenAD_Symbol_264
      INTEGER(w2f__i8) OpenAD_Symbol_265
      INTEGER(w2f__i8) OpenAD_Symbol_266
      INTEGER(w2f__i8) OpenAD_Symbol_267
      INTEGER(w2f__i8) OpenAD_Symbol_268
      INTEGER(w2f__i8) OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_270
      INTEGER(w2f__i8) OpenAD_Symbol_271
      INTEGER(w2f__i8) OpenAD_Symbol_272
      INTEGER(w2f__i8) OpenAD_Symbol_273
      INTEGER(w2f__i8) OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) NX
      INTEGER(w2f__i4) NY
      TYPE (OpenADTy_active) X(1 : INT((NX * NY)))
      TYPE (OpenADTy_active) FVEC(1 : INT((NX * NY)))
      REAL(w2f__8) R
C
C     **** Local Variables and Functions ****
C
      TYPE (OpenADTy_active) DPDX
      TYPE (OpenADTy_active) DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      REAL(w2f__8) HX
      REAL(w2f__8) HX2
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) N
      REAL(w2f__8) NXP1
      REAL(w2f__8) NYP1
      REAL(w2f__8) ONE
      PARAMETER ( ONE = 1.0D00)
      TYPE (OpenADTy_active) P
      TYPE (OpenADTy_active) PB
      TYPE (OpenADTy_active) PBB
      TYPE (OpenADTy_active) PBL
      TYPE (OpenADTy_active) PBLAP
      TYPE (OpenADTy_active) PBR
      TYPE (OpenADTy_active) PL
      TYPE (OpenADTy_active) PLAP
      TYPE (OpenADTy_active) PLL
      TYPE (OpenADTy_active) PLLAP
      TYPE (OpenADTy_active) PR
      TYPE (OpenADTy_active) PRLAP
      TYPE (OpenADTy_active) PRR
      TYPE (OpenADTy_active) PT
      TYPE (OpenADTy_active) PTL
      TYPE (OpenADTy_active) PTLAP
      TYPE (OpenADTy_active) PTR
      TYPE (OpenADTy_active) PTT
      REAL(w2f__8) THREE
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
      INTEGER(w2f__i8) OpenAD_Symbol_275
      INTEGER(w2f__i8) OpenAD_Symbol_276
      INTEGER(w2f__i8) OpenAD_Symbol_277
      INTEGER(w2f__i8) OpenAD_Symbol_278
      INTEGER(w2f__i8) OpenAD_Symbol_279
      INTEGER(w2f__i8) OpenAD_Symbol_280
      INTEGER(w2f__i8) OpenAD_Symbol_281
      INTEGER(w2f__i8) OpenAD_Symbol_282
      INTEGER(w2f__i8) OpenAD_Symbol_283
      INTEGER(w2f__i8) OpenAD_Symbol_284
      INTEGER(w2f__i8) OpenAD_Symbol_285
      INTEGER(w2f__i8) OpenAD_Symbol_286
      INTEGER(w2f__i8) OpenAD_Symbol_287
      INTEGER(w2f__i8) OpenAD_Symbol_288
      INTEGER(w2f__i8) OpenAD_Symbol_289
      INTEGER(w2f__i8) OpenAD_Symbol_290
      INTEGER(w2f__i8) OpenAD_Symbol_291
      INTEGER(w2f__i8) OpenAD_Symbol_292
      INTEGER(w2f__i8) OpenAD_Symbol_293
      INTEGER(w2f__i8) OpenAD_Symbol_294
      INTEGER(w2f__i8) OpenAD_Symbol_295
      INTEGER(w2f__i8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      INTEGER(w2f__i8) OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      INTEGER(w2f__i8) OpenAD_Symbol_300
      REAL(w2f__8) OpenAD_Symbol_301
      INTEGER(w2f__i8) OpenAD_Symbol_302
      REAL(w2f__8) OpenAD_Symbol_303
      INTEGER(w2f__i8) OpenAD_Symbol_304
      REAL(w2f__8) OpenAD_Symbol_305
      INTEGER(w2f__i8) OpenAD_Symbol_306
      REAL(w2f__8) OpenAD_Symbol_307
      INTEGER(w2f__i8) OpenAD_Symbol_308
      REAL(w2f__8) OpenAD_Symbol_309
      INTEGER(w2f__i8) OpenAD_Symbol_310
      REAL(w2f__8) OpenAD_Symbol_311
      INTEGER(w2f__i8) OpenAD_Symbol_312
      REAL(w2f__8) OpenAD_Symbol_313
      INTEGER(w2f__i8) OpenAD_Symbol_314
      REAL(w2f__8) OpenAD_Symbol_315
      INTEGER(w2f__i8) OpenAD_Symbol_316
      REAL(w2f__8) OpenAD_Symbol_317
      INTEGER(w2f__i8) OpenAD_Symbol_318
      REAL(w2f__8) OpenAD_Symbol_319
      INTEGER(w2f__i8) OpenAD_Symbol_320
      REAL(w2f__8) OpenAD_Symbol_321
      INTEGER(w2f__i8) OpenAD_Symbol_322
      REAL(w2f__8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      REAL(w2f__8) OpenAD_Symbol_325
      INTEGER(w2f__i8) OpenAD_Symbol_326
      REAL(w2f__8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
      REAL(w2f__8) OpenAD_Symbol_329
      INTEGER(w2f__i8) OpenAD_Symbol_330
      REAL(w2f__8) OpenAD_Symbol_331
      INTEGER(w2f__i8) OpenAD_Symbol_332
      REAL(w2f__8) OpenAD_Symbol_333
      INTEGER(w2f__i8) OpenAD_Symbol_334
      REAL(w2f__8) OpenAD_Symbol_335
      INTEGER(w2f__i8) OpenAD_Symbol_336
      REAL(w2f__8) OpenAD_Symbol_337
      INTEGER(w2f__i8) OpenAD_Symbol_338
      REAL(w2f__8) OpenAD_Symbol_339
      INTEGER(w2f__i8) OpenAD_Symbol_340
      REAL(w2f__8) OpenAD_Symbol_341
      INTEGER(w2f__i8) OpenAD_Symbol_342
      REAL(w2f__8) OpenAD_Symbol_343
      INTEGER(w2f__i8) OpenAD_Symbol_344
      REAL(w2f__8) OpenAD_Symbol_345
      INTEGER(w2f__i8) OpenAD_Symbol_346
      REAL(w2f__8) OpenAD_Symbol_347
      INTEGER(w2f__i8) OpenAD_Symbol_348
      REAL(w2f__8) OpenAD_Symbol_349
      INTEGER(w2f__i8) OpenAD_Symbol_350
      REAL(w2f__8) OpenAD_Symbol_351
      INTEGER(w2f__i8) OpenAD_Symbol_352
      REAL(w2f__8) OpenAD_Symbol_353
      INTEGER(w2f__i8) OpenAD_Symbol_354
      REAL(w2f__8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      REAL(w2f__8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
      REAL(w2f__8) OpenAD_Symbol_359
      INTEGER(w2f__i8) OpenAD_Symbol_360
      REAL(w2f__8) OpenAD_Symbol_361
      INTEGER(w2f__i8) OpenAD_Symbol_362
      REAL(w2f__8) OpenAD_Symbol_363
      INTEGER(w2f__i8) OpenAD_Symbol_364
      INTEGER(w2f__i8) OpenAD_Symbol_365
      INTEGER(w2f__i8) OpenAD_Symbol_366
      INTEGER(w2f__i8) OpenAD_Symbol_367
      INTEGER(w2f__i8) OpenAD_Symbol_368
      INTEGER(w2f__i8) OpenAD_Symbol_369
      INTEGER(w2f__i8) OpenAD_Symbol_370
      INTEGER(w2f__i8) OpenAD_Symbol_371
      INTEGER(w2f__i8) OpenAD_Symbol_372
      INTEGER(w2f__i8) OpenAD_Symbol_373
      INTEGER(w2f__i8) OpenAD_Symbol_374
      INTEGER(w2f__i8) OpenAD_Symbol_375
      INTEGER(w2f__i8) OpenAD_Symbol_376
      INTEGER(w2f__i8) OpenAD_Symbol_377
      INTEGER(w2f__i8) OpenAD_Symbol_378
      INTEGER(w2f__i8) OpenAD_Symbol_379
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(FVEC)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      N = NX * NY
      NXP1 = (NX + 1)
      NYP1 = (NY + 1)
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      DO I = 1, NY, 1
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            __value__(PBL) = 0.0D00
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
          ENDIF
          IF(I .eq. 1) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
          ELSE
            IF(I .eq. 2) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            __value__(PBR) = 0.0D00
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
          ENDIF
          IF(J .eq. 1) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
          ELSE
            IF(J .eq. 2) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
            ENDIF
          ENDIF
          __value__(P) = __value__(X(K))
          IF(J .eq.(NX +(-1))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
            ENDIF
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            __value__(PTL) = 0.0D00
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = __value__(X(K))
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
          ENDIF
          __value__(DPDY) = ((__value__(PT) - __value__(PB)) /(HY *
     >  2.0D00))
          __value__(DPDX) = ((__value__(PR) - __value__(PL)) /(HX *
     >  2.0D00))
          __value__(PBLAP) = (((__value__(PBB) + __value__(P) -
     >  __value__(PB) * 2.0D00) / HY2) +((__value__(PBL) + __value__(
     > PBR) - __value__(PB) * 2.0D00) / HX2))
          __value__(PLLAP) = (((__value__(PBL) + __value__(PTL) -
     >  __value__(PL) * 2.0D00) / HY2) +((__value__(PLL) + __value__(P)
     >  - __value__(PL) * 2.0D00) / HX2))
          __value__(PLAP) = (((__value__(PB) + __value__(PT) -
     >  __value__(P) * 2.0D00) / HY2) +((__value__(PL) + __value__(PR)
     >  - __value__(P) * 2.0D00) / HX2))
          __value__(PRLAP) = (((__value__(P) + __value__(PRR) -
     >  __value__(PR) * 2.0D00) / HX2) +((__value__(PBR) + __value__(
     > PTR) - __value__(PR) * 2.0D00) / HY2))
          __value__(PTLAP) = (((__value__(P) + __value__(PTT) -
     >  __value__(PT) * 2.0D00) / HY2) +((__value__(PTL) + __value__(
     > PTR) - __value__(PT) * 2.0D00) / HX2))
          __value__(FVEC(INT(K))) = (((__value__(PBLAP) + __value__(
     > PTLAP) - __value__(PLAP) * 2.0D00) / HY2) +((__value__(PLLAP) +
     >  __value__(PRLAP) - __value__(PLAP) * 2.0D00) / HX2) - R *(((
     > __value__(DPDY) *(__value__(PRLAP) - __value__(PLLAP))) /(HX *
     >  2.0D00)) -((__value__(DPDX) *(__value__(PTLAP) - __value__(
     > PBLAP))) /(HY * 2.0D00))))
        END DO
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      N = NX * NY
      NXP1 = (NX + 1)
      NYP1 = (NY + 1)
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      OpenAD_Symbol_207 = 0_w2f__i8
      DO I = 1, NY, 1
        OpenAD_Symbol_208 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_209 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_209)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_290 = (K - NX +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_290)
            OpenAD_Symbol_210 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_210)
          ENDIF
          IF(I .eq. 1) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_213 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_213)
          ELSE
            IF(I .eq. 2) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_287 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_287)
              OpenAD_Symbol_211 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_211)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_288 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_288)
              OpenAD_Symbol_289 = (K - NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_289)
              OpenAD_Symbol_212 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_212)
            ENDIF
            OpenAD_Symbol_214 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_214)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_215 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_215)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_286 = (K - NX + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_286)
            OpenAD_Symbol_216 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_216)
          ENDIF
          IF(J .eq. 1) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_219 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_219)
          ELSE
            IF(J .eq. 2) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_283 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_283)
              OpenAD_Symbol_217 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_217)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_284 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_284)
              OpenAD_Symbol_285 = (K +(-2))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_285)
              OpenAD_Symbol_218 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_218)
            ENDIF
            OpenAD_Symbol_220 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_220)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX +(-1))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_275 = (K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_275)
            OpenAD_Symbol_223 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_223)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_221 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_221)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_281 = (K + 1)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_281)
              OpenAD_Symbol_282 = (K + 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_282)
              OpenAD_Symbol_222 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_222)
            ENDIF
            OpenAD_Symbol_224 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_224)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_225 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_225)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_280 = (NX + K +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_280)
            OpenAD_Symbol_226 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_226)
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_276 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_276)
            OpenAD_Symbol_229 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_229)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_227 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_227)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_278 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_278)
              OpenAD_Symbol_279 = (K + NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_279)
              OpenAD_Symbol_228 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_228)
            ENDIF
            OpenAD_Symbol_230 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_230)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_231 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_231)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_277 = (NX + K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_277)
            OpenAD_Symbol_232 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_232)
          ENDIF
          OpenAD_Symbol_0 = (__value__(PT) - __value__(PB))
          OpenAD_Symbol_1 = (HY * 2.0D00)
          __value__(DPDY) = (OpenAD_Symbol_0 / OpenAD_Symbol_1)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_5 = (-1_w2f__i8)
          OpenAD_Symbol_2 = (INT(1_w2f__i8) / OpenAD_Symbol_1)
          OpenAD_Symbol_6 = (__value__(PR) - __value__(PL))
          OpenAD_Symbol_7 = (HX * 2.0D00)
          __value__(DPDX) = (OpenAD_Symbol_6 / OpenAD_Symbol_7)
          OpenAD_Symbol_10 = 1_w2f__i8
          OpenAD_Symbol_11 = (-1_w2f__i8)
          OpenAD_Symbol_8 = (INT(1_w2f__i8) / OpenAD_Symbol_7)
          OpenAD_Symbol_14 = (__value__(PBB) + __value__(P) - __value__
     > (PB) * 2.0D00)
          OpenAD_Symbol_23 = (__value__(PBL) + __value__(PBR) -
     >  __value__(PB) * 2.0D00)
          __value__(PBLAP) = ((OpenAD_Symbol_14 / HY2) +(
     > OpenAD_Symbol_23 / HX2))
          OpenAD_Symbol_17 = 1_w2f__i8
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_21 = 2.0D00
          OpenAD_Symbol_20 = (-1_w2f__i8)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_15 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_12 = 1_w2f__i8
          OpenAD_Symbol_26 = 1_w2f__i8
          OpenAD_Symbol_28 = 1_w2f__i8
          OpenAD_Symbol_30 = 2.0D00
          OpenAD_Symbol_29 = (-1_w2f__i8)
          OpenAD_Symbol_27 = 1_w2f__i8
          OpenAD_Symbol_24 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_13 = 1_w2f__i8
          OpenAD_Symbol_34 = (__value__(PBL) + __value__(PTL) -
     >  __value__(PL) * 2.0D00)
          OpenAD_Symbol_43 = (__value__(PLL) + __value__(P) - __value__
     > (PL) * 2.0D00)
          __value__(PLLAP) = ((OpenAD_Symbol_34 / HY2) +(
     > OpenAD_Symbol_43 / HX2))
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_39 = 1_w2f__i8
          OpenAD_Symbol_41 = 2.0D00
          OpenAD_Symbol_40 = (-1_w2f__i8)
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_35 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_32 = 1_w2f__i8
          OpenAD_Symbol_46 = 1_w2f__i8
          OpenAD_Symbol_48 = 1_w2f__i8
          OpenAD_Symbol_50 = 2.0D00
          OpenAD_Symbol_49 = (-1_w2f__i8)
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_44 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_54 = (__value__(PB) + __value__(PT) - __value__
     > (P) * 2.0D00)
          OpenAD_Symbol_63 = (__value__(PL) + __value__(PR) - __value__
     > (P) * 2.0D00)
          __value__(PLAP) = ((OpenAD_Symbol_54 / HY2) +(
     > OpenAD_Symbol_63 / HX2))
          OpenAD_Symbol_57 = 1_w2f__i8
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_61 = 2.0D00
          OpenAD_Symbol_60 = (-1_w2f__i8)
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_55 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_52 = 1_w2f__i8
          OpenAD_Symbol_66 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_70 = 2.0D00
          OpenAD_Symbol_69 = (-1_w2f__i8)
          OpenAD_Symbol_67 = 1_w2f__i8
          OpenAD_Symbol_64 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_53 = 1_w2f__i8
          OpenAD_Symbol_74 = (__value__(P) + __value__(PRR) - __value__
     > (PR) * 2.0D00)
          OpenAD_Symbol_83 = (__value__(PBR) + __value__(PTR) -
     >  __value__(PR) * 2.0D00)
          __value__(PRLAP) = ((OpenAD_Symbol_74 / HX2) +(
     > OpenAD_Symbol_83 / HY2))
          OpenAD_Symbol_77 = 1_w2f__i8
          OpenAD_Symbol_79 = 1_w2f__i8
          OpenAD_Symbol_81 = 2.0D00
          OpenAD_Symbol_80 = (-1_w2f__i8)
          OpenAD_Symbol_78 = 1_w2f__i8
          OpenAD_Symbol_75 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_86 = 1_w2f__i8
          OpenAD_Symbol_88 = 1_w2f__i8
          OpenAD_Symbol_90 = 2.0D00
          OpenAD_Symbol_89 = (-1_w2f__i8)
          OpenAD_Symbol_87 = 1_w2f__i8
          OpenAD_Symbol_84 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_73 = 1_w2f__i8
          OpenAD_Symbol_94 = (__value__(P) + __value__(PTT) - __value__
     > (PT) * 2.0D00)
          OpenAD_Symbol_103 = (__value__(PTL) + __value__(PTR) -
     >  __value__(PT) * 2.0D00)
          __value__(PTLAP) = ((OpenAD_Symbol_94 / HY2) +(
     > OpenAD_Symbol_103 / HX2))
          OpenAD_Symbol_97 = 1_w2f__i8
          OpenAD_Symbol_99 = 1_w2f__i8
          OpenAD_Symbol_101 = 2.0D00
          OpenAD_Symbol_100 = (-1_w2f__i8)
          OpenAD_Symbol_98 = 1_w2f__i8
          OpenAD_Symbol_95 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_92 = 1_w2f__i8
          OpenAD_Symbol_106 = 1_w2f__i8
          OpenAD_Symbol_108 = 1_w2f__i8
          OpenAD_Symbol_110 = 2.0D00
          OpenAD_Symbol_109 = (-1_w2f__i8)
          OpenAD_Symbol_107 = 1_w2f__i8
          OpenAD_Symbol_104 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_93 = 1_w2f__i8
          OpenAD_Symbol_116 = (__value__(PBLAP) + __value__(PTLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_125 = (__value__(PLLAP) + __value__(PRLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_143 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_139 = (__value__(DPDY) * OpenAD_Symbol_143)
          OpenAD_Symbol_140 = (HX * 2.0D00)
          OpenAD_Symbol_152 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_148 = (__value__(DPDX) * OpenAD_Symbol_152)
          OpenAD_Symbol_149 = (HY * 2.0D00)
          OpenAD_Symbol_134 = ((OpenAD_Symbol_139 / OpenAD_Symbol_140)
     >  -(OpenAD_Symbol_148 / OpenAD_Symbol_149))
          __value__(FVEC(INT(K))) = ((OpenAD_Symbol_116 / HY2) +(
     > OpenAD_Symbol_125 / HX2) - R * OpenAD_Symbol_134)
          OpenAD_Symbol_119 = 1_w2f__i8
          OpenAD_Symbol_121 = 1_w2f__i8
          OpenAD_Symbol_123 = 2.0D00
          OpenAD_Symbol_122 = (-1_w2f__i8)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_114 = 1_w2f__i8
          OpenAD_Symbol_128 = 1_w2f__i8
          OpenAD_Symbol_130 = 1_w2f__i8
          OpenAD_Symbol_132 = 2.0D00
          OpenAD_Symbol_131 = (-1_w2f__i8)
          OpenAD_Symbol_129 = 1_w2f__i8
          OpenAD_Symbol_126 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_115 = 1_w2f__i8
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_144 = OpenAD_Symbol_143
          OpenAD_Symbol_146 = 1_w2f__i8
          OpenAD_Symbol_147 = (-1_w2f__i8)
          OpenAD_Symbol_145 = __value__(DPDY)
          OpenAD_Symbol_141 = (INT(1_w2f__i8) / OpenAD_Symbol_140)
          OpenAD_Symbol_137 = 1_w2f__i8
          OpenAD_Symbol_153 = OpenAD_Symbol_152
          OpenAD_Symbol_155 = 1_w2f__i8
          OpenAD_Symbol_156 = (-1_w2f__i8)
          OpenAD_Symbol_154 = __value__(DPDX)
          OpenAD_Symbol_150 = (INT(1_w2f__i8) / OpenAD_Symbol_149)
          OpenAD_Symbol_138 = (-1_w2f__i8)
          OpenAD_Symbol_136 = R
          OpenAD_Symbol_113 = (-1_w2f__i8)
          OpenAD_Symbol_157 = (OpenAD_Symbol_136 * INT((-1_w2f__i8)))
          OpenAD_Symbol_158 = (OpenAD_Symbol_150 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_157)
          OpenAD_Symbol_159 = (OpenAD_Symbol_154 * OpenAD_Symbol_158)
          OpenAD_Symbol_160 = (OpenAD_Symbol_117 + OpenAD_Symbol_159)
          OpenAD_Symbol_161 = (OpenAD_Symbol_117 + INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_159)
          OpenAD_Symbol_162 = (OpenAD_Symbol_141 * OpenAD_Symbol_157)
          OpenAD_Symbol_163 = (OpenAD_Symbol_145 * OpenAD_Symbol_162)
          OpenAD_Symbol_164 = (OpenAD_Symbol_126 + OpenAD_Symbol_163)
          OpenAD_Symbol_165 = (OpenAD_Symbol_126 + INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_163)
          OpenAD_Symbol_166 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_126 + 2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_117)
          OpenAD_Symbol_167 = (OpenAD_Symbol_104 * OpenAD_Symbol_160)
          OpenAD_Symbol_168 = (OpenAD_Symbol_95 * OpenAD_Symbol_160)
          OpenAD_Symbol_169 = (OpenAD_Symbol_84 * OpenAD_Symbol_164)
          OpenAD_Symbol_170 = (OpenAD_Symbol_75 * OpenAD_Symbol_164)
          OpenAD_Symbol_171 = (OpenAD_Symbol_64 * OpenAD_Symbol_166)
          OpenAD_Symbol_172 = (OpenAD_Symbol_55 * OpenAD_Symbol_166)
          OpenAD_Symbol_173 = (OpenAD_Symbol_44 * OpenAD_Symbol_165)
          OpenAD_Symbol_174 = (OpenAD_Symbol_35 * OpenAD_Symbol_165)
          OpenAD_Symbol_175 = (OpenAD_Symbol_24 * OpenAD_Symbol_161)
          OpenAD_Symbol_176 = (OpenAD_Symbol_15 * OpenAD_Symbol_161)
          OpenAD_Symbol_177 = (OpenAD_Symbol_8 * OpenAD_Symbol_153 *
     >  OpenAD_Symbol_158)
          OpenAD_Symbol_178 = (INT((-1_w2f__i8)) * OpenAD_Symbol_177)
          OpenAD_Symbol_179 = (OpenAD_Symbol_2 * OpenAD_Symbol_144 *
     >  OpenAD_Symbol_162)
          OpenAD_Symbol_180 = (INT((-1_w2f__i8)) * OpenAD_Symbol_179)
          OpenAD_Symbol_181 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_167)
          OpenAD_Symbol_182 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_168)
          OpenAD_Symbol_183 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_169)
          OpenAD_Symbol_184 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_170)
          OpenAD_Symbol_185 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_171)
          OpenAD_Symbol_186 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_172)
          OpenAD_Symbol_187 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_173)
          OpenAD_Symbol_188 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_174)
          OpenAD_Symbol_189 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_175)
          OpenAD_Symbol_190 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_176)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_167)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_167)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_168)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_168)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_169)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_169)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_170)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_170)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_171)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_171)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_172)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_172)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_173)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_173)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_174)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_174)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_175)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_175)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_176)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_176)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_177)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_178)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_179)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_180)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_181)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_182)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_183)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_184)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_185)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_186)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_187)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_188)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_189)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_190)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_208 = (INT(OpenAD_Symbol_208) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_208)
        OpenAD_Symbol_207 = (INT(OpenAD_Symbol_207) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_207)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_191)
      OpenAD_Symbol_192 = 1
      DO WHILE(INT(OpenAD_Symbol_192) .LE. INT(OpenAD_Symbol_191))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_193)
        OpenAD_Symbol_194 = 1
        DO WHILE(INT(OpenAD_Symbol_194) .LE. INT(OpenAD_Symbol_193))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_296)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_297)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_297, __deriv__(FVEC(INT(
     > OpenAD_Symbol_296))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_298)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_299)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_299, __deriv__(FVEC(INT(
     > OpenAD_Symbol_298))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_300)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_301)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_301, __deriv__(FVEC(INT(
     > OpenAD_Symbol_300))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_302)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_303)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_303, __deriv__(FVEC(INT(
     > OpenAD_Symbol_302))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_304)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_305)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_305, __deriv__(FVEC(INT(
     > OpenAD_Symbol_304))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_306)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_307)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_307, __deriv__(FVEC(INT(
     > OpenAD_Symbol_306))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_308)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_309)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_309, __deriv__(FVEC(INT(
     > OpenAD_Symbol_308))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_311)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_311, __deriv__(FVEC(INT(
     > OpenAD_Symbol_310))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_312)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_313)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_313, __deriv__(FVEC(INT(
     > OpenAD_Symbol_312))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_314)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_315)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_315, __deriv__(FVEC(INT(
     > OpenAD_Symbol_314))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_316)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_317)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_317, __deriv__(FVEC(INT(
     > OpenAD_Symbol_316))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_318)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_319)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_319, __deriv__(FVEC(INT(
     > OpenAD_Symbol_318))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_320)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_321)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_321, __deriv__(FVEC(INT(
     > OpenAD_Symbol_320))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_322)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_323)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_323, __deriv__(FVEC(INT(
     > OpenAD_Symbol_322))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_325)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_325, __deriv__(FVEC(INT(
     > OpenAD_Symbol_324))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_326)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_327)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_327, __deriv__(FVEC(INT(
     > OpenAD_Symbol_326))), __deriv__(PBB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_328)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_329)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_329, __deriv__(FVEC(INT(
     > OpenAD_Symbol_328))), __deriv__(PBR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_330)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_331)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_331, __deriv__(FVEC(INT(
     > OpenAD_Symbol_330))), __deriv__(PBL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_332)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_333)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_333, __deriv__(FVEC(INT(
     > OpenAD_Symbol_332))), __deriv__(PTL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_334)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_335)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_335, __deriv__(FVEC(INT(
     > OpenAD_Symbol_334))), __deriv__(PBL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_336)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_337)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_337, __deriv__(FVEC(INT(
     > OpenAD_Symbol_336))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_338)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_339)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_339, __deriv__(FVEC(INT(
     > OpenAD_Symbol_338))), __deriv__(PLL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_340)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_341)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_341, __deriv__(FVEC(INT(
     > OpenAD_Symbol_340))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_342)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_343)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_343, __deriv__(FVEC(INT(
     > OpenAD_Symbol_342))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_344)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_345)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_345, __deriv__(FVEC(INT(
     > OpenAD_Symbol_344))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_346)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_347)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_347, __deriv__(FVEC(INT(
     > OpenAD_Symbol_346))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_348)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_349)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_349, __deriv__(FVEC(INT(
     > OpenAD_Symbol_348))), __deriv__(PRR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_350)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_351)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_351, __deriv__(FVEC(INT(
     > OpenAD_Symbol_350))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_352)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_353)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_353, __deriv__(FVEC(INT(
     > OpenAD_Symbol_352))), __deriv__(PTR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_354)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_355)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_355, __deriv__(FVEC(INT(
     > OpenAD_Symbol_354))), __deriv__(PBR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_356)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_357)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_357, __deriv__(FVEC(INT(
     > OpenAD_Symbol_356))), __deriv__(PTT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_358)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_359)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_359, __deriv__(FVEC(INT(
     > OpenAD_Symbol_358))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_360)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_361)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_361, __deriv__(FVEC(INT(
     > OpenAD_Symbol_360))), __deriv__(PTR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_362)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_363)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_363, __deriv__(FVEC(INT(
     > OpenAD_Symbol_362))), __deriv__(PTL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_362))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_195)
          IF(OpenAD_Symbol_195 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_364)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTR), __deriv__(X(INT(
     > OpenAD_Symbol_364))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_196)
          IF(OpenAD_Symbol_196 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_295)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_295))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PT))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_197)
            IF(OpenAD_Symbol_197 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_365)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PTT), __deriv__(X(INT(
     > OpenAD_Symbol_365))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_366)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PTT), __deriv__(X(INT(
     > OpenAD_Symbol_366))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_367)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_367))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_198)
          IF(OpenAD_Symbol_198 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_368)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTL), __deriv__(X(INT(
     > OpenAD_Symbol_368))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_199)
          IF(OpenAD_Symbol_199 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_294)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_294))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PR))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_200)
            IF(OpenAD_Symbol_200 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_369)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_369))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_370)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_370))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_371)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_371))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_293)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(P), __deriv__(X(INT(OpenAD_Symbol_293
     > ))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_201)
          IF(OpenAD_Symbol_201 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_292)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_292))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PLL))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_202)
            IF(OpenAD_Symbol_202 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_372)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_372))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_373)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_373))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_374)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_374))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_203)
          IF(OpenAD_Symbol_203 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_375)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBR), __deriv__(X(INT(
     > OpenAD_Symbol_375))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_204)
          IF(OpenAD_Symbol_204 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_291)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_291))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBB))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_205)
            IF(OpenAD_Symbol_205 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_376)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_376))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_377)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_377))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_378)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_378))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_206)
          IF(OpenAD_Symbol_206 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_379)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBL), __deriv__(X(INT(
     > OpenAD_Symbol_379))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ENDIF
          OpenAD_Symbol_194 = INT(OpenAD_Symbol_194) + 1
        END DO
        OpenAD_Symbol_192 = INT(OpenAD_Symbol_192) + 1
      END DO
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
      N = NX * NY
      NXP1 = (NX + 1)
      NYP1 = (NY + 1)
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      OpenAD_Symbol_249 = 0_w2f__i8
      DO I = 1, NY, 1
        OpenAD_Symbol_250 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_251 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_251)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_290 = (K - NX +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_290)
            OpenAD_Symbol_252 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_252)
          ENDIF
          IF(I .eq. 1) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_255 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_255)
          ELSE
            IF(I .eq. 2) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_287 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_287)
              OpenAD_Symbol_253 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_253)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_288 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_288)
              OpenAD_Symbol_289 = (K - NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_289)
              OpenAD_Symbol_254 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_254)
            ENDIF
            OpenAD_Symbol_256 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_256)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_257 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_257)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_286 = (K - NX + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_286)
            OpenAD_Symbol_258 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_258)
          ENDIF
          IF(J .eq. 1) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_261 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_261)
          ELSE
            IF(J .eq. 2) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_283 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_283)
              OpenAD_Symbol_259 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_259)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_284 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_284)
              OpenAD_Symbol_285 = (K +(-2))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_285)
              OpenAD_Symbol_260 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_260)
            ENDIF
            OpenAD_Symbol_262 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_262)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX +(-1))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_275 = (K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_275)
            OpenAD_Symbol_265 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_265)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_263 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_263)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_281 = (K + 1)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_281)
              OpenAD_Symbol_282 = (K + 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_282)
              OpenAD_Symbol_264 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_264)
            ENDIF
            OpenAD_Symbol_266 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_266)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_267 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_267)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_280 = (NX + K +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_280)
            OpenAD_Symbol_268 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_268)
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_276 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_276)
            OpenAD_Symbol_271 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_271)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_269 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_269)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_278 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_278)
              OpenAD_Symbol_279 = (K + NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_279)
              OpenAD_Symbol_270 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_270)
            ENDIF
            OpenAD_Symbol_272 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_272)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_273 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_273)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_277 = (NX + K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_277)
            OpenAD_Symbol_274 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_274)
          ENDIF
          OpenAD_Symbol_0 = (__value__(PT) - __value__(PB))
          OpenAD_Symbol_1 = (HY * 2.0D00)
          __value__(DPDY) = (OpenAD_Symbol_0 / OpenAD_Symbol_1)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_5 = (-1_w2f__i8)
          OpenAD_Symbol_2 = (INT(1_w2f__i8) / OpenAD_Symbol_1)
          OpenAD_Symbol_6 = (__value__(PR) - __value__(PL))
          OpenAD_Symbol_7 = (HX * 2.0D00)
          __value__(DPDX) = (OpenAD_Symbol_6 / OpenAD_Symbol_7)
          OpenAD_Symbol_10 = 1_w2f__i8
          OpenAD_Symbol_11 = (-1_w2f__i8)
          OpenAD_Symbol_8 = (INT(1_w2f__i8) / OpenAD_Symbol_7)
          OpenAD_Symbol_14 = (__value__(PBB) + __value__(P) - __value__
     > (PB) * 2.0D00)
          OpenAD_Symbol_23 = (__value__(PBL) + __value__(PBR) -
     >  __value__(PB) * 2.0D00)
          __value__(PBLAP) = ((OpenAD_Symbol_14 / HY2) +(
     > OpenAD_Symbol_23 / HX2))
          OpenAD_Symbol_17 = 1_w2f__i8
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_21 = 2.0D00
          OpenAD_Symbol_20 = (-1_w2f__i8)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_15 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_12 = 1_w2f__i8
          OpenAD_Symbol_26 = 1_w2f__i8
          OpenAD_Symbol_28 = 1_w2f__i8
          OpenAD_Symbol_30 = 2.0D00
          OpenAD_Symbol_29 = (-1_w2f__i8)
          OpenAD_Symbol_27 = 1_w2f__i8
          OpenAD_Symbol_24 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_13 = 1_w2f__i8
          OpenAD_Symbol_34 = (__value__(PBL) + __value__(PTL) -
     >  __value__(PL) * 2.0D00)
          OpenAD_Symbol_43 = (__value__(PLL) + __value__(P) - __value__
     > (PL) * 2.0D00)
          __value__(PLLAP) = ((OpenAD_Symbol_34 / HY2) +(
     > OpenAD_Symbol_43 / HX2))
          OpenAD_Symbol_37 = 1_w2f__i8
          OpenAD_Symbol_39 = 1_w2f__i8
          OpenAD_Symbol_41 = 2.0D00
          OpenAD_Symbol_40 = (-1_w2f__i8)
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_35 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_32 = 1_w2f__i8
          OpenAD_Symbol_46 = 1_w2f__i8
          OpenAD_Symbol_48 = 1_w2f__i8
          OpenAD_Symbol_50 = 2.0D00
          OpenAD_Symbol_49 = (-1_w2f__i8)
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_44 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_54 = (__value__(PB) + __value__(PT) - __value__
     > (P) * 2.0D00)
          OpenAD_Symbol_63 = (__value__(PL) + __value__(PR) - __value__
     > (P) * 2.0D00)
          __value__(PLAP) = ((OpenAD_Symbol_54 / HY2) +(
     > OpenAD_Symbol_63 / HX2))
          OpenAD_Symbol_57 = 1_w2f__i8
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_61 = 2.0D00
          OpenAD_Symbol_60 = (-1_w2f__i8)
          OpenAD_Symbol_58 = 1_w2f__i8
          OpenAD_Symbol_55 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_52 = 1_w2f__i8
          OpenAD_Symbol_66 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_70 = 2.0D00
          OpenAD_Symbol_69 = (-1_w2f__i8)
          OpenAD_Symbol_67 = 1_w2f__i8
          OpenAD_Symbol_64 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_53 = 1_w2f__i8
          OpenAD_Symbol_74 = (__value__(P) + __value__(PRR) - __value__
     > (PR) * 2.0D00)
          OpenAD_Symbol_83 = (__value__(PBR) + __value__(PTR) -
     >  __value__(PR) * 2.0D00)
          __value__(PRLAP) = ((OpenAD_Symbol_74 / HX2) +(
     > OpenAD_Symbol_83 / HY2))
          OpenAD_Symbol_77 = 1_w2f__i8
          OpenAD_Symbol_79 = 1_w2f__i8
          OpenAD_Symbol_81 = 2.0D00
          OpenAD_Symbol_80 = (-1_w2f__i8)
          OpenAD_Symbol_78 = 1_w2f__i8
          OpenAD_Symbol_75 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_72 = 1_w2f__i8
          OpenAD_Symbol_86 = 1_w2f__i8
          OpenAD_Symbol_88 = 1_w2f__i8
          OpenAD_Symbol_90 = 2.0D00
          OpenAD_Symbol_89 = (-1_w2f__i8)
          OpenAD_Symbol_87 = 1_w2f__i8
          OpenAD_Symbol_84 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_73 = 1_w2f__i8
          OpenAD_Symbol_94 = (__value__(P) + __value__(PTT) - __value__
     > (PT) * 2.0D00)
          OpenAD_Symbol_103 = (__value__(PTL) + __value__(PTR) -
     >  __value__(PT) * 2.0D00)
          __value__(PTLAP) = ((OpenAD_Symbol_94 / HY2) +(
     > OpenAD_Symbol_103 / HX2))
          OpenAD_Symbol_97 = 1_w2f__i8
          OpenAD_Symbol_99 = 1_w2f__i8
          OpenAD_Symbol_101 = 2.0D00
          OpenAD_Symbol_100 = (-1_w2f__i8)
          OpenAD_Symbol_98 = 1_w2f__i8
          OpenAD_Symbol_95 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_92 = 1_w2f__i8
          OpenAD_Symbol_106 = 1_w2f__i8
          OpenAD_Symbol_108 = 1_w2f__i8
          OpenAD_Symbol_110 = 2.0D00
          OpenAD_Symbol_109 = (-1_w2f__i8)
          OpenAD_Symbol_107 = 1_w2f__i8
          OpenAD_Symbol_104 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_93 = 1_w2f__i8
          OpenAD_Symbol_116 = (__value__(PBLAP) + __value__(PTLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_125 = (__value__(PLLAP) + __value__(PRLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_143 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_139 = (__value__(DPDY) * OpenAD_Symbol_143)
          OpenAD_Symbol_140 = (HX * 2.0D00)
          OpenAD_Symbol_152 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_148 = (__value__(DPDX) * OpenAD_Symbol_152)
          OpenAD_Symbol_149 = (HY * 2.0D00)
          OpenAD_Symbol_134 = ((OpenAD_Symbol_139 / OpenAD_Symbol_140)
     >  -(OpenAD_Symbol_148 / OpenAD_Symbol_149))
          __value__(FVEC(INT(K))) = ((OpenAD_Symbol_116 / HY2) +(
     > OpenAD_Symbol_125 / HX2) - R * OpenAD_Symbol_134)
          OpenAD_Symbol_119 = 1_w2f__i8
          OpenAD_Symbol_121 = 1_w2f__i8
          OpenAD_Symbol_123 = 2.0D00
          OpenAD_Symbol_122 = (-1_w2f__i8)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_114 = 1_w2f__i8
          OpenAD_Symbol_128 = 1_w2f__i8
          OpenAD_Symbol_130 = 1_w2f__i8
          OpenAD_Symbol_132 = 2.0D00
          OpenAD_Symbol_131 = (-1_w2f__i8)
          OpenAD_Symbol_129 = 1_w2f__i8
          OpenAD_Symbol_126 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_115 = 1_w2f__i8
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_144 = OpenAD_Symbol_143
          OpenAD_Symbol_146 = 1_w2f__i8
          OpenAD_Symbol_147 = (-1_w2f__i8)
          OpenAD_Symbol_145 = __value__(DPDY)
          OpenAD_Symbol_141 = (INT(1_w2f__i8) / OpenAD_Symbol_140)
          OpenAD_Symbol_137 = 1_w2f__i8
          OpenAD_Symbol_153 = OpenAD_Symbol_152
          OpenAD_Symbol_155 = 1_w2f__i8
          OpenAD_Symbol_156 = (-1_w2f__i8)
          OpenAD_Symbol_154 = __value__(DPDX)
          OpenAD_Symbol_150 = (INT(1_w2f__i8) / OpenAD_Symbol_149)
          OpenAD_Symbol_138 = (-1_w2f__i8)
          OpenAD_Symbol_136 = R
          OpenAD_Symbol_113 = (-1_w2f__i8)
          OpenAD_Symbol_157 = (OpenAD_Symbol_136 * INT((-1_w2f__i8)))
          OpenAD_Symbol_158 = (OpenAD_Symbol_150 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_157)
          OpenAD_Symbol_159 = (OpenAD_Symbol_154 * OpenAD_Symbol_158)
          OpenAD_Symbol_160 = (OpenAD_Symbol_117 + OpenAD_Symbol_159)
          OpenAD_Symbol_161 = (OpenAD_Symbol_117 + INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_159)
          OpenAD_Symbol_162 = (OpenAD_Symbol_141 * OpenAD_Symbol_157)
          OpenAD_Symbol_163 = (OpenAD_Symbol_145 * OpenAD_Symbol_162)
          OpenAD_Symbol_164 = (OpenAD_Symbol_126 + OpenAD_Symbol_163)
          OpenAD_Symbol_165 = (OpenAD_Symbol_126 + INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_163)
          OpenAD_Symbol_166 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_126 + 2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_117)
          OpenAD_Symbol_167 = (OpenAD_Symbol_104 * OpenAD_Symbol_160)
          OpenAD_Symbol_168 = (OpenAD_Symbol_95 * OpenAD_Symbol_160)
          OpenAD_Symbol_169 = (OpenAD_Symbol_84 * OpenAD_Symbol_164)
          OpenAD_Symbol_170 = (OpenAD_Symbol_75 * OpenAD_Symbol_164)
          OpenAD_Symbol_171 = (OpenAD_Symbol_64 * OpenAD_Symbol_166)
          OpenAD_Symbol_172 = (OpenAD_Symbol_55 * OpenAD_Symbol_166)
          OpenAD_Symbol_173 = (OpenAD_Symbol_44 * OpenAD_Symbol_165)
          OpenAD_Symbol_174 = (OpenAD_Symbol_35 * OpenAD_Symbol_165)
          OpenAD_Symbol_175 = (OpenAD_Symbol_24 * OpenAD_Symbol_161)
          OpenAD_Symbol_176 = (OpenAD_Symbol_15 * OpenAD_Symbol_161)
          OpenAD_Symbol_177 = (OpenAD_Symbol_8 * OpenAD_Symbol_153 *
     >  OpenAD_Symbol_158)
          OpenAD_Symbol_178 = (INT((-1_w2f__i8)) * OpenAD_Symbol_177)
          OpenAD_Symbol_179 = (OpenAD_Symbol_2 * OpenAD_Symbol_144 *
     >  OpenAD_Symbol_162)
          OpenAD_Symbol_180 = (INT((-1_w2f__i8)) * OpenAD_Symbol_179)
          OpenAD_Symbol_181 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_167)
          OpenAD_Symbol_182 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_168)
          OpenAD_Symbol_183 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_169)
          OpenAD_Symbol_184 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_170)
          OpenAD_Symbol_185 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_171)
          OpenAD_Symbol_186 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_172)
          OpenAD_Symbol_187 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_173)
          OpenAD_Symbol_188 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_174)
          OpenAD_Symbol_189 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_175)
          OpenAD_Symbol_190 = (2.0D00 * INT((-1_w2f__i8)) *
     >  OpenAD_Symbol_176)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_167)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_167)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_168)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_168)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_169)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_169)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_170)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_170)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_171)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_171)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_172)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_172)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_173)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_173)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_174)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_174)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_175)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_175)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_176)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_176)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_177)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_178)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_179)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_180)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_181)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_182)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_183)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_184)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_185)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_186)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_187)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_188)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_189)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_190)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_250 = (INT(OpenAD_Symbol_250) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_250)
        OpenAD_Symbol_249 = (INT(OpenAD_Symbol_249) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_249)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_233)
      OpenAD_Symbol_234 = 1
      DO WHILE(INT(OpenAD_Symbol_234) .LE. INT(OpenAD_Symbol_233))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_235)
        OpenAD_Symbol_236 = 1
        DO WHILE(INT(OpenAD_Symbol_236) .LE. INT(OpenAD_Symbol_235))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_296)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_297)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_297, __deriv__(FVEC(INT(
     > OpenAD_Symbol_296))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_298)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_299)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_299, __deriv__(FVEC(INT(
     > OpenAD_Symbol_298))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_300)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_301)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_301, __deriv__(FVEC(INT(
     > OpenAD_Symbol_300))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_302)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_303)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_303, __deriv__(FVEC(INT(
     > OpenAD_Symbol_302))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_304)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_305)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_305, __deriv__(FVEC(INT(
     > OpenAD_Symbol_304))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_306)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_307)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_307, __deriv__(FVEC(INT(
     > OpenAD_Symbol_306))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_308)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_309)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_309, __deriv__(FVEC(INT(
     > OpenAD_Symbol_308))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_311)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_311, __deriv__(FVEC(INT(
     > OpenAD_Symbol_310))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_312)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_313)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_313, __deriv__(FVEC(INT(
     > OpenAD_Symbol_312))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_314)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_315)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_315, __deriv__(FVEC(INT(
     > OpenAD_Symbol_314))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_316)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_317)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_317, __deriv__(FVEC(INT(
     > OpenAD_Symbol_316))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_318)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_319)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_319, __deriv__(FVEC(INT(
     > OpenAD_Symbol_318))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_320)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_321)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_321, __deriv__(FVEC(INT(
     > OpenAD_Symbol_320))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_322)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_323)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_323, __deriv__(FVEC(INT(
     > OpenAD_Symbol_322))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_325)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_325, __deriv__(FVEC(INT(
     > OpenAD_Symbol_324))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_326)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_327)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_327, __deriv__(FVEC(INT(
     > OpenAD_Symbol_326))), __deriv__(PBB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_328)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_329)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_329, __deriv__(FVEC(INT(
     > OpenAD_Symbol_328))), __deriv__(PBR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_330)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_331)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_331, __deriv__(FVEC(INT(
     > OpenAD_Symbol_330))), __deriv__(PBL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_332)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_333)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_333, __deriv__(FVEC(INT(
     > OpenAD_Symbol_332))), __deriv__(PTL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_334)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_335)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_335, __deriv__(FVEC(INT(
     > OpenAD_Symbol_334))), __deriv__(PBL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_336)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_337)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_337, __deriv__(FVEC(INT(
     > OpenAD_Symbol_336))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_338)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_339)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_339, __deriv__(FVEC(INT(
     > OpenAD_Symbol_338))), __deriv__(PLL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_340)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_341)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_341, __deriv__(FVEC(INT(
     > OpenAD_Symbol_340))), __deriv__(PT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_342)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_343)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_343, __deriv__(FVEC(INT(
     > OpenAD_Symbol_342))), __deriv__(PB))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_344)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_345)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_345, __deriv__(FVEC(INT(
     > OpenAD_Symbol_344))), __deriv__(PR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_346)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_347)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_347, __deriv__(FVEC(INT(
     > OpenAD_Symbol_346))), __deriv__(PL))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_348)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_349)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_349, __deriv__(FVEC(INT(
     > OpenAD_Symbol_348))), __deriv__(PRR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_350)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_351)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_351, __deriv__(FVEC(INT(
     > OpenAD_Symbol_350))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_352)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_353)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_353, __deriv__(FVEC(INT(
     > OpenAD_Symbol_352))), __deriv__(PTR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_354)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_355)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_355, __deriv__(FVEC(INT(
     > OpenAD_Symbol_354))), __deriv__(PBR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_356)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_357)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_357, __deriv__(FVEC(INT(
     > OpenAD_Symbol_356))), __deriv__(PTT))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_358)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_359)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_359, __deriv__(FVEC(INT(
     > OpenAD_Symbol_358))), __deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_360)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_361)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_361, __deriv__(FVEC(INT(
     > OpenAD_Symbol_360))), __deriv__(PTR))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_362)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_363)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_363, __deriv__(FVEC(INT(
     > OpenAD_Symbol_362))), __deriv__(PTL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_362))))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_237)
          IF(OpenAD_Symbol_237 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_364)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTR), __deriv__(X(INT(
     > OpenAD_Symbol_364))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_238)
          IF(OpenAD_Symbol_238 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_295)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_295))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PT))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_239)
            IF(OpenAD_Symbol_239 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_365)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PTT), __deriv__(X(INT(
     > OpenAD_Symbol_365))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_366)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PTT), __deriv__(X(INT(
     > OpenAD_Symbol_366))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_367)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_367))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_240)
          IF(OpenAD_Symbol_240 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_368)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTL), __deriv__(X(INT(
     > OpenAD_Symbol_368))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_241)
          IF(OpenAD_Symbol_241 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_294)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_294))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PR))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_242)
            IF(OpenAD_Symbol_242 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_369)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_369))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_370)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_370))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_371)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_371))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_293)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(P), __deriv__(X(INT(OpenAD_Symbol_293
     > ))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_243)
          IF(OpenAD_Symbol_243 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_292)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_292))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PLL))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_244)
            IF(OpenAD_Symbol_244 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_372)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_372))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_373)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_373))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_374)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_374))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_245)
          IF(OpenAD_Symbol_245 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_375)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBR), __deriv__(X(INT(
     > OpenAD_Symbol_375))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_246)
          IF(OpenAD_Symbol_246 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_291)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_291))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBB))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_247)
            IF(OpenAD_Symbol_247 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_376)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_376))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_377)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_377))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_378)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_378))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_248)
          IF(OpenAD_Symbol_248 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_379)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBL), __deriv__(X(INT(
     > OpenAD_Symbol_379))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ENDIF
          OpenAD_Symbol_236 = INT(OpenAD_Symbol_236) + 1
        END DO
        OpenAD_Symbol_234 = INT(OpenAD_Symbol_234) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
