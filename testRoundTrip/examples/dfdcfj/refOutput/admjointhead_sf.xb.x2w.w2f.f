C ***********************************************************
C Fortran file translated from WHIRL Fri Nov 10 16:30:26 2006
C ***********************************************************
C ***********************************************************

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
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_168
      TYPE (OpenADTy_active) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      TYPE (OpenADTy_active) OpenAD_Symbol_170
      TYPE (OpenADTy_active) OpenAD_Symbol_171
      TYPE (OpenADTy_active) OpenAD_Symbol_172
      TYPE (OpenADTy_active) OpenAD_Symbol_173
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
      REAL(w2f__8) OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
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
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      TYPE (OpenADTy_active) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      TYPE (OpenADTy_active) OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      REAL(w2f__8) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      TYPE (OpenADTy_active) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      TYPE (OpenADTy_active) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      TYPE (OpenADTy_active) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      TYPE (OpenADTy_active) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      TYPE (OpenADTy_active) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      TYPE (OpenADTy_active) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      TYPE (OpenADTy_active) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      TYPE (OpenADTy_active) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      TYPE (OpenADTy_active) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_256
      REAL(w2f__8) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      TYPE (OpenADTy_active) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      REAL(w2f__8) OpenAD_Symbol_263
      REAL(w2f__8) OpenAD_Symbol_264
      REAL(w2f__8) OpenAD_Symbol_265
      REAL(w2f__8) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      REAL(w2f__8) OpenAD_Symbol_268
      REAL(w2f__8) OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_27
      TYPE (OpenADTy_active) OpenAD_Symbol_270
      REAL(w2f__8) OpenAD_Symbol_271
      REAL(w2f__8) OpenAD_Symbol_272
      REAL(w2f__8) OpenAD_Symbol_273
      REAL(w2f__8) OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_275
      REAL(w2f__8) OpenAD_Symbol_276
      REAL(w2f__8) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
      REAL(w2f__8) OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_280
      REAL(w2f__8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      REAL(w2f__8) OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_284
      REAL(w2f__8) OpenAD_Symbol_285
      REAL(w2f__8) OpenAD_Symbol_286
      REAL(w2f__8) OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      REAL(w2f__8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_29
      TYPE (OpenADTy_active) OpenAD_Symbol_290
      REAL(w2f__8) OpenAD_Symbol_291
      TYPE (OpenADTy_active) OpenAD_Symbol_292
      TYPE (OpenADTy_active) OpenAD_Symbol_293
      TYPE (OpenADTy_active) OpenAD_Symbol_294
      TYPE (OpenADTy_active) OpenAD_Symbol_295
      TYPE (OpenADTy_active) OpenAD_Symbol_296
      TYPE (OpenADTy_active) OpenAD_Symbol_297
      TYPE (OpenADTy_active) OpenAD_Symbol_298
      TYPE (OpenADTy_active) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_30
      TYPE (OpenADTy_active) OpenAD_Symbol_300
      TYPE (OpenADTy_active) OpenAD_Symbol_301
      TYPE (OpenADTy_active) OpenAD_Symbol_302
      TYPE (OpenADTy_active) OpenAD_Symbol_303
      TYPE (OpenADTy_active) OpenAD_Symbol_304
      TYPE (OpenADTy_active) OpenAD_Symbol_305
      TYPE (OpenADTy_active) OpenAD_Symbol_306
      REAL(w2f__8) OpenAD_Symbol_307
      TYPE (OpenADTy_active) OpenAD_Symbol_308
      INTEGER(w2f__i8) OpenAD_Symbol_309
      INTEGER(w2f__i8) OpenAD_Symbol_310
      INTEGER(w2f__i8) OpenAD_Symbol_311
      INTEGER(w2f__i8) OpenAD_Symbol_312
      INTEGER(w2f__i8) OpenAD_Symbol_313
      INTEGER(w2f__i8) OpenAD_Symbol_314
      INTEGER(w2f__i8) OpenAD_Symbol_315
      INTEGER(w2f__i8) OpenAD_Symbol_316
      INTEGER(w2f__i8) OpenAD_Symbol_317
      INTEGER(w2f__i8) OpenAD_Symbol_318
      INTEGER(w2f__i8) OpenAD_Symbol_319
      REAL(w2f__8) OpenAD_Symbol_32
      INTEGER(w2f__i8) OpenAD_Symbol_320
      INTEGER(w2f__i8) OpenAD_Symbol_321
      INTEGER(w2f__i8) OpenAD_Symbol_322
      INTEGER(w2f__i8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      INTEGER(w2f__i8) OpenAD_Symbol_325
      INTEGER(w2f__i8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
      INTEGER(w2f__i8) OpenAD_Symbol_329
      REAL(w2f__8) OpenAD_Symbol_33
      INTEGER(w2f__i8) OpenAD_Symbol_330
      INTEGER(w2f__i8) OpenAD_Symbol_331
      INTEGER(w2f__i8) OpenAD_Symbol_332
      INTEGER(w2f__i8) OpenAD_Symbol_333
      INTEGER(w2f__i8) OpenAD_Symbol_334
      INTEGER(w2f__i8) OpenAD_Symbol_335
      INTEGER(w2f__i8) OpenAD_Symbol_336
      INTEGER(w2f__i8) OpenAD_Symbol_337
      INTEGER(w2f__i8) OpenAD_Symbol_338
      INTEGER(w2f__i8) OpenAD_Symbol_339
      REAL(w2f__8) OpenAD_Symbol_34
      INTEGER(w2f__i8) OpenAD_Symbol_340
      INTEGER(w2f__i8) OpenAD_Symbol_341
      INTEGER(w2f__i8) OpenAD_Symbol_342
      INTEGER(w2f__i8) OpenAD_Symbol_343
      INTEGER(w2f__i8) OpenAD_Symbol_344
      INTEGER(w2f__i8) OpenAD_Symbol_345
      INTEGER(w2f__i8) OpenAD_Symbol_346
      INTEGER(w2f__i8) OpenAD_Symbol_347
      INTEGER(w2f__i8) OpenAD_Symbol_348
      INTEGER(w2f__i8) OpenAD_Symbol_349
      REAL(w2f__8) OpenAD_Symbol_35
      INTEGER(w2f__i8) OpenAD_Symbol_350
      INTEGER(w2f__i8) OpenAD_Symbol_351
      INTEGER(w2f__i8) OpenAD_Symbol_352
      INTEGER(w2f__i8) OpenAD_Symbol_353
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
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
      INTEGER(w2f__i4) NX
      INTEGER(w2f__i4) NY
      TYPE (OpenADTy_active) X(1 : INT((NX * NY)))
      TYPE (OpenADTy_active) FVEC(1 : INT((NX * NY)))
      REAL(w2f__8) R
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i8) t__1
      INTEGER(w2f__i8) t__2
      TYPE (OpenADTy_active) DPDX
      TYPE (OpenADTy_active) DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR =     4.000000000000000)
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
      PARAMETER ( ONE =     1.000000000000000)
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
      PARAMETER ( THREE =     3.000000000000000)
      REAL(w2f__8) TWO
      PARAMETER ( TWO =     2.000000000000000)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO =     0.000000000000000)
      INTEGER(w2f__i4) t__3
      INTEGER(w2f__i4) t__4
      INTEGER(w2f__i4) t__5
      INTEGER(w2f__i8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
      INTEGER(w2f__i8) OpenAD_Symbol_359
      INTEGER(w2f__i8) OpenAD_Symbol_360
      INTEGER(w2f__i8) OpenAD_Symbol_361
      REAL(w2f__8) OpenAD_Symbol_362
      INTEGER(w2f__i8) OpenAD_Symbol_363
      REAL(w2f__8) OpenAD_Symbol_364
      INTEGER(w2f__i8) OpenAD_Symbol_365
      REAL(w2f__8) OpenAD_Symbol_366
      INTEGER(w2f__i8) OpenAD_Symbol_367
      REAL(w2f__8) OpenAD_Symbol_368
      INTEGER(w2f__i8) OpenAD_Symbol_369
      REAL(w2f__8) OpenAD_Symbol_370
      INTEGER(w2f__i8) OpenAD_Symbol_371
      REAL(w2f__8) OpenAD_Symbol_372
      INTEGER(w2f__i8) OpenAD_Symbol_373
      REAL(w2f__8) OpenAD_Symbol_374
      INTEGER(w2f__i8) OpenAD_Symbol_375
      REAL(w2f__8) OpenAD_Symbol_376
      INTEGER(w2f__i8) OpenAD_Symbol_377
      REAL(w2f__8) OpenAD_Symbol_378
      INTEGER(w2f__i8) OpenAD_Symbol_379
      REAL(w2f__8) OpenAD_Symbol_380
      INTEGER(w2f__i8) OpenAD_Symbol_381
      REAL(w2f__8) OpenAD_Symbol_382
      INTEGER(w2f__i8) OpenAD_Symbol_383
      REAL(w2f__8) OpenAD_Symbol_384
      INTEGER(w2f__i8) OpenAD_Symbol_385
      REAL(w2f__8) OpenAD_Symbol_386
      INTEGER(w2f__i8) OpenAD_Symbol_387
      REAL(w2f__8) OpenAD_Symbol_388
      INTEGER(w2f__i8) OpenAD_Symbol_389
      REAL(w2f__8) OpenAD_Symbol_390
      INTEGER(w2f__i8) OpenAD_Symbol_391
      REAL(w2f__8) OpenAD_Symbol_392
      INTEGER(w2f__i8) OpenAD_Symbol_393
      REAL(w2f__8) OpenAD_Symbol_394
      INTEGER(w2f__i8) OpenAD_Symbol_395
      REAL(w2f__8) OpenAD_Symbol_396
      INTEGER(w2f__i8) OpenAD_Symbol_397
      REAL(w2f__8) OpenAD_Symbol_398
      INTEGER(w2f__i8) OpenAD_Symbol_399
      REAL(w2f__8) OpenAD_Symbol_400
      INTEGER(w2f__i8) OpenAD_Symbol_401
      REAL(w2f__8) OpenAD_Symbol_402
      INTEGER(w2f__i8) OpenAD_Symbol_403
      REAL(w2f__8) OpenAD_Symbol_404
      INTEGER(w2f__i8) OpenAD_Symbol_405
      REAL(w2f__8) OpenAD_Symbol_406
      INTEGER(w2f__i8) OpenAD_Symbol_407
      REAL(w2f__8) OpenAD_Symbol_408
      INTEGER(w2f__i8) OpenAD_Symbol_409
      REAL(w2f__8) OpenAD_Symbol_410
      INTEGER(w2f__i8) OpenAD_Symbol_411
      REAL(w2f__8) OpenAD_Symbol_412
      INTEGER(w2f__i8) OpenAD_Symbol_413
      REAL(w2f__8) OpenAD_Symbol_414
      INTEGER(w2f__i8) OpenAD_Symbol_415
      REAL(w2f__8) OpenAD_Symbol_416
      INTEGER(w2f__i8) OpenAD_Symbol_417
      REAL(w2f__8) OpenAD_Symbol_418
      INTEGER(w2f__i8) OpenAD_Symbol_419
      REAL(w2f__8) OpenAD_Symbol_420
      INTEGER(w2f__i8) OpenAD_Symbol_421
      REAL(w2f__8) OpenAD_Symbol_422
      INTEGER(w2f__i8) OpenAD_Symbol_423
      REAL(w2f__8) OpenAD_Symbol_424
      INTEGER(w2f__i8) OpenAD_Symbol_425
      REAL(w2f__8) OpenAD_Symbol_426
      INTEGER(w2f__i8) OpenAD_Symbol_427
      REAL(w2f__8) OpenAD_Symbol_428
      INTEGER(w2f__i8) OpenAD_Symbol_429
      INTEGER(w2f__i8) OpenAD_Symbol_430
      REAL(w2f__8) OpenAD_Symbol_431
      INTEGER(w2f__i8) OpenAD_Symbol_432
      INTEGER(w2f__i8) OpenAD_Symbol_433
      INTEGER(w2f__i8) OpenAD_Symbol_434
      INTEGER(w2f__i8) OpenAD_Symbol_435
      INTEGER(w2f__i8) OpenAD_Symbol_436
      INTEGER(w2f__i8) OpenAD_Symbol_437
      INTEGER(w2f__i8) OpenAD_Symbol_438
      INTEGER(w2f__i8) OpenAD_Symbol_439
      INTEGER(w2f__i8) OpenAD_Symbol_440
      INTEGER(w2f__i8) OpenAD_Symbol_441
      INTEGER(w2f__i8) OpenAD_Symbol_442
      INTEGER(w2f__i8) OpenAD_Symbol_443
      INTEGER(w2f__i8) OpenAD_Symbol_444
      INTEGER(w2f__i8) OpenAD_Symbol_445
      INTEGER(w2f__i8) OpenAD_Symbol_446
      INTEGER(w2f__i8) OpenAD_Symbol_447
      INTEGER(w2f__i8) OpenAD_Symbol_448
      INTEGER(w2f__i8) OpenAD_Symbol_449
      INTEGER(w2f__i8) OpenAD_Symbol_450
      INTEGER(w2f__i8) OpenAD_Symbol_451
      INTEGER(w2f__i8) OpenAD_Symbol_452
      INTEGER(w2f__i8) OpenAD_Symbol_453
      INTEGER(w2f__i8) OpenAD_Symbol_454
      INTEGER(w2f__i8) OpenAD_Symbol_455
      INTEGER(w2f__i8) OpenAD_Symbol_456
      INTEGER(w2f__i8) OpenAD_Symbol_457
      INTEGER(w2f__i8) OpenAD_Symbol_458
      INTEGER(w2f__i8) OpenAD_Symbol_459
      INTEGER(w2f__i8) OpenAD_Symbol_460
      REAL(w2f__8) OpenAD_Symbol_461
      INTEGER(w2f__i8) OpenAD_Symbol_462
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
      t__1 = INT(NX * NY)
      t__2 = MAX(t__1, 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      t__3 = NY
      DO I = 1, t__3, 1
        t__4 = NX
        DO J = 1, t__4, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PBL) = 0.0D00
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            __value__(PBR) = 0.0D00
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
            ENDIF
          ENDIF
          __value__(P) = __value__(X(K))
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
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
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PTL) = 0.0D00
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
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
      t__5 = N
      DO K = 1, t__5, 1
        __value__(FVEC(INT(K))) = (__value__(FVEC(K)) * HX2 * HY2)
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      t__1 = INT(NX * NY)
      t__2 = MAX(t__1, 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      t__3 = NY
      OpenAD_Symbol_327 = 0_w2f__i8
      DO I = 1, t__3, 1
        t__4 = NX
        OpenAD_Symbol_328 = 0_w2f__i8
        DO J = 1, t__4, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_329 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_329)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_458 = (K - NX + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_458)
            OpenAD_Symbol_330 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_330)
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_333 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_333)
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_452 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_452)
              OpenAD_Symbol_331 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_331)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_454 = (K - NX * INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_454)
              OpenAD_Symbol_455 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_455)
              OpenAD_Symbol_332 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_332)
            ENDIF
            OpenAD_Symbol_334 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_334)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_335 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_335)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_450 = (K - NX + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_450)
            OpenAD_Symbol_336 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_336)
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_339 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_339)
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_444 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_444)
              OpenAD_Symbol_337 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_337)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_446 = (K + INT((-2_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_446)
              OpenAD_Symbol_447 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_447)
              OpenAD_Symbol_338 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_338)
            ENDIF
            OpenAD_Symbol_340 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_340)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_357 = (K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_357)
            OpenAD_Symbol_343 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_343)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_341 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_341)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_440 = (K + INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_440)
              OpenAD_Symbol_441 = (K + INT(1_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_441)
              OpenAD_Symbol_342 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_342)
            ENDIF
            OpenAD_Symbol_344 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_344)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_345 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_345)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_437 = (NX + K + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_437)
            OpenAD_Symbol_346 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_346)
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_359 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_359)
            OpenAD_Symbol_349 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_349)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
              OpenAD_Symbol_163 = 1_w2f__i8
              OpenAD_Symbol_291 = OpenAD_Symbol_163
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
C             $OpenAD$ INLINE push(subst)
              CALL push(OpenAD_Symbol_291)
              OpenAD_Symbol_347 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_347)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_433 = (K + NX * INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_433)
              OpenAD_Symbol_434 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_434)
              OpenAD_Symbol_348 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_348)
            ENDIF
            OpenAD_Symbol_350 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_350)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_351 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_351)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_429 = (NX + K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_429)
            OpenAD_Symbol_352 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_352)
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
          OpenAD_Symbol_32 = ((OpenAD_Symbol_14 / HY2) +(
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
          __value__(PBLAP) = OpenAD_Symbol_32
          OpenAD_Symbol_35 = (__value__(PBL) + __value__(PTL) -
     >  __value__(PL) * 2.0D00)
          OpenAD_Symbol_44 = (__value__(PLL) + __value__(P) - __value__
     > (PL) * 2.0D00)
          OpenAD_Symbol_53 = ((OpenAD_Symbol_35 / HY2) +(
     > OpenAD_Symbol_44 / HX2))
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_40 = 1_w2f__i8
          OpenAD_Symbol_42 = 2.0D00
          OpenAD_Symbol_41 = (-1_w2f__i8)
          OpenAD_Symbol_39 = 1_w2f__i8
          OpenAD_Symbol_36 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_49 = 1_w2f__i8
          OpenAD_Symbol_51 = 2.0D00
          OpenAD_Symbol_50 = (-1_w2f__i8)
          OpenAD_Symbol_48 = 1_w2f__i8
          OpenAD_Symbol_45 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_34 = 1_w2f__i8
          __value__(PLLAP) = OpenAD_Symbol_53
          OpenAD_Symbol_56 = (__value__(PB) + __value__(PT) - __value__
     > (P) * 2.0D00)
          OpenAD_Symbol_65 = (__value__(PL) + __value__(PR) - __value__
     > (P) * 2.0D00)
          OpenAD_Symbol_74 = ((OpenAD_Symbol_56 / HY2) +(
     > OpenAD_Symbol_65 / HX2))
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_61 = 1_w2f__i8
          OpenAD_Symbol_63 = 2.0D00
          OpenAD_Symbol_62 = (-1_w2f__i8)
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_57 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_54 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_72 = 2.0D00
          OpenAD_Symbol_71 = (-1_w2f__i8)
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_66 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_55 = 1_w2f__i8
          __value__(PLAP) = OpenAD_Symbol_74
          OpenAD_Symbol_77 = (__value__(P) + __value__(PRR) - __value__
     > (PR) * 2.0D00)
          OpenAD_Symbol_86 = (__value__(PBR) + __value__(PTR) -
     >  __value__(PR) * 2.0D00)
          OpenAD_Symbol_95 = ((OpenAD_Symbol_77 / HX2) +(
     > OpenAD_Symbol_86 / HY2))
          OpenAD_Symbol_80 = 1_w2f__i8
          OpenAD_Symbol_82 = 1_w2f__i8
          OpenAD_Symbol_84 = 2.0D00
          OpenAD_Symbol_83 = (-1_w2f__i8)
          OpenAD_Symbol_81 = 1_w2f__i8
          OpenAD_Symbol_78 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_75 = 1_w2f__i8
          OpenAD_Symbol_89 = 1_w2f__i8
          OpenAD_Symbol_91 = 1_w2f__i8
          OpenAD_Symbol_93 = 2.0D00
          OpenAD_Symbol_92 = (-1_w2f__i8)
          OpenAD_Symbol_90 = 1_w2f__i8
          OpenAD_Symbol_87 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_76 = 1_w2f__i8
          __value__(PRLAP) = OpenAD_Symbol_95
          OpenAD_Symbol_98 = (__value__(P) + __value__(PTT) - __value__
     > (PT) * 2.0D00)
          OpenAD_Symbol_107 = (__value__(PTL) + __value__(PTR) -
     >  __value__(PT) * 2.0D00)
          OpenAD_Symbol_116 = ((OpenAD_Symbol_98 / HY2) +(
     > OpenAD_Symbol_107 / HX2))
          OpenAD_Symbol_101 = 1_w2f__i8
          OpenAD_Symbol_103 = 1_w2f__i8
          OpenAD_Symbol_105 = 2.0D00
          OpenAD_Symbol_104 = (-1_w2f__i8)
          OpenAD_Symbol_102 = 1_w2f__i8
          OpenAD_Symbol_99 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_96 = 1_w2f__i8
          OpenAD_Symbol_110 = 1_w2f__i8
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_114 = 2.0D00
          OpenAD_Symbol_113 = (-1_w2f__i8)
          OpenAD_Symbol_111 = 1_w2f__i8
          OpenAD_Symbol_108 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_97 = 1_w2f__i8
          __value__(PTLAP) = OpenAD_Symbol_116
          OpenAD_Symbol_121 = (__value__(PBLAP) + __value__(PTLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_130 = (__value__(PLLAP) + __value__(PRLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_148 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_144 = (__value__(DPDY) * OpenAD_Symbol_148)
          OpenAD_Symbol_145 = (HX * 2.0D00)
          OpenAD_Symbol_157 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_153 = (__value__(DPDX) * OpenAD_Symbol_157)
          OpenAD_Symbol_154 = (HY * 2.0D00)
          OpenAD_Symbol_139 = ((OpenAD_Symbol_144 / OpenAD_Symbol_145)
     >  -(OpenAD_Symbol_153 / OpenAD_Symbol_154))
          OpenAD_Symbol_162 = ((OpenAD_Symbol_121 / HY2) +(
     > OpenAD_Symbol_130 / HX2) - R * OpenAD_Symbol_139)
          OpenAD_Symbol_124 = 1_w2f__i8
          OpenAD_Symbol_126 = 1_w2f__i8
          OpenAD_Symbol_128 = 2.0D00
          OpenAD_Symbol_127 = (-1_w2f__i8)
          OpenAD_Symbol_125 = 1_w2f__i8
          OpenAD_Symbol_122 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_119 = 1_w2f__i8
          OpenAD_Symbol_133 = 1_w2f__i8
          OpenAD_Symbol_135 = 1_w2f__i8
          OpenAD_Symbol_137 = 2.0D00
          OpenAD_Symbol_136 = (-1_w2f__i8)
          OpenAD_Symbol_134 = 1_w2f__i8
          OpenAD_Symbol_131 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_120 = 1_w2f__i8
          OpenAD_Symbol_117 = 1_w2f__i8
          OpenAD_Symbol_149 = OpenAD_Symbol_148
          OpenAD_Symbol_151 = 1_w2f__i8
          OpenAD_Symbol_152 = (-1_w2f__i8)
          OpenAD_Symbol_150 = __value__(DPDY)
          OpenAD_Symbol_146 = (INT(1_w2f__i8) / OpenAD_Symbol_145)
          OpenAD_Symbol_142 = 1_w2f__i8
          OpenAD_Symbol_158 = OpenAD_Symbol_157
          OpenAD_Symbol_160 = 1_w2f__i8
          OpenAD_Symbol_161 = (-1_w2f__i8)
          OpenAD_Symbol_159 = __value__(DPDX)
          OpenAD_Symbol_155 = (INT(1_w2f__i8) / OpenAD_Symbol_154)
          OpenAD_Symbol_143 = (-1_w2f__i8)
          OpenAD_Symbol_141 = R
          OpenAD_Symbol_118 = (-1_w2f__i8)
          __value__(FVEC(INT(K))) = OpenAD_Symbol_162
          OpenAD_Symbol_174 = (OpenAD_Symbol_119 * OpenAD_Symbol_117)
          OpenAD_Symbol_175 = (OpenAD_Symbol_120 * OpenAD_Symbol_117)
          OpenAD_Symbol_176 = (OpenAD_Symbol_141 * OpenAD_Symbol_118)
          OpenAD_Symbol_177 = (OpenAD_Symbol_142 * OpenAD_Symbol_176)
          OpenAD_Symbol_178 = (OpenAD_Symbol_143 * OpenAD_Symbol_176)
          OpenAD_Symbol_179 = (OpenAD_Symbol_131 * OpenAD_Symbol_175)
          OpenAD_Symbol_180 = (OpenAD_Symbol_133 * OpenAD_Symbol_179)
          OpenAD_Symbol_181 = (OpenAD_Symbol_134 * OpenAD_Symbol_179)
          OpenAD_Symbol_182 = (OpenAD_Symbol_135 * OpenAD_Symbol_181)
          OpenAD_Symbol_183 = (OpenAD_Symbol_136 * OpenAD_Symbol_181)
          OpenAD_Symbol_184 = (OpenAD_Symbol_122 * OpenAD_Symbol_174)
          OpenAD_Symbol_185 = (OpenAD_Symbol_124 * OpenAD_Symbol_184)
          OpenAD_Symbol_186 = (OpenAD_Symbol_125 * OpenAD_Symbol_184)
          OpenAD_Symbol_187 = (OpenAD_Symbol_126 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_127 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_155 * OpenAD_Symbol_178)
          OpenAD_Symbol_190 = (OpenAD_Symbol_158 * OpenAD_Symbol_189)
          OpenAD_Symbol_191 = (OpenAD_Symbol_159 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_187 + OpenAD_Symbol_160 *
     >  OpenAD_Symbol_191)
          OpenAD_Symbol_193 = (OpenAD_Symbol_185 + OpenAD_Symbol_161 *
     >  OpenAD_Symbol_191)
          OpenAD_Symbol_194 = (OpenAD_Symbol_96 * OpenAD_Symbol_192)
          OpenAD_Symbol_195 = (OpenAD_Symbol_97 * OpenAD_Symbol_192)
          OpenAD_Symbol_196 = (OpenAD_Symbol_12 * OpenAD_Symbol_193)
          OpenAD_Symbol_197 = (OpenAD_Symbol_13 * OpenAD_Symbol_193)
          OpenAD_Symbol_198 = (OpenAD_Symbol_146 * OpenAD_Symbol_177)
          OpenAD_Symbol_199 = (OpenAD_Symbol_149 * OpenAD_Symbol_198)
          OpenAD_Symbol_200 = (OpenAD_Symbol_150 * OpenAD_Symbol_198)
          OpenAD_Symbol_201 = (OpenAD_Symbol_182 + OpenAD_Symbol_151 *
     >  OpenAD_Symbol_200)
          OpenAD_Symbol_202 = (OpenAD_Symbol_180 + OpenAD_Symbol_152 *
     >  OpenAD_Symbol_200)
          OpenAD_Symbol_203 = (OpenAD_Symbol_75 * OpenAD_Symbol_201)
          OpenAD_Symbol_204 = (OpenAD_Symbol_76 * OpenAD_Symbol_201)
          OpenAD_Symbol_205 = (OpenAD_Symbol_33 * OpenAD_Symbol_202)
          OpenAD_Symbol_206 = (OpenAD_Symbol_34 * OpenAD_Symbol_202)
          OpenAD_Symbol_207 = (OpenAD_Symbol_137 * OpenAD_Symbol_183)
          OpenAD_Symbol_208 = (OpenAD_Symbol_207 + OpenAD_Symbol_128 *
     >  OpenAD_Symbol_188)
          OpenAD_Symbol_209 = (OpenAD_Symbol_54 * OpenAD_Symbol_208)
          OpenAD_Symbol_210 = (OpenAD_Symbol_55 * OpenAD_Symbol_208)
          OpenAD_Symbol_211 = (OpenAD_Symbol_108 * OpenAD_Symbol_195)
          OpenAD_Symbol_212 = (OpenAD_Symbol_110 * OpenAD_Symbol_211)
          OpenAD_Symbol_214 = (OpenAD_Symbol_111 * OpenAD_Symbol_211)
          OpenAD_Symbol_215 = (OpenAD_Symbol_112 * OpenAD_Symbol_214)
          OpenAD_Symbol_217 = (OpenAD_Symbol_113 * OpenAD_Symbol_214)
          OpenAD_Symbol_218 = (OpenAD_Symbol_99 * OpenAD_Symbol_194)
          OpenAD_Symbol_219 = (OpenAD_Symbol_101 * OpenAD_Symbol_218)
          OpenAD_Symbol_221 = (OpenAD_Symbol_102 * OpenAD_Symbol_218)
          OpenAD_Symbol_222 = (OpenAD_Symbol_103 * OpenAD_Symbol_221)
          OpenAD_Symbol_224 = (OpenAD_Symbol_104 * OpenAD_Symbol_221)
          OpenAD_Symbol_225 = (OpenAD_Symbol_87 * OpenAD_Symbol_204)
          OpenAD_Symbol_226 = (OpenAD_Symbol_89 * OpenAD_Symbol_225)
          OpenAD_Symbol_228 = (OpenAD_Symbol_90 * OpenAD_Symbol_225)
          OpenAD_Symbol_229 = (OpenAD_Symbol_91 * OpenAD_Symbol_228)
          OpenAD_Symbol_230 = (OpenAD_Symbol_92 * OpenAD_Symbol_228)
          OpenAD_Symbol_231 = (OpenAD_Symbol_78 * OpenAD_Symbol_203)
          OpenAD_Symbol_232 = (OpenAD_Symbol_80 * OpenAD_Symbol_231)
          OpenAD_Symbol_233 = (OpenAD_Symbol_81 * OpenAD_Symbol_231)
          OpenAD_Symbol_234 = (OpenAD_Symbol_82 * OpenAD_Symbol_233)
          OpenAD_Symbol_236 = (OpenAD_Symbol_83 * OpenAD_Symbol_233)
          OpenAD_Symbol_237 = (OpenAD_Symbol_66 * OpenAD_Symbol_210)
          OpenAD_Symbol_238 = (OpenAD_Symbol_68 * OpenAD_Symbol_237)
          OpenAD_Symbol_240 = (OpenAD_Symbol_69 * OpenAD_Symbol_237)
          OpenAD_Symbol_241 = (OpenAD_Symbol_70 * OpenAD_Symbol_240)
          OpenAD_Symbol_243 = (OpenAD_Symbol_71 * OpenAD_Symbol_240)
          OpenAD_Symbol_244 = (OpenAD_Symbol_57 * OpenAD_Symbol_209)
          OpenAD_Symbol_245 = (OpenAD_Symbol_59 * OpenAD_Symbol_244)
          OpenAD_Symbol_247 = (OpenAD_Symbol_60 * OpenAD_Symbol_244)
          OpenAD_Symbol_248 = (OpenAD_Symbol_61 * OpenAD_Symbol_247)
          OpenAD_Symbol_250 = (OpenAD_Symbol_62 * OpenAD_Symbol_247)
          OpenAD_Symbol_251 = (OpenAD_Symbol_45 * OpenAD_Symbol_206)
          OpenAD_Symbol_252 = (OpenAD_Symbol_47 * OpenAD_Symbol_251)
          OpenAD_Symbol_254 = (OpenAD_Symbol_48 * OpenAD_Symbol_251)
          OpenAD_Symbol_255 = (OpenAD_Symbol_49 * OpenAD_Symbol_254)
          OpenAD_Symbol_256 = (OpenAD_Symbol_50 * OpenAD_Symbol_254)
          OpenAD_Symbol_257 = (OpenAD_Symbol_36 * OpenAD_Symbol_205)
          OpenAD_Symbol_258 = (OpenAD_Symbol_38 * OpenAD_Symbol_257)
          OpenAD_Symbol_260 = (OpenAD_Symbol_39 * OpenAD_Symbol_257)
          OpenAD_Symbol_261 = (OpenAD_Symbol_40 * OpenAD_Symbol_260)
          OpenAD_Symbol_262 = (OpenAD_Symbol_41 * OpenAD_Symbol_260)
          OpenAD_Symbol_263 = (OpenAD_Symbol_24 * OpenAD_Symbol_197)
          OpenAD_Symbol_264 = (OpenAD_Symbol_26 * OpenAD_Symbol_263)
          OpenAD_Symbol_265 = (OpenAD_Symbol_27 * OpenAD_Symbol_263)
          OpenAD_Symbol_266 = (OpenAD_Symbol_28 * OpenAD_Symbol_265)
          OpenAD_Symbol_267 = (OpenAD_Symbol_29 * OpenAD_Symbol_265)
          OpenAD_Symbol_268 = (OpenAD_Symbol_15 * OpenAD_Symbol_196)
          OpenAD_Symbol_269 = (OpenAD_Symbol_17 * OpenAD_Symbol_268)
          OpenAD_Symbol_271 = (OpenAD_Symbol_18 * OpenAD_Symbol_268)
          OpenAD_Symbol_272 = (OpenAD_Symbol_19 * OpenAD_Symbol_271)
          OpenAD_Symbol_273 = (OpenAD_Symbol_20 * OpenAD_Symbol_271)
          OpenAD_Symbol_274 = (OpenAD_Symbol_8 * OpenAD_Symbol_190)
          OpenAD_Symbol_275 = (OpenAD_Symbol_10 * OpenAD_Symbol_274)
          OpenAD_Symbol_276 = (OpenAD_Symbol_11 * OpenAD_Symbol_274)
          OpenAD_Symbol_277 = (OpenAD_Symbol_2 * OpenAD_Symbol_199)
          OpenAD_Symbol_278 = (OpenAD_Symbol_4 * OpenAD_Symbol_277)
          OpenAD_Symbol_279 = (OpenAD_Symbol_5 * OpenAD_Symbol_277)
          OpenAD_Symbol_280 = (OpenAD_Symbol_114 * OpenAD_Symbol_217)
          OpenAD_Symbol_281 = (OpenAD_Symbol_105 * OpenAD_Symbol_224)
          OpenAD_Symbol_282 = (OpenAD_Symbol_93 * OpenAD_Symbol_230)
          OpenAD_Symbol_283 = (OpenAD_Symbol_84 * OpenAD_Symbol_236)
          OpenAD_Symbol_284 = (OpenAD_Symbol_72 * OpenAD_Symbol_243)
          OpenAD_Symbol_285 = (OpenAD_Symbol_63 * OpenAD_Symbol_250)
          OpenAD_Symbol_286 = (OpenAD_Symbol_51 * OpenAD_Symbol_256)
          OpenAD_Symbol_287 = (OpenAD_Symbol_42 * OpenAD_Symbol_262)
          OpenAD_Symbol_288 = (OpenAD_Symbol_30 * OpenAD_Symbol_267)
          OpenAD_Symbol_289 = (OpenAD_Symbol_21 * OpenAD_Symbol_273)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_212)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_215)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_219)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_222)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_226)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_229)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_232)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_234)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_238)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_241)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_245)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_248)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_252)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_255)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_258)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_261)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_264)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_266)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_269)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_272)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_275)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_276)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_278)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_279)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_280)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_281)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_282)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_283)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_284)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_285)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_286)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_287)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_288)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_289)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_328 = (INT(OpenAD_Symbol_328) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_328)
        OpenAD_Symbol_327 = (INT(OpenAD_Symbol_327) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_327)
      t__5 = N
      OpenAD_Symbol_353 = 0_w2f__i8
      DO K = 1, t__5, 1
        OpenAD_Symbol_165 = (HX2 * HY2)
        OpenAD_Symbol_168 = (__value__(FVEC(K)) * OpenAD_Symbol_165)
        OpenAD_Symbol_166 = OpenAD_Symbol_165
        __value__(FVEC(INT(K))) = OpenAD_Symbol_168
        OpenAD_Symbol_307 = OpenAD_Symbol_166
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_307)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
        OpenAD_Symbol_353 = (INT(OpenAD_Symbol_353) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_353)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_309)
      OpenAD_Symbol_310 = 1
      DO WHILE(INT(OpenAD_Symbol_310) .LE. INT(OpenAD_Symbol_309))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_460)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_461)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_461, __deriv__(FVEC(INT(
     > OpenAD_Symbol_460))), __deriv__(OpenAD_Symbol_308))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_460))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_462)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_308), __deriv__(FVEC(INT(
     > OpenAD_Symbol_462))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_308))
        OpenAD_Symbol_310 = INT(OpenAD_Symbol_310) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_311)
      OpenAD_Symbol_312 = 1
      DO WHILE(INT(OpenAD_Symbol_312) .LE. INT(OpenAD_Symbol_311))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_313)
        OpenAD_Symbol_314 = 1
        DO WHILE(INT(OpenAD_Symbol_314) .LE. INT(OpenAD_Symbol_313))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_361)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_362)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_362, __deriv__(FVEC(INT(
     > OpenAD_Symbol_361))), __deriv__(OpenAD_Symbol_246))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_363)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_364)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_364, __deriv__(FVEC(INT(
     > OpenAD_Symbol_363))), __deriv__(OpenAD_Symbol_246))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_365)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_366)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_366, __deriv__(FVEC(INT(
     > OpenAD_Symbol_365))), __deriv__(OpenAD_Symbol_239))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_367)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_368)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_368, __deriv__(FVEC(INT(
     > OpenAD_Symbol_367))), __deriv__(OpenAD_Symbol_239))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_369)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_370)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_370, __deriv__(FVEC(INT(
     > OpenAD_Symbol_369))), __deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_371)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_372)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_372, __deriv__(FVEC(INT(
     > OpenAD_Symbol_371))), __deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_373)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_374)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_374, __deriv__(FVEC(INT(
     > OpenAD_Symbol_373))), __deriv__(OpenAD_Symbol_242))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_375)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_376)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_376, __deriv__(FVEC(INT(
     > OpenAD_Symbol_375))), __deriv__(OpenAD_Symbol_242))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_377)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_378)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_378, __deriv__(FVEC(INT(
     > OpenAD_Symbol_377))), __deriv__(OpenAD_Symbol_249))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_379)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_380)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_380, __deriv__(FVEC(INT(
     > OpenAD_Symbol_379))), __deriv__(OpenAD_Symbol_249))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_381)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_382)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_382, __deriv__(FVEC(INT(
     > OpenAD_Symbol_381))), __deriv__(OpenAD_Symbol_246))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_383)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_384)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_384, __deriv__(FVEC(INT(
     > OpenAD_Symbol_383))), __deriv__(OpenAD_Symbol_249))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_385)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_386)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_386, __deriv__(FVEC(INT(
     > OpenAD_Symbol_385))), __deriv__(OpenAD_Symbol_239))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_387)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_388)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_388, __deriv__(FVEC(INT(
     > OpenAD_Symbol_387))), __deriv__(OpenAD_Symbol_242))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_389)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_390)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_390, __deriv__(FVEC(INT(
     > OpenAD_Symbol_389))), __deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_391)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_392)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_392, __deriv__(FVEC(INT(
     > OpenAD_Symbol_391))), __deriv__(OpenAD_Symbol_270))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_393)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_394)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_394, __deriv__(FVEC(INT(
     > OpenAD_Symbol_393))), __deriv__(OpenAD_Symbol_227))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_395)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_396)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_396, __deriv__(FVEC(INT(
     > OpenAD_Symbol_395))), __deriv__(OpenAD_Symbol_259))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_397)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_398)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_398, __deriv__(FVEC(INT(
     > OpenAD_Symbol_397))), __deriv__(OpenAD_Symbol_213))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_399)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_400)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_400, __deriv__(FVEC(INT(
     > OpenAD_Symbol_399))), __deriv__(OpenAD_Symbol_259))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_401)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_402)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_402, __deriv__(FVEC(INT(
     > OpenAD_Symbol_401))), __deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_403)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_404)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_404, __deriv__(FVEC(INT(
     > OpenAD_Symbol_403))), __deriv__(OpenAD_Symbol_253))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_405)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_406)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_406, __deriv__(FVEC(INT(
     > OpenAD_Symbol_405))), __deriv__(OpenAD_Symbol_249))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_407)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_408)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_408, __deriv__(FVEC(INT(
     > OpenAD_Symbol_407))), __deriv__(OpenAD_Symbol_246))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_409)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_410)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_410, __deriv__(FVEC(INT(
     > OpenAD_Symbol_409))), __deriv__(OpenAD_Symbol_242))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_411)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_412)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_412, __deriv__(FVEC(INT(
     > OpenAD_Symbol_411))), __deriv__(OpenAD_Symbol_239))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_413)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_414)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_414, __deriv__(FVEC(INT(
     > OpenAD_Symbol_413))), __deriv__(OpenAD_Symbol_235))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_415)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_416)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_416, __deriv__(FVEC(INT(
     > OpenAD_Symbol_415))), __deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_417)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_418)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_418, __deriv__(FVEC(INT(
     > OpenAD_Symbol_417))), __deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_419)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_420)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_420, __deriv__(FVEC(INT(
     > OpenAD_Symbol_419))), __deriv__(OpenAD_Symbol_227))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_421)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_422)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_422, __deriv__(FVEC(INT(
     > OpenAD_Symbol_421))), __deriv__(OpenAD_Symbol_223))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_423)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_424)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_424, __deriv__(FVEC(INT(
     > OpenAD_Symbol_423))), __deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_425)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_426)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_426, __deriv__(FVEC(INT(
     > OpenAD_Symbol_425))), __deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_427)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_428)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_428, __deriv__(FVEC(INT(
     > OpenAD_Symbol_427))), __deriv__(OpenAD_Symbol_213))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_427))))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_213), __deriv__(PTL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_213))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_216), __deriv__(PTR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_220), __deriv__(P))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_220))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_223), __deriv__(PTT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_223))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_227), __deriv__(PBR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_227))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_235), __deriv__(PRR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_235))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_239), __deriv__(PL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_239))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_242), __deriv__(PR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_242))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_246), __deriv__(PB))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_246))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_249), __deriv__(PT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_249))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_253), __deriv__(PLL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_253))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_259), __deriv__(PBL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_259))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_270), __deriv__(PBB))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_270))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_315)
          IF(OpenAD_Symbol_315 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTR), __deriv__(
     > OpenAD_Symbol_290))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_430)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_290), __deriv__(X(INT
     > (OpenAD_Symbol_430))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_290))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_316)
          IF(OpenAD_Symbol_316 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_173))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_360)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_173), __deriv__(X(INT
     > (OpenAD_Symbol_360))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_173))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_317)
            IF(OpenAD_Symbol_317 .ne. 0) THEN
