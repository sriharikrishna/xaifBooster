
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(OBJ, G_OBJ0, G_OBJ1, G_OBJ2, G_OBJ3, G_OBJ4,
     >  G_OBJ5, X0, X1, X2, X3, X4, X5, H_OBJ0, H_OBJ1, H_OBJ2, H_OBJ3,
     >  H_OBJ4, H_OBJ5, H_OBJ6, H_OBJ7, H_OBJ8, H_OBJ9, H_OBJ10,
     >  H_OBJ11, H_OBJ12, H_OBJ13, H_OBJ14, H_OBJ15, H_OBJ16, H_OBJ17,
     >  H_OBJ18, H_OBJ19, H_OBJ20)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
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
      REAL(w2f__8) OpenAD_Symbol_121
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
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
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
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
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
      REAL(w2f__8) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_177
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
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
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
      REAL(w2f__8) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
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
      REAL(w2f__8) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      REAL(w2f__8) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_256
      REAL(w2f__8) OpenAD_Symbol_258
      REAL(w2f__8) OpenAD_Symbol_259
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
      REAL(w2f__8) OpenAD_Symbol_284
      REAL(w2f__8) OpenAD_Symbol_285
      REAL(w2f__8) OpenAD_Symbol_286
      REAL(w2f__8) OpenAD_Symbol_287
      REAL(w2f__8) OpenAD_Symbol_288
      REAL(w2f__8) OpenAD_Symbol_289
      REAL(w2f__8) OpenAD_Symbol_290
      REAL(w2f__8) OpenAD_Symbol_291
      REAL(w2f__8) OpenAD_Symbol_292
      REAL(w2f__8) OpenAD_Symbol_293
      REAL(w2f__8) OpenAD_Symbol_294
      REAL(w2f__8) OpenAD_Symbol_295
      REAL(w2f__8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      REAL(w2f__8) OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_300
      REAL(w2f__8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      REAL(w2f__8) OpenAD_Symbol_303
      REAL(w2f__8) OpenAD_Symbol_304
      REAL(w2f__8) OpenAD_Symbol_305
      REAL(w2f__8) OpenAD_Symbol_306
      REAL(w2f__8) OpenAD_Symbol_307
      REAL(w2f__8) OpenAD_Symbol_308
      REAL(w2f__8) OpenAD_Symbol_309
      REAL(w2f__8) OpenAD_Symbol_310
      REAL(w2f__8) OpenAD_Symbol_311
      REAL(w2f__8) OpenAD_Symbol_312
      REAL(w2f__8) OpenAD_Symbol_313
      REAL(w2f__8) OpenAD_Symbol_314
      REAL(w2f__8) OpenAD_Symbol_315
      REAL(w2f__8) OpenAD_Symbol_316
      REAL(w2f__8) OpenAD_Symbol_317
      REAL(w2f__8) OpenAD_Symbol_318
      REAL(w2f__8) OpenAD_Symbol_319
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_320
      REAL(w2f__8) OpenAD_Symbol_321
      REAL(w2f__8) OpenAD_Symbol_322
      REAL(w2f__8) OpenAD_Symbol_323
      REAL(w2f__8) OpenAD_Symbol_324
      REAL(w2f__8) OpenAD_Symbol_325
      REAL(w2f__8) OpenAD_Symbol_326
      REAL(w2f__8) OpenAD_Symbol_327
      REAL(w2f__8) OpenAD_Symbol_328
      REAL(w2f__8) OpenAD_Symbol_329
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_330
      REAL(w2f__8) OpenAD_Symbol_331
      REAL(w2f__8) OpenAD_Symbol_332
      REAL(w2f__8) OpenAD_Symbol_333
      REAL(w2f__8) OpenAD_Symbol_334
      REAL(w2f__8) OpenAD_Symbol_335
      REAL(w2f__8) OpenAD_Symbol_336
      REAL(w2f__8) OpenAD_Symbol_337
      REAL(w2f__8) OpenAD_Symbol_338
      REAL(w2f__8) OpenAD_Symbol_339
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_340
      REAL(w2f__8) OpenAD_Symbol_341
      REAL(w2f__8) OpenAD_Symbol_342
      REAL(w2f__8) OpenAD_Symbol_343
      REAL(w2f__8) OpenAD_Symbol_344
      REAL(w2f__8) OpenAD_Symbol_345
      REAL(w2f__8) OpenAD_Symbol_346
      REAL(w2f__8) OpenAD_Symbol_347
      REAL(w2f__8) OpenAD_Symbol_348
      REAL(w2f__8) OpenAD_Symbol_349
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_350
      REAL(w2f__8) OpenAD_Symbol_351
      REAL(w2f__8) OpenAD_Symbol_352
      REAL(w2f__8) OpenAD_Symbol_353
      REAL(w2f__8) OpenAD_Symbol_354
      REAL(w2f__8) OpenAD_Symbol_355
      REAL(w2f__8) OpenAD_Symbol_356
      REAL(w2f__8) OpenAD_Symbol_357
      REAL(w2f__8) OpenAD_Symbol_358
      REAL(w2f__8) OpenAD_Symbol_359
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_360
      REAL(w2f__8) OpenAD_Symbol_361
      REAL(w2f__8) OpenAD_Symbol_362
      REAL(w2f__8) OpenAD_Symbol_363
      REAL(w2f__8) OpenAD_Symbol_364
      REAL(w2f__8) OpenAD_Symbol_365
      REAL(w2f__8) OpenAD_Symbol_366
      REAL(w2f__8) OpenAD_Symbol_367
      REAL(w2f__8) OpenAD_Symbol_368
      REAL(w2f__8) OpenAD_Symbol_369
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_370
      REAL(w2f__8) OpenAD_Symbol_371
      REAL(w2f__8) OpenAD_Symbol_372
      REAL(w2f__8) OpenAD_Symbol_373
      REAL(w2f__8) OpenAD_Symbol_374
      REAL(w2f__8) OpenAD_Symbol_375
      REAL(w2f__8) OpenAD_Symbol_376
      REAL(w2f__8) OpenAD_Symbol_377
      REAL(w2f__8) OpenAD_Symbol_378
      REAL(w2f__8) OpenAD_Symbol_379
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_380
      REAL(w2f__8) OpenAD_Symbol_381
      REAL(w2f__8) OpenAD_Symbol_382
      REAL(w2f__8) OpenAD_Symbol_383
      REAL(w2f__8) OpenAD_Symbol_384
      REAL(w2f__8) OpenAD_Symbol_385
      REAL(w2f__8) OpenAD_Symbol_386
      REAL(w2f__8) OpenAD_Symbol_387
      REAL(w2f__8) OpenAD_Symbol_388
      REAL(w2f__8) OpenAD_Symbol_389
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_390
      REAL(w2f__8) OpenAD_Symbol_391
      REAL(w2f__8) OpenAD_Symbol_392
      REAL(w2f__8) OpenAD_Symbol_393
      REAL(w2f__8) OpenAD_Symbol_394
      REAL(w2f__8) OpenAD_Symbol_395
      REAL(w2f__8) OpenAD_Symbol_396
      REAL(w2f__8) OpenAD_Symbol_397
      REAL(w2f__8) OpenAD_Symbol_398
      REAL(w2f__8) OpenAD_Symbol_399
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_400
      REAL(w2f__8) OpenAD_Symbol_401
      REAL(w2f__8) OpenAD_Symbol_402
      REAL(w2f__8) OpenAD_Symbol_403
      REAL(w2f__8) OpenAD_Symbol_404
      REAL(w2f__8) OpenAD_Symbol_405
      REAL(w2f__8) OpenAD_Symbol_406
      REAL(w2f__8) OpenAD_Symbol_407
      REAL(w2f__8) OpenAD_Symbol_408
      REAL(w2f__8) OpenAD_Symbol_409
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_410
      REAL(w2f__8) OpenAD_Symbol_411
      REAL(w2f__8) OpenAD_Symbol_412
      REAL(w2f__8) OpenAD_Symbol_413
      REAL(w2f__8) OpenAD_Symbol_414
      REAL(w2f__8) OpenAD_Symbol_415
      REAL(w2f__8) OpenAD_Symbol_416
      REAL(w2f__8) OpenAD_Symbol_417
      REAL(w2f__8) OpenAD_Symbol_418
      REAL(w2f__8) OpenAD_Symbol_419
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_420
      REAL(w2f__8) OpenAD_Symbol_421
      TYPE (OpenADTy_active) OpenAD_Symbol_422
      REAL(w2f__8) OpenAD_Symbol_423
      REAL(w2f__8) OpenAD_Symbol_424
      REAL(w2f__8) OpenAD_Symbol_425
      REAL(w2f__8) OpenAD_Symbol_426
      REAL(w2f__8) OpenAD_Symbol_427
      REAL(w2f__8) OpenAD_Symbol_428
      REAL(w2f__8) OpenAD_Symbol_429
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_430
      REAL(w2f__8) OpenAD_Symbol_431
      REAL(w2f__8) OpenAD_Symbol_432
      REAL(w2f__8) OpenAD_Symbol_433
      REAL(w2f__8) OpenAD_Symbol_434
      REAL(w2f__8) OpenAD_Symbol_435
      REAL(w2f__8) OpenAD_Symbol_436
      REAL(w2f__8) OpenAD_Symbol_437
      REAL(w2f__8) OpenAD_Symbol_438
      REAL(w2f__8) OpenAD_Symbol_439
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_440
      REAL(w2f__8) OpenAD_Symbol_441
      REAL(w2f__8) OpenAD_Symbol_442
      REAL(w2f__8) OpenAD_Symbol_443
      REAL(w2f__8) OpenAD_Symbol_444
      REAL(w2f__8) OpenAD_Symbol_445
      REAL(w2f__8) OpenAD_Symbol_446
      REAL(w2f__8) OpenAD_Symbol_447
      REAL(w2f__8) OpenAD_Symbol_448
      REAL(w2f__8) OpenAD_Symbol_449
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_450
      TYPE (OpenADTy_active) OpenAD_Symbol_451
      REAL(w2f__8) OpenAD_Symbol_452
      REAL(w2f__8) OpenAD_Symbol_453
      TYPE (OpenADTy_active) OpenAD_Symbol_454
      REAL(w2f__8) OpenAD_Symbol_455
      REAL(w2f__8) OpenAD_Symbol_456
      REAL(w2f__8) OpenAD_Symbol_457
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
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
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_9
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) OBJ
      TYPE (OpenADTy_active) G_OBJ0
      TYPE (OpenADTy_active) G_OBJ1
      TYPE (OpenADTy_active) G_OBJ2
      TYPE (OpenADTy_active) G_OBJ3
      TYPE (OpenADTy_active) G_OBJ4
      TYPE (OpenADTy_active) G_OBJ5
      TYPE (OpenADTy_active) X0
      TYPE (OpenADTy_active) X1
      TYPE (OpenADTy_active) X2
      TYPE (OpenADTy_active) X3
      TYPE (OpenADTy_active) X4
      TYPE (OpenADTy_active) X5
      TYPE (OpenADTy_active) H_OBJ0
      TYPE (OpenADTy_active) H_OBJ1
      TYPE (OpenADTy_active) H_OBJ2
      TYPE (OpenADTy_active) H_OBJ3
      TYPE (OpenADTy_active) H_OBJ4
      TYPE (OpenADTy_active) H_OBJ5
      TYPE (OpenADTy_active) H_OBJ6
      TYPE (OpenADTy_active) H_OBJ7
      TYPE (OpenADTy_active) H_OBJ8
      TYPE (OpenADTy_active) H_OBJ9
      TYPE (OpenADTy_active) H_OBJ10
      TYPE (OpenADTy_active) H_OBJ11
      TYPE (OpenADTy_active) H_OBJ12
      TYPE (OpenADTy_active) H_OBJ13
      TYPE (OpenADTy_active) H_OBJ14
      TYPE (OpenADTy_active) H_OBJ15
      TYPE (OpenADTy_active) H_OBJ16
      TYPE (OpenADTy_active) H_OBJ17
      TYPE (OpenADTy_active) H_OBJ18
      TYPE (OpenADTy_active) H_OBJ19
      TYPE (OpenADTy_active) H_OBJ20
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) A
      REAL(w2f__8) AB
      TYPE (OpenADTy_active) ADJ_M0
      TYPE (OpenADTy_active) ADJ_M1
      TYPE (OpenADTy_active) ADJ_M2
      TYPE (OpenADTy_active) ADJ_M3
      REAL(w2f__8) B
      REAL(w2f__8) BM1
      TYPE (OpenADTy_active) D00
      TYPE (OpenADTy_active) D01
      TYPE (OpenADTy_active) D03
      TYPE (OpenADTy_active) D11
      TYPE (OpenADTy_active) D12
      TYPE (OpenADTy_active) F
      REAL(w2f__8) FOUR3RD
      TYPE (OpenADTy_active) G
      TYPE (OpenADTy_active) GG
      TYPE (OpenADTy_active) LOC1
      TYPE (OpenADTy_active) LOC2
      TYPE (OpenADTy_active) M00
      TYPE (OpenADTy_active) M01
      TYPE (OpenADTy_active) M02
      TYPE (OpenADTy_active) M03
      TYPE (OpenADTy_active) M11
      TYPE (OpenADTy_active) M12
      TYPE (OpenADTy_active) M13
      TYPE (OpenADTy_active) M22
      TYPE (OpenADTy_active) M23
      TYPE (OpenADTy_active) M33
      TYPE (OpenADTy_active) MATR0
      TYPE (OpenADTy_active) MATR1
      TYPE (OpenADTy_active) MATR2
      TYPE (OpenADTy_active) MATR3
      REAL(w2f__8) NORM
      TYPE (OpenADTy_active) R00
      TYPE (OpenADTy_active) R02
      TYPE (OpenADTy_active) R03
      TYPE (OpenADTy_active) R11
      TYPE (OpenADTy_active) R12
      TYPE (OpenADTy_active) R13
      REAL(w2f__8) R22
      REAL(w2f__8) R33
      REAL(w2f__8) SQRT3
      REAL(w2f__8) THIRD
      REAL(w2f__8) TSQRT3
      REAL(w2f__8) TWO3RD
      REAL(w2f__8) TWOSQRT3
      REAL(w2f__8) OpenAD_Symbol_458
      REAL(w2f__8) OpenAD_Symbol_459
      REAL(w2f__8) OpenAD_Symbol_460
      REAL(w2f__8) OpenAD_Symbol_461
      REAL(w2f__8) OpenAD_Symbol_462
      REAL(w2f__8) OpenAD_Symbol_463
      REAL(w2f__8) OpenAD_Symbol_464
      REAL(w2f__8) OpenAD_Symbol_465
      REAL(w2f__8) OpenAD_Symbol_466
      REAL(w2f__8) OpenAD_Symbol_467
      REAL(w2f__8) OpenAD_Symbol_468
      REAL(w2f__8) OpenAD_Symbol_469
      REAL(w2f__8) OpenAD_Symbol_470
      REAL(w2f__8) OpenAD_Symbol_471
      REAL(w2f__8) OpenAD_Symbol_472
      REAL(w2f__8) OpenAD_Symbol_473
      REAL(w2f__8) OpenAD_Symbol_474
      REAL(w2f__8) OpenAD_Symbol_475
      REAL(w2f__8) OpenAD_Symbol_476
      REAL(w2f__8) OpenAD_Symbol_477
      REAL(w2f__8) OpenAD_Symbol_478
      REAL(w2f__8) OpenAD_Symbol_479
      REAL(w2f__8) OpenAD_Symbol_480
      REAL(w2f__8) OpenAD_Symbol_481
      REAL(w2f__8) OpenAD_Symbol_482
      REAL(w2f__8) OpenAD_Symbol_483
      REAL(w2f__8) OpenAD_Symbol_484
      REAL(w2f__8) OpenAD_Symbol_485
      REAL(w2f__8) OpenAD_Symbol_486
      REAL(w2f__8) OpenAD_Symbol_487
      REAL(w2f__8) OpenAD_Symbol_488
      REAL(w2f__8) OpenAD_Symbol_489
      REAL(w2f__8) OpenAD_Symbol_490
      REAL(w2f__8) OpenAD_Symbol_491
      REAL(w2f__8) OpenAD_Symbol_492
      REAL(w2f__8) OpenAD_Symbol_493
      REAL(w2f__8) OpenAD_Symbol_494
      REAL(w2f__8) OpenAD_Symbol_495
      REAL(w2f__8) OpenAD_Symbol_496
      REAL(w2f__8) OpenAD_Symbol_497
      REAL(w2f__8) OpenAD_Symbol_498
      REAL(w2f__8) OpenAD_Symbol_499
      REAL(w2f__8) OpenAD_Symbol_500
      REAL(w2f__8) OpenAD_Symbol_501
      REAL(w2f__8) OpenAD_Symbol_502
      REAL(w2f__8) OpenAD_Symbol_503
      REAL(w2f__8) OpenAD_Symbol_504
      REAL(w2f__8) OpenAD_Symbol_505
      REAL(w2f__8) OpenAD_Symbol_506
      REAL(w2f__8) OpenAD_Symbol_507
      REAL(w2f__8) OpenAD_Symbol_508
      REAL(w2f__8) OpenAD_Symbol_509
      REAL(w2f__8) OpenAD_Symbol_510
      REAL(w2f__8) OpenAD_Symbol_511
      REAL(w2f__8) OpenAD_Symbol_512
      REAL(w2f__8) OpenAD_Symbol_513
      REAL(w2f__8) OpenAD_Symbol_514
      REAL(w2f__8) OpenAD_Symbol_515
      REAL(w2f__8) OpenAD_Symbol_516
      REAL(w2f__8) OpenAD_Symbol_517
      REAL(w2f__8) OpenAD_Symbol_518
      REAL(w2f__8) OpenAD_Symbol_519
      REAL(w2f__8) OpenAD_Symbol_520
      REAL(w2f__8) OpenAD_Symbol_521
      REAL(w2f__8) OpenAD_Symbol_522
      REAL(w2f__8) OpenAD_Symbol_523
      REAL(w2f__8) OpenAD_Symbol_524
      REAL(w2f__8) OpenAD_Symbol_525
      REAL(w2f__8) OpenAD_Symbol_526
      REAL(w2f__8) OpenAD_Symbol_527
      REAL(w2f__8) OpenAD_Symbol_528
      REAL(w2f__8) OpenAD_Symbol_529
      REAL(w2f__8) OpenAD_Symbol_530
      REAL(w2f__8) OpenAD_Symbol_531
      REAL(w2f__8) OpenAD_Symbol_532
      REAL(w2f__8) OpenAD_Symbol_533
      REAL(w2f__8) OpenAD_Symbol_534
      REAL(w2f__8) OpenAD_Symbol_535
      REAL(w2f__8) OpenAD_Symbol_536
      REAL(w2f__8) OpenAD_Symbol_537
      REAL(w2f__8) OpenAD_Symbol_538
      REAL(w2f__8) OpenAD_Symbol_539
      REAL(w2f__8) OpenAD_Symbol_540
      REAL(w2f__8) OpenAD_Symbol_541
      REAL(w2f__8) OpenAD_Symbol_542
      REAL(w2f__8) OpenAD_Symbol_543
      REAL(w2f__8) OpenAD_Symbol_544
      REAL(w2f__8) OpenAD_Symbol_545
      REAL(w2f__8) OpenAD_Symbol_546
      REAL(w2f__8) OpenAD_Symbol_547
      REAL(w2f__8) OpenAD_Symbol_548
      REAL(w2f__8) OpenAD_Symbol_549
      REAL(w2f__8) OpenAD_Symbol_550
      REAL(w2f__8) OpenAD_Symbol_551
      REAL(w2f__8) OpenAD_Symbol_552
      REAL(w2f__8) OpenAD_Symbol_553
      REAL(w2f__8) OpenAD_Symbol_554
      REAL(w2f__8) OpenAD_Symbol_555
      REAL(w2f__8) OpenAD_Symbol_556
      REAL(w2f__8) OpenAD_Symbol_557
      REAL(w2f__8) OpenAD_Symbol_558
      REAL(w2f__8) OpenAD_Symbol_559
      REAL(w2f__8) OpenAD_Symbol_560
      REAL(w2f__8) OpenAD_Symbol_561
      REAL(w2f__8) OpenAD_Symbol_562
      REAL(w2f__8) OpenAD_Symbol_563
      REAL(w2f__8) OpenAD_Symbol_564
      REAL(w2f__8) OpenAD_Symbol_565
      REAL(w2f__8) OpenAD_Symbol_566
      REAL(w2f__8) OpenAD_Symbol_567
      REAL(w2f__8) OpenAD_Symbol_568
      REAL(w2f__8) OpenAD_Symbol_569
      REAL(w2f__8) OpenAD_Symbol_570
      REAL(w2f__8) OpenAD_Symbol_571
      REAL(w2f__8) OpenAD_Symbol_572
      REAL(w2f__8) OpenAD_Symbol_573
      REAL(w2f__8) OpenAD_Symbol_574
      REAL(w2f__8) OpenAD_Symbol_575
      REAL(w2f__8) OpenAD_Symbol_576
      REAL(w2f__8) OpenAD_Symbol_577
      REAL(w2f__8) OpenAD_Symbol_578
      REAL(w2f__8) OpenAD_Symbol_579
      REAL(w2f__8) OpenAD_Symbol_580
      REAL(w2f__8) OpenAD_Symbol_581
      REAL(w2f__8) OpenAD_Symbol_582
      REAL(w2f__8) OpenAD_Symbol_583
      REAL(w2f__8) OpenAD_Symbol_584
      REAL(w2f__8) OpenAD_Symbol_585
      REAL(w2f__8) OpenAD_Symbol_586
      REAL(w2f__8) OpenAD_Symbol_587
      REAL(w2f__8) OpenAD_Symbol_588
      REAL(w2f__8) OpenAD_Symbol_589
      REAL(w2f__8) OpenAD_Symbol_590
      REAL(w2f__8) OpenAD_Symbol_591
      REAL(w2f__8) OpenAD_Symbol_592
      REAL(w2f__8) OpenAD_Symbol_593
      REAL(w2f__8) OpenAD_Symbol_594
      REAL(w2f__8) OpenAD_Symbol_595
      REAL(w2f__8) OpenAD_Symbol_596
      REAL(w2f__8) OpenAD_Symbol_597
      REAL(w2f__8) OpenAD_Symbol_598
      REAL(w2f__8) OpenAD_Symbol_599
      REAL(w2f__8) OpenAD_Symbol_600
      REAL(w2f__8) OpenAD_Symbol_601
      REAL(w2f__8) OpenAD_Symbol_602
      REAL(w2f__8) OpenAD_Symbol_603
      REAL(w2f__8) OpenAD_Symbol_604
      REAL(w2f__8) OpenAD_Symbol_605
      REAL(w2f__8) OpenAD_Symbol_606
      REAL(w2f__8) OpenAD_Symbol_607
      REAL(w2f__8) OpenAD_Symbol_608
      REAL(w2f__8) OpenAD_Symbol_609
      REAL(w2f__8) OpenAD_Symbol_610
      REAL(w2f__8) OpenAD_Symbol_611
      REAL(w2f__8) OpenAD_Symbol_612
      REAL(w2f__8) OpenAD_Symbol_613
      REAL(w2f__8) OpenAD_Symbol_614
      REAL(w2f__8) OpenAD_Symbol_615
      REAL(w2f__8) OpenAD_Symbol_616
      REAL(w2f__8) OpenAD_Symbol_617
      REAL(w2f__8) OpenAD_Symbol_618
      REAL(w2f__8) OpenAD_Symbol_619
      REAL(w2f__8) OpenAD_Symbol_620
      REAL(w2f__8) OpenAD_Symbol_621
      REAL(w2f__8) OpenAD_Symbol_622
      REAL(w2f__8) OpenAD_Symbol_623
      REAL(w2f__8) OpenAD_Symbol_624
      REAL(w2f__8) OpenAD_Symbol_625
      REAL(w2f__8) OpenAD_Symbol_626
      REAL(w2f__8) OpenAD_Symbol_627
      REAL(w2f__8) OpenAD_Symbol_628
      REAL(w2f__8) OpenAD_Symbol_629
      REAL(w2f__8) OpenAD_Symbol_630
      REAL(w2f__8) OpenAD_Symbol_631
      REAL(w2f__8) OpenAD_Symbol_632
      REAL(w2f__8) OpenAD_Symbol_633
      REAL(w2f__8) OpenAD_Symbol_634
      REAL(w2f__8) OpenAD_Symbol_635
      REAL(w2f__8) OpenAD_Symbol_636
      REAL(w2f__8) OpenAD_Symbol_637
      REAL(w2f__8) OpenAD_Symbol_638
      REAL(w2f__8) OpenAD_Symbol_639
      REAL(w2f__8) OpenAD_Symbol_640
      REAL(w2f__8) OpenAD_Symbol_641
      REAL(w2f__8) OpenAD_Symbol_642
      REAL(w2f__8) OpenAD_Symbol_643
      REAL(w2f__8) OpenAD_Symbol_644
      REAL(w2f__8) OpenAD_Symbol_645
      REAL(w2f__8) OpenAD_Symbol_646
      REAL(w2f__8) OpenAD_Symbol_647
      REAL(w2f__8) OpenAD_Symbol_648
      REAL(w2f__8) OpenAD_Symbol_649
      REAL(w2f__8) OpenAD_Symbol_650
      REAL(w2f__8) OpenAD_Symbol_651
      REAL(w2f__8) OpenAD_Symbol_652
      REAL(w2f__8) OpenAD_Symbol_653
      REAL(w2f__8) OpenAD_Symbol_654
      REAL(w2f__8) OpenAD_Symbol_655
      REAL(w2f__8) OpenAD_Symbol_656
      REAL(w2f__8) OpenAD_Symbol_657
      REAL(w2f__8) OpenAD_Symbol_658
      REAL(w2f__8) OpenAD_Symbol_659
      REAL(w2f__8) OpenAD_Symbol_660
      REAL(w2f__8) OpenAD_Symbol_661
      REAL(w2f__8) OpenAD_Symbol_662
      REAL(w2f__8) OpenAD_Symbol_663
      REAL(w2f__8) OpenAD_Symbol_664
      REAL(w2f__8) OpenAD_Symbol_665
      REAL(w2f__8) OpenAD_Symbol_666
      REAL(w2f__8) OpenAD_Symbol_667
      REAL(w2f__8) OpenAD_Symbol_668
      REAL(w2f__8) OpenAD_Symbol_669
      REAL(w2f__8) OpenAD_Symbol_670
      REAL(w2f__8) OpenAD_Symbol_671
      REAL(w2f__8) OpenAD_Symbol_672
      REAL(w2f__8) OpenAD_Symbol_673
      REAL(w2f__8) OpenAD_Symbol_674
      REAL(w2f__8) OpenAD_Symbol_675
      REAL(w2f__8) OpenAD_Symbol_676
      REAL(w2f__8) OpenAD_Symbol_677
      REAL(w2f__8) OpenAD_Symbol_678
      REAL(w2f__8) OpenAD_Symbol_679
      REAL(w2f__8) OpenAD_Symbol_680
      REAL(w2f__8) OpenAD_Symbol_681
      REAL(w2f__8) OpenAD_Symbol_682
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X0)
C$OPENAD INDEPENDENT(X1)
C$OPENAD INDEPENDENT(X2)
C$OPENAD INDEPENDENT(X3)
C$OPENAD INDEPENDENT(X4)
C$OPENAD INDEPENDENT(X5)
C$OPENAD DEPENDENT(OBJ)
C$OPENAD DEPENDENT(G_OBJ0)
C$OPENAD DEPENDENT(G_OBJ1)
C$OPENAD DEPENDENT(G_OBJ2)
C$OPENAD DEPENDENT(G_OBJ3)
C$OPENAD DEPENDENT(G_OBJ4)
C$OPENAD DEPENDENT(G_OBJ5)
C$OPENAD DEPENDENT(H_OBJ0)
C$OPENAD DEPENDENT(H_OBJ1)
C$OPENAD DEPENDENT(H_OBJ2)
C$OPENAD DEPENDENT(H_OBJ3)
C$OPENAD DEPENDENT(H_OBJ4)
C$OPENAD DEPENDENT(H_OBJ5)
C$OPENAD DEPENDENT(H_OBJ6)
C$OPENAD DEPENDENT(H_OBJ7)
C$OPENAD DEPENDENT(H_OBJ8)
C$OPENAD DEPENDENT(H_OBJ9)
C$OPENAD DEPENDENT(H_OBJ10)
C$OPENAD DEPENDENT(H_OBJ11)
C$OPENAD DEPENDENT(H_OBJ12)
C$OPENAD DEPENDENT(H_OBJ13)
C$OPENAD DEPENDENT(H_OBJ14)
C$OPENAD DEPENDENT(H_OBJ15)
C$OPENAD DEPENDENT(H_OBJ16)
C$OPENAD DEPENDENT(H_OBJ17)
C$OPENAD DEPENDENT(H_OBJ18)
C$OPENAD DEPENDENT(H_OBJ19)
C$OPENAD DEPENDENT(H_OBJ20)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      A = 5.0D-01
      B = (-1.0D00)
      AB = (A * B)
      SQRT3 = 5.77350258827209472656D-01
      TSQRT3 = 1.15470051765441894531D00
      TWOSQRT3 = 1.15470051765441894531D00
      THIRD = 3.33333343267440795898D-01
      TWO3RD = 6.66666686534881591797D-01
      FOUR3RD = 1.33333337306976318359D00
      BM1 = (-2.0D00)
      __value__(MATR0) = (__value__(X1) - __value__(X0))
      __value__(MATR1) = (SQRT3 *(__value__(X2) * 2.0D00 - __value__(X1
     > ) - __value__(X0)))
      __value__(MATR2) = (__value__(X4) - __value__(X3))
      __value__(MATR3) = (SQRT3 *(__value__(X5) * 2.0D00 - __value__(X4
     > ) - __value__(X3)))
      __value__(M03) = (__value__(MATR0) * __value__(MATR3))
      __value__(M12) = (__value__(MATR1) * __value__(MATR2))
      __value__(G) = (__value__(M03) - __value__(M12))
      __value__(D00) = (__value__(M03) * 2.0D00)
      __value__(D11) = (__value__(M12) * 2.0D00)
      __value__(M00) = (__value__(MATR0) * __value__(MATR0))
      __value__(M11) = (__value__(MATR1) * __value__(MATR1))
      __value__(M22) = (__value__(MATR2) * __value__(MATR2))
      __value__(M33) = (__value__(MATR3) * __value__(MATR3))
      __value__(D12) = (__value__(M00) * __value__(M33))
      __value__(D03) = (__value__(M11) * __value__(M22))
      __value__(F) = (__value__(D03) + __value__(D12))
      NORM = __value__(F)
      __value__(LOC1) = (A *(1.0D00 / __value__(G)))
      __value__(OBJ) = (__value__(F) * __value__(LOC1))
      __value__(LOC2) = (AB *(1.0D00 /(__value__(G) * __value__(G))))
      __value__(GG) = (AB * B *(1.0D00 /(__value__(G) * __value__(G) *
     >  __value__(G))))
      __value__(G) = (__value__(F) * __value__(LOC2))
      __value__(F) = (__value__(LOC1) * 2.0D00)
      __value__(ADJ_M0) = (__value__(F) * __value__(MATR0) + __value__(
     > G) * __value__(MATR3))
      __value__(ADJ_M1) = (__value__(F) * __value__(MATR1) - __value__(
     > G) * __value__(MATR2))
      __value__(ADJ_M2) = (__value__(F) * __value__(MATR2) - __value__(
     > G) * __value__(MATR1))
      __value__(ADJ_M3) = (__value__(F) * __value__(MATR3) + __value__(
     > G) * __value__(MATR0))
      __value__(LOC1) = (__value__(ADJ_M1) * SQRT3)
      __value__(G_OBJ0) = (-(__value__(ADJ_M0) + __value__(LOC1)))
      __value__(G_OBJ1) = (__value__(ADJ_M0) - __value__(LOC1))
      __value__(G_OBJ2) = (__value__(LOC1) * 2.0D00)
      __value__(LOC1) = (__value__(ADJ_M3) * SQRT3)
      __value__(G_OBJ3) = (-(__value__(ADJ_M2) + __value__(LOC1)))
      __value__(G_OBJ4) = (__value__(ADJ_M2) - __value__(LOC1))
      __value__(G_OBJ5) = (__value__(LOC1) * 2.0D00)
      __value__(LOC2) = (__value__(LOC2) * 2.0D00)
      __value__(R00) = (__value__(D00) * __value__(LOC2) + __value__(GG
     > ) * __value__(M33))
      __value__(R11) = (__value__(D11) * __value__(LOC2) + __value__(GG
     > ) * __value__(M22))
      R22 = (__value__(D11) * __value__(LOC2) + __value__(GG) *
     >  __value__(M11))
      R33 = (__value__(D00) * __value__(LOC2) + __value__(GG) *
     >  __value__(M00))
      __value__(M01) = (__value__(MATR0) * __value__(MATR1))
      __value__(M02) = (__value__(MATR0) * __value__(MATR2))
      __value__(M12) = (__value__(MATR1) * __value__(MATR2))
      __value__(M13) = (__value__(MATR1) * __value__(MATR3))
      __value__(M23) = (__value__(MATR2) * __value__(MATR3))
      __value__(D01) = (__value__(LOC2) *(__value__(M02) + __value__(
     > M13)))
      __value__(LOC1) = (__value__(R11) * THIRD)
      __value__(F) = (TWOSQRT3 *(__value__(D01) + __value__(GG) *
     >  __value__(M23)))
      __value__(G) = (__value__(LOC1) + __value__(R00))
      __value__(H_OBJ1) = (__value__(LOC1) - __value__(R00))
      __value__(H_OBJ0) = (__value__(F) + __value__(G))
      __value__(H_OBJ3) = (__value__(G) - __value__(F))
      __value__(LOC1) = (-(__value__(R11) * TWO3RD))
      __value__(H_OBJ2) = (__value__(LOC1) - __value__(F))
      __value__(H_OBJ4) = (__value__(F) + __value__(LOC1))
      __value__(H_OBJ5) = (FOUR3RD * __value__(R11))
      __value__(LOC1) = (__value__(R00) * THIRD)
      __value__(F) = (TWOSQRT3 *(__value__(D01) + __value__(GG) *
     >  __value__(M01)))
      __value__(G) = (__value__(LOC1) + __value__(R11))
      __value__(H_OBJ16) = (__value__(LOC1) - __value__(R11))
      __value__(H_OBJ15) = (__value__(F) + __value__(G))
      __value__(H_OBJ18) = (__value__(G) - __value__(F))
      __value__(LOC1) = (-(__value__(R00) * TWO3RD))
      __value__(H_OBJ17) = (__value__(LOC1) - __value__(F))
      __value__(H_OBJ19) = (__value__(F) + __value__(LOC1))
      __value__(H_OBJ20) = (FOUR3RD * __value__(R00))
      __value__(LOC1) = (__value__(LOC2) *(__value__(M01) + __value__(
     > M23)))
      __value__(R13) = (__value__(LOC1) + __value__(GG) * __value__(M02
     > ))
      __value__(R02) = (__value__(LOC1) + __value__(GG) * __value__(M13
     > ))
      __value__(R03) = (__value__(D03) * __value__(LOC2) + __value__(GG
     > ) * __value__(M03))
      __value__(R12) = (__value__(D12) * __value__(LOC2) + __value__(GG
     > ) * __value__(M12))
      __value__(G) = (-(__value__(R13) * TWO3RD))
      __value__(F) = (__value__(R03) * TWOSQRT3)
      __value__(H_OBJ8) = (__value__(G) - __value__(F))
      __value__(H_OBJ11) = (__value__(F) + __value__(G))
      __value__(F) = (__value__(R12) * TWOSQRT3)
      __value__(H_OBJ12) = (__value__(G) - __value__(F))
      __value__(H_OBJ13) = (__value__(F) + __value__(G))
      __value__(H_OBJ14) = (__value__(R13) * 1.2D+01)
      __value__(G) = (FOUR3RD * __value__(R02))
      __value__(F) = (SQRT3 *(__value__(R03) + __value__(R12)))
      __value__(H_OBJ10) = (__value__(G) - __value__(F))
      __value__(H_OBJ6) = (__value__(F) + __value__(G))
      __value__(G) = (__value__(R02) * TWO3RD)
      __value__(F) = (SQRT3 *(__value__(R03) - __value__(R12)))
      __value__(H_OBJ9) = (__value__(G) - __value__(F))
      __value__(H_OBJ7) = (__value__(F) + __value__(G))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      A = 5.0D-01
      B = (-1.0D00)
      AB = (A * B)
      SQRT3 = 5.77350258827209472656D-01
      TSQRT3 = 1.15470051765441894531D00
      TWOSQRT3 = 1.15470051765441894531D00
      THIRD = 3.33333343267440795898D-01
      TWO3RD = 6.66666686534881591797D-01
      FOUR3RD = 1.33333337306976318359D00
      BM1 = (-2.0D00)
      __value__(MATR0) = (__value__(X1) - __value__(X0))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (__value__(X2) * 2.0D00 - __value__(X1) -
     >  __value__(X0))
      __value__(MATR1) = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      __value__(MATR2) = (__value__(X4) - __value__(X3))
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_13 = (__value__(X5) * 2.0D00 - __value__(X4) -
     >  __value__(X3))
      __value__(MATR3) = (SQRT3 * OpenAD_Symbol_13)
      OpenAD_Symbol_20 = 2.0D00
      OpenAD_Symbol_18 = 1_w2f__i8
      OpenAD_Symbol_19 = (-1_w2f__i8)
      OpenAD_Symbol_16 = 1_w2f__i8
      OpenAD_Symbol_17 = (-1_w2f__i8)
      OpenAD_Symbol_15 = SQRT3
      __value__(M03) = (__value__(MATR0) * __value__(MATR3))
      OpenAD_Symbol_22 = __value__(MATR3)
      OpenAD_Symbol_23 = __value__(MATR0)
      __value__(M12) = (__value__(MATR1) * __value__(MATR2))
      OpenAD_Symbol_24 = __value__(MATR2)
      OpenAD_Symbol_25 = __value__(MATR1)
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_26 = 1_w2f__i8
      OpenAD_Symbol_27 = (-1_w2f__i8)
      __value__(D00) = (__value__(M03) * 2.0D00)
      OpenAD_Symbol_28 = 2.0D00
      __value__(D11) = (__value__(M12) * 2.0D00)
      OpenAD_Symbol_30 = 2.0D00
      __value__(M00) = (__value__(MATR0) * __value__(MATR0))
      OpenAD_Symbol_32 = __value__(MATR0)
      OpenAD_Symbol_33 = __value__(MATR0)
      __value__(M11) = (__value__(MATR1) * __value__(MATR1))
      OpenAD_Symbol_34 = __value__(MATR1)
      OpenAD_Symbol_35 = __value__(MATR1)
      __value__(M22) = (__value__(MATR2) * __value__(MATR2))
      OpenAD_Symbol_36 = __value__(MATR2)
      OpenAD_Symbol_37 = __value__(MATR2)
      __value__(M33) = (__value__(MATR3) * __value__(MATR3))
      OpenAD_Symbol_38 = __value__(MATR3)
      OpenAD_Symbol_39 = __value__(MATR3)
      __value__(D12) = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_40 = __value__(M33)
      OpenAD_Symbol_41 = __value__(M00)
      __value__(D03) = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_42 = __value__(M22)
      OpenAD_Symbol_43 = __value__(M11)
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_44 = 1_w2f__i8
      OpenAD_Symbol_45 = 1_w2f__i8
      NORM = __value__(F)
      OpenAD_Symbol_46 = (1.0D00 / __value__(G))
      __value__(LOC1) = (A * OpenAD_Symbol_46)
      OpenAD_Symbol_50 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_48 = A
      __value__(OBJ) = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_51 = __value__(LOC1)
      OpenAD_Symbol_52 = __value__(F)
      OpenAD_Symbol_56 = (__value__(G) * __value__(G))
      OpenAD_Symbol_53 = (1.0D00 / OpenAD_Symbol_56)
      __value__(LOC2) = (AB * OpenAD_Symbol_53)
      OpenAD_Symbol_59 = __value__(G)
      OpenAD_Symbol_60 = __value__(G)
      OpenAD_Symbol_58 = (-(1.0D00 /(OpenAD_Symbol_56 *
     >  OpenAD_Symbol_56)))
      OpenAD_Symbol_55 = AB
      OpenAD_Symbol_61 = (AB * B)
      OpenAD_Symbol_68 = (__value__(G) * __value__(G))
      OpenAD_Symbol_65 = (__value__(G) * OpenAD_Symbol_68)
      OpenAD_Symbol_62 = (1.0D00 / OpenAD_Symbol_65)
      __value__(GG) = (OpenAD_Symbol_61 * OpenAD_Symbol_62)
      OpenAD_Symbol_69 = OpenAD_Symbol_68
      OpenAD_Symbol_71 = __value__(G)
      OpenAD_Symbol_72 = __value__(G)
      OpenAD_Symbol_70 = __value__(G)
      OpenAD_Symbol_67 = (-(1.0D00 /(OpenAD_Symbol_65 *
     >  OpenAD_Symbol_65)))
      OpenAD_Symbol_64 = OpenAD_Symbol_61
      OpenAD_Symbol_265 = (OpenAD_Symbol_50 * OpenAD_Symbol_48)
      OpenAD_Symbol_266 = (INT((-1_w2f__i8)) * OpenAD_Symbol_25)
      OpenAD_Symbol_267 = (INT((-1_w2f__i8)) * OpenAD_Symbol_22)
      OpenAD_Symbol_268 = (OpenAD_Symbol_265 * OpenAD_Symbol_52)
      OpenAD_Symbol_269 = (OpenAD_Symbol_24 * INT((-1_w2f__i8)))
      OpenAD_Symbol_270 = (OpenAD_Symbol_24 * 2.0D00)
      OpenAD_Symbol_271 = (OpenAD_Symbol_25 * INT((-1_w2f__i8)))
      OpenAD_Symbol_272 = (OpenAD_Symbol_266 * INT((-1_w2f__i8)))
      OpenAD_Symbol_273 = (OpenAD_Symbol_23 * 2.0D00)
      OpenAD_Symbol_274 = (OpenAD_Symbol_22 * 2.0D00)
      OpenAD_Symbol_275 = (OpenAD_Symbol_267 * 2.0D00)
      OpenAD_Symbol_276 = (OpenAD_Symbol_269 * OpenAD_Symbol_265)
      OpenAD_Symbol_277 = (OpenAD_Symbol_271 * OpenAD_Symbol_265)
      OpenAD_Symbol_278 = (OpenAD_Symbol_272 * OpenAD_Symbol_265)
      OpenAD_Symbol_279 = (OpenAD_Symbol_23 * OpenAD_Symbol_265)
      OpenAD_Symbol_280 = (OpenAD_Symbol_22 * OpenAD_Symbol_265)
      OpenAD_Symbol_281 = (OpenAD_Symbol_267 * OpenAD_Symbol_265)
      OpenAD_Symbol_282 = (OpenAD_Symbol_25 * 2.0D00)
      OpenAD_Symbol_283 = (OpenAD_Symbol_266 * 2.0D00)
      OpenAD_Symbol_284 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_285 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_286 = (2.0D00 * OpenAD_Symbol_4)
      OpenAD_Symbol_287 = (OpenAD_Symbol_284 * OpenAD_Symbol_270)
      OpenAD_Symbol_288 = (OpenAD_Symbol_285 * OpenAD_Symbol_270)
      OpenAD_Symbol_289 = (OpenAD_Symbol_286 * OpenAD_Symbol_270)
      OpenAD_Symbol_290 = (OpenAD_Symbol_284 * OpenAD_Symbol_276)
      OpenAD_Symbol_291 = (OpenAD_Symbol_285 * OpenAD_Symbol_276)
      OpenAD_Symbol_292 = (OpenAD_Symbol_286 * OpenAD_Symbol_276)
      OpenAD_Symbol_293 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_294 = (OpenAD_Symbol_15 * OpenAD_Symbol_23)
      OpenAD_Symbol_295 = (OpenAD_Symbol_293 * OpenAD_Symbol_23)
      OpenAD_Symbol_296 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_297 = (2.0D00 * OpenAD_Symbol_15)
      OpenAD_Symbol_298 = (OpenAD_Symbol_293 * OpenAD_Symbol_273)
      OpenAD_Symbol_299 = (OpenAD_Symbol_296 * OpenAD_Symbol_273)
      OpenAD_Symbol_300 = (OpenAD_Symbol_297 * OpenAD_Symbol_273)
      OpenAD_Symbol_301 = (INT((-1_w2f__i8)) * OpenAD_Symbol_294)
      OpenAD_Symbol_302 = (OpenAD_Symbol_293 * OpenAD_Symbol_279)
      OpenAD_Symbol_303 = (OpenAD_Symbol_296 * OpenAD_Symbol_279)
      OpenAD_Symbol_304 = (OpenAD_Symbol_297 * OpenAD_Symbol_279)
      OpenAD_Symbol_305 = (2.0D00 * OpenAD_Symbol_294)
      OpenAD_Symbol_306 = (OpenAD_Symbol_32 + OpenAD_Symbol_33)
      OpenAD_Symbol_307 = (OpenAD_Symbol_34 + OpenAD_Symbol_35)
      OpenAD_Symbol_308 = (OpenAD_Symbol_36 + OpenAD_Symbol_37)
      OpenAD_Symbol_309 = (OpenAD_Symbol_38 + OpenAD_Symbol_39)
      OpenAD_Symbol_310 = ((OpenAD_Symbol_69 +(OpenAD_Symbol_71 +
     >  OpenAD_Symbol_72) * OpenAD_Symbol_70) * OpenAD_Symbol_67 *
     >  OpenAD_Symbol_64)
      OpenAD_Symbol_311 = ((OpenAD_Symbol_59 + OpenAD_Symbol_60) *
     >  OpenAD_Symbol_58 * OpenAD_Symbol_55)
      OpenAD_Symbol_312 = (INT((-1_w2f__i8)) * OpenAD_Symbol_308)
      OpenAD_Symbol_313 = (OpenAD_Symbol_308 * OpenAD_Symbol_43)
      OpenAD_Symbol_314 = (OpenAD_Symbol_312 * OpenAD_Symbol_43)
      OpenAD_Symbol_315 = (INT((-1_w2f__i8)) * OpenAD_Symbol_306)
      OpenAD_Symbol_316 = (OpenAD_Symbol_306 * OpenAD_Symbol_40)
      OpenAD_Symbol_317 = (OpenAD_Symbol_315 * OpenAD_Symbol_40)
      OpenAD_Symbol_318 = (OpenAD_Symbol_309 * OpenAD_Symbol_41)
      OpenAD_Symbol_319 = (OpenAD_Symbol_307 * OpenAD_Symbol_42)
      OpenAD_Symbol_320 = (OpenAD_Symbol_269 * OpenAD_Symbol_310)
      OpenAD_Symbol_321 = (OpenAD_Symbol_271 * OpenAD_Symbol_310)
      OpenAD_Symbol_322 = (OpenAD_Symbol_272 * OpenAD_Symbol_310)
      OpenAD_Symbol_323 = (OpenAD_Symbol_23 * OpenAD_Symbol_310)
      OpenAD_Symbol_324 = (OpenAD_Symbol_22 * OpenAD_Symbol_310)
      OpenAD_Symbol_325 = (OpenAD_Symbol_267 * OpenAD_Symbol_310)
      OpenAD_Symbol_326 = (OpenAD_Symbol_269 * OpenAD_Symbol_311)
      OpenAD_Symbol_327 = (OpenAD_Symbol_271 * OpenAD_Symbol_311)
      OpenAD_Symbol_328 = (OpenAD_Symbol_272 * OpenAD_Symbol_311)
      OpenAD_Symbol_329 = (OpenAD_Symbol_23 * OpenAD_Symbol_311)
      OpenAD_Symbol_330 = (OpenAD_Symbol_22 * OpenAD_Symbol_311)
      OpenAD_Symbol_331 = (OpenAD_Symbol_267 * OpenAD_Symbol_311)
      OpenAD_Symbol_332 = (OpenAD_Symbol_319 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_269 * OpenAD_Symbol_268)
      OpenAD_Symbol_333 = (OpenAD_Symbol_313 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_271 * OpenAD_Symbol_268)
      OpenAD_Symbol_334 = (OpenAD_Symbol_314 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_272 * OpenAD_Symbol_268)
      OpenAD_Symbol_335 = (OpenAD_Symbol_318 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_23 * OpenAD_Symbol_268)
      OpenAD_Symbol_336 = (OpenAD_Symbol_316 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_22 * OpenAD_Symbol_268)
      OpenAD_Symbol_337 = (OpenAD_Symbol_317 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_267 * OpenAD_Symbol_268)
      OpenAD_Symbol_338 = (OpenAD_Symbol_4 * OpenAD_Symbol_307)
      OpenAD_Symbol_339 = (OpenAD_Symbol_284 * OpenAD_Symbol_307)
      OpenAD_Symbol_340 = (OpenAD_Symbol_4 * OpenAD_Symbol_319)
      OpenAD_Symbol_341 = (OpenAD_Symbol_284 * OpenAD_Symbol_319)
      OpenAD_Symbol_342 = (OpenAD_Symbol_284 * OpenAD_Symbol_319)
      OpenAD_Symbol_343 = (OpenAD_Symbol_285 * OpenAD_Symbol_319)
      OpenAD_Symbol_344 = (OpenAD_Symbol_286 * OpenAD_Symbol_319)
      OpenAD_Symbol_345 = (OpenAD_Symbol_284 * OpenAD_Symbol_332)
      OpenAD_Symbol_346 = (OpenAD_Symbol_285 * OpenAD_Symbol_332)
      OpenAD_Symbol_347 = (OpenAD_Symbol_286 * OpenAD_Symbol_332)
      OpenAD_Symbol_348 = (OpenAD_Symbol_284 * OpenAD_Symbol_320)
      OpenAD_Symbol_349 = (OpenAD_Symbol_285 * OpenAD_Symbol_320)
      OpenAD_Symbol_350 = (OpenAD_Symbol_286 * OpenAD_Symbol_320)
      OpenAD_Symbol_351 = (OpenAD_Symbol_284 * OpenAD_Symbol_326)
      OpenAD_Symbol_352 = (OpenAD_Symbol_285 * OpenAD_Symbol_326)
      OpenAD_Symbol_353 = (OpenAD_Symbol_286 * OpenAD_Symbol_326)
      OpenAD_Symbol_354 = (INT((-1_w2f__i8)) * OpenAD_Symbol_338)
      OpenAD_Symbol_355 = (INT((-1_w2f__i8)) * OpenAD_Symbol_340)
      OpenAD_Symbol_356 = (2.0D00 * OpenAD_Symbol_338)
      OpenAD_Symbol_357 = (2.0D00 * OpenAD_Symbol_340)
      OpenAD_Symbol_358 = (OpenAD_Symbol_15 * OpenAD_Symbol_309)
      OpenAD_Symbol_359 = (OpenAD_Symbol_293 * OpenAD_Symbol_309)
      OpenAD_Symbol_360 = (OpenAD_Symbol_15 * OpenAD_Symbol_318)
      OpenAD_Symbol_361 = (OpenAD_Symbol_293 * OpenAD_Symbol_318)
      OpenAD_Symbol_362 = (OpenAD_Symbol_293 * OpenAD_Symbol_318)
      OpenAD_Symbol_363 = (OpenAD_Symbol_296 * OpenAD_Symbol_318)
      OpenAD_Symbol_364 = (OpenAD_Symbol_297 * OpenAD_Symbol_318)
      OpenAD_Symbol_365 = (OpenAD_Symbol_293 * OpenAD_Symbol_335)
      OpenAD_Symbol_366 = (OpenAD_Symbol_296 * OpenAD_Symbol_335)
      OpenAD_Symbol_367 = (OpenAD_Symbol_297 * OpenAD_Symbol_335)
      OpenAD_Symbol_368 = (OpenAD_Symbol_293 * OpenAD_Symbol_323)
      OpenAD_Symbol_369 = (OpenAD_Symbol_296 * OpenAD_Symbol_323)
      OpenAD_Symbol_370 = (OpenAD_Symbol_297 * OpenAD_Symbol_323)
      OpenAD_Symbol_371 = (OpenAD_Symbol_293 * OpenAD_Symbol_329)
      OpenAD_Symbol_372 = (OpenAD_Symbol_296 * OpenAD_Symbol_329)
      OpenAD_Symbol_373 = (OpenAD_Symbol_297 * OpenAD_Symbol_329)
      OpenAD_Symbol_374 = (INT((-1_w2f__i8)) * OpenAD_Symbol_358)
      OpenAD_Symbol_375 = (INT((-1_w2f__i8)) * OpenAD_Symbol_360)
      OpenAD_Symbol_376 = (2.0D00 * OpenAD_Symbol_358)
      OpenAD_Symbol_377 = (2.0D00 * OpenAD_Symbol_360)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_306)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_315)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_308)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_312)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_284)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_285)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_286)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_293)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_296)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_297)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_267)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_295)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_301)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_305)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_274)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_275)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_298)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_299)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_300)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_282)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_283)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_287)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_288)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_289)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_339)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_354)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_356)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_359)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_374)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_376)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_316)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_317)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_361)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_375)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_377)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_313)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_314)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_341)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_355)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_357)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_313)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_314)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_316)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_317)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_342)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_343)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_344)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_362)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_363)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_364)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_277)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_278)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_280)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_281)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_290)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_291)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_292)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_302)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_303)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_304)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_333)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_334)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_336)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_337)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_345)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_346)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_347)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_365)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_366)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_367)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_327)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_328)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_330)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_331)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_351)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_352)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_353)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_371)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_372)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_373)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_321)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_322)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_324)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_325)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_348)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_349)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_350)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_368)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_369)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_370)
      __value__(G) = (__value__(F) * __value__(LOC2))
      OpenAD_Symbol_73 = __value__(LOC2)
      OpenAD_Symbol_74 = __value__(F)
      __value__(F) = (__value__(LOC1) * 2.0D00)
      OpenAD_Symbol_75 = 2.0D00
      __value__(ADJ_M0) = (__value__(F) * __value__(MATR0) + __value__(
     > G) * __value__(MATR3))
      OpenAD_Symbol_79 = __value__(MATR0)
      OpenAD_Symbol_80 = __value__(F)
      OpenAD_Symbol_77 = 1_w2f__i8
      OpenAD_Symbol_81 = __value__(MATR3)
      OpenAD_Symbol_82 = __value__(G)
      OpenAD_Symbol_78 = 1_w2f__i8
      __value__(ADJ_M1) = (__value__(F) * __value__(MATR1) - __value__(
     > G) * __value__(MATR2))
      OpenAD_Symbol_85 = __value__(MATR1)
      OpenAD_Symbol_86 = __value__(F)
      OpenAD_Symbol_83 = 1_w2f__i8
      OpenAD_Symbol_87 = __value__(MATR2)
      OpenAD_Symbol_88 = __value__(G)
      OpenAD_Symbol_84 = (-1_w2f__i8)
      __value__(ADJ_M2) = (__value__(F) * __value__(MATR2) - __value__(
     > G) * __value__(MATR1))
      OpenAD_Symbol_91 = __value__(MATR2)
      OpenAD_Symbol_92 = __value__(F)
      OpenAD_Symbol_89 = 1_w2f__i8
      OpenAD_Symbol_93 = __value__(MATR1)
      OpenAD_Symbol_94 = __value__(G)
      OpenAD_Symbol_90 = (-1_w2f__i8)
      __value__(ADJ_M3) = (__value__(F) * __value__(MATR3) + __value__(
     > G) * __value__(MATR0))
      OpenAD_Symbol_97 = __value__(MATR3)
      OpenAD_Symbol_98 = __value__(F)
      OpenAD_Symbol_95 = 1_w2f__i8
      OpenAD_Symbol_99 = __value__(MATR0)
      OpenAD_Symbol_100 = __value__(G)
      OpenAD_Symbol_96 = 1_w2f__i8
      __value__(LOC1) = (__value__(ADJ_M1) * SQRT3)
      OpenAD_Symbol_101 = SQRT3
      __value__(G_OBJ0) = (-(__value__(ADJ_M0) + __value__(LOC1)))
      OpenAD_Symbol_104 = 1_w2f__i8
      OpenAD_Symbol_105 = 1_w2f__i8
      OpenAD_Symbol_103 = (-1_w2f__i8)
      __value__(G_OBJ1) = (__value__(ADJ_M0) - __value__(LOC1))
      OpenAD_Symbol_106 = 1_w2f__i8
      OpenAD_Symbol_107 = (-1_w2f__i8)
      __value__(G_OBJ2) = (__value__(LOC1) * 2.0D00)
      OpenAD_Symbol_108 = 2.0D00
      OpenAD_Symbol_378 = (OpenAD_Symbol_73 * OpenAD_Symbol_81)
      OpenAD_Symbol_379 = (OpenAD_Symbol_74 * OpenAD_Symbol_81)
      OpenAD_Symbol_380 = (OpenAD_Symbol_73 * OpenAD_Symbol_99)
      OpenAD_Symbol_381 = (OpenAD_Symbol_74 * OpenAD_Symbol_99)
      OpenAD_Symbol_382 = (OpenAD_Symbol_94 * INT((-1_w2f__i8)))
      OpenAD_Symbol_383 = (OpenAD_Symbol_73 * OpenAD_Symbol_93 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_384 = (OpenAD_Symbol_74 * OpenAD_Symbol_93 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_385 = (2.0D00 * OpenAD_Symbol_97)
      OpenAD_Symbol_386 = (2.0D00 * OpenAD_Symbol_91)
      OpenAD_Symbol_387 = (2.0D00 * OpenAD_Symbol_85)
      OpenAD_Symbol_388 = (OpenAD_Symbol_88 * INT((-1_w2f__i8)))
      OpenAD_Symbol_389 = (OpenAD_Symbol_73 * OpenAD_Symbol_87 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_390 = (OpenAD_Symbol_74 * OpenAD_Symbol_87 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_391 = (2.0D00 * OpenAD_Symbol_79)
      OpenAD_Symbol_392 = (OpenAD_Symbol_80 * INT((-1_w2f__i8)))
      OpenAD_Symbol_393 = (OpenAD_Symbol_82 * INT((-1_w2f__i8)))
      OpenAD_Symbol_394 = (OpenAD_Symbol_101 * INT((-1_w2f__i8)))
      OpenAD_Symbol_395 = (OpenAD_Symbol_101 * 2.0D00)
      OpenAD_Symbol_396 = (OpenAD_Symbol_101 * INT((-1_w2f__i8)))
      OpenAD_Symbol_397 = (OpenAD_Symbol_86 * OpenAD_Symbol_394)
      OpenAD_Symbol_398 = (OpenAD_Symbol_86 * OpenAD_Symbol_395)
      OpenAD_Symbol_399 = (OpenAD_Symbol_86 * OpenAD_Symbol_396)
      OpenAD_Symbol_400 = (OpenAD_Symbol_391 + OpenAD_Symbol_387 *
     >  OpenAD_Symbol_394)
      OpenAD_Symbol_401 = (OpenAD_Symbol_387 * OpenAD_Symbol_395)
      OpenAD_Symbol_402 = (OpenAD_Symbol_391 * INT((-1_w2f__i8)) +
     >  OpenAD_Symbol_387 * OpenAD_Symbol_396)
      OpenAD_Symbol_403 = (OpenAD_Symbol_388 * OpenAD_Symbol_394)
      OpenAD_Symbol_404 = (OpenAD_Symbol_388 * OpenAD_Symbol_395)
      OpenAD_Symbol_405 = (OpenAD_Symbol_388 * OpenAD_Symbol_396)
      OpenAD_Symbol_406 = (OpenAD_Symbol_378 + OpenAD_Symbol_389 *
     >  OpenAD_Symbol_394)
      OpenAD_Symbol_407 = (OpenAD_Symbol_389 * OpenAD_Symbol_395)
      OpenAD_Symbol_408 = (OpenAD_Symbol_378 * INT((-1_w2f__i8)) +
     >  OpenAD_Symbol_389 * OpenAD_Symbol_396)
      OpenAD_Symbol_409 = (OpenAD_Symbol_379 + OpenAD_Symbol_390 *
     >  OpenAD_Symbol_394)
      OpenAD_Symbol_410 = (OpenAD_Symbol_390 * OpenAD_Symbol_395)
      OpenAD_Symbol_411 = (OpenAD_Symbol_379 * INT((-1_w2f__i8)) +
     >  OpenAD_Symbol_390 * OpenAD_Symbol_396)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_382)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_383)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_384)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_92)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_386)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_100)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_380)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_381)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_98)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_385)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_80)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_82)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_397)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_400)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_403)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_406)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_409)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_398)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_401)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_404)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_407)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_410)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_392)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_393)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_399)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_402)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_405)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_408)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_411)
      __value__(LOC1) = (__value__(ADJ_M3) * SQRT3)
      OpenAD_Symbol_110 = SQRT3
      __value__(G_OBJ3) = (-(__value__(ADJ_M2) + __value__(LOC1)))
      OpenAD_Symbol_113 = 1_w2f__i8
      OpenAD_Symbol_114 = 1_w2f__i8
      OpenAD_Symbol_112 = (-1_w2f__i8)
      __value__(G_OBJ4) = (__value__(ADJ_M2) - __value__(LOC1))
      OpenAD_Symbol_115 = 1_w2f__i8
      OpenAD_Symbol_116 = (-1_w2f__i8)
      __value__(G_OBJ5) = (__value__(LOC1) * 2.0D00)
      OpenAD_Symbol_117 = 2.0D00
      OpenAD_Symbol_121 = (__value__(LOC2) * 2.0D00)
      OpenAD_Symbol_119 = 2.0D00
      __value__(LOC2) = OpenAD_Symbol_121
      __value__(R00) = (__value__(D00) * __value__(LOC2) + __value__(GG
     > ) * __value__(M33))
      OpenAD_Symbol_124 = __value__(LOC2)
      OpenAD_Symbol_125 = __value__(D00)
      OpenAD_Symbol_122 = 1_w2f__i8
      OpenAD_Symbol_126 = __value__(M33)
      OpenAD_Symbol_127 = __value__(GG)
      OpenAD_Symbol_123 = 1_w2f__i8
      __value__(R11) = (__value__(D11) * __value__(LOC2) + __value__(GG
     > ) * __value__(M22))
      OpenAD_Symbol_130 = __value__(LOC2)
      OpenAD_Symbol_131 = __value__(D11)
      OpenAD_Symbol_128 = 1_w2f__i8
      OpenAD_Symbol_132 = __value__(M22)
      OpenAD_Symbol_133 = __value__(GG)
      OpenAD_Symbol_129 = 1_w2f__i8
      R22 = (__value__(D11) * __value__(LOC2) + __value__(GG) *
     >  __value__(M11))
      R33 = (__value__(D00) * __value__(LOC2) + __value__(GG) *
     >  __value__(M00))
      __value__(M01) = (__value__(MATR0) * __value__(MATR1))
      OpenAD_Symbol_134 = __value__(MATR1)
      OpenAD_Symbol_135 = __value__(MATR0)
      __value__(M02) = (__value__(MATR0) * __value__(MATR2))
      OpenAD_Symbol_136 = __value__(MATR2)
      OpenAD_Symbol_137 = __value__(MATR0)
      __value__(M12) = (__value__(MATR1) * __value__(MATR2))
      OpenAD_Symbol_138 = __value__(MATR2)
      OpenAD_Symbol_139 = __value__(MATR1)
      __value__(M13) = (__value__(MATR1) * __value__(MATR3))
      OpenAD_Symbol_140 = __value__(MATR3)
      OpenAD_Symbol_141 = __value__(MATR1)
      __value__(M23) = (__value__(MATR2) * __value__(MATR3))
      OpenAD_Symbol_142 = __value__(MATR3)
      OpenAD_Symbol_143 = __value__(MATR2)
      OpenAD_Symbol_144 = (__value__(M02) + __value__(M13))
      __value__(D01) = (__value__(LOC2) * OpenAD_Symbol_144)
      OpenAD_Symbol_145 = OpenAD_Symbol_144
      OpenAD_Symbol_147 = 1_w2f__i8
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_146 = __value__(LOC2)
      OpenAD_Symbol_412 = (OpenAD_Symbol_110 * INT((-1_w2f__i8)))
      OpenAD_Symbol_413 = (OpenAD_Symbol_110 * 2.0D00)
      OpenAD_Symbol_414 = (OpenAD_Symbol_136 * OpenAD_Symbol_146)
      OpenAD_Symbol_415 = (OpenAD_Symbol_137 * OpenAD_Symbol_146)
      OpenAD_Symbol_416 = (OpenAD_Symbol_140 * OpenAD_Symbol_146)
      OpenAD_Symbol_417 = (OpenAD_Symbol_141 * OpenAD_Symbol_146)
      OpenAD_Symbol_418 = (2.0D00 * OpenAD_Symbol_131)
      OpenAD_Symbol_419 = (2.0D00 * OpenAD_Symbol_125)
      OpenAD_Symbol_420 = (2.0D00 * OpenAD_Symbol_145)
      OpenAD_Symbol_421 = (OpenAD_Symbol_110 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_412)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_413)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_134)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_135)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_136)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_137)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_138)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_139)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_140)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_141)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_142)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_143)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_421)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_126)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_124)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_127)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_419)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_132)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_130)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_133)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_418)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_414)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_415)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_416)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_417)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_420)
      __value__(LOC1) = (__value__(R11) * THIRD)
      OpenAD_Symbol_149 = THIRD
      OpenAD_Symbol_151 = (__value__(D01) + __value__(GG) * __value__(
     > M23))
      __value__(F) = (TWOSQRT3 * OpenAD_Symbol_151)
      OpenAD_Symbol_154 = 1_w2f__i8
      OpenAD_Symbol_156 = __value__(M23)
      OpenAD_Symbol_157 = __value__(GG)
      OpenAD_Symbol_155 = 1_w2f__i8
      OpenAD_Symbol_153 = TWOSQRT3
      __value__(G) = (__value__(LOC1) + __value__(R00))
      OpenAD_Symbol_158 = 1_w2f__i8
      OpenAD_Symbol_159 = 1_w2f__i8
      __value__(H_OBJ1) = (__value__(LOC1) - __value__(R00))
      OpenAD_Symbol_160 = 1_w2f__i8
      OpenAD_Symbol_161 = (-1_w2f__i8)
      __value__(H_OBJ0) = (__value__(F) + __value__(G))
      OpenAD_Symbol_162 = 1_w2f__i8
      OpenAD_Symbol_163 = 1_w2f__i8
      __value__(H_OBJ3) = (__value__(G) - __value__(F))
      OpenAD_Symbol_164 = 1_w2f__i8
      OpenAD_Symbol_165 = (-1_w2f__i8)
      OpenAD_Symbol_423 = (OpenAD_Symbol_156 * OpenAD_Symbol_153)
      OpenAD_Symbol_424 = (OpenAD_Symbol_157 * OpenAD_Symbol_153)
      OpenAD_Symbol_425 = (OpenAD_Symbol_153 * INT((-1_w2f__i8)))
      OpenAD_Symbol_426 = (OpenAD_Symbol_423 * INT((-1_w2f__i8)))
      OpenAD_Symbol_427 = (OpenAD_Symbol_424 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_149)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_153)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_423)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_424)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_149)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_153)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_423)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_424)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_149)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_425)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_426)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_427)
      __value__(LOC1) = (-(__value__(R11) * TWO3RD))
      OpenAD_Symbol_167 = TWO3RD
      OpenAD_Symbol_166 = (-1_w2f__i8)
      __value__(H_OBJ2) = (__value__(LOC1) - __value__(F))
      OpenAD_Symbol_169 = 1_w2f__i8
      OpenAD_Symbol_170 = (-1_w2f__i8)
      __value__(H_OBJ4) = (__value__(F) + __value__(LOC1))
      OpenAD_Symbol_171 = 1_w2f__i8
      OpenAD_Symbol_172 = 1_w2f__i8
      __value__(H_OBJ5) = (FOUR3RD * __value__(R11))
      OpenAD_Symbol_174 = FOUR3RD
      OpenAD_Symbol_428 = (OpenAD_Symbol_167 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_174)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_428)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_428)
      __value__(LOC1) = (__value__(R00) * THIRD)
      OpenAD_Symbol_175 = THIRD
      OpenAD_Symbol_177 = (__value__(D01) + __value__(GG) * __value__(
     > M01))
      __value__(F) = (TWOSQRT3 * OpenAD_Symbol_177)
      OpenAD_Symbol_180 = 1_w2f__i8
      OpenAD_Symbol_182 = __value__(M01)
      OpenAD_Symbol_183 = __value__(GG)
      OpenAD_Symbol_181 = 1_w2f__i8
      OpenAD_Symbol_179 = TWOSQRT3
      __value__(G) = (__value__(LOC1) + __value__(R11))
      OpenAD_Symbol_184 = 1_w2f__i8
      OpenAD_Symbol_185 = 1_w2f__i8
      __value__(H_OBJ16) = (__value__(LOC1) - __value__(R11))
      OpenAD_Symbol_186 = 1_w2f__i8
      OpenAD_Symbol_187 = (-1_w2f__i8)
      __value__(H_OBJ15) = (__value__(F) + __value__(G))
      OpenAD_Symbol_188 = 1_w2f__i8
      OpenAD_Symbol_189 = 1_w2f__i8
      __value__(H_OBJ18) = (__value__(G) - __value__(F))
      OpenAD_Symbol_190 = 1_w2f__i8
      OpenAD_Symbol_191 = (-1_w2f__i8)
      OpenAD_Symbol_429 = (OpenAD_Symbol_182 * OpenAD_Symbol_179)
      OpenAD_Symbol_430 = (OpenAD_Symbol_183 * OpenAD_Symbol_179)
      OpenAD_Symbol_431 = (OpenAD_Symbol_179 * INT((-1_w2f__i8)))
      OpenAD_Symbol_432 = (OpenAD_Symbol_429 * INT((-1_w2f__i8)))
      OpenAD_Symbol_433 = (OpenAD_Symbol_430 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_175)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_179)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_429)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_430)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_175)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_179)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_429)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_430)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_175)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_431)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_432)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_433)
      __value__(LOC1) = (-(__value__(R00) * TWO3RD))
      OpenAD_Symbol_193 = TWO3RD
      OpenAD_Symbol_192 = (-1_w2f__i8)
      __value__(H_OBJ17) = (__value__(LOC1) - __value__(F))
      OpenAD_Symbol_195 = 1_w2f__i8
      OpenAD_Symbol_196 = (-1_w2f__i8)
      __value__(H_OBJ19) = (__value__(F) + __value__(LOC1))
      OpenAD_Symbol_197 = 1_w2f__i8
      OpenAD_Symbol_198 = 1_w2f__i8
      __value__(H_OBJ20) = (FOUR3RD * __value__(R00))
      OpenAD_Symbol_200 = FOUR3RD
      OpenAD_Symbol_434 = (OpenAD_Symbol_193 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_200)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_434)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_434)
      OpenAD_Symbol_201 = (__value__(M01) + __value__(M23))
      __value__(LOC1) = (__value__(LOC2) * OpenAD_Symbol_201)
      OpenAD_Symbol_202 = OpenAD_Symbol_201
      OpenAD_Symbol_204 = 1_w2f__i8
      OpenAD_Symbol_205 = 1_w2f__i8
      OpenAD_Symbol_203 = __value__(LOC2)
      __value__(R13) = (__value__(LOC1) + __value__(GG) * __value__(M02
     > ))
      OpenAD_Symbol_206 = 1_w2f__i8
      OpenAD_Symbol_208 = __value__(M02)
      OpenAD_Symbol_209 = __value__(GG)
      OpenAD_Symbol_207 = 1_w2f__i8
      __value__(R02) = (__value__(LOC1) + __value__(GG) * __value__(M13
     > ))
      OpenAD_Symbol_210 = 1_w2f__i8
      OpenAD_Symbol_212 = __value__(M13)
      OpenAD_Symbol_213 = __value__(GG)
      OpenAD_Symbol_211 = 1_w2f__i8
      __value__(R03) = (__value__(D03) * __value__(LOC2) + __value__(GG
     > ) * __value__(M03))
      OpenAD_Symbol_216 = __value__(LOC2)
      OpenAD_Symbol_217 = __value__(D03)
      OpenAD_Symbol_214 = 1_w2f__i8
      OpenAD_Symbol_218 = __value__(M03)
      OpenAD_Symbol_219 = __value__(GG)
      OpenAD_Symbol_215 = 1_w2f__i8
      __value__(R12) = (__value__(D12) * __value__(LOC2) + __value__(GG
     > ) * __value__(M12))
      OpenAD_Symbol_222 = __value__(LOC2)
      OpenAD_Symbol_223 = __value__(D12)
      OpenAD_Symbol_220 = 1_w2f__i8
      OpenAD_Symbol_224 = __value__(M12)
      OpenAD_Symbol_225 = __value__(GG)
      OpenAD_Symbol_221 = 1_w2f__i8
      __value__(G) = (-(__value__(R13) * TWO3RD))
      OpenAD_Symbol_227 = TWO3RD
      OpenAD_Symbol_226 = (-1_w2f__i8)
      __value__(F) = (__value__(R03) * TWOSQRT3)
      OpenAD_Symbol_229 = TWOSQRT3
      __value__(H_OBJ8) = (__value__(G) - __value__(F))
      OpenAD_Symbol_231 = 1_w2f__i8
      OpenAD_Symbol_232 = (-1_w2f__i8)
      __value__(H_OBJ11) = (__value__(F) + __value__(G))
      OpenAD_Symbol_233 = 1_w2f__i8
      OpenAD_Symbol_234 = 1_w2f__i8
      OpenAD_Symbol_435 = (OpenAD_Symbol_227 * INT((-1_w2f__i8)))
      OpenAD_Symbol_436 = (OpenAD_Symbol_229 * INT((-1_w2f__i8)))
      OpenAD_Symbol_437 = (OpenAD_Symbol_219 * OpenAD_Symbol_436)
      OpenAD_Symbol_438 = (OpenAD_Symbol_216 * OpenAD_Symbol_436)
      OpenAD_Symbol_439 = (OpenAD_Symbol_219 * OpenAD_Symbol_229)
      OpenAD_Symbol_440 = (OpenAD_Symbol_216 * OpenAD_Symbol_229)
      OpenAD_Symbol_441 = (OpenAD_Symbol_208 * OpenAD_Symbol_435)
      OpenAD_Symbol_442 = (OpenAD_Symbol_209 * OpenAD_Symbol_435)
      OpenAD_Symbol_443 = (OpenAD_Symbol_202 * OpenAD_Symbol_435)
      OpenAD_Symbol_444 = (OpenAD_Symbol_203 * OpenAD_Symbol_435)
      OpenAD_Symbol_445 = (OpenAD_Symbol_203 * OpenAD_Symbol_435)
      OpenAD_Symbol_446 = (OpenAD_Symbol_218 * OpenAD_Symbol_436 +
     >  OpenAD_Symbol_441)
      OpenAD_Symbol_447 = (OpenAD_Symbol_217 * OpenAD_Symbol_436 +
     >  OpenAD_Symbol_443)
      OpenAD_Symbol_448 = (OpenAD_Symbol_218 * OpenAD_Symbol_229 +
     >  OpenAD_Symbol_441)
      OpenAD_Symbol_449 = (OpenAD_Symbol_217 * OpenAD_Symbol_229 +
     >  OpenAD_Symbol_443)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_208)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_209)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_202)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_212)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_213)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_202)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_218)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_219)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_216)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_217)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_224)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_222)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_225)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_223)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_441)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_442)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_443)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_444)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_445)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_437)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_438)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_446)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_442)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_447)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_444)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_445)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_439)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_440)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_448)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_442)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_449)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_444)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_445)
      __value__(F) = (__value__(R12) * TWOSQRT3)
      OpenAD_Symbol_235 = TWOSQRT3
      __value__(H_OBJ12) = (__value__(G) - __value__(F))
      OpenAD_Symbol_237 = 1_w2f__i8
      OpenAD_Symbol_238 = (-1_w2f__i8)
      __value__(H_OBJ13) = (__value__(F) + __value__(G))
      OpenAD_Symbol_239 = 1_w2f__i8
      OpenAD_Symbol_240 = 1_w2f__i8
      __value__(H_OBJ14) = (__value__(R13) * 1.2D+01)
      OpenAD_Symbol_241 = 1.2D+01
      __value__(G) = (FOUR3RD * __value__(R02))
      OpenAD_Symbol_244 = FOUR3RD
      OpenAD_Symbol_450 = (OpenAD_Symbol_235 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_450)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_235)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_244)
      OpenAD_Symbol_245 = (__value__(R03) + __value__(R12))
      __value__(F) = (SQRT3 * OpenAD_Symbol_245)
      OpenAD_Symbol_248 = 1_w2f__i8
      OpenAD_Symbol_249 = 1_w2f__i8
      OpenAD_Symbol_247 = SQRT3
      __value__(H_OBJ10) = (__value__(G) - __value__(F))
      OpenAD_Symbol_250 = 1_w2f__i8
      OpenAD_Symbol_251 = (-1_w2f__i8)
      __value__(H_OBJ6) = (__value__(F) + __value__(G))
      OpenAD_Symbol_252 = 1_w2f__i8
      OpenAD_Symbol_253 = 1_w2f__i8
      __value__(G) = (__value__(R02) * TWO3RD)
      OpenAD_Symbol_254 = TWO3RD
      OpenAD_Symbol_452 = (OpenAD_Symbol_247 * INT((-1_w2f__i8)))
      OpenAD_Symbol_453 = (OpenAD_Symbol_247 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_254)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_452)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_453)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
      OpenAD_Symbol_256 = (__value__(R03) - __value__(R12))
      __value__(F) = (SQRT3 * OpenAD_Symbol_256)
      OpenAD_Symbol_259 = 1_w2f__i8
      OpenAD_Symbol_260 = (-1_w2f__i8)
      OpenAD_Symbol_258 = SQRT3
      __value__(H_OBJ9) = (__value__(G) - __value__(F))
      OpenAD_Symbol_261 = 1_w2f__i8
      OpenAD_Symbol_262 = (-1_w2f__i8)
      __value__(H_OBJ7) = (__value__(F) + __value__(G))
      OpenAD_Symbol_263 = 1_w2f__i8
      OpenAD_Symbol_264 = 1_w2f__i8
      OpenAD_Symbol_455 = (INT((-1_w2f__i8)) * OpenAD_Symbol_258)
      OpenAD_Symbol_456 = (OpenAD_Symbol_258 * INT((-1_w2f__i8)))
      OpenAD_Symbol_457 = (OpenAD_Symbol_455 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_456)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_457)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_258)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_455)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ7), __deriv__(G))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_458)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_458, __deriv__(H_OBJ7), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_459)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_459, __deriv__(H_OBJ7), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ7))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ9), __deriv__(G))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_460)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_460, __deriv__(H_OBJ9), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_461)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_461, __deriv__(H_OBJ9), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ9))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ6), __deriv__(
     > OpenAD_Symbol_454))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_462)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_462, __deriv__(H_OBJ6), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_463)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_463, __deriv__(H_OBJ6), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ6))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ10), __deriv__(
     > OpenAD_Symbol_454))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_464)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_464, __deriv__(H_OBJ10), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_465)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_465, __deriv__(H_OBJ10), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ10))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_466)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_466, __deriv__(G), __deriv__(R02))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_454), __deriv__(G))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_454))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_467)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_467, __deriv__(G), __deriv__(R02))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1.2D+01, __deriv__(H_OBJ14), __deriv__(R13))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ14))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ13), __deriv__(
     > OpenAD_Symbol_451))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_468)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_468, __deriv__(H_OBJ13), __deriv__(R12))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ13))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ12), __deriv__(
     > OpenAD_Symbol_451))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_469)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_469, __deriv__(H_OBJ12), __deriv__(R12))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ12))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_451), __deriv__(G))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_451))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_470)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_470, __deriv__(H_OBJ11), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_471)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_471, __deriv__(H_OBJ11), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_472)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_472, __deriv__(H_OBJ11), __deriv__(LOC2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_473)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_473, __deriv__(H_OBJ11), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_474)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_474, __deriv__(H_OBJ11), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_475)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_475, __deriv__(H_OBJ11), __deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_476)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_476, __deriv__(H_OBJ11), __deriv__(M03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_477)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_477, __deriv__(H_OBJ8), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_478)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_478, __deriv__(H_OBJ8), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_479)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_479, __deriv__(H_OBJ8), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_480)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_480, __deriv__(H_OBJ8), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_481)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_481, __deriv__(H_OBJ8), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_482)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_482, __deriv__(H_OBJ8), __deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_483)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_483, __deriv__(H_OBJ8), __deriv__(M03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ8))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_484)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_484, __deriv__(G), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_485)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_485, __deriv__(G), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_486)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_486, __deriv__(G), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_487)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_487, __deriv__(G), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_488)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_488, __deriv__(G), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_489)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_489, __deriv__(R12), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_490)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_490, __deriv__(R12), __deriv__(M12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_491)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_491, __deriv__(R12), __deriv__(D12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_492)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_492, __deriv__(R12), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_493)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_493, __deriv__(R03), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_494)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_494, __deriv__(R03), __deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_495)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_495, __deriv__(R03), __deriv__(M03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_496)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_496, __deriv__(R03), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_497)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_497, __deriv__(R02), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_498)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_498, __deriv__(R02), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_499)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_499, __deriv__(R02), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_500)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_500, __deriv__(R02), __deriv__(M13))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_501)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_501, __deriv__(R02), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_502)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_502, __deriv__(R13), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_503)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_503, __deriv__(R13), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_504)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_504, __deriv__(R13), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_505)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_505, __deriv__(R13), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_506)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_506, __deriv__(R13), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R13))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ19), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_507)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_507, __deriv__(H_OBJ19), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ19))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ17), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_508)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_508, __deriv__(H_OBJ17), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ17))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_509)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_509, __deriv__(H_OBJ20), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ20))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_510)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_510, __deriv__(H_OBJ18), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_511)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_511, __deriv__(H_OBJ18), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_512)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_512, __deriv__(H_OBJ18), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ18), __deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_513)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_513, __deriv__(H_OBJ18), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ18))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_514)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_514, __deriv__(H_OBJ15), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_515)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_515, __deriv__(H_OBJ15), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_516)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_516, __deriv__(H_OBJ15), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ15), __deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_517)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_517, __deriv__(H_OBJ15), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ15))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_518)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_518, __deriv__(F), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_519)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_519, __deriv__(F), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_520)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_520, __deriv__(F), __deriv__(D01))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ16), __deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_521)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_521, __deriv__(H_OBJ16), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ16))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ4), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_522)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_522, __deriv__(H_OBJ4), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ4))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ2), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_523)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_523, __deriv__(H_OBJ2), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_524)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_524, __deriv__(H_OBJ5), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_525)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_525, __deriv__(H_OBJ3), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_526)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_526, __deriv__(H_OBJ3), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_527)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_527, __deriv__(H_OBJ3), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ3), __deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_528)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_528, __deriv__(H_OBJ3), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_529)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_529, __deriv__(H_OBJ0), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_530)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_530, __deriv__(H_OBJ0), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_531)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_531, __deriv__(H_OBJ0), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ0), __deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_532)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_532, __deriv__(H_OBJ0), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_533)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_533, __deriv__(F), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_534)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_534, __deriv__(F), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_535)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_535, __deriv__(F), __deriv__(D01))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ1), __deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_536)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_536, __deriv__(H_OBJ1), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_537)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_537, __deriv__(D01), __deriv__(
     > OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_538)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_538, __deriv__(D01), __deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_539)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_539, __deriv__(D01), __deriv__(MATR1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_540)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_540, __deriv__(D01), __deriv__(MATR2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_541)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_541, __deriv__(D01), __deriv__(MATR0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_542)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_542, __deriv__(R11), __deriv__(
     > OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_543)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_543, __deriv__(R11), __deriv__(M22))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_544)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_544, __deriv__(R11), __deriv__(D11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_545)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_545, __deriv__(R11), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_546)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_546, __deriv__(R00), __deriv__(
     > OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_547)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_547, __deriv__(R00), __deriv__(M33))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_548)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_548, __deriv__(R00), __deriv__(D00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_549)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_549, __deriv__(R00), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_550)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_550, __deriv__(G_OBJ3), __deriv__(ADJ_M3
     > ))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(G_OBJ3), __deriv__(ADJ_M2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_551)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_551, __deriv__(M23), __deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_552)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_552, __deriv__(M23), __deriv__(MATR2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_553)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_553, __deriv__(M13), __deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_554)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_554, __deriv__(M13), __deriv__(MATR1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M13))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_555)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_555, __deriv__(M12), __deriv__(MATR2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_556)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_556, __deriv__(M12), __deriv__(MATR1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_557)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_557, __deriv__(M02), __deriv__(MATR2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_558)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_558, __deriv__(M02), __deriv__(MATR0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_559)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_559, __deriv__(M01), __deriv__(MATR1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_560)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_560, __deriv__(M01), __deriv__(MATR0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(2.0D00, __deriv__(LOC2), __deriv__(OpenAD_Symbol_422))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_561)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_561, __deriv__(G_OBJ5), __deriv__(ADJ_M3
     > ))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ5))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(G_OBJ4), __deriv__(ADJ_M2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_562)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_562, __deriv__(G_OBJ4), __deriv__(ADJ_M3
     > ))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ4))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_422), __deriv__(LOC2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_563)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_563, __deriv__(G_OBJ0), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_564)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_564, __deriv__(G_OBJ0), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_565)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_565, __deriv__(G_OBJ0), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_566)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_566, __deriv__(G_OBJ0), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_567)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_567, __deriv__(G_OBJ0), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_568)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_568, __deriv__(G_OBJ0), __deriv__(MATR3)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_569)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_569, __deriv__(G_OBJ0), __deriv__(MATR0)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_570)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_570, __deriv__(G_OBJ2), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_571)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_571, __deriv__(G_OBJ2), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_572)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_572, __deriv__(G_OBJ2), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_573)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_573, __deriv__(G_OBJ2), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_574)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_574, __deriv__(G_OBJ2), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_575)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_575, __deriv__(G_OBJ1), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_576)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_576, __deriv__(G_OBJ1), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_577)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_577, __deriv__(G_OBJ1), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_578)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_578, __deriv__(G_OBJ1), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_579)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_579, __deriv__(G_OBJ1), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_580)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_580, __deriv__(G_OBJ1), __deriv__(MATR3)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_581)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_581, __deriv__(G_OBJ1), __deriv__(MATR0)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_582)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_582, __deriv__(ADJ_M3), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_583)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_583, __deriv__(ADJ_M3), __deriv__(MATR3)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_584)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_584, __deriv__(ADJ_M3), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_585)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_585, __deriv__(ADJ_M3), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_586)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_586, __deriv__(ADJ_M3), __deriv__(MATR0)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(ADJ_M3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_587)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_587, __deriv__(ADJ_M2), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_588)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_588, __deriv__(ADJ_M2), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_589)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_589, __deriv__(ADJ_M2), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_590)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_590, __deriv__(ADJ_M2), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_591)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_591, __deriv__(ADJ_M2), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(ADJ_M2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_592)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_592, __deriv__(GG), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_593)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_593, __deriv__(GG), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_594)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_594, __deriv__(GG), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_595)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_595, __deriv__(GG), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_596)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_596, __deriv__(GG), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_597)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_597, __deriv__(GG), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_598)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_598, __deriv__(GG), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_599)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_599, __deriv__(GG), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_600)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_600, __deriv__(GG), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_601)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_601, __deriv__(GG), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_602)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_602, __deriv__(LOC2), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_603)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_603, __deriv__(LOC2), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_604)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_604, __deriv__(LOC2), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_605)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_605, __deriv__(LOC2), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_606)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_606, __deriv__(LOC2), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_607)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_607, __deriv__(LOC2), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_608)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_608, __deriv__(LOC2), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_609)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_609, __deriv__(LOC2), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_610)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_610, __deriv__(LOC2), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_611)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_611, __deriv__(LOC2), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_612)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_612, __deriv__(OBJ), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_613)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_613, __deriv__(OBJ), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_614)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_614, __deriv__(OBJ), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_615)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_615, __deriv__(OBJ), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_616)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_616, __deriv__(OBJ), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_617)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_617, __deriv__(OBJ), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_618)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_618, __deriv__(OBJ), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_619)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_619, __deriv__(OBJ), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_620)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_620, __deriv__(OBJ), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_621)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_621, __deriv__(OBJ), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OBJ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_622)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_622, __deriv__(LOC1), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_623)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_623, __deriv__(LOC1), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_624)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_624, __deriv__(LOC1), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_625)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_625, __deriv__(LOC1), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_626)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_626, __deriv__(LOC1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_627)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_627, __deriv__(LOC1), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_628)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_628, __deriv__(LOC1), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_629)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_629, __deriv__(LOC1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_630)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_630, __deriv__(LOC1), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_631)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_631, __deriv__(LOC1), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_632)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_632, __deriv__(F), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_633)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_633, __deriv__(F), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_634)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_634, __deriv__(F), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_635)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_635, __deriv__(F), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_636)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_636, __deriv__(F), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_637)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_637, __deriv__(F), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_638)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_638, __deriv__(F), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_639)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_639, __deriv__(F), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_640)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_640, __deriv__(F), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_641)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_641, __deriv__(F), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_642)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_642, __deriv__(D03), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_643)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_643, __deriv__(D03), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_644)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_644, __deriv__(D03), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_645)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_645, __deriv__(D03), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_646)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_646, __deriv__(D03), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_647)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_647, __deriv__(D12), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_648)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_648, __deriv__(D12), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_649)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_649, __deriv__(D12), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_650)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_650, __deriv__(D12), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_651)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_651, __deriv__(D12), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_652)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_652, __deriv__(M33), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_653)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_653, __deriv__(M33), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_654)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_654, __deriv__(M33), __deriv__(X3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M33))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_655)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_655, __deriv__(M11), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_656)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_656, __deriv__(M11), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_657)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_657, __deriv__(M11), __deriv__(X0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_658)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_658, __deriv__(D11), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_659)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_659, __deriv__(D11), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_660)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_660, __deriv__(D11), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_661)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_661, __deriv__(D11), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_662)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_662, __deriv__(D11), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_663)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_663, __deriv__(D00), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_664)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_664, __deriv__(D00), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_665)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_665, __deriv__(D00), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_666)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_666, __deriv__(D00), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_667)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_667, __deriv__(D00), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_668)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_668, __deriv__(M03), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_669)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_669, __deriv__(M03), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_670)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_670, __deriv__(M03), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_671)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_671, __deriv__(M03), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_672)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_672, __deriv__(M03), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_673)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_673, __deriv__(MATR3), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_674)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_674, __deriv__(MATR3), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_675)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_675, __deriv__(MATR3), __deriv__(X3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_676)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_676, __deriv__(MATR1), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_677)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_677, __deriv__(MATR1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_678)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_678, __deriv__(MATR1), __deriv__(X0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_679)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_679, __deriv__(M22), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_680)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_680, __deriv__(M22), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M22))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_681)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_681, __deriv__(M00), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_682)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_682, __deriv__(M00), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M00))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR2), __deriv__(X3))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR2), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR2))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR0), __deriv__(X0))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR0), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR0))
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
      A = 5.0D-01
      B = (-1.0D00)
      AB = (A * B)
      SQRT3 = 5.77350258827209472656D-01
      TSQRT3 = 1.15470051765441894531D00
      TWOSQRT3 = 1.15470051765441894531D00
      THIRD = 3.33333343267440795898D-01
      TWO3RD = 6.66666686534881591797D-01
      FOUR3RD = 1.33333337306976318359D00
      BM1 = (-2.0D00)
      __value__(MATR0) = (__value__(X1) - __value__(X0))
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = (-1_w2f__i8)
      OpenAD_Symbol_2 = (__value__(X2) * 2.0D00 - __value__(X1) -
     >  __value__(X0))
      __value__(MATR1) = (SQRT3 * OpenAD_Symbol_2)
      OpenAD_Symbol_9 = 2.0D00
      OpenAD_Symbol_7 = 1_w2f__i8
      OpenAD_Symbol_8 = (-1_w2f__i8)
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_4 = SQRT3
      __value__(MATR2) = (__value__(X4) - __value__(X3))
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_13 = (__value__(X5) * 2.0D00 - __value__(X4) -
     >  __value__(X3))
      __value__(MATR3) = (SQRT3 * OpenAD_Symbol_13)
      OpenAD_Symbol_20 = 2.0D00
      OpenAD_Symbol_18 = 1_w2f__i8
      OpenAD_Symbol_19 = (-1_w2f__i8)
      OpenAD_Symbol_16 = 1_w2f__i8
      OpenAD_Symbol_17 = (-1_w2f__i8)
      OpenAD_Symbol_15 = SQRT3
      __value__(M03) = (__value__(MATR0) * __value__(MATR3))
      OpenAD_Symbol_22 = __value__(MATR3)
      OpenAD_Symbol_23 = __value__(MATR0)
      __value__(M12) = (__value__(MATR1) * __value__(MATR2))
      OpenAD_Symbol_24 = __value__(MATR2)
      OpenAD_Symbol_25 = __value__(MATR1)
      __value__(G) = (__value__(M03) - __value__(M12))
      OpenAD_Symbol_26 = 1_w2f__i8
      OpenAD_Symbol_27 = (-1_w2f__i8)
      __value__(D00) = (__value__(M03) * 2.0D00)
      OpenAD_Symbol_28 = 2.0D00
      __value__(D11) = (__value__(M12) * 2.0D00)
      OpenAD_Symbol_30 = 2.0D00
      __value__(M00) = (__value__(MATR0) * __value__(MATR0))
      OpenAD_Symbol_32 = __value__(MATR0)
      OpenAD_Symbol_33 = __value__(MATR0)
      __value__(M11) = (__value__(MATR1) * __value__(MATR1))
      OpenAD_Symbol_34 = __value__(MATR1)
      OpenAD_Symbol_35 = __value__(MATR1)
      __value__(M22) = (__value__(MATR2) * __value__(MATR2))
      OpenAD_Symbol_36 = __value__(MATR2)
      OpenAD_Symbol_37 = __value__(MATR2)
      __value__(M33) = (__value__(MATR3) * __value__(MATR3))
      OpenAD_Symbol_38 = __value__(MATR3)
      OpenAD_Symbol_39 = __value__(MATR3)
      __value__(D12) = (__value__(M00) * __value__(M33))
      OpenAD_Symbol_40 = __value__(M33)
      OpenAD_Symbol_41 = __value__(M00)
      __value__(D03) = (__value__(M11) * __value__(M22))
      OpenAD_Symbol_42 = __value__(M22)
      OpenAD_Symbol_43 = __value__(M11)
      __value__(F) = (__value__(D03) + __value__(D12))
      OpenAD_Symbol_44 = 1_w2f__i8
      OpenAD_Symbol_45 = 1_w2f__i8
      NORM = __value__(F)
      OpenAD_Symbol_46 = (1.0D00 / __value__(G))
      __value__(LOC1) = (A * OpenAD_Symbol_46)
      OpenAD_Symbol_50 = (-(1.0D00 /(__value__(G) * __value__(G))))
      OpenAD_Symbol_48 = A
      __value__(OBJ) = (__value__(F) * __value__(LOC1))
      OpenAD_Symbol_51 = __value__(LOC1)
      OpenAD_Symbol_52 = __value__(F)
      OpenAD_Symbol_56 = (__value__(G) * __value__(G))
      OpenAD_Symbol_53 = (1.0D00 / OpenAD_Symbol_56)
      __value__(LOC2) = (AB * OpenAD_Symbol_53)
      OpenAD_Symbol_59 = __value__(G)
      OpenAD_Symbol_60 = __value__(G)
      OpenAD_Symbol_58 = (-(1.0D00 /(OpenAD_Symbol_56 *
     >  OpenAD_Symbol_56)))
      OpenAD_Symbol_55 = AB
      OpenAD_Symbol_61 = (AB * B)
      OpenAD_Symbol_68 = (__value__(G) * __value__(G))
      OpenAD_Symbol_65 = (__value__(G) * OpenAD_Symbol_68)
      OpenAD_Symbol_62 = (1.0D00 / OpenAD_Symbol_65)
      __value__(GG) = (OpenAD_Symbol_61 * OpenAD_Symbol_62)
      OpenAD_Symbol_69 = OpenAD_Symbol_68
      OpenAD_Symbol_71 = __value__(G)
      OpenAD_Symbol_72 = __value__(G)
      OpenAD_Symbol_70 = __value__(G)
      OpenAD_Symbol_67 = (-(1.0D00 /(OpenAD_Symbol_65 *
     >  OpenAD_Symbol_65)))
      OpenAD_Symbol_64 = OpenAD_Symbol_61
      OpenAD_Symbol_265 = (OpenAD_Symbol_50 * OpenAD_Symbol_48)
      OpenAD_Symbol_266 = (INT((-1_w2f__i8)) * OpenAD_Symbol_25)
      OpenAD_Symbol_267 = (INT((-1_w2f__i8)) * OpenAD_Symbol_22)
      OpenAD_Symbol_268 = (OpenAD_Symbol_265 * OpenAD_Symbol_52)
      OpenAD_Symbol_269 = (OpenAD_Symbol_24 * INT((-1_w2f__i8)))
      OpenAD_Symbol_270 = (OpenAD_Symbol_24 * 2.0D00)
      OpenAD_Symbol_271 = (OpenAD_Symbol_25 * INT((-1_w2f__i8)))
      OpenAD_Symbol_272 = (OpenAD_Symbol_266 * INT((-1_w2f__i8)))
      OpenAD_Symbol_273 = (OpenAD_Symbol_23 * 2.0D00)
      OpenAD_Symbol_274 = (OpenAD_Symbol_22 * 2.0D00)
      OpenAD_Symbol_275 = (OpenAD_Symbol_267 * 2.0D00)
      OpenAD_Symbol_276 = (OpenAD_Symbol_269 * OpenAD_Symbol_265)
      OpenAD_Symbol_277 = (OpenAD_Symbol_271 * OpenAD_Symbol_265)
      OpenAD_Symbol_278 = (OpenAD_Symbol_272 * OpenAD_Symbol_265)
      OpenAD_Symbol_279 = (OpenAD_Symbol_23 * OpenAD_Symbol_265)
      OpenAD_Symbol_280 = (OpenAD_Symbol_22 * OpenAD_Symbol_265)
      OpenAD_Symbol_281 = (OpenAD_Symbol_267 * OpenAD_Symbol_265)
      OpenAD_Symbol_282 = (OpenAD_Symbol_25 * 2.0D00)
      OpenAD_Symbol_283 = (OpenAD_Symbol_266 * 2.0D00)
      OpenAD_Symbol_284 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_285 = (INT((-1_w2f__i8)) * OpenAD_Symbol_4)
      OpenAD_Symbol_286 = (2.0D00 * OpenAD_Symbol_4)
      OpenAD_Symbol_287 = (OpenAD_Symbol_284 * OpenAD_Symbol_270)
      OpenAD_Symbol_288 = (OpenAD_Symbol_285 * OpenAD_Symbol_270)
      OpenAD_Symbol_289 = (OpenAD_Symbol_286 * OpenAD_Symbol_270)
      OpenAD_Symbol_290 = (OpenAD_Symbol_284 * OpenAD_Symbol_276)
      OpenAD_Symbol_291 = (OpenAD_Symbol_285 * OpenAD_Symbol_276)
      OpenAD_Symbol_292 = (OpenAD_Symbol_286 * OpenAD_Symbol_276)
      OpenAD_Symbol_293 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_294 = (OpenAD_Symbol_15 * OpenAD_Symbol_23)
      OpenAD_Symbol_295 = (OpenAD_Symbol_293 * OpenAD_Symbol_23)
      OpenAD_Symbol_296 = (INT((-1_w2f__i8)) * OpenAD_Symbol_15)
      OpenAD_Symbol_297 = (2.0D00 * OpenAD_Symbol_15)
      OpenAD_Symbol_298 = (OpenAD_Symbol_293 * OpenAD_Symbol_273)
      OpenAD_Symbol_299 = (OpenAD_Symbol_296 * OpenAD_Symbol_273)
      OpenAD_Symbol_300 = (OpenAD_Symbol_297 * OpenAD_Symbol_273)
      OpenAD_Symbol_301 = (INT((-1_w2f__i8)) * OpenAD_Symbol_294)
      OpenAD_Symbol_302 = (OpenAD_Symbol_293 * OpenAD_Symbol_279)
      OpenAD_Symbol_303 = (OpenAD_Symbol_296 * OpenAD_Symbol_279)
      OpenAD_Symbol_304 = (OpenAD_Symbol_297 * OpenAD_Symbol_279)
      OpenAD_Symbol_305 = (2.0D00 * OpenAD_Symbol_294)
      OpenAD_Symbol_306 = (OpenAD_Symbol_32 + OpenAD_Symbol_33)
      OpenAD_Symbol_307 = (OpenAD_Symbol_34 + OpenAD_Symbol_35)
      OpenAD_Symbol_308 = (OpenAD_Symbol_36 + OpenAD_Symbol_37)
      OpenAD_Symbol_309 = (OpenAD_Symbol_38 + OpenAD_Symbol_39)
      OpenAD_Symbol_310 = ((OpenAD_Symbol_69 +(OpenAD_Symbol_71 +
     >  OpenAD_Symbol_72) * OpenAD_Symbol_70) * OpenAD_Symbol_67 *
     >  OpenAD_Symbol_64)
      OpenAD_Symbol_311 = ((OpenAD_Symbol_59 + OpenAD_Symbol_60) *
     >  OpenAD_Symbol_58 * OpenAD_Symbol_55)
      OpenAD_Symbol_312 = (INT((-1_w2f__i8)) * OpenAD_Symbol_308)
      OpenAD_Symbol_313 = (OpenAD_Symbol_308 * OpenAD_Symbol_43)
      OpenAD_Symbol_314 = (OpenAD_Symbol_312 * OpenAD_Symbol_43)
      OpenAD_Symbol_315 = (INT((-1_w2f__i8)) * OpenAD_Symbol_306)
      OpenAD_Symbol_316 = (OpenAD_Symbol_306 * OpenAD_Symbol_40)
      OpenAD_Symbol_317 = (OpenAD_Symbol_315 * OpenAD_Symbol_40)
      OpenAD_Symbol_318 = (OpenAD_Symbol_309 * OpenAD_Symbol_41)
      OpenAD_Symbol_319 = (OpenAD_Symbol_307 * OpenAD_Symbol_42)
      OpenAD_Symbol_320 = (OpenAD_Symbol_269 * OpenAD_Symbol_310)
      OpenAD_Symbol_321 = (OpenAD_Symbol_271 * OpenAD_Symbol_310)
      OpenAD_Symbol_322 = (OpenAD_Symbol_272 * OpenAD_Symbol_310)
      OpenAD_Symbol_323 = (OpenAD_Symbol_23 * OpenAD_Symbol_310)
      OpenAD_Symbol_324 = (OpenAD_Symbol_22 * OpenAD_Symbol_310)
      OpenAD_Symbol_325 = (OpenAD_Symbol_267 * OpenAD_Symbol_310)
      OpenAD_Symbol_326 = (OpenAD_Symbol_269 * OpenAD_Symbol_311)
      OpenAD_Symbol_327 = (OpenAD_Symbol_271 * OpenAD_Symbol_311)
      OpenAD_Symbol_328 = (OpenAD_Symbol_272 * OpenAD_Symbol_311)
      OpenAD_Symbol_329 = (OpenAD_Symbol_23 * OpenAD_Symbol_311)
      OpenAD_Symbol_330 = (OpenAD_Symbol_22 * OpenAD_Symbol_311)
      OpenAD_Symbol_331 = (OpenAD_Symbol_267 * OpenAD_Symbol_311)
      OpenAD_Symbol_332 = (OpenAD_Symbol_319 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_269 * OpenAD_Symbol_268)
      OpenAD_Symbol_333 = (OpenAD_Symbol_313 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_271 * OpenAD_Symbol_268)
      OpenAD_Symbol_334 = (OpenAD_Symbol_314 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_272 * OpenAD_Symbol_268)
      OpenAD_Symbol_335 = (OpenAD_Symbol_318 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_23 * OpenAD_Symbol_268)
      OpenAD_Symbol_336 = (OpenAD_Symbol_316 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_22 * OpenAD_Symbol_268)
      OpenAD_Symbol_337 = (OpenAD_Symbol_317 * OpenAD_Symbol_51 +
     >  OpenAD_Symbol_267 * OpenAD_Symbol_268)
      OpenAD_Symbol_338 = (OpenAD_Symbol_4 * OpenAD_Symbol_307)
      OpenAD_Symbol_339 = (OpenAD_Symbol_284 * OpenAD_Symbol_307)
      OpenAD_Symbol_340 = (OpenAD_Symbol_4 * OpenAD_Symbol_319)
      OpenAD_Symbol_341 = (OpenAD_Symbol_284 * OpenAD_Symbol_319)
      OpenAD_Symbol_342 = (OpenAD_Symbol_284 * OpenAD_Symbol_319)
      OpenAD_Symbol_343 = (OpenAD_Symbol_285 * OpenAD_Symbol_319)
      OpenAD_Symbol_344 = (OpenAD_Symbol_286 * OpenAD_Symbol_319)
      OpenAD_Symbol_345 = (OpenAD_Symbol_284 * OpenAD_Symbol_332)
      OpenAD_Symbol_346 = (OpenAD_Symbol_285 * OpenAD_Symbol_332)
      OpenAD_Symbol_347 = (OpenAD_Symbol_286 * OpenAD_Symbol_332)
      OpenAD_Symbol_348 = (OpenAD_Symbol_284 * OpenAD_Symbol_320)
      OpenAD_Symbol_349 = (OpenAD_Symbol_285 * OpenAD_Symbol_320)
      OpenAD_Symbol_350 = (OpenAD_Symbol_286 * OpenAD_Symbol_320)
      OpenAD_Symbol_351 = (OpenAD_Symbol_284 * OpenAD_Symbol_326)
      OpenAD_Symbol_352 = (OpenAD_Symbol_285 * OpenAD_Symbol_326)
      OpenAD_Symbol_353 = (OpenAD_Symbol_286 * OpenAD_Symbol_326)
      OpenAD_Symbol_354 = (INT((-1_w2f__i8)) * OpenAD_Symbol_338)
      OpenAD_Symbol_355 = (INT((-1_w2f__i8)) * OpenAD_Symbol_340)
      OpenAD_Symbol_356 = (2.0D00 * OpenAD_Symbol_338)
      OpenAD_Symbol_357 = (2.0D00 * OpenAD_Symbol_340)
      OpenAD_Symbol_358 = (OpenAD_Symbol_15 * OpenAD_Symbol_309)
      OpenAD_Symbol_359 = (OpenAD_Symbol_293 * OpenAD_Symbol_309)
      OpenAD_Symbol_360 = (OpenAD_Symbol_15 * OpenAD_Symbol_318)
      OpenAD_Symbol_361 = (OpenAD_Symbol_293 * OpenAD_Symbol_318)
      OpenAD_Symbol_362 = (OpenAD_Symbol_293 * OpenAD_Symbol_318)
      OpenAD_Symbol_363 = (OpenAD_Symbol_296 * OpenAD_Symbol_318)
      OpenAD_Symbol_364 = (OpenAD_Symbol_297 * OpenAD_Symbol_318)
      OpenAD_Symbol_365 = (OpenAD_Symbol_293 * OpenAD_Symbol_335)
      OpenAD_Symbol_366 = (OpenAD_Symbol_296 * OpenAD_Symbol_335)
      OpenAD_Symbol_367 = (OpenAD_Symbol_297 * OpenAD_Symbol_335)
      OpenAD_Symbol_368 = (OpenAD_Symbol_293 * OpenAD_Symbol_323)
      OpenAD_Symbol_369 = (OpenAD_Symbol_296 * OpenAD_Symbol_323)
      OpenAD_Symbol_370 = (OpenAD_Symbol_297 * OpenAD_Symbol_323)
      OpenAD_Symbol_371 = (OpenAD_Symbol_293 * OpenAD_Symbol_329)
      OpenAD_Symbol_372 = (OpenAD_Symbol_296 * OpenAD_Symbol_329)
      OpenAD_Symbol_373 = (OpenAD_Symbol_297 * OpenAD_Symbol_329)
      OpenAD_Symbol_374 = (INT((-1_w2f__i8)) * OpenAD_Symbol_358)
      OpenAD_Symbol_375 = (INT((-1_w2f__i8)) * OpenAD_Symbol_360)
      OpenAD_Symbol_376 = (2.0D00 * OpenAD_Symbol_358)
      OpenAD_Symbol_377 = (2.0D00 * OpenAD_Symbol_360)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_306)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_315)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_308)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_312)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_284)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_285)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_286)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_293)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_296)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_297)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_22)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_267)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_295)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_301)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_305)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_274)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_275)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_298)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_299)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_300)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_282)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_283)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_287)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_288)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_289)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_339)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_354)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_356)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_359)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_374)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_376)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_316)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_317)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_361)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_375)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_377)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_313)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_314)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_341)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_355)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_357)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_313)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_314)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_316)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_317)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_342)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_343)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_344)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_362)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_363)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_364)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_277)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_278)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_280)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_281)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_290)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_291)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_292)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_302)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_303)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_304)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_333)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_334)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_336)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_337)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_345)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_346)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_347)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_365)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_366)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_367)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_327)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_328)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_330)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_331)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_351)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_352)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_353)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_371)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_372)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_373)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_321)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_322)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_324)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_325)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_348)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_349)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_350)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_368)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_369)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_370)
      __value__(G) = (__value__(F) * __value__(LOC2))
      OpenAD_Symbol_73 = __value__(LOC2)
      OpenAD_Symbol_74 = __value__(F)
      __value__(F) = (__value__(LOC1) * 2.0D00)
      OpenAD_Symbol_75 = 2.0D00
      __value__(ADJ_M0) = (__value__(F) * __value__(MATR0) + __value__(
     > G) * __value__(MATR3))
      OpenAD_Symbol_79 = __value__(MATR0)
      OpenAD_Symbol_80 = __value__(F)
      OpenAD_Symbol_77 = 1_w2f__i8
      OpenAD_Symbol_81 = __value__(MATR3)
      OpenAD_Symbol_82 = __value__(G)
      OpenAD_Symbol_78 = 1_w2f__i8
      __value__(ADJ_M1) = (__value__(F) * __value__(MATR1) - __value__(
     > G) * __value__(MATR2))
      OpenAD_Symbol_85 = __value__(MATR1)
      OpenAD_Symbol_86 = __value__(F)
      OpenAD_Symbol_83 = 1_w2f__i8
      OpenAD_Symbol_87 = __value__(MATR2)
      OpenAD_Symbol_88 = __value__(G)
      OpenAD_Symbol_84 = (-1_w2f__i8)
      __value__(ADJ_M2) = (__value__(F) * __value__(MATR2) - __value__(
     > G) * __value__(MATR1))
      OpenAD_Symbol_91 = __value__(MATR2)
      OpenAD_Symbol_92 = __value__(F)
      OpenAD_Symbol_89 = 1_w2f__i8
      OpenAD_Symbol_93 = __value__(MATR1)
      OpenAD_Symbol_94 = __value__(G)
      OpenAD_Symbol_90 = (-1_w2f__i8)
      __value__(ADJ_M3) = (__value__(F) * __value__(MATR3) + __value__(
     > G) * __value__(MATR0))
      OpenAD_Symbol_97 = __value__(MATR3)
      OpenAD_Symbol_98 = __value__(F)
      OpenAD_Symbol_95 = 1_w2f__i8
      OpenAD_Symbol_99 = __value__(MATR0)
      OpenAD_Symbol_100 = __value__(G)
      OpenAD_Symbol_96 = 1_w2f__i8
      __value__(LOC1) = (__value__(ADJ_M1) * SQRT3)
      OpenAD_Symbol_101 = SQRT3
      __value__(G_OBJ0) = (-(__value__(ADJ_M0) + __value__(LOC1)))
      OpenAD_Symbol_104 = 1_w2f__i8
      OpenAD_Symbol_105 = 1_w2f__i8
      OpenAD_Symbol_103 = (-1_w2f__i8)
      __value__(G_OBJ1) = (__value__(ADJ_M0) - __value__(LOC1))
      OpenAD_Symbol_106 = 1_w2f__i8
      OpenAD_Symbol_107 = (-1_w2f__i8)
      __value__(G_OBJ2) = (__value__(LOC1) * 2.0D00)
      OpenAD_Symbol_108 = 2.0D00
      OpenAD_Symbol_378 = (OpenAD_Symbol_73 * OpenAD_Symbol_81)
      OpenAD_Symbol_379 = (OpenAD_Symbol_74 * OpenAD_Symbol_81)
      OpenAD_Symbol_380 = (OpenAD_Symbol_73 * OpenAD_Symbol_99)
      OpenAD_Symbol_381 = (OpenAD_Symbol_74 * OpenAD_Symbol_99)
      OpenAD_Symbol_382 = (OpenAD_Symbol_94 * INT((-1_w2f__i8)))
      OpenAD_Symbol_383 = (OpenAD_Symbol_73 * OpenAD_Symbol_93 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_384 = (OpenAD_Symbol_74 * OpenAD_Symbol_93 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_385 = (2.0D00 * OpenAD_Symbol_97)
      OpenAD_Symbol_386 = (2.0D00 * OpenAD_Symbol_91)
      OpenAD_Symbol_387 = (2.0D00 * OpenAD_Symbol_85)
      OpenAD_Symbol_388 = (OpenAD_Symbol_88 * INT((-1_w2f__i8)))
      OpenAD_Symbol_389 = (OpenAD_Symbol_73 * OpenAD_Symbol_87 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_390 = (OpenAD_Symbol_74 * OpenAD_Symbol_87 * INT((
     > -1_w2f__i8)))
      OpenAD_Symbol_391 = (2.0D00 * OpenAD_Symbol_79)
      OpenAD_Symbol_392 = (OpenAD_Symbol_80 * INT((-1_w2f__i8)))
      OpenAD_Symbol_393 = (OpenAD_Symbol_82 * INT((-1_w2f__i8)))
      OpenAD_Symbol_394 = (OpenAD_Symbol_101 * INT((-1_w2f__i8)))
      OpenAD_Symbol_395 = (OpenAD_Symbol_101 * 2.0D00)
      OpenAD_Symbol_396 = (OpenAD_Symbol_101 * INT((-1_w2f__i8)))
      OpenAD_Symbol_397 = (OpenAD_Symbol_86 * OpenAD_Symbol_394)
      OpenAD_Symbol_398 = (OpenAD_Symbol_86 * OpenAD_Symbol_395)
      OpenAD_Symbol_399 = (OpenAD_Symbol_86 * OpenAD_Symbol_396)
      OpenAD_Symbol_400 = (OpenAD_Symbol_391 + OpenAD_Symbol_387 *
     >  OpenAD_Symbol_394)
      OpenAD_Symbol_401 = (OpenAD_Symbol_387 * OpenAD_Symbol_395)
      OpenAD_Symbol_402 = (OpenAD_Symbol_391 * INT((-1_w2f__i8)) +
     >  OpenAD_Symbol_387 * OpenAD_Symbol_396)
      OpenAD_Symbol_403 = (OpenAD_Symbol_388 * OpenAD_Symbol_394)
      OpenAD_Symbol_404 = (OpenAD_Symbol_388 * OpenAD_Symbol_395)
      OpenAD_Symbol_405 = (OpenAD_Symbol_388 * OpenAD_Symbol_396)
      OpenAD_Symbol_406 = (OpenAD_Symbol_378 + OpenAD_Symbol_389 *
     >  OpenAD_Symbol_394)
      OpenAD_Symbol_407 = (OpenAD_Symbol_389 * OpenAD_Symbol_395)
      OpenAD_Symbol_408 = (OpenAD_Symbol_378 * INT((-1_w2f__i8)) +
     >  OpenAD_Symbol_389 * OpenAD_Symbol_396)
      OpenAD_Symbol_409 = (OpenAD_Symbol_379 + OpenAD_Symbol_390 *
     >  OpenAD_Symbol_394)
      OpenAD_Symbol_410 = (OpenAD_Symbol_390 * OpenAD_Symbol_395)
      OpenAD_Symbol_411 = (OpenAD_Symbol_379 * INT((-1_w2f__i8)) +
     >  OpenAD_Symbol_390 * OpenAD_Symbol_396)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_382)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_383)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_384)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_92)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_386)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_100)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_380)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_381)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_98)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_385)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_80)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_82)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_397)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_400)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_403)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_406)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_409)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_398)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_401)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_404)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_407)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_410)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_392)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_393)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_399)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_402)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_405)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_408)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_411)
      __value__(LOC1) = (__value__(ADJ_M3) * SQRT3)
      OpenAD_Symbol_110 = SQRT3
      __value__(G_OBJ3) = (-(__value__(ADJ_M2) + __value__(LOC1)))
      OpenAD_Symbol_113 = 1_w2f__i8
      OpenAD_Symbol_114 = 1_w2f__i8
      OpenAD_Symbol_112 = (-1_w2f__i8)
      __value__(G_OBJ4) = (__value__(ADJ_M2) - __value__(LOC1))
      OpenAD_Symbol_115 = 1_w2f__i8
      OpenAD_Symbol_116 = (-1_w2f__i8)
      __value__(G_OBJ5) = (__value__(LOC1) * 2.0D00)
      OpenAD_Symbol_117 = 2.0D00
      OpenAD_Symbol_121 = (__value__(LOC2) * 2.0D00)
      OpenAD_Symbol_119 = 2.0D00
      __value__(LOC2) = OpenAD_Symbol_121
      __value__(R00) = (__value__(D00) * __value__(LOC2) + __value__(GG
     > ) * __value__(M33))
      OpenAD_Symbol_124 = __value__(LOC2)
      OpenAD_Symbol_125 = __value__(D00)
      OpenAD_Symbol_122 = 1_w2f__i8
      OpenAD_Symbol_126 = __value__(M33)
      OpenAD_Symbol_127 = __value__(GG)
      OpenAD_Symbol_123 = 1_w2f__i8
      __value__(R11) = (__value__(D11) * __value__(LOC2) + __value__(GG
     > ) * __value__(M22))
      OpenAD_Symbol_130 = __value__(LOC2)
      OpenAD_Symbol_131 = __value__(D11)
      OpenAD_Symbol_128 = 1_w2f__i8
      OpenAD_Symbol_132 = __value__(M22)
      OpenAD_Symbol_133 = __value__(GG)
      OpenAD_Symbol_129 = 1_w2f__i8
      R22 = (__value__(D11) * __value__(LOC2) + __value__(GG) *
     >  __value__(M11))
      R33 = (__value__(D00) * __value__(LOC2) + __value__(GG) *
     >  __value__(M00))
      __value__(M01) = (__value__(MATR0) * __value__(MATR1))
      OpenAD_Symbol_134 = __value__(MATR1)
      OpenAD_Symbol_135 = __value__(MATR0)
      __value__(M02) = (__value__(MATR0) * __value__(MATR2))
      OpenAD_Symbol_136 = __value__(MATR2)
      OpenAD_Symbol_137 = __value__(MATR0)
      __value__(M12) = (__value__(MATR1) * __value__(MATR2))
      OpenAD_Symbol_138 = __value__(MATR2)
      OpenAD_Symbol_139 = __value__(MATR1)
      __value__(M13) = (__value__(MATR1) * __value__(MATR3))
      OpenAD_Symbol_140 = __value__(MATR3)
      OpenAD_Symbol_141 = __value__(MATR1)
      __value__(M23) = (__value__(MATR2) * __value__(MATR3))
      OpenAD_Symbol_142 = __value__(MATR3)
      OpenAD_Symbol_143 = __value__(MATR2)
      OpenAD_Symbol_144 = (__value__(M02) + __value__(M13))
      __value__(D01) = (__value__(LOC2) * OpenAD_Symbol_144)
      OpenAD_Symbol_145 = OpenAD_Symbol_144
      OpenAD_Symbol_147 = 1_w2f__i8
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_146 = __value__(LOC2)
      OpenAD_Symbol_412 = (OpenAD_Symbol_110 * INT((-1_w2f__i8)))
      OpenAD_Symbol_413 = (OpenAD_Symbol_110 * 2.0D00)
      OpenAD_Symbol_414 = (OpenAD_Symbol_136 * OpenAD_Symbol_146)
      OpenAD_Symbol_415 = (OpenAD_Symbol_137 * OpenAD_Symbol_146)
      OpenAD_Symbol_416 = (OpenAD_Symbol_140 * OpenAD_Symbol_146)
      OpenAD_Symbol_417 = (OpenAD_Symbol_141 * OpenAD_Symbol_146)
      OpenAD_Symbol_418 = (2.0D00 * OpenAD_Symbol_131)
      OpenAD_Symbol_419 = (2.0D00 * OpenAD_Symbol_125)
      OpenAD_Symbol_420 = (2.0D00 * OpenAD_Symbol_145)
      OpenAD_Symbol_421 = (OpenAD_Symbol_110 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_412)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_413)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_134)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_135)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_136)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_137)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_138)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_139)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_140)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_141)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_142)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_143)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_421)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_126)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_124)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_127)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_419)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_132)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_130)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_133)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_418)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_414)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_415)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_416)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_417)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_420)
      __value__(LOC1) = (__value__(R11) * THIRD)
      OpenAD_Symbol_149 = THIRD
      OpenAD_Symbol_151 = (__value__(D01) + __value__(GG) * __value__(
     > M23))
      __value__(F) = (TWOSQRT3 * OpenAD_Symbol_151)
      OpenAD_Symbol_154 = 1_w2f__i8
      OpenAD_Symbol_156 = __value__(M23)
      OpenAD_Symbol_157 = __value__(GG)
      OpenAD_Symbol_155 = 1_w2f__i8
      OpenAD_Symbol_153 = TWOSQRT3
      __value__(G) = (__value__(LOC1) + __value__(R00))
      OpenAD_Symbol_158 = 1_w2f__i8
      OpenAD_Symbol_159 = 1_w2f__i8
      __value__(H_OBJ1) = (__value__(LOC1) - __value__(R00))
      OpenAD_Symbol_160 = 1_w2f__i8
      OpenAD_Symbol_161 = (-1_w2f__i8)
      __value__(H_OBJ0) = (__value__(F) + __value__(G))
      OpenAD_Symbol_162 = 1_w2f__i8
      OpenAD_Symbol_163 = 1_w2f__i8
      __value__(H_OBJ3) = (__value__(G) - __value__(F))
      OpenAD_Symbol_164 = 1_w2f__i8
      OpenAD_Symbol_165 = (-1_w2f__i8)
      OpenAD_Symbol_423 = (OpenAD_Symbol_156 * OpenAD_Symbol_153)
      OpenAD_Symbol_424 = (OpenAD_Symbol_157 * OpenAD_Symbol_153)
      OpenAD_Symbol_425 = (OpenAD_Symbol_153 * INT((-1_w2f__i8)))
      OpenAD_Symbol_426 = (OpenAD_Symbol_423 * INT((-1_w2f__i8)))
      OpenAD_Symbol_427 = (OpenAD_Symbol_424 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_149)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_153)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_423)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_424)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_149)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_153)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_423)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_424)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_149)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_425)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_426)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_427)
      __value__(LOC1) = (-(__value__(R11) * TWO3RD))
      OpenAD_Symbol_167 = TWO3RD
      OpenAD_Symbol_166 = (-1_w2f__i8)
      __value__(H_OBJ2) = (__value__(LOC1) - __value__(F))
      OpenAD_Symbol_169 = 1_w2f__i8
      OpenAD_Symbol_170 = (-1_w2f__i8)
      __value__(H_OBJ4) = (__value__(F) + __value__(LOC1))
      OpenAD_Symbol_171 = 1_w2f__i8
      OpenAD_Symbol_172 = 1_w2f__i8
      __value__(H_OBJ5) = (FOUR3RD * __value__(R11))
      OpenAD_Symbol_174 = FOUR3RD
      OpenAD_Symbol_428 = (OpenAD_Symbol_167 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_174)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_428)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_428)
      __value__(LOC1) = (__value__(R00) * THIRD)
      OpenAD_Symbol_175 = THIRD
      OpenAD_Symbol_177 = (__value__(D01) + __value__(GG) * __value__(
     > M01))
      __value__(F) = (TWOSQRT3 * OpenAD_Symbol_177)
      OpenAD_Symbol_180 = 1_w2f__i8
      OpenAD_Symbol_182 = __value__(M01)
      OpenAD_Symbol_183 = __value__(GG)
      OpenAD_Symbol_181 = 1_w2f__i8
      OpenAD_Symbol_179 = TWOSQRT3
      __value__(G) = (__value__(LOC1) + __value__(R11))
      OpenAD_Symbol_184 = 1_w2f__i8
      OpenAD_Symbol_185 = 1_w2f__i8
      __value__(H_OBJ16) = (__value__(LOC1) - __value__(R11))
      OpenAD_Symbol_186 = 1_w2f__i8
      OpenAD_Symbol_187 = (-1_w2f__i8)
      __value__(H_OBJ15) = (__value__(F) + __value__(G))
      OpenAD_Symbol_188 = 1_w2f__i8
      OpenAD_Symbol_189 = 1_w2f__i8
      __value__(H_OBJ18) = (__value__(G) - __value__(F))
      OpenAD_Symbol_190 = 1_w2f__i8
      OpenAD_Symbol_191 = (-1_w2f__i8)
      OpenAD_Symbol_429 = (OpenAD_Symbol_182 * OpenAD_Symbol_179)
      OpenAD_Symbol_430 = (OpenAD_Symbol_183 * OpenAD_Symbol_179)
      OpenAD_Symbol_431 = (OpenAD_Symbol_179 * INT((-1_w2f__i8)))
      OpenAD_Symbol_432 = (OpenAD_Symbol_429 * INT((-1_w2f__i8)))
      OpenAD_Symbol_433 = (OpenAD_Symbol_430 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_175)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_179)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_429)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_430)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_175)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_179)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_429)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_430)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_175)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_431)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_432)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_433)
      __value__(LOC1) = (-(__value__(R00) * TWO3RD))
      OpenAD_Symbol_193 = TWO3RD
      OpenAD_Symbol_192 = (-1_w2f__i8)
      __value__(H_OBJ17) = (__value__(LOC1) - __value__(F))
      OpenAD_Symbol_195 = 1_w2f__i8
      OpenAD_Symbol_196 = (-1_w2f__i8)
      __value__(H_OBJ19) = (__value__(F) + __value__(LOC1))
      OpenAD_Symbol_197 = 1_w2f__i8
      OpenAD_Symbol_198 = 1_w2f__i8
      __value__(H_OBJ20) = (FOUR3RD * __value__(R00))
      OpenAD_Symbol_200 = FOUR3RD
      OpenAD_Symbol_434 = (OpenAD_Symbol_193 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_200)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_434)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_434)
      OpenAD_Symbol_201 = (__value__(M01) + __value__(M23))
      __value__(LOC1) = (__value__(LOC2) * OpenAD_Symbol_201)
      OpenAD_Symbol_202 = OpenAD_Symbol_201
      OpenAD_Symbol_204 = 1_w2f__i8
      OpenAD_Symbol_205 = 1_w2f__i8
      OpenAD_Symbol_203 = __value__(LOC2)
      __value__(R13) = (__value__(LOC1) + __value__(GG) * __value__(M02
     > ))
      OpenAD_Symbol_206 = 1_w2f__i8
      OpenAD_Symbol_208 = __value__(M02)
      OpenAD_Symbol_209 = __value__(GG)
      OpenAD_Symbol_207 = 1_w2f__i8
      __value__(R02) = (__value__(LOC1) + __value__(GG) * __value__(M13
     > ))
      OpenAD_Symbol_210 = 1_w2f__i8
      OpenAD_Symbol_212 = __value__(M13)
      OpenAD_Symbol_213 = __value__(GG)
      OpenAD_Symbol_211 = 1_w2f__i8
      __value__(R03) = (__value__(D03) * __value__(LOC2) + __value__(GG
     > ) * __value__(M03))
      OpenAD_Symbol_216 = __value__(LOC2)
      OpenAD_Symbol_217 = __value__(D03)
      OpenAD_Symbol_214 = 1_w2f__i8
      OpenAD_Symbol_218 = __value__(M03)
      OpenAD_Symbol_219 = __value__(GG)
      OpenAD_Symbol_215 = 1_w2f__i8
      __value__(R12) = (__value__(D12) * __value__(LOC2) + __value__(GG
     > ) * __value__(M12))
      OpenAD_Symbol_222 = __value__(LOC2)
      OpenAD_Symbol_223 = __value__(D12)
      OpenAD_Symbol_220 = 1_w2f__i8
      OpenAD_Symbol_224 = __value__(M12)
      OpenAD_Symbol_225 = __value__(GG)
      OpenAD_Symbol_221 = 1_w2f__i8
      __value__(G) = (-(__value__(R13) * TWO3RD))
      OpenAD_Symbol_227 = TWO3RD
      OpenAD_Symbol_226 = (-1_w2f__i8)
      __value__(F) = (__value__(R03) * TWOSQRT3)
      OpenAD_Symbol_229 = TWOSQRT3
      __value__(H_OBJ8) = (__value__(G) - __value__(F))
      OpenAD_Symbol_231 = 1_w2f__i8
      OpenAD_Symbol_232 = (-1_w2f__i8)
      __value__(H_OBJ11) = (__value__(F) + __value__(G))
      OpenAD_Symbol_233 = 1_w2f__i8
      OpenAD_Symbol_234 = 1_w2f__i8
      OpenAD_Symbol_435 = (OpenAD_Symbol_227 * INT((-1_w2f__i8)))
      OpenAD_Symbol_436 = (OpenAD_Symbol_229 * INT((-1_w2f__i8)))
      OpenAD_Symbol_437 = (OpenAD_Symbol_219 * OpenAD_Symbol_436)
      OpenAD_Symbol_438 = (OpenAD_Symbol_216 * OpenAD_Symbol_436)
      OpenAD_Symbol_439 = (OpenAD_Symbol_219 * OpenAD_Symbol_229)
      OpenAD_Symbol_440 = (OpenAD_Symbol_216 * OpenAD_Symbol_229)
      OpenAD_Symbol_441 = (OpenAD_Symbol_208 * OpenAD_Symbol_435)
      OpenAD_Symbol_442 = (OpenAD_Symbol_209 * OpenAD_Symbol_435)
      OpenAD_Symbol_443 = (OpenAD_Symbol_202 * OpenAD_Symbol_435)
      OpenAD_Symbol_444 = (OpenAD_Symbol_203 * OpenAD_Symbol_435)
      OpenAD_Symbol_445 = (OpenAD_Symbol_203 * OpenAD_Symbol_435)
      OpenAD_Symbol_446 = (OpenAD_Symbol_218 * OpenAD_Symbol_436 +
     >  OpenAD_Symbol_441)
      OpenAD_Symbol_447 = (OpenAD_Symbol_217 * OpenAD_Symbol_436 +
     >  OpenAD_Symbol_443)
      OpenAD_Symbol_448 = (OpenAD_Symbol_218 * OpenAD_Symbol_229 +
     >  OpenAD_Symbol_441)
      OpenAD_Symbol_449 = (OpenAD_Symbol_217 * OpenAD_Symbol_229 +
     >  OpenAD_Symbol_443)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_208)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_209)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_202)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_212)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_213)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_202)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_218)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_219)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_216)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_217)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_224)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_222)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_225)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_223)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_441)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_442)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_443)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_444)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_445)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_437)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_438)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_446)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_442)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_447)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_444)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_445)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_439)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_440)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_448)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_442)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_449)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_444)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_445)
      __value__(F) = (__value__(R12) * TWOSQRT3)
      OpenAD_Symbol_235 = TWOSQRT3
      __value__(H_OBJ12) = (__value__(G) - __value__(F))
      OpenAD_Symbol_237 = 1_w2f__i8
      OpenAD_Symbol_238 = (-1_w2f__i8)
      __value__(H_OBJ13) = (__value__(F) + __value__(G))
      OpenAD_Symbol_239 = 1_w2f__i8
      OpenAD_Symbol_240 = 1_w2f__i8
      __value__(H_OBJ14) = (__value__(R13) * 1.2D+01)
      OpenAD_Symbol_241 = 1.2D+01
      __value__(G) = (FOUR3RD * __value__(R02))
      OpenAD_Symbol_244 = FOUR3RD
      OpenAD_Symbol_450 = (OpenAD_Symbol_235 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_450)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_235)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_244)
      OpenAD_Symbol_245 = (__value__(R03) + __value__(R12))
      __value__(F) = (SQRT3 * OpenAD_Symbol_245)
      OpenAD_Symbol_248 = 1_w2f__i8
      OpenAD_Symbol_249 = 1_w2f__i8
      OpenAD_Symbol_247 = SQRT3
      __value__(H_OBJ10) = (__value__(G) - __value__(F))
      OpenAD_Symbol_250 = 1_w2f__i8
      OpenAD_Symbol_251 = (-1_w2f__i8)
      __value__(H_OBJ6) = (__value__(F) + __value__(G))
      OpenAD_Symbol_252 = 1_w2f__i8
      OpenAD_Symbol_253 = 1_w2f__i8
      __value__(G) = (__value__(R02) * TWO3RD)
      OpenAD_Symbol_254 = TWO3RD
      OpenAD_Symbol_452 = (OpenAD_Symbol_247 * INT((-1_w2f__i8)))
      OpenAD_Symbol_453 = (OpenAD_Symbol_247 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_254)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_452)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_453)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
      OpenAD_Symbol_256 = (__value__(R03) - __value__(R12))
      __value__(F) = (SQRT3 * OpenAD_Symbol_256)
      OpenAD_Symbol_259 = 1_w2f__i8
      OpenAD_Symbol_260 = (-1_w2f__i8)
      OpenAD_Symbol_258 = SQRT3
      __value__(H_OBJ9) = (__value__(G) - __value__(F))
      OpenAD_Symbol_261 = 1_w2f__i8
      OpenAD_Symbol_262 = (-1_w2f__i8)
      __value__(H_OBJ7) = (__value__(F) + __value__(G))
      OpenAD_Symbol_263 = 1_w2f__i8
      OpenAD_Symbol_264 = 1_w2f__i8
      OpenAD_Symbol_455 = (INT((-1_w2f__i8)) * OpenAD_Symbol_258)
      OpenAD_Symbol_456 = (OpenAD_Symbol_258 * INT((-1_w2f__i8)))
      OpenAD_Symbol_457 = (OpenAD_Symbol_455 * INT((-1_w2f__i8)))
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_456)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_457)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_258)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_455)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ7), __deriv__(G))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_458)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_458, __deriv__(H_OBJ7), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_459)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_459, __deriv__(H_OBJ7), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ7))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ9), __deriv__(G))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_460)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_460, __deriv__(H_OBJ9), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_461)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_461, __deriv__(H_OBJ9), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ9))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ6), __deriv__(
     > OpenAD_Symbol_454))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_462)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_462, __deriv__(H_OBJ6), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_463)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_463, __deriv__(H_OBJ6), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ6))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ10), __deriv__(
     > OpenAD_Symbol_454))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_464)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_464, __deriv__(H_OBJ10), __deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_465)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_465, __deriv__(H_OBJ10), __deriv__(R03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ10))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_466)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_466, __deriv__(G), __deriv__(R02))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_454), __deriv__(G))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_454))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_467)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_467, __deriv__(G), __deriv__(R02))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1.2D+01, __deriv__(H_OBJ14), __deriv__(R13))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ14))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ13), __deriv__(
     > OpenAD_Symbol_451))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_468)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_468, __deriv__(H_OBJ13), __deriv__(R12))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ13))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ12), __deriv__(
     > OpenAD_Symbol_451))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_469)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_469, __deriv__(H_OBJ12), __deriv__(R12))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ12))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_451), __deriv__(G))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_451))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_470)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_470, __deriv__(H_OBJ11), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_471)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_471, __deriv__(H_OBJ11), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_472)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_472, __deriv__(H_OBJ11), __deriv__(LOC2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_473)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_473, __deriv__(H_OBJ11), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_474)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_474, __deriv__(H_OBJ11), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_475)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_475, __deriv__(H_OBJ11), __deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_476)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_476, __deriv__(H_OBJ11), __deriv__(M03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_477)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_477, __deriv__(H_OBJ8), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_478)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_478, __deriv__(H_OBJ8), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_479)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_479, __deriv__(H_OBJ8), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_480)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_480, __deriv__(H_OBJ8), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_481)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_481, __deriv__(H_OBJ8), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_482)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_482, __deriv__(H_OBJ8), __deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_483)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_483, __deriv__(H_OBJ8), __deriv__(M03))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ8))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_484)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_484, __deriv__(G), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_485)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_485, __deriv__(G), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_486)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_486, __deriv__(G), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_487)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_487, __deriv__(G), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_488)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_488, __deriv__(G), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_489)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_489, __deriv__(R12), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_490)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_490, __deriv__(R12), __deriv__(M12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_491)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_491, __deriv__(R12), __deriv__(D12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_492)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_492, __deriv__(R12), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_493)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_493, __deriv__(R03), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_494)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_494, __deriv__(R03), __deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_495)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_495, __deriv__(R03), __deriv__(M03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_496)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_496, __deriv__(R03), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_497)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_497, __deriv__(R02), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_498)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_498, __deriv__(R02), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_499)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_499, __deriv__(R02), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_500)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_500, __deriv__(R02), __deriv__(M13))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_501)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_501, __deriv__(R02), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_502)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_502, __deriv__(R13), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_503)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_503, __deriv__(R13), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_504)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_504, __deriv__(R13), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_505)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_505, __deriv__(R13), __deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_506)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_506, __deriv__(R13), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R13))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ19), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_507)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_507, __deriv__(H_OBJ19), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ19))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ17), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_508)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_508, __deriv__(H_OBJ17), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ17))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_509)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_509, __deriv__(H_OBJ20), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ20))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_510)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_510, __deriv__(H_OBJ18), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_511)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_511, __deriv__(H_OBJ18), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_512)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_512, __deriv__(H_OBJ18), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ18), __deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_513)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_513, __deriv__(H_OBJ18), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ18))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_514)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_514, __deriv__(H_OBJ15), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_515)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_515, __deriv__(H_OBJ15), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_516)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_516, __deriv__(H_OBJ15), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ15), __deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_517)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_517, __deriv__(H_OBJ15), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ15))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_518)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_518, __deriv__(F), __deriv__(M01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_519)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_519, __deriv__(F), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_520)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_520, __deriv__(F), __deriv__(D01))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ16), __deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_521)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_521, __deriv__(H_OBJ16), __deriv__(R00))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ16))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ4), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_522)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_522, __deriv__(H_OBJ4), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ4))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ2), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_523)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_523, __deriv__(H_OBJ2), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_524)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_524, __deriv__(H_OBJ5), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_525)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_525, __deriv__(H_OBJ3), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_526)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_526, __deriv__(H_OBJ3), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_527)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_527, __deriv__(H_OBJ3), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ3), __deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_528)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_528, __deriv__(H_OBJ3), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_529)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_529, __deriv__(H_OBJ0), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_530)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_530, __deriv__(H_OBJ0), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_531)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_531, __deriv__(H_OBJ0), __deriv__(D01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(H_OBJ0), __deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_532)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_532, __deriv__(H_OBJ0), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_533)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_533, __deriv__(F), __deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_534)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_534, __deriv__(F), __deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_535)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_535, __deriv__(F), __deriv__(D01))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(H_OBJ1), __deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_536)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_536, __deriv__(H_OBJ1), __deriv__(R11))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(H_OBJ1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_537)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_537, __deriv__(D01), __deriv__(
     > OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_538)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_538, __deriv__(D01), __deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_539)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_539, __deriv__(D01), __deriv__(MATR1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_540)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_540, __deriv__(D01), __deriv__(MATR2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_541)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_541, __deriv__(D01), __deriv__(MATR0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D01))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_542)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_542, __deriv__(R11), __deriv__(
     > OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_543)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_543, __deriv__(R11), __deriv__(M22))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_544)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_544, __deriv__(R11), __deriv__(D11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_545)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_545, __deriv__(R11), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_546)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_546, __deriv__(R00), __deriv__(
     > OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_547)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_547, __deriv__(R00), __deriv__(M33))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_548)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_548, __deriv__(R00), __deriv__(D00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_549)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_549, __deriv__(R00), __deriv__(GG))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(R00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_550)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_550, __deriv__(G_OBJ3), __deriv__(ADJ_M3
     > ))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(G_OBJ3), __deriv__(ADJ_M2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_551)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_551, __deriv__(M23), __deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_552)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_552, __deriv__(M23), __deriv__(MATR2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M23))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_553)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_553, __deriv__(M13), __deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_554)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_554, __deriv__(M13), __deriv__(MATR1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M13))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_555)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_555, __deriv__(M12), __deriv__(MATR2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_556)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_556, __deriv__(M12), __deriv__(MATR1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_557)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_557, __deriv__(M02), __deriv__(MATR2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_558)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_558, __deriv__(M02), __deriv__(MATR0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M02))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_559)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_559, __deriv__(M01), __deriv__(MATR1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_560)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_560, __deriv__(M01), __deriv__(MATR0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M01))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(2.0D00, __deriv__(LOC2), __deriv__(OpenAD_Symbol_422))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_561)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_561, __deriv__(G_OBJ5), __deriv__(ADJ_M3
     > ))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ5))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(G_OBJ4), __deriv__(ADJ_M2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_562)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_562, __deriv__(G_OBJ4), __deriv__(ADJ_M3
     > ))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ4))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_422), __deriv__(LOC2))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_422))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_563)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_563, __deriv__(G_OBJ0), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_564)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_564, __deriv__(G_OBJ0), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_565)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_565, __deriv__(G_OBJ0), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_566)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_566, __deriv__(G_OBJ0), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_567)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_567, __deriv__(G_OBJ0), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_568)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_568, __deriv__(G_OBJ0), __deriv__(MATR3)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_569)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_569, __deriv__(G_OBJ0), __deriv__(MATR0)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_570)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_570, __deriv__(G_OBJ2), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_571)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_571, __deriv__(G_OBJ2), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_572)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_572, __deriv__(G_OBJ2), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_573)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_573, __deriv__(G_OBJ2), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_574)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_574, __deriv__(G_OBJ2), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_575)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_575, __deriv__(G_OBJ1), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_576)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_576, __deriv__(G_OBJ1), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_577)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_577, __deriv__(G_OBJ1), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_578)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_578, __deriv__(G_OBJ1), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_579)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_579, __deriv__(G_OBJ1), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_580)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_580, __deriv__(G_OBJ1), __deriv__(MATR3)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_581)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_581, __deriv__(G_OBJ1), __deriv__(MATR0)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(G_OBJ1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_582)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_582, __deriv__(ADJ_M3), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_583)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_583, __deriv__(ADJ_M3), __deriv__(MATR3)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_584)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_584, __deriv__(ADJ_M3), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_585)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_585, __deriv__(ADJ_M3), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_586)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_586, __deriv__(ADJ_M3), __deriv__(MATR0)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(ADJ_M3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_587)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_587, __deriv__(ADJ_M2), __deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_588)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_588, __deriv__(ADJ_M2), __deriv__(MATR2)
     > )
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_589)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_589, __deriv__(ADJ_M2), __deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_590)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_590, __deriv__(ADJ_M2), __deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_591)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_591, __deriv__(ADJ_M2), __deriv__(MATR1)
     > )
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(ADJ_M2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_592)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_592, __deriv__(GG), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_593)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_593, __deriv__(GG), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_594)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_594, __deriv__(GG), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_595)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_595, __deriv__(GG), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_596)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_596, __deriv__(GG), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_597)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_597, __deriv__(GG), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_598)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_598, __deriv__(GG), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_599)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_599, __deriv__(GG), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_600)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_600, __deriv__(GG), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_601)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_601, __deriv__(GG), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(GG))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_602)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_602, __deriv__(LOC2), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_603)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_603, __deriv__(LOC2), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_604)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_604, __deriv__(LOC2), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_605)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_605, __deriv__(LOC2), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_606)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_606, __deriv__(LOC2), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_607)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_607, __deriv__(LOC2), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_608)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_608, __deriv__(LOC2), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_609)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_609, __deriv__(LOC2), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_610)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_610, __deriv__(LOC2), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_611)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_611, __deriv__(LOC2), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(LOC2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_612)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_612, __deriv__(OBJ), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_613)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_613, __deriv__(OBJ), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_614)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_614, __deriv__(OBJ), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_615)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_615, __deriv__(OBJ), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_616)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_616, __deriv__(OBJ), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_617)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_617, __deriv__(OBJ), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_618)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_618, __deriv__(OBJ), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_619)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_619, __deriv__(OBJ), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_620)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_620, __deriv__(OBJ), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_621)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_621, __deriv__(OBJ), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OBJ))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_622)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_622, __deriv__(LOC1), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_623)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_623, __deriv__(LOC1), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_624)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_624, __deriv__(LOC1), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_625)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_625, __deriv__(LOC1), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_626)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_626, __deriv__(LOC1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_627)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_627, __deriv__(LOC1), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_628)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_628, __deriv__(LOC1), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_629)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_629, __deriv__(LOC1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_630)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_630, __deriv__(LOC1), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_631)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_631, __deriv__(LOC1), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(LOC1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_632)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_632, __deriv__(F), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_633)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_633, __deriv__(F), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_634)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_634, __deriv__(F), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_635)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_635, __deriv__(F), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_636)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_636, __deriv__(F), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_637)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_637, __deriv__(F), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_638)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_638, __deriv__(F), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_639)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_639, __deriv__(F), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_640)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_640, __deriv__(F), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_641)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_641, __deriv__(F), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(F))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_642)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_642, __deriv__(D03), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_643)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_643, __deriv__(D03), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_644)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_644, __deriv__(D03), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_645)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_645, __deriv__(D03), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_646)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_646, __deriv__(D03), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_647)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_647, __deriv__(D12), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_648)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_648, __deriv__(D12), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_649)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_649, __deriv__(D12), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_650)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_650, __deriv__(D12), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_651)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_651, __deriv__(D12), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D12))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_652)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_652, __deriv__(M33), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_653)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_653, __deriv__(M33), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_654)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_654, __deriv__(M33), __deriv__(X3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M33))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_655)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_655, __deriv__(M11), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_656)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_656, __deriv__(M11), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_657)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_657, __deriv__(M11), __deriv__(X0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_658)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_658, __deriv__(D11), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_659)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_659, __deriv__(D11), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_660)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_660, __deriv__(D11), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_661)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_661, __deriv__(D11), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_662)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_662, __deriv__(D11), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D11))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_663)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_663, __deriv__(D00), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_664)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_664, __deriv__(D00), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_665)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_665, __deriv__(D00), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_666)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_666, __deriv__(D00), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_667)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_667, __deriv__(D00), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(D00))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_668)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_668, __deriv__(M03), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_669)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_669, __deriv__(M03), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_670)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_670, __deriv__(M03), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_671)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_671, __deriv__(M03), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_672)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_672, __deriv__(M03), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M03))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_673)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_673, __deriv__(MATR3), __deriv__(X5))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_674)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_674, __deriv__(MATR3), __deriv__(X4))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_675)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_675, __deriv__(MATR3), __deriv__(X3))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_676)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_676, __deriv__(MATR1), __deriv__(X2))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_677)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_677, __deriv__(MATR1), __deriv__(X1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_678)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_678, __deriv__(MATR1), __deriv__(X0))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR1))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_679)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_679, __deriv__(M22), __deriv__(X3))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_680)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_680, __deriv__(M22), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M22))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_681)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_681, __deriv__(M00), __deriv__(X0))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_682)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_682, __deriv__(M00), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(M00))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR2), __deriv__(X3))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR2), __deriv__(X4))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR2))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(-1_w2f__i8, __deriv__(MATR0), __deriv__(X0))
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(1_w2f__i8, __deriv__(MATR0), __deriv__(X1))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(MATR0))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
