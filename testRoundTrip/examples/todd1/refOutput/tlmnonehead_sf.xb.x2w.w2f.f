
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
      CALL sax(1_w2f__i8, __deriv__(X1), __deriv__(MATR0))
      CALL saxpy(-1_w2f__i8, __deriv__(X0), __deriv__(MATR0))
      CALL sax(1_w2f__i8, __deriv__(X4), __deriv__(MATR2))
      CALL saxpy(-1_w2f__i8, __deriv__(X3), __deriv__(MATR2))
      CALL sax(OpenAD_Symbol_306, __deriv__(X1), __deriv__(M00))
      CALL saxpy(OpenAD_Symbol_315, __deriv__(X0), __deriv__(M00))
      CALL sax(OpenAD_Symbol_308, __deriv__(X4), __deriv__(M22))
      CALL saxpy(OpenAD_Symbol_312, __deriv__(X3), __deriv__(M22))
      CALL sax(OpenAD_Symbol_284, __deriv__(X0), __deriv__(MATR1))
      CALL saxpy(OpenAD_Symbol_285, __deriv__(X1), __deriv__(MATR1))
      CALL saxpy(OpenAD_Symbol_286, __deriv__(X2), __deriv__(MATR1))
      CALL sax(OpenAD_Symbol_293, __deriv__(X3), __deriv__(MATR3))
      CALL saxpy(OpenAD_Symbol_296, __deriv__(X4), __deriv__(MATR3))
      CALL saxpy(OpenAD_Symbol_297, __deriv__(X5), __deriv__(MATR3))
      CALL sax(OpenAD_Symbol_22, __deriv__(X1), __deriv__(M03))
      CALL saxpy(OpenAD_Symbol_267, __deriv__(X0), __deriv__(M03))
      CALL saxpy(OpenAD_Symbol_295, __deriv__(X3), __deriv__(M03))
      CALL saxpy(OpenAD_Symbol_301, __deriv__(X4), __deriv__(M03))
      CALL saxpy(OpenAD_Symbol_305, __deriv__(X5), __deriv__(M03))
      CALL sax(OpenAD_Symbol_274, __deriv__(X1), __deriv__(D00))
      CALL saxpy(OpenAD_Symbol_275, __deriv__(X0), __deriv__(D00))
      CALL saxpy(OpenAD_Symbol_298, __deriv__(X3), __deriv__(D00))
      CALL saxpy(OpenAD_Symbol_299, __deriv__(X4), __deriv__(D00))
      CALL saxpy(OpenAD_Symbol_300, __deriv__(X5), __deriv__(D00))
      CALL sax(OpenAD_Symbol_282, __deriv__(X4), __deriv__(D11))
      CALL saxpy(OpenAD_Symbol_283, __deriv__(X3), __deriv__(D11))
      CALL saxpy(OpenAD_Symbol_287, __deriv__(X0), __deriv__(D11))
      CALL saxpy(OpenAD_Symbol_288, __deriv__(X1), __deriv__(D11))
      CALL saxpy(OpenAD_Symbol_289, __deriv__(X2), __deriv__(D11))
      CALL sax(OpenAD_Symbol_339, __deriv__(X0), __deriv__(M11))
      CALL saxpy(OpenAD_Symbol_354, __deriv__(X1), __deriv__(M11))
      CALL saxpy(OpenAD_Symbol_356, __deriv__(X2), __deriv__(M11))
      CALL sax(OpenAD_Symbol_359, __deriv__(X3), __deriv__(M33))
      CALL saxpy(OpenAD_Symbol_374, __deriv__(X4), __deriv__(M33))
      CALL saxpy(OpenAD_Symbol_376, __deriv__(X5), __deriv__(M33))
      CALL sax(OpenAD_Symbol_316, __deriv__(X1), __deriv__(D12))
      CALL saxpy(OpenAD_Symbol_317, __deriv__(X0), __deriv__(D12))
      CALL saxpy(OpenAD_Symbol_361, __deriv__(X3), __deriv__(D12))
      CALL saxpy(OpenAD_Symbol_375, __deriv__(X4), __deriv__(D12))
      CALL saxpy(OpenAD_Symbol_377, __deriv__(X5), __deriv__(D12))
      CALL sax(OpenAD_Symbol_313, __deriv__(X4), __deriv__(D03))
      CALL saxpy(OpenAD_Symbol_314, __deriv__(X3), __deriv__(D03))
      CALL saxpy(OpenAD_Symbol_341, __deriv__(X0), __deriv__(D03))
      CALL saxpy(OpenAD_Symbol_355, __deriv__(X1), __deriv__(D03))
      CALL saxpy(OpenAD_Symbol_357, __deriv__(X2), __deriv__(D03))
      CALL sax(OpenAD_Symbol_313, __deriv__(X4), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_314, __deriv__(X3), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_316, __deriv__(X1), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_317, __deriv__(X0), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_342, __deriv__(X0), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_343, __deriv__(X1), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_344, __deriv__(X2), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_362, __deriv__(X3), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_363, __deriv__(X4), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_364, __deriv__(X5), __deriv__(F))
      CALL sax(OpenAD_Symbol_277, __deriv__(X4), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_278, __deriv__(X3), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_280, __deriv__(X1), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_281, __deriv__(X0), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_290, __deriv__(X0), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_291, __deriv__(X1), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_292, __deriv__(X2), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_302, __deriv__(X3), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_303, __deriv__(X4), __deriv__(LOC1))
      CALL saxpy(OpenAD_Symbol_304, __deriv__(X5), __deriv__(LOC1))
      CALL sax(OpenAD_Symbol_333, __deriv__(X4), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_334, __deriv__(X3), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_336, __deriv__(X1), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_337, __deriv__(X0), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_345, __deriv__(X0), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_346, __deriv__(X1), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_347, __deriv__(X2), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_365, __deriv__(X3), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_366, __deriv__(X4), __deriv__(OBJ))
      CALL saxpy(OpenAD_Symbol_367, __deriv__(X5), __deriv__(OBJ))
      CALL sax(OpenAD_Symbol_327, __deriv__(X4), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_328, __deriv__(X3), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_330, __deriv__(X1), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_331, __deriv__(X0), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_351, __deriv__(X0), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_352, __deriv__(X1), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_353, __deriv__(X2), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_371, __deriv__(X3), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_372, __deriv__(X4), __deriv__(LOC2))
      CALL saxpy(OpenAD_Symbol_373, __deriv__(X5), __deriv__(LOC2))
      CALL sax(OpenAD_Symbol_321, __deriv__(X4), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_322, __deriv__(X3), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_324, __deriv__(X1), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_325, __deriv__(X0), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_348, __deriv__(X0), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_349, __deriv__(X1), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_350, __deriv__(X2), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_368, __deriv__(X3), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_369, __deriv__(X4), __deriv__(GG))
      CALL saxpy(OpenAD_Symbol_370, __deriv__(X5), __deriv__(GG))
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
      CALL sax(OpenAD_Symbol_382, __deriv__(MATR1), __deriv__(ADJ_M2))
      CALL saxpy(OpenAD_Symbol_383, __deriv__(F), __deriv__(ADJ_M2))
      CALL saxpy(OpenAD_Symbol_384, __deriv__(LOC2), __deriv__(ADJ_M2))
      CALL saxpy(OpenAD_Symbol_92, __deriv__(MATR2), __deriv__(ADJ_M2))
      CALL saxpy(OpenAD_Symbol_386, __deriv__(LOC1), __deriv__(ADJ_M2))
      CALL sax(OpenAD_Symbol_100, __deriv__(MATR0), __deriv__(ADJ_M3))
      CALL saxpy(OpenAD_Symbol_380, __deriv__(F), __deriv__(ADJ_M3))
      CALL saxpy(OpenAD_Symbol_381, __deriv__(LOC2), __deriv__(ADJ_M3))
      CALL saxpy(OpenAD_Symbol_98, __deriv__(MATR3), __deriv__(ADJ_M3))
      CALL saxpy(OpenAD_Symbol_385, __deriv__(LOC1), __deriv__(ADJ_M3))
      CALL sax(OpenAD_Symbol_80, __deriv__(MATR0), __deriv__(G_OBJ1))
      CALL saxpy(OpenAD_Symbol_82, __deriv__(MATR3), __deriv__(G_OBJ1))
      CALL saxpy(OpenAD_Symbol_397, __deriv__(MATR1), __deriv__(G_OBJ1)
     > )
      CALL saxpy(OpenAD_Symbol_400, __deriv__(LOC1), __deriv__(G_OBJ1))
      CALL saxpy(OpenAD_Symbol_403, __deriv__(MATR2), __deriv__(G_OBJ1)
     > )
      CALL saxpy(OpenAD_Symbol_406, __deriv__(F), __deriv__(G_OBJ1))
      CALL saxpy(OpenAD_Symbol_409, __deriv__(LOC2), __deriv__(G_OBJ1))
      CALL sax(OpenAD_Symbol_398, __deriv__(MATR1), __deriv__(G_OBJ2))
      CALL saxpy(OpenAD_Symbol_401, __deriv__(LOC1), __deriv__(G_OBJ2))
      CALL saxpy(OpenAD_Symbol_404, __deriv__(MATR2), __deriv__(G_OBJ2)
     > )
      CALL saxpy(OpenAD_Symbol_407, __deriv__(F), __deriv__(G_OBJ2))
      CALL saxpy(OpenAD_Symbol_410, __deriv__(LOC2), __deriv__(G_OBJ2))
      CALL sax(OpenAD_Symbol_392, __deriv__(MATR0), __deriv__(G_OBJ0))
      CALL saxpy(OpenAD_Symbol_393, __deriv__(MATR3), __deriv__(G_OBJ0)
     > )
      CALL saxpy(OpenAD_Symbol_399, __deriv__(MATR1), __deriv__(G_OBJ0)
     > )
      CALL saxpy(OpenAD_Symbol_402, __deriv__(LOC1), __deriv__(G_OBJ0))
      CALL saxpy(OpenAD_Symbol_405, __deriv__(MATR2), __deriv__(G_OBJ0)
     > )
      CALL saxpy(OpenAD_Symbol_408, __deriv__(F), __deriv__(G_OBJ0))
      CALL saxpy(OpenAD_Symbol_411, __deriv__(LOC2), __deriv__(G_OBJ0))
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
      CALL setderiv(__deriv__(OpenAD_Symbol_422), __deriv__(LOC2))
      CALL sax(OpenAD_Symbol_412, __deriv__(ADJ_M3), __deriv__(G_OBJ4))
      CALL saxpy(1_w2f__i8, __deriv__(ADJ_M2), __deriv__(G_OBJ4))
      CALL sax(OpenAD_Symbol_413, __deriv__(ADJ_M3), __deriv__(G_OBJ5))
      CALL sax(2.0D00, __deriv__(OpenAD_Symbol_422), __deriv__(LOC2))
      CALL sax(OpenAD_Symbol_134, __deriv__(MATR0), __deriv__(M01))
      CALL saxpy(OpenAD_Symbol_135, __deriv__(MATR1), __deriv__(M01))
      CALL sax(OpenAD_Symbol_136, __deriv__(MATR0), __deriv__(M02))
      CALL saxpy(OpenAD_Symbol_137, __deriv__(MATR2), __deriv__(M02))
      CALL sax(OpenAD_Symbol_138, __deriv__(MATR1), __deriv__(M12))
      CALL saxpy(OpenAD_Symbol_139, __deriv__(MATR2), __deriv__(M12))
      CALL sax(OpenAD_Symbol_140, __deriv__(MATR1), __deriv__(M13))
      CALL saxpy(OpenAD_Symbol_141, __deriv__(MATR3), __deriv__(M13))
      CALL sax(OpenAD_Symbol_142, __deriv__(MATR2), __deriv__(M23))
      CALL saxpy(OpenAD_Symbol_143, __deriv__(MATR3), __deriv__(M23))
      CALL sax(-1_w2f__i8, __deriv__(ADJ_M2), __deriv__(G_OBJ3))
      CALL saxpy(OpenAD_Symbol_421, __deriv__(ADJ_M3), __deriv__(G_OBJ3
     > ))
      CALL sax(OpenAD_Symbol_126, __deriv__(GG), __deriv__(R00))
      CALL saxpy(OpenAD_Symbol_124, __deriv__(D00), __deriv__(R00))
      CALL saxpy(OpenAD_Symbol_127, __deriv__(M33), __deriv__(R00))
      CALL saxpy(OpenAD_Symbol_419, __deriv__(OpenAD_Symbol_422),
     >  __deriv__(R00))
      CALL sax(OpenAD_Symbol_132, __deriv__(GG), __deriv__(R11))
      CALL saxpy(OpenAD_Symbol_130, __deriv__(D11), __deriv__(R11))
      CALL saxpy(OpenAD_Symbol_133, __deriv__(M22), __deriv__(R11))
      CALL saxpy(OpenAD_Symbol_418, __deriv__(OpenAD_Symbol_422),
     >  __deriv__(R11))
      CALL sax(OpenAD_Symbol_414, __deriv__(MATR0), __deriv__(D01))
      CALL saxpy(OpenAD_Symbol_415, __deriv__(MATR2), __deriv__(D01))
      CALL saxpy(OpenAD_Symbol_416, __deriv__(MATR1), __deriv__(D01))
      CALL saxpy(OpenAD_Symbol_417, __deriv__(MATR3), __deriv__(D01))
      CALL saxpy(OpenAD_Symbol_420, __deriv__(OpenAD_Symbol_422),
     >  __deriv__(D01))
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
      CALL sax(OpenAD_Symbol_149, __deriv__(R11), __deriv__(H_OBJ1))
      CALL saxpy(-1_w2f__i8, __deriv__(R00), __deriv__(H_OBJ1))
      CALL sax(OpenAD_Symbol_153, __deriv__(D01), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_423, __deriv__(GG), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_424, __deriv__(M23), __deriv__(F))
      CALL sax(OpenAD_Symbol_149, __deriv__(R11), __deriv__(H_OBJ0))
      CALL saxpy(1_w2f__i8, __deriv__(R00), __deriv__(H_OBJ0))
      CALL saxpy(OpenAD_Symbol_153, __deriv__(D01), __deriv__(H_OBJ0))
      CALL saxpy(OpenAD_Symbol_423, __deriv__(GG), __deriv__(H_OBJ0))
      CALL saxpy(OpenAD_Symbol_424, __deriv__(M23), __deriv__(H_OBJ0))
      CALL sax(OpenAD_Symbol_149, __deriv__(R11), __deriv__(H_OBJ3))
      CALL saxpy(1_w2f__i8, __deriv__(R00), __deriv__(H_OBJ3))
      CALL saxpy(OpenAD_Symbol_425, __deriv__(D01), __deriv__(H_OBJ3))
      CALL saxpy(OpenAD_Symbol_426, __deriv__(GG), __deriv__(H_OBJ3))
      CALL saxpy(OpenAD_Symbol_427, __deriv__(M23), __deriv__(H_OBJ3))
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
      CALL sax(OpenAD_Symbol_174, __deriv__(R11), __deriv__(H_OBJ5))
      CALL sax(OpenAD_Symbol_428, __deriv__(R11), __deriv__(H_OBJ2))
      CALL saxpy(-1_w2f__i8, __deriv__(F), __deriv__(H_OBJ2))
      CALL sax(OpenAD_Symbol_428, __deriv__(R11), __deriv__(H_OBJ4))
      CALL saxpy(1_w2f__i8, __deriv__(F), __deriv__(H_OBJ4))
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
      CALL sax(OpenAD_Symbol_175, __deriv__(R00), __deriv__(H_OBJ16))
      CALL saxpy(-1_w2f__i8, __deriv__(R11), __deriv__(H_OBJ16))
      CALL sax(OpenAD_Symbol_179, __deriv__(D01), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_429, __deriv__(GG), __deriv__(F))
      CALL saxpy(OpenAD_Symbol_430, __deriv__(M01), __deriv__(F))
      CALL sax(OpenAD_Symbol_175, __deriv__(R00), __deriv__(H_OBJ15))
      CALL saxpy(1_w2f__i8, __deriv__(R11), __deriv__(H_OBJ15))
      CALL saxpy(OpenAD_Symbol_179, __deriv__(D01), __deriv__(H_OBJ15))
      CALL saxpy(OpenAD_Symbol_429, __deriv__(GG), __deriv__(H_OBJ15))
      CALL saxpy(OpenAD_Symbol_430, __deriv__(M01), __deriv__(H_OBJ15))
      CALL sax(OpenAD_Symbol_175, __deriv__(R00), __deriv__(H_OBJ18))
      CALL saxpy(1_w2f__i8, __deriv__(R11), __deriv__(H_OBJ18))
      CALL saxpy(OpenAD_Symbol_431, __deriv__(D01), __deriv__(H_OBJ18))
      CALL saxpy(OpenAD_Symbol_432, __deriv__(GG), __deriv__(H_OBJ18))
      CALL saxpy(OpenAD_Symbol_433, __deriv__(M01), __deriv__(H_OBJ18))
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
      CALL sax(OpenAD_Symbol_200, __deriv__(R00), __deriv__(H_OBJ20))
      CALL sax(OpenAD_Symbol_434, __deriv__(R00), __deriv__(H_OBJ17))
      CALL saxpy(-1_w2f__i8, __deriv__(F), __deriv__(H_OBJ17))
      CALL sax(OpenAD_Symbol_434, __deriv__(R00), __deriv__(H_OBJ19))
      CALL saxpy(1_w2f__i8, __deriv__(F), __deriv__(H_OBJ19))
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
      CALL sax(OpenAD_Symbol_208, __deriv__(GG), __deriv__(R13))
      CALL saxpy(OpenAD_Symbol_209, __deriv__(M02), __deriv__(R13))
      CALL saxpy(OpenAD_Symbol_202, __deriv__(LOC2), __deriv__(R13))
      CALL saxpy(OpenAD_Symbol_203, __deriv__(M01), __deriv__(R13))
      CALL saxpy(OpenAD_Symbol_203, __deriv__(M23), __deriv__(R13))
      CALL sax(OpenAD_Symbol_212, __deriv__(GG), __deriv__(R02))
      CALL saxpy(OpenAD_Symbol_213, __deriv__(M13), __deriv__(R02))
      CALL saxpy(OpenAD_Symbol_202, __deriv__(LOC2), __deriv__(R02))
      CALL saxpy(OpenAD_Symbol_203, __deriv__(M01), __deriv__(R02))
      CALL saxpy(OpenAD_Symbol_203, __deriv__(M23), __deriv__(R02))
      CALL sax(OpenAD_Symbol_218, __deriv__(GG), __deriv__(R03))
      CALL saxpy(OpenAD_Symbol_219, __deriv__(M03), __deriv__(R03))
      CALL saxpy(OpenAD_Symbol_216, __deriv__(D03), __deriv__(R03))
      CALL saxpy(OpenAD_Symbol_217, __deriv__(LOC2), __deriv__(R03))
      CALL sax(OpenAD_Symbol_224, __deriv__(GG), __deriv__(R12))
      CALL saxpy(OpenAD_Symbol_222, __deriv__(D12), __deriv__(R12))
      CALL saxpy(OpenAD_Symbol_225, __deriv__(M12), __deriv__(R12))
      CALL saxpy(OpenAD_Symbol_223, __deriv__(LOC2), __deriv__(R12))
      CALL sax(OpenAD_Symbol_441, __deriv__(GG), __deriv__(G))
      CALL saxpy(OpenAD_Symbol_442, __deriv__(M02), __deriv__(G))
      CALL saxpy(OpenAD_Symbol_443, __deriv__(LOC2), __deriv__(G))
      CALL saxpy(OpenAD_Symbol_444, __deriv__(M01), __deriv__(G))
      CALL saxpy(OpenAD_Symbol_445, __deriv__(M23), __deriv__(G))
      CALL sax(OpenAD_Symbol_437, __deriv__(M03), __deriv__(H_OBJ8))
      CALL saxpy(OpenAD_Symbol_438, __deriv__(D03), __deriv__(H_OBJ8))
      CALL saxpy(OpenAD_Symbol_446, __deriv__(GG), __deriv__(H_OBJ8))
      CALL saxpy(OpenAD_Symbol_442, __deriv__(M02), __deriv__(H_OBJ8))
      CALL saxpy(OpenAD_Symbol_447, __deriv__(LOC2), __deriv__(H_OBJ8))
      CALL saxpy(OpenAD_Symbol_444, __deriv__(M01), __deriv__(H_OBJ8))
      CALL saxpy(OpenAD_Symbol_445, __deriv__(M23), __deriv__(H_OBJ8))
      CALL sax(OpenAD_Symbol_439, __deriv__(M03), __deriv__(H_OBJ11))
      CALL saxpy(OpenAD_Symbol_440, __deriv__(D03), __deriv__(H_OBJ11))
      CALL saxpy(OpenAD_Symbol_448, __deriv__(GG), __deriv__(H_OBJ11))
      CALL saxpy(OpenAD_Symbol_442, __deriv__(M02), __deriv__(H_OBJ11))
      CALL saxpy(OpenAD_Symbol_449, __deriv__(LOC2), __deriv__(H_OBJ11)
     > )
      CALL saxpy(OpenAD_Symbol_444, __deriv__(M01), __deriv__(H_OBJ11))
      CALL saxpy(OpenAD_Symbol_445, __deriv__(M23), __deriv__(H_OBJ11))
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
      CALL setderiv(__deriv__(OpenAD_Symbol_451), __deriv__(G))
      CALL sax(OpenAD_Symbol_450, __deriv__(R12), __deriv__(H_OBJ12))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_451), __deriv__(
     > H_OBJ12))
      CALL sax(OpenAD_Symbol_235, __deriv__(R12), __deriv__(H_OBJ13))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_451), __deriv__(
     > H_OBJ13))
      CALL sax(1.2D+01, __deriv__(R13), __deriv__(H_OBJ14))
      CALL sax(OpenAD_Symbol_244, __deriv__(R02), __deriv__(G))
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
      CALL setderiv(__deriv__(OpenAD_Symbol_454), __deriv__(G))
      CALL sax(OpenAD_Symbol_254, __deriv__(R02), __deriv__(G))
      CALL sax(OpenAD_Symbol_452, __deriv__(R03), __deriv__(H_OBJ10))
      CALL saxpy(OpenAD_Symbol_453, __deriv__(R12), __deriv__(H_OBJ10))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_454), __deriv__(
     > H_OBJ10))
      CALL sax(OpenAD_Symbol_247, __deriv__(R03), __deriv__(H_OBJ6))
      CALL saxpy(OpenAD_Symbol_247, __deriv__(R12), __deriv__(H_OBJ6))
      CALL saxpy(1_w2f__i8, __deriv__(OpenAD_Symbol_454), __deriv__(
     > H_OBJ6))
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
      CALL sax(OpenAD_Symbol_456, __deriv__(R03), __deriv__(H_OBJ9))
      CALL saxpy(OpenAD_Symbol_457, __deriv__(R12), __deriv__(H_OBJ9))
      CALL saxpy(1_w2f__i8, __deriv__(G), __deriv__(H_OBJ9))
      CALL sax(OpenAD_Symbol_258, __deriv__(R03), __deriv__(H_OBJ7))
      CALL saxpy(OpenAD_Symbol_455, __deriv__(R12), __deriv__(H_OBJ7))
      CALL saxpy(1_w2f__i8, __deriv__(G), __deriv__(H_OBJ7))
      END SUBROUTINE
