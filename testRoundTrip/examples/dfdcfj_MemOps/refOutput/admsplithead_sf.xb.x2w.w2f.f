C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:54:59 2006
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
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_13
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
      TYPE (OpenADTy_active) OpenAD_Symbol_163
      TYPE (OpenADTy_active) OpenAD_Symbol_164
      TYPE (OpenADTy_active) OpenAD_Symbol_165
      TYPE (OpenADTy_active) OpenAD_Symbol_166
      TYPE (OpenADTy_active) OpenAD_Symbol_167
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
      TYPE (OpenADTy_active) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      TYPE (OpenADTy_active) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      TYPE (OpenADTy_active) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      REAL(w2f__8) OpenAD_Symbol_216
      TYPE (OpenADTy_active) OpenAD_Symbol_217
      REAL(w2f__8) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_220
      TYPE (OpenADTy_active) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      REAL(w2f__8) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      REAL(w2f__8) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      TYPE (OpenADTy_active) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      TYPE (OpenADTy_active) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      TYPE (OpenADTy_active) OpenAD_Symbol_236
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      TYPE (OpenADTy_active) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      TYPE (OpenADTy_active) OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      TYPE (OpenADTy_active) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      TYPE (OpenADTy_active) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_256
      REAL(w2f__8) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      REAL(w2f__8) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      REAL(w2f__8) OpenAD_Symbol_263
      TYPE (OpenADTy_active) OpenAD_Symbol_264
      REAL(w2f__8) OpenAD_Symbol_265
      REAL(w2f__8) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      REAL(w2f__8) OpenAD_Symbol_268
      REAL(w2f__8) OpenAD_Symbol_269
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_270
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
      TYPE (OpenADTy_active) OpenAD_Symbol_284
      TYPE (OpenADTy_active) OpenAD_Symbol_285
      TYPE (OpenADTy_active) OpenAD_Symbol_286
      TYPE (OpenADTy_active) OpenAD_Symbol_287
      TYPE (OpenADTy_active) OpenAD_Symbol_288
      TYPE (OpenADTy_active) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_29
      TYPE (OpenADTy_active) OpenAD_Symbol_290
      TYPE (OpenADTy_active) OpenAD_Symbol_291
      TYPE (OpenADTy_active) OpenAD_Symbol_292
      TYPE (OpenADTy_active) OpenAD_Symbol_293
      TYPE (OpenADTy_active) OpenAD_Symbol_294
      TYPE (OpenADTy_active) OpenAD_Symbol_295
      TYPE (OpenADTy_active) OpenAD_Symbol_296
      TYPE (OpenADTy_active) OpenAD_Symbol_297
      TYPE (OpenADTy_active) OpenAD_Symbol_298
      TYPE (OpenADTy_active) OpenAD_Symbol_299
      INTEGER(w2f__i8) OpenAD_Symbol_300
      INTEGER(w2f__i8) OpenAD_Symbol_301
      INTEGER(w2f__i8) OpenAD_Symbol_302
      INTEGER(w2f__i8) OpenAD_Symbol_303
      INTEGER(w2f__i8) OpenAD_Symbol_304
      INTEGER(w2f__i8) OpenAD_Symbol_305
      INTEGER(w2f__i8) OpenAD_Symbol_306
      INTEGER(w2f__i8) OpenAD_Symbol_307
      INTEGER(w2f__i8) OpenAD_Symbol_308
      INTEGER(w2f__i8) OpenAD_Symbol_309
      REAL(w2f__8) OpenAD_Symbol_31
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
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_52
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
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_73
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
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_94
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
      INTEGER(w2f__i8) OpenAD_Symbol_342
      INTEGER(w2f__i8) OpenAD_Symbol_343
      INTEGER(w2f__i8) OpenAD_Symbol_344
      INTEGER(w2f__i8) OpenAD_Symbol_345
      INTEGER(w2f__i8) OpenAD_Symbol_346
      INTEGER(w2f__i8) OpenAD_Symbol_347
      INTEGER(w2f__i8) OpenAD_Symbol_348
      INTEGER(w2f__i8) OpenAD_Symbol_349
      REAL(w2f__8) OpenAD_Symbol_350
      INTEGER(w2f__i8) OpenAD_Symbol_351
      REAL(w2f__8) OpenAD_Symbol_352
      INTEGER(w2f__i8) OpenAD_Symbol_353
      REAL(w2f__8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      REAL(w2f__8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      REAL(w2f__8) OpenAD_Symbol_358
      INTEGER(w2f__i8) OpenAD_Symbol_359
      REAL(w2f__8) OpenAD_Symbol_360
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
      INTEGER(w2f__i8) OpenAD_Symbol_418
      INTEGER(w2f__i8) OpenAD_Symbol_419
      INTEGER(w2f__i8) OpenAD_Symbol_420
      INTEGER(w2f__i8) OpenAD_Symbol_421
      INTEGER(w2f__i8) OpenAD_Symbol_422
      INTEGER(w2f__i8) OpenAD_Symbol_423
      INTEGER(w2f__i8) OpenAD_Symbol_424
      INTEGER(w2f__i8) OpenAD_Symbol_425
      INTEGER(w2f__i8) OpenAD_Symbol_426
      INTEGER(w2f__i8) OpenAD_Symbol_427
      INTEGER(w2f__i8) OpenAD_Symbol_428
      INTEGER(w2f__i8) OpenAD_Symbol_429
      INTEGER(w2f__i8) OpenAD_Symbol_430
      INTEGER(w2f__i8) OpenAD_Symbol_431
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
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      DO I = 1, NY, 1
        DO J = 1, NX, 1
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
              __value__(PBB) = __value__(X(K - 2 * NX))
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
              __value__(PTT) = __value__(X(K))
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + 2 * NX))
            ENDIF
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
          ENDIF
          __value__(DPDY) = ((__value__(PT) - __value__(PB)) /(2.0D00 *
     >  HY))
          __value__(DPDX) = ((__value__(PR) - __value__(PL)) /(2.0D00 *
     >  HX))
          __value__(PBLAP) = (((__value__(PBB) + __value__(P) - 2.0D00
     >  * __value__(PB)) / HY2) +((__value__(PBL) + __value__(PBR) -
     >  2.0D00 * __value__(PB)) / HX2))
          __value__(PLLAP) = (((__value__(PBL) + __value__(PTL) -
     >  2.0D00 * __value__(PL)) / HY2) +((__value__(PLL) + __value__(P)
     >  - 2.0D00 * __value__(PL)) / HX2))
          __value__(PLAP) = (((__value__(PB) + __value__(PT) - 2.0D00 *
     >  __value__(P)) / HY2) +((__value__(PL) + __value__(PR) - 2.0D00
     >  * __value__(P)) / HX2))
          __value__(PRLAP) = (((__value__(P) + __value__(PRR) - 2.0D00
     >  * __value__(PR)) / HX2) +((__value__(PBR) + __value__(PTR) -
     >  2.0D00 * __value__(PR)) / HY2))
          __value__(PTLAP) = (((__value__(P) + __value__(PTT) - 2.0D00
     >  * __value__(PT)) / HY2) +((__value__(PTL) + __value__(PTR) -
     >  2.0D00 * __value__(PT)) / HX2))
          __value__(FVEC(INT(K))) = (((__value__(PBLAP) + __value__(
     > PTLAP) - 2.0D00 * __value__(PLAP)) / HY2) +((__value__(PLLAP) +
     >  __value__(PRLAP) - 2.0D00 * __value__(PLAP)) / HX2) - R *(((
     > __value__(DPDY) *(__value__(PRLAP) - __value__(PLLAP))) /(2.0D00
     >  * HX)) -((__value__(DPDX) *(__value__(PTLAP) - __value__(PBLAP)
     > )) /(2.0D00 * HY))))
        END DO
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      OpenAD_Symbol_316 = 0_w2f__i8
      DO I = 1, NY, 1
        OpenAD_Symbol_317 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_318 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_318)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_445 = (K - NX + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_445)
            OpenAD_Symbol_319 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_319)
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_322 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_322)
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_439 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_439)
              OpenAD_Symbol_320 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_320)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - 2 * NX))
              OpenAD_Symbol_441 = (K - INT(2_w2f__i8) * NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_441)
              OpenAD_Symbol_442 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_442)
              OpenAD_Symbol_321 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_321)
            ENDIF
            OpenAD_Symbol_323 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_323)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_324 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_324)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_437 = (K - NX + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_437)
            OpenAD_Symbol_325 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_325)
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_328 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_328)
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_431 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_431)
              OpenAD_Symbol_326 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_326)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_433 = (K + INT((-2_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_433)
              OpenAD_Symbol_434 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_434)
              OpenAD_Symbol_327 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_327)
            ENDIF
            OpenAD_Symbol_329 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_329)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_345 = (K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_345)
            OpenAD_Symbol_332 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_332)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_330 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_330)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_427 = (K + INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_427)
              OpenAD_Symbol_428 = (K + INT(1_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_428)
              OpenAD_Symbol_331 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_331)
            ENDIF
            OpenAD_Symbol_333 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_333)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_334 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_334)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_424 = (NX + K + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_424)
            OpenAD_Symbol_335 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_335)
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_347 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_347)
            OpenAD_Symbol_338 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_338)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_336 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_336)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + 2 * NX))
              OpenAD_Symbol_420 = (K + INT(2_w2f__i8) * NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_420)
              OpenAD_Symbol_421 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_421)
              OpenAD_Symbol_337 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_337)
            ENDIF
            OpenAD_Symbol_339 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_339)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_340 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_340)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_417 = (NX + K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_417)
            OpenAD_Symbol_341 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_341)
          ENDIF
          OpenAD_Symbol_0 = (__value__(PT) - __value__(PB))
          OpenAD_Symbol_1 = (2.0D00 * HY)
          __value__(DPDY) = (OpenAD_Symbol_0 / OpenAD_Symbol_1)
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_5 = (-1_w2f__i8)
          OpenAD_Symbol_2 = (INT(1_w2f__i8) / OpenAD_Symbol_1)
          OpenAD_Symbol_6 = (__value__(PR) - __value__(PL))
          OpenAD_Symbol_7 = (2.0D00 * HX)
          __value__(DPDX) = (OpenAD_Symbol_6 / OpenAD_Symbol_7)
          OpenAD_Symbol_10 = 1_w2f__i8
          OpenAD_Symbol_11 = (-1_w2f__i8)
          OpenAD_Symbol_8 = (INT(1_w2f__i8) / OpenAD_Symbol_7)
          OpenAD_Symbol_14 = (__value__(PBB) + __value__(P) - 2.0D00 *
     >  __value__(PB))
          OpenAD_Symbol_23 = (__value__(PBL) + __value__(PBR) - 2.0D00
     >  * __value__(PB))
          OpenAD_Symbol_32 = ((OpenAD_Symbol_14 / HY2) +(
     > OpenAD_Symbol_23 / HX2))
          OpenAD_Symbol_17 = 1_w2f__i8
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_22 = 2.0D00
          OpenAD_Symbol_20 = (-1_w2f__i8)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_15 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_12 = 1_w2f__i8
          OpenAD_Symbol_26 = 1_w2f__i8
          OpenAD_Symbol_28 = 1_w2f__i8
          OpenAD_Symbol_31 = 2.0D00
          OpenAD_Symbol_29 = (-1_w2f__i8)
          OpenAD_Symbol_27 = 1_w2f__i8
          OpenAD_Symbol_24 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_13 = 1_w2f__i8
          __value__(PBLAP) = OpenAD_Symbol_32
          OpenAD_Symbol_35 = (__value__(PBL) + __value__(PTL) - 2.0D00
     >  * __value__(PL))
          OpenAD_Symbol_44 = (__value__(PLL) + __value__(P) - 2.0D00 *
     >  __value__(PL))
          OpenAD_Symbol_53 = ((OpenAD_Symbol_35 / HY2) +(
     > OpenAD_Symbol_44 / HX2))
          OpenAD_Symbol_38 = 1_w2f__i8
          OpenAD_Symbol_40 = 1_w2f__i8
          OpenAD_Symbol_43 = 2.0D00
          OpenAD_Symbol_41 = (-1_w2f__i8)
          OpenAD_Symbol_39 = 1_w2f__i8
          OpenAD_Symbol_36 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_47 = 1_w2f__i8
          OpenAD_Symbol_49 = 1_w2f__i8
          OpenAD_Symbol_52 = 2.0D00
          OpenAD_Symbol_50 = (-1_w2f__i8)
          OpenAD_Symbol_48 = 1_w2f__i8
          OpenAD_Symbol_45 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_34 = 1_w2f__i8
          __value__(PLLAP) = OpenAD_Symbol_53
          OpenAD_Symbol_56 = (__value__(PB) + __value__(PT) - 2.0D00 *
     >  __value__(P))
          OpenAD_Symbol_65 = (__value__(PL) + __value__(PR) - 2.0D00 *
     >  __value__(P))
          OpenAD_Symbol_74 = ((OpenAD_Symbol_56 / HY2) +(
     > OpenAD_Symbol_65 / HX2))
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_61 = 1_w2f__i8
          OpenAD_Symbol_64 = 2.0D00
          OpenAD_Symbol_62 = (-1_w2f__i8)
          OpenAD_Symbol_60 = 1_w2f__i8
          OpenAD_Symbol_57 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_54 = 1_w2f__i8
          OpenAD_Symbol_68 = 1_w2f__i8
          OpenAD_Symbol_70 = 1_w2f__i8
          OpenAD_Symbol_73 = 2.0D00
          OpenAD_Symbol_71 = (-1_w2f__i8)
          OpenAD_Symbol_69 = 1_w2f__i8
          OpenAD_Symbol_66 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_55 = 1_w2f__i8
          __value__(PLAP) = OpenAD_Symbol_74
          OpenAD_Symbol_77 = (__value__(P) + __value__(PRR) - 2.0D00 *
     >  __value__(PR))
          OpenAD_Symbol_86 = (__value__(PBR) + __value__(PTR) - 2.0D00
     >  * __value__(PR))
          OpenAD_Symbol_95 = ((OpenAD_Symbol_77 / HX2) +(
     > OpenAD_Symbol_86 / HY2))
          OpenAD_Symbol_80 = 1_w2f__i8
          OpenAD_Symbol_82 = 1_w2f__i8
          OpenAD_Symbol_85 = 2.0D00
          OpenAD_Symbol_83 = (-1_w2f__i8)
          OpenAD_Symbol_81 = 1_w2f__i8
          OpenAD_Symbol_78 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_75 = 1_w2f__i8
          OpenAD_Symbol_89 = 1_w2f__i8
          OpenAD_Symbol_91 = 1_w2f__i8
          OpenAD_Symbol_94 = 2.0D00
          OpenAD_Symbol_92 = (-1_w2f__i8)
          OpenAD_Symbol_90 = 1_w2f__i8
          OpenAD_Symbol_87 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_76 = 1_w2f__i8
          __value__(PRLAP) = OpenAD_Symbol_95
          OpenAD_Symbol_98 = (__value__(P) + __value__(PTT) - 2.0D00 *
     >  __value__(PT))
          OpenAD_Symbol_107 = (__value__(PTL) + __value__(PTR) - 2.0D00
     >  * __value__(PT))
          OpenAD_Symbol_116 = ((OpenAD_Symbol_98 / HY2) +(
     > OpenAD_Symbol_107 / HX2))
          OpenAD_Symbol_101 = 1_w2f__i8
          OpenAD_Symbol_103 = 1_w2f__i8
          OpenAD_Symbol_106 = 2.0D00
          OpenAD_Symbol_104 = (-1_w2f__i8)
          OpenAD_Symbol_102 = 1_w2f__i8
          OpenAD_Symbol_99 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_96 = 1_w2f__i8
          OpenAD_Symbol_110 = 1_w2f__i8
          OpenAD_Symbol_112 = 1_w2f__i8
          OpenAD_Symbol_115 = 2.0D00
          OpenAD_Symbol_113 = (-1_w2f__i8)
          OpenAD_Symbol_111 = 1_w2f__i8
          OpenAD_Symbol_108 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_97 = 1_w2f__i8
          __value__(PTLAP) = OpenAD_Symbol_116
          OpenAD_Symbol_121 = (__value__(PBLAP) + __value__(PTLAP) -
     >  2.0D00 * __value__(PLAP))
          OpenAD_Symbol_130 = (__value__(PLLAP) + __value__(PRLAP) -
     >  2.0D00 * __value__(PLAP))
          OpenAD_Symbol_148 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_144 = (__value__(DPDY) * OpenAD_Symbol_148)
          OpenAD_Symbol_145 = (2.0D00 * HX)
          OpenAD_Symbol_157 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_153 = (__value__(DPDX) * OpenAD_Symbol_157)
          OpenAD_Symbol_154 = (2.0D00 * HY)
          OpenAD_Symbol_139 = ((OpenAD_Symbol_144 / OpenAD_Symbol_145)
     >  -(OpenAD_Symbol_153 / OpenAD_Symbol_154))
          OpenAD_Symbol_162 = ((OpenAD_Symbol_121 / HY2) +(
     > OpenAD_Symbol_130 / HX2) - R * OpenAD_Symbol_139)
          OpenAD_Symbol_124 = 1_w2f__i8
          OpenAD_Symbol_126 = 1_w2f__i8
          OpenAD_Symbol_129 = 2.0D00
          OpenAD_Symbol_127 = (-1_w2f__i8)
          OpenAD_Symbol_125 = 1_w2f__i8
          OpenAD_Symbol_122 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_119 = 1_w2f__i8
          OpenAD_Symbol_133 = 1_w2f__i8
          OpenAD_Symbol_135 = 1_w2f__i8
          OpenAD_Symbol_138 = 2.0D00
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
          OpenAD_Symbol_168 = (OpenAD_Symbol_119 * OpenAD_Symbol_117)
          OpenAD_Symbol_169 = (OpenAD_Symbol_120 * OpenAD_Symbol_117)
          OpenAD_Symbol_170 = (OpenAD_Symbol_141 * OpenAD_Symbol_118)
          OpenAD_Symbol_171 = (OpenAD_Symbol_142 * OpenAD_Symbol_170)
          OpenAD_Symbol_172 = (OpenAD_Symbol_143 * OpenAD_Symbol_170)
          OpenAD_Symbol_173 = (OpenAD_Symbol_131 * OpenAD_Symbol_169)
          OpenAD_Symbol_174 = (OpenAD_Symbol_133 * OpenAD_Symbol_173)
          OpenAD_Symbol_175 = (OpenAD_Symbol_134 * OpenAD_Symbol_173)
          OpenAD_Symbol_176 = (OpenAD_Symbol_135 * OpenAD_Symbol_175)
          OpenAD_Symbol_177 = (OpenAD_Symbol_136 * OpenAD_Symbol_175)
          OpenAD_Symbol_178 = (OpenAD_Symbol_122 * OpenAD_Symbol_168)
          OpenAD_Symbol_179 = (OpenAD_Symbol_124 * OpenAD_Symbol_178)
          OpenAD_Symbol_180 = (OpenAD_Symbol_125 * OpenAD_Symbol_178)
          OpenAD_Symbol_181 = (OpenAD_Symbol_126 * OpenAD_Symbol_180)
          OpenAD_Symbol_182 = (OpenAD_Symbol_127 * OpenAD_Symbol_180)
          OpenAD_Symbol_183 = (OpenAD_Symbol_155 * OpenAD_Symbol_172)
          OpenAD_Symbol_184 = (OpenAD_Symbol_158 * OpenAD_Symbol_183)
          OpenAD_Symbol_185 = (OpenAD_Symbol_159 * OpenAD_Symbol_183)
          OpenAD_Symbol_186 = (OpenAD_Symbol_181 + OpenAD_Symbol_160 *
     >  OpenAD_Symbol_185)
          OpenAD_Symbol_187 = (OpenAD_Symbol_179 + OpenAD_Symbol_161 *
     >  OpenAD_Symbol_185)
          OpenAD_Symbol_188 = (OpenAD_Symbol_96 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_97 * OpenAD_Symbol_186)
          OpenAD_Symbol_190 = (OpenAD_Symbol_12 * OpenAD_Symbol_187)
          OpenAD_Symbol_191 = (OpenAD_Symbol_13 * OpenAD_Symbol_187)
          OpenAD_Symbol_192 = (OpenAD_Symbol_146 * OpenAD_Symbol_171)
          OpenAD_Symbol_193 = (OpenAD_Symbol_149 * OpenAD_Symbol_192)
          OpenAD_Symbol_194 = (OpenAD_Symbol_150 * OpenAD_Symbol_192)
          OpenAD_Symbol_195 = (OpenAD_Symbol_176 + OpenAD_Symbol_151 *
     >  OpenAD_Symbol_194)
          OpenAD_Symbol_196 = (OpenAD_Symbol_174 + OpenAD_Symbol_152 *
     >  OpenAD_Symbol_194)
          OpenAD_Symbol_197 = (OpenAD_Symbol_75 * OpenAD_Symbol_195)
          OpenAD_Symbol_198 = (OpenAD_Symbol_76 * OpenAD_Symbol_195)
          OpenAD_Symbol_199 = (OpenAD_Symbol_33 * OpenAD_Symbol_196)
          OpenAD_Symbol_200 = (OpenAD_Symbol_34 * OpenAD_Symbol_196)
          OpenAD_Symbol_201 = (OpenAD_Symbol_138 * OpenAD_Symbol_177)
          OpenAD_Symbol_202 = (OpenAD_Symbol_201 + OpenAD_Symbol_129 *
     >  OpenAD_Symbol_182)
          OpenAD_Symbol_203 = (OpenAD_Symbol_54 * OpenAD_Symbol_202)
          OpenAD_Symbol_204 = (OpenAD_Symbol_55 * OpenAD_Symbol_202)
          OpenAD_Symbol_205 = (OpenAD_Symbol_108 * OpenAD_Symbol_189)
          OpenAD_Symbol_206 = (OpenAD_Symbol_110 * OpenAD_Symbol_205)
          OpenAD_Symbol_208 = (OpenAD_Symbol_111 * OpenAD_Symbol_205)
          OpenAD_Symbol_209 = (OpenAD_Symbol_112 * OpenAD_Symbol_208)
          OpenAD_Symbol_211 = (OpenAD_Symbol_113 * OpenAD_Symbol_208)
          OpenAD_Symbol_212 = (OpenAD_Symbol_99 * OpenAD_Symbol_188)
          OpenAD_Symbol_213 = (OpenAD_Symbol_101 * OpenAD_Symbol_212)
          OpenAD_Symbol_215 = (OpenAD_Symbol_102 * OpenAD_Symbol_212)
          OpenAD_Symbol_216 = (OpenAD_Symbol_103 * OpenAD_Symbol_215)
          OpenAD_Symbol_218 = (OpenAD_Symbol_104 * OpenAD_Symbol_215)
          OpenAD_Symbol_219 = (OpenAD_Symbol_87 * OpenAD_Symbol_198)
          OpenAD_Symbol_220 = (OpenAD_Symbol_89 * OpenAD_Symbol_219)
          OpenAD_Symbol_222 = (OpenAD_Symbol_90 * OpenAD_Symbol_219)
          OpenAD_Symbol_223 = (OpenAD_Symbol_91 * OpenAD_Symbol_222)
          OpenAD_Symbol_224 = (OpenAD_Symbol_92 * OpenAD_Symbol_222)
          OpenAD_Symbol_225 = (OpenAD_Symbol_78 * OpenAD_Symbol_197)
          OpenAD_Symbol_226 = (OpenAD_Symbol_80 * OpenAD_Symbol_225)
          OpenAD_Symbol_227 = (OpenAD_Symbol_81 * OpenAD_Symbol_225)
          OpenAD_Symbol_228 = (OpenAD_Symbol_82 * OpenAD_Symbol_227)
          OpenAD_Symbol_230 = (OpenAD_Symbol_83 * OpenAD_Symbol_227)
          OpenAD_Symbol_231 = (OpenAD_Symbol_66 * OpenAD_Symbol_204)
          OpenAD_Symbol_232 = (OpenAD_Symbol_68 * OpenAD_Symbol_231)
          OpenAD_Symbol_234 = (OpenAD_Symbol_69 * OpenAD_Symbol_231)
          OpenAD_Symbol_235 = (OpenAD_Symbol_70 * OpenAD_Symbol_234)
          OpenAD_Symbol_237 = (OpenAD_Symbol_71 * OpenAD_Symbol_234)
          OpenAD_Symbol_238 = (OpenAD_Symbol_57 * OpenAD_Symbol_203)
          OpenAD_Symbol_239 = (OpenAD_Symbol_59 * OpenAD_Symbol_238)
          OpenAD_Symbol_241 = (OpenAD_Symbol_60 * OpenAD_Symbol_238)
          OpenAD_Symbol_242 = (OpenAD_Symbol_61 * OpenAD_Symbol_241)
          OpenAD_Symbol_244 = (OpenAD_Symbol_62 * OpenAD_Symbol_241)
          OpenAD_Symbol_245 = (OpenAD_Symbol_45 * OpenAD_Symbol_200)
          OpenAD_Symbol_246 = (OpenAD_Symbol_47 * OpenAD_Symbol_245)
          OpenAD_Symbol_248 = (OpenAD_Symbol_48 * OpenAD_Symbol_245)
          OpenAD_Symbol_249 = (OpenAD_Symbol_49 * OpenAD_Symbol_248)
          OpenAD_Symbol_250 = (OpenAD_Symbol_50 * OpenAD_Symbol_248)
          OpenAD_Symbol_251 = (OpenAD_Symbol_36 * OpenAD_Symbol_199)
          OpenAD_Symbol_252 = (OpenAD_Symbol_38 * OpenAD_Symbol_251)
          OpenAD_Symbol_254 = (OpenAD_Symbol_39 * OpenAD_Symbol_251)
          OpenAD_Symbol_255 = (OpenAD_Symbol_40 * OpenAD_Symbol_254)
          OpenAD_Symbol_256 = (OpenAD_Symbol_41 * OpenAD_Symbol_254)
          OpenAD_Symbol_257 = (OpenAD_Symbol_24 * OpenAD_Symbol_191)
          OpenAD_Symbol_258 = (OpenAD_Symbol_26 * OpenAD_Symbol_257)
          OpenAD_Symbol_259 = (OpenAD_Symbol_27 * OpenAD_Symbol_257)
          OpenAD_Symbol_260 = (OpenAD_Symbol_28 * OpenAD_Symbol_259)
          OpenAD_Symbol_261 = (OpenAD_Symbol_29 * OpenAD_Symbol_259)
          OpenAD_Symbol_262 = (OpenAD_Symbol_15 * OpenAD_Symbol_190)
          OpenAD_Symbol_263 = (OpenAD_Symbol_17 * OpenAD_Symbol_262)
          OpenAD_Symbol_265 = (OpenAD_Symbol_18 * OpenAD_Symbol_262)
          OpenAD_Symbol_266 = (OpenAD_Symbol_19 * OpenAD_Symbol_265)
          OpenAD_Symbol_267 = (OpenAD_Symbol_20 * OpenAD_Symbol_265)
          OpenAD_Symbol_268 = (OpenAD_Symbol_8 * OpenAD_Symbol_184)
          OpenAD_Symbol_269 = (OpenAD_Symbol_10 * OpenAD_Symbol_268)
          OpenAD_Symbol_270 = (OpenAD_Symbol_11 * OpenAD_Symbol_268)
          OpenAD_Symbol_271 = (OpenAD_Symbol_2 * OpenAD_Symbol_193)
          OpenAD_Symbol_272 = (OpenAD_Symbol_4 * OpenAD_Symbol_271)
          OpenAD_Symbol_273 = (OpenAD_Symbol_5 * OpenAD_Symbol_271)
          OpenAD_Symbol_274 = (OpenAD_Symbol_115 * OpenAD_Symbol_211)
          OpenAD_Symbol_275 = (OpenAD_Symbol_106 * OpenAD_Symbol_218)
          OpenAD_Symbol_276 = (OpenAD_Symbol_94 * OpenAD_Symbol_224)
          OpenAD_Symbol_277 = (OpenAD_Symbol_85 * OpenAD_Symbol_230)
          OpenAD_Symbol_278 = (OpenAD_Symbol_73 * OpenAD_Symbol_237)
          OpenAD_Symbol_279 = (OpenAD_Symbol_64 * OpenAD_Symbol_244)
          OpenAD_Symbol_280 = (OpenAD_Symbol_52 * OpenAD_Symbol_250)
          OpenAD_Symbol_281 = (OpenAD_Symbol_43 * OpenAD_Symbol_256)
          OpenAD_Symbol_282 = (OpenAD_Symbol_31 * OpenAD_Symbol_261)
          OpenAD_Symbol_283 = (OpenAD_Symbol_22 * OpenAD_Symbol_267)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_206)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_209)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_213)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_216)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_220)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_223)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_226)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_228)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_232)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_235)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_239)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_242)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_246)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_249)
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
          CALL push(OpenAD_Symbol_260)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_263)
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
          CALL push(OpenAD_Symbol_270)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_272)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_273)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_274)
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
          CALL push(OpenAD_Symbol_277)
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
          OpenAD_Symbol_317 = (INT(OpenAD_Symbol_317) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_317)
        OpenAD_Symbol_316 = (INT(OpenAD_Symbol_316) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_316)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_300)
      OpenAD_Symbol_301 = 1
      DO WHILE(INT(OpenAD_Symbol_301) .LE. INT(OpenAD_Symbol_300))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_302)
        OpenAD_Symbol_303 = 1
        DO WHILE(INT(OpenAD_Symbol_303) .LE. INT(OpenAD_Symbol_302))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_349)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_350)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_350, __deriv__(FVEC(INT(
     > OpenAD_Symbol_349))), __deriv__(OpenAD_Symbol_240))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_351)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_352)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_352, __deriv__(FVEC(INT(
     > OpenAD_Symbol_351))), __deriv__(OpenAD_Symbol_240))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_353)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_354)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_354, __deriv__(FVEC(INT(
     > OpenAD_Symbol_353))), __deriv__(OpenAD_Symbol_233))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_355)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_356)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_356, __deriv__(FVEC(INT(
     > OpenAD_Symbol_355))), __deriv__(OpenAD_Symbol_233))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_357)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_358)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_358, __deriv__(FVEC(INT(
     > OpenAD_Symbol_357))), __deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_359)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_360)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_360, __deriv__(FVEC(INT(
     > OpenAD_Symbol_359))), __deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_361)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_362)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_362, __deriv__(FVEC(INT(
     > OpenAD_Symbol_361))), __deriv__(OpenAD_Symbol_236))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_363)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_364)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_364, __deriv__(FVEC(INT(
     > OpenAD_Symbol_363))), __deriv__(OpenAD_Symbol_236))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_365)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_366)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_366, __deriv__(FVEC(INT(
     > OpenAD_Symbol_365))), __deriv__(OpenAD_Symbol_243))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_367)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_368)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_368, __deriv__(FVEC(INT(
     > OpenAD_Symbol_367))), __deriv__(OpenAD_Symbol_243))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_369)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_370)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_370, __deriv__(FVEC(INT(
     > OpenAD_Symbol_369))), __deriv__(OpenAD_Symbol_240))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_371)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_372)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_372, __deriv__(FVEC(INT(
     > OpenAD_Symbol_371))), __deriv__(OpenAD_Symbol_243))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_373)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_374)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_374, __deriv__(FVEC(INT(
     > OpenAD_Symbol_373))), __deriv__(OpenAD_Symbol_233))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_375)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_376)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_376, __deriv__(FVEC(INT(
     > OpenAD_Symbol_375))), __deriv__(OpenAD_Symbol_236))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_377)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_378)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_378, __deriv__(FVEC(INT(
     > OpenAD_Symbol_377))), __deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_379)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_380)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_380, __deriv__(FVEC(INT(
     > OpenAD_Symbol_379))), __deriv__(OpenAD_Symbol_264))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_381)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_382)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_382, __deriv__(FVEC(INT(
     > OpenAD_Symbol_381))), __deriv__(OpenAD_Symbol_221))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_383)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_384)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_384, __deriv__(FVEC(INT(
     > OpenAD_Symbol_383))), __deriv__(OpenAD_Symbol_253))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_385)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_386)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_386, __deriv__(FVEC(INT(
     > OpenAD_Symbol_385))), __deriv__(OpenAD_Symbol_207))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_387)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_388)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_388, __deriv__(FVEC(INT(
     > OpenAD_Symbol_387))), __deriv__(OpenAD_Symbol_253))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_389)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_390)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_390, __deriv__(FVEC(INT(
     > OpenAD_Symbol_389))), __deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_391)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_392)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_392, __deriv__(FVEC(INT(
     > OpenAD_Symbol_391))), __deriv__(OpenAD_Symbol_247))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_393)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_394)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_394, __deriv__(FVEC(INT(
     > OpenAD_Symbol_393))), __deriv__(OpenAD_Symbol_243))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_395)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_396)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_396, __deriv__(FVEC(INT(
     > OpenAD_Symbol_395))), __deriv__(OpenAD_Symbol_240))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_397)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_398)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_398, __deriv__(FVEC(INT(
     > OpenAD_Symbol_397))), __deriv__(OpenAD_Symbol_236))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_399)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_400)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_400, __deriv__(FVEC(INT(
     > OpenAD_Symbol_399))), __deriv__(OpenAD_Symbol_233))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_401)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_402)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_402, __deriv__(FVEC(INT(
     > OpenAD_Symbol_401))), __deriv__(OpenAD_Symbol_229))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_403)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_404)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_404, __deriv__(FVEC(INT(
     > OpenAD_Symbol_403))), __deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_405)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_406)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_406, __deriv__(FVEC(INT(
     > OpenAD_Symbol_405))), __deriv__(OpenAD_Symbol_210))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_407)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_408)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_408, __deriv__(FVEC(INT(
     > OpenAD_Symbol_407))), __deriv__(OpenAD_Symbol_221))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_409)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_410)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_410, __deriv__(FVEC(INT(
     > OpenAD_Symbol_409))), __deriv__(OpenAD_Symbol_217))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_411)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_412)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_412, __deriv__(FVEC(INT(
     > OpenAD_Symbol_411))), __deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_413)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_414)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_414, __deriv__(FVEC(INT(
     > OpenAD_Symbol_413))), __deriv__(OpenAD_Symbol_210))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_415)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_416)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_416, __deriv__(FVEC(INT(
     > OpenAD_Symbol_415))), __deriv__(OpenAD_Symbol_207))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_415))))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_207), __deriv__(PTL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_207))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_210), __deriv__(PTR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_210))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_214), __deriv__(P))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_214))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_217), __deriv__(PTT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_217))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_221), __deriv__(PBR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_221))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_229), __deriv__(PRR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_229))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_233), __deriv__(PL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_233))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_236), __deriv__(PR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_236))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_240), __deriv__(PB))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_240))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_243), __deriv__(PT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_243))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_247), __deriv__(PLL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_247))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_253), __deriv__(PBL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_253))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_264), __deriv__(PBB))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_264))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_304)
          IF(OpenAD_Symbol_304 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTR), __deriv__(
     > OpenAD_Symbol_284))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_418)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_284), __deriv__(X(INT
     > (OpenAD_Symbol_418))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_284))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_305)
          IF(OpenAD_Symbol_305 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_167))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_348)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_167), __deriv__(X(INT
     > (OpenAD_Symbol_348))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_167))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_306)
            IF(OpenAD_Symbol_306 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PTT), __deriv__(
     > OpenAD_Symbol_285))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_419)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_285), __deriv__(X(
     > INT(OpenAD_Symbol_419))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_285))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PTT), __deriv__(
     > OpenAD_Symbol_287))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_286))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_422)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_286), __deriv__(X(
     > INT(OpenAD_Symbol_422))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_286))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_423)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_287), __deriv__(X(
     > INT(OpenAD_Symbol_423))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_287))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_307)
          IF(OpenAD_Symbol_307 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTL), __deriv__(
     > OpenAD_Symbol_288))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_425)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_288), __deriv__(X(INT
     > (OpenAD_Symbol_425))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_288))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_308)
          IF(OpenAD_Symbol_308 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_166))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_346)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_166), __deriv__(X(INT
     > (OpenAD_Symbol_346))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_166))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_309)
            IF(OpenAD_Symbol_309 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_289))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_426)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_289), __deriv__(X(
     > INT(OpenAD_Symbol_426))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_289))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_291))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_290))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_429)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_290), __deriv__(X(
     > INT(OpenAD_Symbol_429))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_290))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_430)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_291), __deriv__(X(
     > INT(OpenAD_Symbol_430))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_291))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(P), __deriv__(
     > OpenAD_Symbol_165))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_344)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_165), __deriv__(X(INT(
     > OpenAD_Symbol_344))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_165))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
          IF(OpenAD_Symbol_310 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_164))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_343)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_164), __deriv__(X(INT
     > (OpenAD_Symbol_343))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_164))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_311)
            IF(OpenAD_Symbol_311 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_292))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_432)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_292), __deriv__(X(
     > INT(OpenAD_Symbol_432))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_292))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_294))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
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
          CALL pop_i(OpenAD_Symbol_312)
          IF(OpenAD_Symbol_312 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBR), __deriv__(
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
          CALL pop_i(OpenAD_Symbol_313)
          IF(OpenAD_Symbol_313 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_163))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_342)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_163), __deriv__(X(INT
     > (OpenAD_Symbol_342))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_163))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_314)
            IF(OpenAD_Symbol_314 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_296))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_440)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_296), __deriv__(X(
     > INT(OpenAD_Symbol_440))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_296))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_298))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_297))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_443)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_297), __deriv__(X(
     > INT(OpenAD_Symbol_443))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_297))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_444)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_298), __deriv__(X(
     > INT(OpenAD_Symbol_444))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_298))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_315)
          IF(OpenAD_Symbol_315 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBL), __deriv__(
     > OpenAD_Symbol_299))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_446)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_299), __deriv__(X(INT
     > (OpenAD_Symbol_446))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_299))
          ENDIF
          OpenAD_Symbol_303 = INT(OpenAD_Symbol_303) + 1
        END DO
        OpenAD_Symbol_301 = INT(OpenAD_Symbol_301) + 1
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
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ INLINE cp_res_store_real_vector_a(subst)
      CALL cp_res_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
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
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
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