C             $OpenAD$ INLINE Pop(subst)
              CALL Pop(OpenAD_Symbol_431)
C             $OpenAD$ INLINE Saxpy(subst,subst,subst)
              CALL Saxpy(OpenAD_Symbol_431, __deriv__(PTT), __deriv__(
     > OpenAD_Symbol_292))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_432)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_292), __deriv__(X(
     > INT(OpenAD_Symbol_432))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_292))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PTT), __deriv__(
     > OpenAD_Symbol_294))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_293))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_435)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_293), __deriv__(X(
     > INT(OpenAD_Symbol_435))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_293))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_436)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_294), __deriv__(X(
     > INT(OpenAD_Symbol_436))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_294))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_318)
          IF(OpenAD_Symbol_318 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTL), __deriv__(
     > OpenAD_Symbol_295))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_438)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_295), __deriv__(X(INT
     > (OpenAD_Symbol_438))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_295))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_319)
          IF(OpenAD_Symbol_319 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_172))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_358)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_172), __deriv__(X(INT
     > (OpenAD_Symbol_358))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_172))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_320)
            IF(OpenAD_Symbol_320 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_296))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_439)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_296), __deriv__(X(
     > INT(OpenAD_Symbol_439))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_296))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_298))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_297))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_442)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_297), __deriv__(X(
     > INT(OpenAD_Symbol_442))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_297))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_443)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_298), __deriv__(X(
     > INT(OpenAD_Symbol_443))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_298))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(P), __deriv__(
     > OpenAD_Symbol_171))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_356)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_171), __deriv__(X(INT(
     > OpenAD_Symbol_356))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_171))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_321)
          IF(OpenAD_Symbol_321 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_170))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_355)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_170), __deriv__(X(INT
     > (OpenAD_Symbol_355))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_170))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_322)
            IF(OpenAD_Symbol_322 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_299))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_445)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_299), __deriv__(X(
     > INT(OpenAD_Symbol_445))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_299))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_301))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_300))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_448)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_300), __deriv__(X(
     > INT(OpenAD_Symbol_448))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_300))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_449)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_301), __deriv__(X(
     > INT(OpenAD_Symbol_449))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_301))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_323)
          IF(OpenAD_Symbol_323 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBR), __deriv__(
     > OpenAD_Symbol_302))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_451)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_302), __deriv__(X(INT
     > (OpenAD_Symbol_451))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_302))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
          IF(OpenAD_Symbol_324 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_169))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_354)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_169), __deriv__(X(INT
     > (OpenAD_Symbol_354))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_169))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_325)
            IF(OpenAD_Symbol_325 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_303))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_453)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_303), __deriv__(X(
     > INT(OpenAD_Symbol_453))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_303))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_305))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_304))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_456)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_304), __deriv__(X(
     > INT(OpenAD_Symbol_456))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_304))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_457)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_305), __deriv__(X(
     > INT(OpenAD_Symbol_457))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_305))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_326)
          IF(OpenAD_Symbol_326 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBL), __deriv__(
     > OpenAD_Symbol_306))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_459)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_306), __deriv__(X(INT
     > (OpenAD_Symbol_459))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_306))
          ENDIF
          OpenAD_Symbol_314 = INT(OpenAD_Symbol_314) + 1
        END DO
        OpenAD_Symbol_312 = INT(OpenAD_Symbol_312) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_vector_a(subst)
      CALL cp_res_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NX)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ INLINE cp_res_restore_real_vector_a(subst)
      CALL cp_res_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
