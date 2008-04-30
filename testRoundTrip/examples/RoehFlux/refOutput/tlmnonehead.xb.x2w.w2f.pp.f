

      SUBROUTINE ad_roehf5(NRM, PRIML, PRIMR, GAMMA, GM1, GM1INV,
     >  NLEFIX, LEFIX, MCHEPS, FLUX)
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
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
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
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      REAL(w2f__8) OpenAD_Symbol_173
      REAL(w2f__8) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_176
      REAL(w2f__8) OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
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
      REAL(w2f__8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      REAL(w2f__8) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      REAL(w2f__8) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      REAL(w2f__8) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      REAL(w2f__8) OpenAD_Symbol_249
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      REAL(w2f__8) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_257
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
      REAL(w2f__8) OpenAD_Symbol_3
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
      REAL(w2f__8) OpenAD_Symbol_31
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
      REAL(w2f__8) OpenAD_Symbol_329
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
      REAL(w2f__8) OpenAD_Symbol_422
      REAL(w2f__8) OpenAD_Symbol_423
      REAL(w2f__8) OpenAD_Symbol_424
      REAL(w2f__8) OpenAD_Symbol_425
      REAL(w2f__8) OpenAD_Symbol_426
      REAL(w2f__8) OpenAD_Symbol_427
      REAL(w2f__8) OpenAD_Symbol_428
      REAL(w2f__8) OpenAD_Symbol_429
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
      REAL(w2f__8) OpenAD_Symbol_451
      REAL(w2f__8) OpenAD_Symbol_452
      REAL(w2f__8) OpenAD_Symbol_453
      REAL(w2f__8) OpenAD_Symbol_454
      REAL(w2f__8) OpenAD_Symbol_455
      REAL(w2f__8) OpenAD_Symbol_456
      REAL(w2f__8) OpenAD_Symbol_457
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
      REAL(w2f__8) OpenAD_Symbol_47
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
      REAL(w2f__8) OpenAD_Symbol_48
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
      REAL(w2f__8) OpenAD_Symbol_49
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
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_501
      REAL(w2f__8) OpenAD_Symbol_502
      REAL(w2f__8) OpenAD_Symbol_503
      REAL(w2f__8) OpenAD_Symbol_504
      REAL(w2f__8) OpenAD_Symbol_505
      REAL(w2f__8) OpenAD_Symbol_506
      REAL(w2f__8) OpenAD_Symbol_507
      REAL(w2f__8) OpenAD_Symbol_509
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_510
      REAL(w2f__8) OpenAD_Symbol_511
      REAL(w2f__8) OpenAD_Symbol_512
      REAL(w2f__8) OpenAD_Symbol_513
      REAL(w2f__8) OpenAD_Symbol_514
      REAL(w2f__8) OpenAD_Symbol_515
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
      REAL(w2f__8) OpenAD_Symbol_53
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
      REAL(w2f__8) OpenAD_Symbol_55
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
      REAL(w2f__8) OpenAD_Symbol_57
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
      REAL(w2f__8) OpenAD_Symbol_58
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
      REAL(w2f__8) OpenAD_Symbol_59
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
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_600
      REAL(w2f__8) OpenAD_Symbol_601
      REAL(w2f__8) OpenAD_Symbol_602
      REAL(w2f__8) OpenAD_Symbol_603
      REAL(w2f__8) OpenAD_Symbol_604
      REAL(w2f__8) OpenAD_Symbol_605
      type(active) :: OpenAD_Symbol_606
      REAL(w2f__8) OpenAD_Symbol_607
      REAL(w2f__8) OpenAD_Symbol_608
      REAL(w2f__8) OpenAD_Symbol_609
      REAL(w2f__8) OpenAD_Symbol_61
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
      REAL(w2f__8) OpenAD_Symbol_62
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
      REAL(w2f__8) OpenAD_Symbol_63
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
      REAL(w2f__8) OpenAD_Symbol_64
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
      REAL(w2f__8) OpenAD_Symbol_65
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
      REAL(w2f__8) OpenAD_Symbol_66
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
      REAL(w2f__8) OpenAD_Symbol_67
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
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_680
      REAL(w2f__8) OpenAD_Symbol_681
      REAL(w2f__8) OpenAD_Symbol_682
      REAL(w2f__8) OpenAD_Symbol_683
      REAL(w2f__8) OpenAD_Symbol_684
      REAL(w2f__8) OpenAD_Symbol_685
      REAL(w2f__8) OpenAD_Symbol_686
      REAL(w2f__8) OpenAD_Symbol_687
      REAL(w2f__8) OpenAD_Symbol_688
      REAL(w2f__8) OpenAD_Symbol_689
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_690
      REAL(w2f__8) OpenAD_Symbol_691
      REAL(w2f__8) OpenAD_Symbol_692
      REAL(w2f__8) OpenAD_Symbol_693
      REAL(w2f__8) OpenAD_Symbol_694
      REAL(w2f__8) OpenAD_Symbol_695
      REAL(w2f__8) OpenAD_Symbol_696
      REAL(w2f__8) OpenAD_Symbol_697
      REAL(w2f__8) OpenAD_Symbol_698
      REAL(w2f__8) OpenAD_Symbol_699
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_700
      REAL(w2f__8) OpenAD_Symbol_701
      REAL(w2f__8) OpenAD_Symbol_702
      REAL(w2f__8) OpenAD_Symbol_703
      REAL(w2f__8) OpenAD_Symbol_704
      REAL(w2f__8) OpenAD_Symbol_705
      REAL(w2f__8) OpenAD_Symbol_706
      REAL(w2f__8) OpenAD_Symbol_707
      REAL(w2f__8) OpenAD_Symbol_708
      REAL(w2f__8) OpenAD_Symbol_709
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_710
      REAL(w2f__8) OpenAD_Symbol_711
      REAL(w2f__8) OpenAD_Symbol_712
      REAL(w2f__8) OpenAD_Symbol_713
      REAL(w2f__8) OpenAD_Symbol_714
      REAL(w2f__8) OpenAD_Symbol_715
      REAL(w2f__8) OpenAD_Symbol_716
      REAL(w2f__8) OpenAD_Symbol_717
      REAL(w2f__8) OpenAD_Symbol_718
      REAL(w2f__8) OpenAD_Symbol_719
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_720
      REAL(w2f__8) OpenAD_Symbol_721
      REAL(w2f__8) OpenAD_Symbol_722
      REAL(w2f__8) OpenAD_Symbol_723
      REAL(w2f__8) OpenAD_Symbol_724
      REAL(w2f__8) OpenAD_Symbol_725
      REAL(w2f__8) OpenAD_Symbol_726
      REAL(w2f__8) OpenAD_Symbol_727
      REAL(w2f__8) OpenAD_Symbol_728
      REAL(w2f__8) OpenAD_Symbol_729
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_730
      REAL(w2f__8) OpenAD_Symbol_731
      REAL(w2f__8) OpenAD_Symbol_732
      REAL(w2f__8) OpenAD_Symbol_733
      REAL(w2f__8) OpenAD_Symbol_734
      REAL(w2f__8) OpenAD_Symbol_735
      REAL(w2f__8) OpenAD_Symbol_736
      REAL(w2f__8) OpenAD_Symbol_737
      REAL(w2f__8) OpenAD_Symbol_738
      REAL(w2f__8) OpenAD_Symbol_739
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_740
      REAL(w2f__8) OpenAD_Symbol_741
      REAL(w2f__8) OpenAD_Symbol_742
      REAL(w2f__8) OpenAD_Symbol_743
      REAL(w2f__8) OpenAD_Symbol_744
      REAL(w2f__8) OpenAD_Symbol_745
      REAL(w2f__8) OpenAD_Symbol_746
      REAL(w2f__8) OpenAD_Symbol_747
      REAL(w2f__8) OpenAD_Symbol_748
      REAL(w2f__8) OpenAD_Symbol_749
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_750
      REAL(w2f__8) OpenAD_Symbol_751
      REAL(w2f__8) OpenAD_Symbol_752
      REAL(w2f__8) OpenAD_Symbol_753
      REAL(w2f__8) OpenAD_Symbol_754
      REAL(w2f__8) OpenAD_Symbol_755
      REAL(w2f__8) OpenAD_Symbol_756
      REAL(w2f__8) OpenAD_Symbol_757
      REAL(w2f__8) OpenAD_Symbol_758
      REAL(w2f__8) OpenAD_Symbol_759
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_760
      REAL(w2f__8) OpenAD_Symbol_761
      REAL(w2f__8) OpenAD_Symbol_762
      REAL(w2f__8) OpenAD_Symbol_763
      REAL(w2f__8) OpenAD_Symbol_764
      REAL(w2f__8) OpenAD_Symbol_765
      REAL(w2f__8) OpenAD_Symbol_766
      REAL(w2f__8) OpenAD_Symbol_767
      REAL(w2f__8) OpenAD_Symbol_768
      REAL(w2f__8) OpenAD_Symbol_769
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_770
      REAL(w2f__8) OpenAD_Symbol_771
      REAL(w2f__8) OpenAD_Symbol_772
      REAL(w2f__8) OpenAD_Symbol_773
      REAL(w2f__8) OpenAD_Symbol_774
      REAL(w2f__8) OpenAD_Symbol_775
      REAL(w2f__8) OpenAD_Symbol_776
      REAL(w2f__8) OpenAD_Symbol_777
      REAL(w2f__8) OpenAD_Symbol_778
      REAL(w2f__8) OpenAD_Symbol_779
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_780
      REAL(w2f__8) OpenAD_Symbol_781
      REAL(w2f__8) OpenAD_Symbol_782
      REAL(w2f__8) OpenAD_Symbol_783
      REAL(w2f__8) OpenAD_Symbol_784
      REAL(w2f__8) OpenAD_Symbol_785
      REAL(w2f__8) OpenAD_Symbol_786
      REAL(w2f__8) OpenAD_Symbol_787
      REAL(w2f__8) OpenAD_Symbol_788
      REAL(w2f__8) OpenAD_Symbol_789
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_790
      REAL(w2f__8) OpenAD_Symbol_791
      REAL(w2f__8) OpenAD_Symbol_792
      REAL(w2f__8) OpenAD_Symbol_793
      REAL(w2f__8) OpenAD_Symbol_794
      REAL(w2f__8) OpenAD_Symbol_795
      REAL(w2f__8) OpenAD_Symbol_796
      REAL(w2f__8) OpenAD_Symbol_797
      REAL(w2f__8) OpenAD_Symbol_798
      REAL(w2f__8) OpenAD_Symbol_799
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_800
      REAL(w2f__8) OpenAD_Symbol_801
      REAL(w2f__8) OpenAD_Symbol_802
      REAL(w2f__8) OpenAD_Symbol_803
      REAL(w2f__8) OpenAD_Symbol_804
      REAL(w2f__8) OpenAD_Symbol_805
      REAL(w2f__8) OpenAD_Symbol_806
      REAL(w2f__8) OpenAD_Symbol_807
      REAL(w2f__8) OpenAD_Symbol_808
      REAL(w2f__8) OpenAD_Symbol_809
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_810
      REAL(w2f__8) OpenAD_Symbol_811
      REAL(w2f__8) OpenAD_Symbol_812
      REAL(w2f__8) OpenAD_Symbol_813
      REAL(w2f__8) OpenAD_Symbol_814
      REAL(w2f__8) OpenAD_Symbol_815
      REAL(w2f__8) OpenAD_Symbol_816
      REAL(w2f__8) OpenAD_Symbol_817
      REAL(w2f__8) OpenAD_Symbol_818
      REAL(w2f__8) OpenAD_Symbol_819
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_820
      REAL(w2f__8) OpenAD_Symbol_821
      REAL(w2f__8) OpenAD_Symbol_822
      REAL(w2f__8) OpenAD_Symbol_823
      REAL(w2f__8) OpenAD_Symbol_824
      REAL(w2f__8) OpenAD_Symbol_825
      REAL(w2f__8) OpenAD_Symbol_826
      type(active) :: OpenAD_Symbol_827
      type(active) :: OpenAD_Symbol_828
      type(active) :: OpenAD_Symbol_829
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_830
      REAL(w2f__8) OpenAD_Symbol_831
      REAL(w2f__8) OpenAD_Symbol_832
      REAL(w2f__8) OpenAD_Symbol_833
      REAL(w2f__8) OpenAD_Symbol_834
      REAL(w2f__8) OpenAD_Symbol_835
      REAL(w2f__8) OpenAD_Symbol_836
      REAL(w2f__8) OpenAD_Symbol_837
      REAL(w2f__8) OpenAD_Symbol_838
      REAL(w2f__8) OpenAD_Symbol_839
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_840
      REAL(w2f__8) OpenAD_Symbol_841
      REAL(w2f__8) OpenAD_Symbol_842
      REAL(w2f__8) OpenAD_Symbol_843
      REAL(w2f__8) OpenAD_Symbol_844
      REAL(w2f__8) OpenAD_Symbol_845
      REAL(w2f__8) OpenAD_Symbol_846
      REAL(w2f__8) OpenAD_Symbol_847
      REAL(w2f__8) OpenAD_Symbol_848
      REAL(w2f__8) OpenAD_Symbol_849
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_850
      REAL(w2f__8) OpenAD_Symbol_851
      REAL(w2f__8) OpenAD_Symbol_852
      REAL(w2f__8) OpenAD_Symbol_853
      REAL(w2f__8) OpenAD_Symbol_854
      REAL(w2f__8) OpenAD_Symbol_855
      REAL(w2f__8) OpenAD_Symbol_856
      REAL(w2f__8) OpenAD_Symbol_857
      REAL(w2f__8) OpenAD_Symbol_858
      REAL(w2f__8) OpenAD_Symbol_859
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_860
      REAL(w2f__8) OpenAD_Symbol_861
      REAL(w2f__8) OpenAD_Symbol_862
      REAL(w2f__8) OpenAD_Symbol_863
      REAL(w2f__8) OpenAD_Symbol_864
      REAL(w2f__8) OpenAD_Symbol_865
      REAL(w2f__8) OpenAD_Symbol_866
      REAL(w2f__8) OpenAD_Symbol_867
      REAL(w2f__8) OpenAD_Symbol_868
      REAL(w2f__8) OpenAD_Symbol_869
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_870
      REAL(w2f__8) OpenAD_Symbol_871
      REAL(w2f__8) OpenAD_Symbol_872
      REAL(w2f__8) OpenAD_Symbol_873
      REAL(w2f__8) OpenAD_Symbol_874
      REAL(w2f__8) OpenAD_Symbol_875
      REAL(w2f__8) OpenAD_Symbol_876
      REAL(w2f__8) OpenAD_Symbol_877
      REAL(w2f__8) OpenAD_Symbol_878
      REAL(w2f__8) OpenAD_Symbol_879
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_880
      REAL(w2f__8) OpenAD_Symbol_881
      REAL(w2f__8) OpenAD_Symbol_882
      REAL(w2f__8) OpenAD_Symbol_883
      REAL(w2f__8) OpenAD_Symbol_884
      REAL(w2f__8) OpenAD_Symbol_885
      REAL(w2f__8) OpenAD_Symbol_886
      REAL(w2f__8) OpenAD_Symbol_887
      REAL(w2f__8) OpenAD_Symbol_888
      REAL(w2f__8) OpenAD_Symbol_889
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_890
      REAL(w2f__8) OpenAD_Symbol_891
      REAL(w2f__8) OpenAD_Symbol_892
      REAL(w2f__8) OpenAD_Symbol_893
      REAL(w2f__8) OpenAD_Symbol_894
      REAL(w2f__8) OpenAD_Symbol_895
      REAL(w2f__8) OpenAD_Symbol_896
      REAL(w2f__8) OpenAD_Symbol_897
      REAL(w2f__8) OpenAD_Symbol_898
      REAL(w2f__8) OpenAD_Symbol_899
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_900
      REAL(w2f__8) OpenAD_Symbol_901
      REAL(w2f__8) OpenAD_Symbol_902
      REAL(w2f__8) OpenAD_Symbol_903
      REAL(w2f__8) OpenAD_Symbol_904
      REAL(w2f__8) OpenAD_Symbol_905
      REAL(w2f__8) OpenAD_Symbol_906
      REAL(w2f__8) OpenAD_Symbol_907
      REAL(w2f__8) OpenAD_Symbol_908
      REAL(w2f__8) OpenAD_Symbol_909
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_910
      REAL(w2f__8) OpenAD_Symbol_911
      REAL(w2f__8) OpenAD_Symbol_912
      REAL(w2f__8) OpenAD_Symbol_913
      REAL(w2f__8) OpenAD_Symbol_914
      REAL(w2f__8) OpenAD_Symbol_915
      REAL(w2f__8) OpenAD_Symbol_916
      REAL(w2f__8) OpenAD_Symbol_917
      REAL(w2f__8) OpenAD_Symbol_918
      REAL(w2f__8) OpenAD_Symbol_919
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_920
      REAL(w2f__8) OpenAD_Symbol_921
      REAL(w2f__8) OpenAD_Symbol_922
      REAL(w2f__8) OpenAD_Symbol_923
      REAL(w2f__8) OpenAD_Symbol_924
      REAL(w2f__8) OpenAD_Symbol_925
      REAL(w2f__8) OpenAD_Symbol_926
      REAL(w2f__8) OpenAD_Symbol_927
      REAL(w2f__8) OpenAD_Symbol_928
      REAL(w2f__8) OpenAD_Symbol_929
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_930
      REAL(w2f__8) OpenAD_Symbol_931
      REAL(w2f__8) OpenAD_Symbol_932
      REAL(w2f__8) OpenAD_Symbol_933
      REAL(w2f__8) OpenAD_Symbol_934
      REAL(w2f__8) OpenAD_Symbol_935
      REAL(w2f__8) OpenAD_Symbol_936
      REAL(w2f__8) OpenAD_Symbol_937
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      type(active) :: NRM(1 : 3)
      INTENT(IN)  NRM
      type(active) :: PRIML(1 : 5)
      INTENT(IN)  PRIML
      type(active) :: PRIMR(1 : 5)
      INTENT(IN)  PRIMR
      type(active) :: GAMMA
      INTENT(IN)  GAMMA
      type(active) :: GM1
      INTENT(IN)  GM1
      type(active) :: GM1INV
      INTENT(IN)  GM1INV
      type(active) :: NLEFIX
      INTENT(IN)  NLEFIX
      type(active) :: LEFIX
      INTENT(IN)  LEFIX
      REAL(w2f__8) MCHEPS
      INTENT(IN)  MCHEPS
      type(active) :: FLUX(1 : 5)
      INTENT(OUT)  FLUX
C
C     **** Local Variables and Functions ****
C
      type(active) :: ALAMCM
      type(active) :: ALAMCP
      type(active) :: ALAMU
      type(active) :: ALP1
      type(active) :: ALP15M
      type(active) :: ALP15P
      type(active) :: ALP2
      type(active) :: ALP3
      type(active) :: ALP4
      type(active) :: ALP5
      type(active) :: CAVE
      type(active) :: DE
      type(active) :: DELTA
      type(active) :: DELTA2
      type(active) :: DR
      type(active) :: DRU
      type(active) :: DRV
      type(active) :: DRW
      type(active) :: DSS1
      type(active) :: DSS2
      type(active) :: DSS3
      type(active) :: DSS4
      type(active) :: DSS5
      type(active) :: EL
      type(active) :: ER
      REAL(w2f__4) HALF
      PARAMETER ( HALF = 5.0E-01)
      type(active) :: HAVE
      type(active) :: HL
      type(active) :: HR
      type(active) :: LAM2
      type(active) :: LAMCM
      type(active) :: LAMCP
      type(active) :: LAMU
      type(active) :: MU
      type(active) :: NDDRU
      type(active) :: NSIZE
      type(active) :: NSIZEI
      type(active) :: NXHAT
      type(active) :: NYHAT
      type(active) :: NZHAT
      type(active) :: OMEGA
      REAL(w2f__4) ONE
      PARAMETER ( ONE = 1.0)
      type(active) :: ROEL
      type(active) :: ROER
      type(active) :: RUL
      type(active) :: RUR
      type(active) :: RVL
      type(active) :: RVR
      type(active) :: RWL
      type(active) :: RWR
      type(active) :: THETAL
      type(active) :: THETAR
      type(active) :: THTAVE
      type(active) :: UAVE
      type(active) :: UDDRU
      type(active) :: UHAT
      type(active) :: UHATL
      type(active) :: UTILDE
      type(active) :: VAVE
      type(active) :: VTILDE
      type(active) :: WAVE
      type(active) :: WTILDE
      REAL(w2f__4) ZERO
      PARAMETER ( ZERO = 0.0)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(NRM)
C$OPENAD INDEPENDENT(PRIML)
C$OPENAD INDEPENDENT(PRIMR)
C$OPENAD INDEPENDENT(GAMMA)
C$OPENAD INDEPENDENT(GM1)
C$OPENAD INDEPENDENT(GM1INV)
C$OPENAD INDEPENDENT(NLEFIX)
C$OPENAD INDEPENDENT(LEFIX)
C$OPENAD INDEPENDENT(MCHEPS)
C$OPENAD DEPENDENT(FLUX)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = ((NRM(1)%v**2)+(NRM(2)%v**2)+(NRM(3)%v**2))
      NSIZE%v = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_6 = (2*(NRM(1)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_8 = (2*(NRM(2)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_2 = 1_w2f__i8
      OpenAD_Symbol_10 = (2*(NRM(3)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_519 = (OpenAD_Symbol_10 * OpenAD_Symbol_1)
      OpenAD_Symbol_520 = (OpenAD_Symbol_8 * OpenAD_Symbol_1)
      OpenAD_Symbol_521 = (OpenAD_Symbol_6 * OpenAD_Symbol_1)
      CALL sax(OpenAD_Symbol_519,NRM(3),NSIZE)
      CALL saxpy(OpenAD_Symbol_520,NRM(2),NSIZE)
      CALL saxpy(OpenAD_Symbol_521,NRM(1),NSIZE)
      IF (MCHEPS .LT. NSIZE%v) THEN
        NSIZEI%v = (1.0D00/NSIZE%v)
        OpenAD_Symbol_13 = (-(1.0D00/(NSIZE%v*NSIZE%v)))
        CALL sax(OpenAD_Symbol_13,NSIZE,NSIZEI)
      ELSE
        NSIZEI%v = 0.0D00
        CALL zero_deriv(NSIZEI)
      ENDIF
      NXHAT%v = (NRM(1)%v*NSIZEI%v)
      OpenAD_Symbol_14 = NSIZEI%v
      OpenAD_Symbol_15 = NRM(1)%v
      NYHAT%v = (NRM(2)%v*NSIZEI%v)
      OpenAD_Symbol_16 = NSIZEI%v
      OpenAD_Symbol_17 = NRM(2)%v
      NZHAT%v = (NRM(3)%v*NSIZEI%v)
      OpenAD_Symbol_18 = NSIZEI%v
      OpenAD_Symbol_19 = NRM(3)%v
      OpenAD_Symbol_25 = (PRIMR(2)%v/PRIML(2)%v)
      OpenAD_Symbol_20 = (SIN(OpenAD_Symbol_25) + 1.0D00)
      ROEL%v = (1.0D00/OpenAD_Symbol_20)
      OpenAD_Symbol_27 = (INT(1 _w2f__i8)/PRIML(2)%v)
      OpenAD_Symbol_28 = (-(PRIMR(2)%v/(PRIML(2)%v*PRIML(2)%v)))
      OpenAD_Symbol_26 = COS(OpenAD_Symbol_25)
      OpenAD_Symbol_23 = 1_w2f__i8
      OpenAD_Symbol_22 = (-(1.0D00 /(OpenAD_Symbol_20 *
     >  OpenAD_Symbol_20)))
      ROER%v = (1.0D00-ROEL%v)
      OpenAD_Symbol_30 = (-1_w2f__i8)
      OpenAD_Symbol_31 = ((PRIML(3)%v**2)+(PRIML(4)%v**2)+(PRIML(5)%v**2
     +))
      THETAL%v = (OpenAD_Symbol_31*5.0D-01)
      OpenAD_Symbol_38 = (2*(PRIML(3)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_36 = 1_w2f__i8
      OpenAD_Symbol_40 = (2*(PRIML(4)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_37 = 1_w2f__i8
      OpenAD_Symbol_34 = 1_w2f__i8
      OpenAD_Symbol_42 = (2*(PRIML(5)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_35 = 1_w2f__i8
      OpenAD_Symbol_32 = 5.0D-01
      OpenAD_Symbol_44 = ((PRIMR(3)%v**2)+(PRIMR(4)%v**2)+(PRIMR(5)%v**2
     +))
      THETAR%v = (OpenAD_Symbol_44*5.0D-01)
      OpenAD_Symbol_51 = (2*(PRIMR(3)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_49 = 1_w2f__i8
      OpenAD_Symbol_53 = (2*(PRIMR(4)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_50 = 1_w2f__i8
      OpenAD_Symbol_47 = 1_w2f__i8
      OpenAD_Symbol_55 = (2*(PRIMR(5)%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_48 = 1_w2f__i8
      OpenAD_Symbol_45 = 5.0D-01
      OpenAD_Symbol_62 = (GAMMA%v*GM1INV%v)
      OpenAD_Symbol_59 = (PRIML(1)%v*OpenAD_Symbol_62)
      HL%v = (THETAL%v+(OpenAD_Symbol_59/PRIML(2)%v))
      OpenAD_Symbol_57 = 1_w2f__i8
      OpenAD_Symbol_63 = OpenAD_Symbol_62
      OpenAD_Symbol_65 = GM1INV%v
      OpenAD_Symbol_66 = GAMMA%v
      OpenAD_Symbol_64 = PRIML(1)%v
      OpenAD_Symbol_60 = (INT(1 _w2f__i8)/PRIML(2)%v)
      OpenAD_Symbol_61 = (-(OpenAD_Symbol_59/(PRIML(2)%v*PRIML(2)%v)))
      OpenAD_Symbol_58 = 1_w2f__i8
      OpenAD_Symbol_72 = (GAMMA%v*GM1INV%v)
      OpenAD_Symbol_69 = (PRIMR(1)%v*OpenAD_Symbol_72)
      HR%v = (THETAR%v+(OpenAD_Symbol_69/PRIMR(2)%v))
      OpenAD_Symbol_67 = 1_w2f__i8
      OpenAD_Symbol_73 = OpenAD_Symbol_72
      OpenAD_Symbol_75 = GM1INV%v
      OpenAD_Symbol_76 = GAMMA%v
      OpenAD_Symbol_74 = PRIMR(1)%v
      OpenAD_Symbol_70 = (INT(1 _w2f__i8)/PRIMR(2)%v)
      OpenAD_Symbol_71 = (-(OpenAD_Symbol_69/(PRIMR(2)%v*PRIMR(2)%v)))
      OpenAD_Symbol_68 = 1_w2f__i8
      UAVE%v = (PRIML(3)%v*ROEL%v+PRIMR(3)%v*ROER%v)
      OpenAD_Symbol_79 = ROEL%v
      OpenAD_Symbol_80 = PRIML(3)%v
      OpenAD_Symbol_77 = 1_w2f__i8
      OpenAD_Symbol_81 = ROER%v
      OpenAD_Symbol_82 = PRIMR(3)%v
      OpenAD_Symbol_78 = 1_w2f__i8
      VAVE%v = (PRIML(4)%v*ROEL%v+PRIMR(4)%v*ROER%v)
      OpenAD_Symbol_85 = ROEL%v
      OpenAD_Symbol_86 = PRIML(4)%v
      OpenAD_Symbol_83 = 1_w2f__i8
      OpenAD_Symbol_87 = ROER%v
      OpenAD_Symbol_88 = PRIMR(4)%v
      OpenAD_Symbol_84 = 1_w2f__i8
      WAVE%v = (PRIML(5)%v*ROEL%v+PRIMR(5)%v*ROER%v)
      OpenAD_Symbol_91 = ROEL%v
      OpenAD_Symbol_92 = PRIML(5)%v
      OpenAD_Symbol_89 = 1_w2f__i8
      OpenAD_Symbol_93 = ROER%v
      OpenAD_Symbol_94 = PRIMR(5)%v
      OpenAD_Symbol_90 = 1_w2f__i8
      HAVE%v = (HL%v*ROEL%v+HR%v*ROER%v)
      OpenAD_Symbol_97 = ROEL%v
      OpenAD_Symbol_98 = HL%v
      OpenAD_Symbol_95 = 1_w2f__i8
      OpenAD_Symbol_99 = ROER%v
      OpenAD_Symbol_100 = HR%v
      OpenAD_Symbol_96 = 1_w2f__i8
      OpenAD_Symbol_101 = ((UAVE%v**2)+(VAVE%v**2)+(WAVE%v**2))
      THTAVE%v = (OpenAD_Symbol_101*5.0D-01)
      OpenAD_Symbol_108 = (2*(UAVE%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_106 = 1_w2f__i8
      OpenAD_Symbol_110 = (2*(VAVE%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_107 = 1_w2f__i8
      OpenAD_Symbol_104 = 1_w2f__i8
      OpenAD_Symbol_112 = (2*(WAVE%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_105 = 1_w2f__i8
      OpenAD_Symbol_102 = 5.0D-01
      OpenAD_Symbol_114 = (HAVE%v-THTAVE%v)
      CAVE%v = (GM1%v*OpenAD_Symbol_114)
      OpenAD_Symbol_115 = OpenAD_Symbol_114
      OpenAD_Symbol_117 = 1_w2f__i8
      OpenAD_Symbol_118 = (-1_w2f__i8)
      OpenAD_Symbol_116 = GM1%v
      OpenAD_Symbol_522 = (OpenAD_Symbol_97 * OpenAD_Symbol_116)
      OpenAD_Symbol_523 = (INT((-1_w2f__i8)) * OpenAD_Symbol_116)
      OpenAD_Symbol_524 = (OpenAD_Symbol_99 * OpenAD_Symbol_116)
      OpenAD_Symbol_525 = (OpenAD_Symbol_70 * OpenAD_Symbol_524)
      OpenAD_Symbol_526 = (OpenAD_Symbol_73 * OpenAD_Symbol_525)
      OpenAD_Symbol_527 = (OpenAD_Symbol_60 * OpenAD_Symbol_522)
      OpenAD_Symbol_528 = (OpenAD_Symbol_63 * OpenAD_Symbol_527)
      OpenAD_Symbol_529 = (OpenAD_Symbol_71 * OpenAD_Symbol_524)
      OpenAD_Symbol_530 = (OpenAD_Symbol_61 * OpenAD_Symbol_522)
      OpenAD_Symbol_531 = (OpenAD_Symbol_74 * OpenAD_Symbol_525)
      OpenAD_Symbol_532 = (OpenAD_Symbol_75 * OpenAD_Symbol_531)
      OpenAD_Symbol_533 = (OpenAD_Symbol_64 * OpenAD_Symbol_527)
      OpenAD_Symbol_534 = (OpenAD_Symbol_65 * OpenAD_Symbol_533)
      OpenAD_Symbol_535 = (OpenAD_Symbol_26 * OpenAD_Symbol_22)
      OpenAD_Symbol_536 = (OpenAD_Symbol_76 * OpenAD_Symbol_531)
      OpenAD_Symbol_537 = (OpenAD_Symbol_66 * OpenAD_Symbol_533)
      OpenAD_Symbol_538 = (OpenAD_Symbol_112 * 5.0D-01)
      OpenAD_Symbol_539 = (OpenAD_Symbol_110 * 5.0D-01)
      OpenAD_Symbol_540 = (OpenAD_Symbol_108 * 5.0D-01)
      OpenAD_Symbol_541 = (INT((-1_w2f__i8)) * OpenAD_Symbol_94 +
     >  OpenAD_Symbol_92)
      OpenAD_Symbol_542 = (INT((-1_w2f__i8)) * OpenAD_Symbol_88 +
     >  OpenAD_Symbol_86)
      OpenAD_Symbol_543 = (INT((-1_w2f__i8)) * OpenAD_Symbol_82 +
     >  OpenAD_Symbol_80)
      OpenAD_Symbol_544 = (OpenAD_Symbol_55 * 5.0D-01)
      OpenAD_Symbol_545 = (OpenAD_Symbol_42 * 5.0D-01)
      OpenAD_Symbol_546 = (OpenAD_Symbol_53 * 5.0D-01)
      OpenAD_Symbol_547 = (OpenAD_Symbol_544 * OpenAD_Symbol_524)
      OpenAD_Symbol_548 = (OpenAD_Symbol_546 * OpenAD_Symbol_524)
      OpenAD_Symbol_549 = (OpenAD_Symbol_51 * 5.0D-01)
      OpenAD_Symbol_550 = (OpenAD_Symbol_51 * 5.0D-01 *
     >  OpenAD_Symbol_524)
      OpenAD_Symbol_551 = (OpenAD_Symbol_40 * 5.0D-01)
      OpenAD_Symbol_552 = (OpenAD_Symbol_545 * OpenAD_Symbol_522)
      OpenAD_Symbol_553 = (OpenAD_Symbol_551 * OpenAD_Symbol_522)
      OpenAD_Symbol_554 = (OpenAD_Symbol_38 * 5.0D-01)
      OpenAD_Symbol_555 = (OpenAD_Symbol_38 * 5.0D-01 *
     >  OpenAD_Symbol_522)
      OpenAD_Symbol_556 = (OpenAD_Symbol_93 * OpenAD_Symbol_538)
      OpenAD_Symbol_557 = (OpenAD_Symbol_91 * OpenAD_Symbol_538)
      OpenAD_Symbol_558 = (OpenAD_Symbol_87 * OpenAD_Symbol_539)
      OpenAD_Symbol_559 = (OpenAD_Symbol_541 * OpenAD_Symbol_538 +
     >  OpenAD_Symbol_542 * OpenAD_Symbol_539)
      OpenAD_Symbol_560 = (OpenAD_Symbol_85 * OpenAD_Symbol_539)
      OpenAD_Symbol_561 = (OpenAD_Symbol_540 * OpenAD_Symbol_523)
      OpenAD_Symbol_562 = (OpenAD_Symbol_556 * OpenAD_Symbol_523)
      OpenAD_Symbol_563 = (OpenAD_Symbol_557 * OpenAD_Symbol_523)
      OpenAD_Symbol_564 = (OpenAD_Symbol_558 * OpenAD_Symbol_523)
      OpenAD_Symbol_565 = (OpenAD_Symbol_560 * OpenAD_Symbol_523)
      OpenAD_Symbol_566 = (OpenAD_Symbol_81 * OpenAD_Symbol_540)
      OpenAD_Symbol_567 = (OpenAD_Symbol_559 + OpenAD_Symbol_543 *
     >  OpenAD_Symbol_540)
      OpenAD_Symbol_568 = (OpenAD_Symbol_79 * OpenAD_Symbol_540)
      OpenAD_Symbol_569 = (OpenAD_Symbol_81 * OpenAD_Symbol_561)
      OpenAD_Symbol_570 = (OpenAD_Symbol_98 * OpenAD_Symbol_116 + INT((
     > -1_w2f__i8)) * OpenAD_Symbol_100 * OpenAD_Symbol_116 +
     >  OpenAD_Symbol_559 * OpenAD_Symbol_523 + OpenAD_Symbol_543 *
     >  OpenAD_Symbol_561)
      OpenAD_Symbol_571 = (OpenAD_Symbol_79 * OpenAD_Symbol_561)
      OpenAD_Symbol_572 = (OpenAD_Symbol_27 * OpenAD_Symbol_535)
      OpenAD_Symbol_573 = (OpenAD_Symbol_572 * OpenAD_Symbol_570)
      OpenAD_Symbol_574 = (OpenAD_Symbol_28 * OpenAD_Symbol_535 *
     >  OpenAD_Symbol_570)
      OpenAD_Symbol_575 = (OpenAD_Symbol_28 * OpenAD_Symbol_535 *
     >  OpenAD_Symbol_541)
      OpenAD_Symbol_576 = (OpenAD_Symbol_28 * OpenAD_Symbol_535 *
     >  OpenAD_Symbol_542)
      OpenAD_Symbol_577 = (OpenAD_Symbol_28 * OpenAD_Symbol_535 *
     >  OpenAD_Symbol_543)
      OpenAD_Symbol_578 = (OpenAD_Symbol_28 * OpenAD_Symbol_535 *
     >  OpenAD_Symbol_567)
      OpenAD_Symbol_579 = (OpenAD_Symbol_572 * OpenAD_Symbol_541)
      OpenAD_Symbol_580 = (OpenAD_Symbol_572 * OpenAD_Symbol_542)
      OpenAD_Symbol_581 = (OpenAD_Symbol_572 * OpenAD_Symbol_543)
      OpenAD_Symbol_582 = (OpenAD_Symbol_572 * OpenAD_Symbol_567)
      CALL sax(OpenAD_Symbol_14,NRM(1),NXHAT)
      CALL saxpy(OpenAD_Symbol_15,NSIZEI,NXHAT)
      CALL sax(OpenAD_Symbol_16,NRM(2),NYHAT)
      CALL saxpy(OpenAD_Symbol_17,NSIZEI,NYHAT)
      CALL sax(OpenAD_Symbol_18,NRM(3),NZHAT)
      CALL saxpy(OpenAD_Symbol_19,NSIZEI,NZHAT)
      CALL sax(OpenAD_Symbol_545,PRIML(5),THETAL)
      CALL saxpy(OpenAD_Symbol_551,PRIML(4),THETAL)
      CALL saxpy(OpenAD_Symbol_554,PRIML(3),THETAL)
      CALL sax(OpenAD_Symbol_544,PRIMR(5),THETAR)
      CALL saxpy(OpenAD_Symbol_546,PRIMR(4),THETAR)
      CALL saxpy(OpenAD_Symbol_549,PRIMR(3),THETAR)
      CALL sax(OpenAD_Symbol_81,PRIMR(3),UAVE)
      CALL saxpy(OpenAD_Symbol_79,PRIML(3),UAVE)
      CALL saxpy(OpenAD_Symbol_577,PRIML(2),UAVE)
      CALL saxpy(OpenAD_Symbol_581,PRIMR(2),UAVE)
      CALL sax(OpenAD_Symbol_87,PRIMR(4),VAVE)
      CALL saxpy(OpenAD_Symbol_85,PRIML(4),VAVE)
      CALL saxpy(OpenAD_Symbol_576,PRIML(2),VAVE)
      CALL saxpy(OpenAD_Symbol_580,PRIMR(2),VAVE)
      CALL sax(OpenAD_Symbol_93,PRIMR(5),WAVE)
      CALL saxpy(OpenAD_Symbol_91,PRIML(5),WAVE)
      CALL saxpy(OpenAD_Symbol_575,PRIML(2),WAVE)
      CALL saxpy(OpenAD_Symbol_579,PRIMR(2),WAVE)
      CALL sax(OpenAD_Symbol_556,PRIMR(5),THTAVE)
      CALL saxpy(OpenAD_Symbol_557,PRIML(5),THTAVE)
      CALL saxpy(OpenAD_Symbol_558,PRIMR(4),THTAVE)
      CALL saxpy(OpenAD_Symbol_560,PRIML(4),THTAVE)
      CALL saxpy(OpenAD_Symbol_566,PRIMR(3),THTAVE)
      CALL saxpy(OpenAD_Symbol_568,PRIML(3),THTAVE)
      CALL saxpy(OpenAD_Symbol_578,PRIML(2),THTAVE)
      CALL saxpy(OpenAD_Symbol_582,PRIMR(2),THTAVE)
      CALL sax(OpenAD_Symbol_526,PRIMR(1),CAVE)
      CALL saxpy(OpenAD_Symbol_528,PRIML(1),CAVE)
      CALL saxpy(OpenAD_Symbol_529,PRIMR(2),CAVE)
      CALL saxpy(OpenAD_Symbol_530,PRIML(2),CAVE)
      CALL saxpy(OpenAD_Symbol_532,GAMMA,CAVE)
      CALL saxpy(OpenAD_Symbol_534,GAMMA,CAVE)
      CALL saxpy(OpenAD_Symbol_536,GM1INV,CAVE)
      CALL saxpy(OpenAD_Symbol_537,GM1INV,CAVE)
      CALL saxpy(OpenAD_Symbol_547,PRIMR(5),CAVE)
      CALL saxpy(OpenAD_Symbol_548,PRIMR(4),CAVE)
      CALL saxpy(OpenAD_Symbol_550,PRIMR(3),CAVE)
      CALL saxpy(OpenAD_Symbol_552,PRIML(5),CAVE)
      CALL saxpy(OpenAD_Symbol_553,PRIML(4),CAVE)
      CALL saxpy(OpenAD_Symbol_555,PRIML(3),CAVE)
      CALL saxpy(OpenAD_Symbol_562,PRIMR(5),CAVE)
      CALL saxpy(OpenAD_Symbol_563,PRIML(5),CAVE)
      CALL saxpy(OpenAD_Symbol_564,PRIMR(4),CAVE)
      CALL saxpy(OpenAD_Symbol_565,PRIML(4),CAVE)
      CALL saxpy(OpenAD_Symbol_569,PRIMR(3),CAVE)
      CALL saxpy(OpenAD_Symbol_571,PRIML(3),CAVE)
      CALL saxpy(OpenAD_Symbol_573,PRIMR(2),CAVE)
      CALL saxpy(OpenAD_Symbol_574,PRIML(2),CAVE)
      CALL saxpy(OpenAD_Symbol_115,GM1,CAVE)
      OpenAD_Symbol_120 = SIN(CAVE%v)
      OpenAD_Symbol_119 = COS(CAVE%v)
      CAVE%v = OpenAD_Symbol_120
      UHAT%v = (NXHAT%v*UAVE%v+NYHAT%v*VAVE%v+NZHAT%v*WAVE%v)
      OpenAD_Symbol_125 = UAVE%v
      OpenAD_Symbol_126 = NXHAT%v
      OpenAD_Symbol_123 = 1_w2f__i8
      OpenAD_Symbol_127 = VAVE%v
      OpenAD_Symbol_128 = NYHAT%v
      OpenAD_Symbol_124 = 1_w2f__i8
      OpenAD_Symbol_121 = 1_w2f__i8
      OpenAD_Symbol_129 = WAVE%v
      OpenAD_Symbol_130 = NZHAT%v
      OpenAD_Symbol_122 = 1_w2f__i8
      UTILDE%v = (NYHAT%v*WAVE%v-NZHAT%v*VAVE%v)
      OpenAD_Symbol_133 = WAVE%v
      OpenAD_Symbol_134 = NYHAT%v
      OpenAD_Symbol_131 = 1_w2f__i8
      OpenAD_Symbol_135 = VAVE%v
      OpenAD_Symbol_136 = NZHAT%v
      OpenAD_Symbol_132 = (-1_w2f__i8)
      VTILDE%v = (NZHAT%v*UAVE%v-NXHAT%v*WAVE%v)
      OpenAD_Symbol_139 = UAVE%v
      OpenAD_Symbol_140 = NZHAT%v
      OpenAD_Symbol_137 = 1_w2f__i8
      OpenAD_Symbol_141 = WAVE%v
      OpenAD_Symbol_142 = NXHAT%v
      OpenAD_Symbol_138 = (-1_w2f__i8)
      WTILDE%v = (NXHAT%v*VAVE%v-NYHAT%v*UAVE%v)
      OpenAD_Symbol_145 = VAVE%v
      OpenAD_Symbol_146 = NXHAT%v
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_147 = UAVE%v
      OpenAD_Symbol_148 = NYHAT%v
      OpenAD_Symbol_144 = (-1_w2f__i8)
      LAMCM%v = (UHAT%v-CAVE%v)
      OpenAD_Symbol_149 = 1_w2f__i8
      OpenAD_Symbol_150 = (-1_w2f__i8)
      LAMU%v = UHAT%v
      LAMCP%v = (CAVE%v+UHAT%v)
      OpenAD_Symbol_151 = 1_w2f__i8
      OpenAD_Symbol_152 = 1_w2f__i8
      OpenAD_Symbol_153 = (CAVE%v+UHAT%v)
      DELTA%v = (NLEFIX%v*OpenAD_Symbol_153)
      OpenAD_Symbol_154 = OpenAD_Symbol_153
      OpenAD_Symbol_156 = 1_w2f__i8
      OpenAD_Symbol_157 = 1_w2f__i8
      OpenAD_Symbol_155 = NLEFIX%v
      DELTA2%v = (DELTA%v**2)
      OpenAD_Symbol_158 = (2*(DELTA%v**(2-INT(1 _w2f__i8))))
      LAM2%v = (LAMCM%v**2)
      OpenAD_Symbol_160 = (2*(LAMCM%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_583 = (OpenAD_Symbol_119 * INT((-1_w2f__i8)))
      OpenAD_Symbol_584 = (OpenAD_Symbol_154 * OpenAD_Symbol_158)
      OpenAD_Symbol_585 = (OpenAD_Symbol_147 * INT((-1_w2f__i8)))
      OpenAD_Symbol_586 = (OpenAD_Symbol_141 * INT((-1_w2f__i8)))
      OpenAD_Symbol_587 = (OpenAD_Symbol_135 * INT((-1_w2f__i8)))
      OpenAD_Symbol_588 = (OpenAD_Symbol_155 * OpenAD_Symbol_158)
      OpenAD_Symbol_589 = (OpenAD_Symbol_148 * INT((-1_w2f__i8)))
      OpenAD_Symbol_590 = (OpenAD_Symbol_142 * INT((-1_w2f__i8)))
      OpenAD_Symbol_591 = (OpenAD_Symbol_136 * INT((-1_w2f__i8)))
      OpenAD_Symbol_592 = (OpenAD_Symbol_119 * OpenAD_Symbol_588)
      OpenAD_Symbol_593 = (OpenAD_Symbol_583 * OpenAD_Symbol_160)
      OpenAD_Symbol_594 = (OpenAD_Symbol_129 * OpenAD_Symbol_588)
      OpenAD_Symbol_595 = (OpenAD_Symbol_130 * OpenAD_Symbol_588)
      OpenAD_Symbol_596 = (OpenAD_Symbol_127 * OpenAD_Symbol_588)
      OpenAD_Symbol_597 = (OpenAD_Symbol_128 * OpenAD_Symbol_588)
      OpenAD_Symbol_598 = (OpenAD_Symbol_125 * OpenAD_Symbol_588)
      OpenAD_Symbol_599 = (OpenAD_Symbol_126 * OpenAD_Symbol_588)
      OpenAD_Symbol_600 = (OpenAD_Symbol_129 * OpenAD_Symbol_160)
      OpenAD_Symbol_601 = (OpenAD_Symbol_130 * OpenAD_Symbol_160)
      OpenAD_Symbol_602 = (OpenAD_Symbol_127 * OpenAD_Symbol_160)
      OpenAD_Symbol_603 = (OpenAD_Symbol_128 * OpenAD_Symbol_160)
      OpenAD_Symbol_604 = (OpenAD_Symbol_125 * OpenAD_Symbol_160)
      OpenAD_Symbol_605 = (OpenAD_Symbol_126 * OpenAD_Symbol_160)
      CALL setderiv(OpenAD_Symbol_606,CAVE)
      CALL sax(OpenAD_Symbol_119,OpenAD_Symbol_606,CAVE)
      CALL sax(OpenAD_Symbol_587,NZHAT,UTILDE)
      CALL saxpy(OpenAD_Symbol_133,NYHAT,UTILDE)
      CALL saxpy(OpenAD_Symbol_591,VAVE,UTILDE)
      CALL saxpy(OpenAD_Symbol_134,WAVE,UTILDE)
      CALL sax(OpenAD_Symbol_586,NXHAT,VTILDE)
      CALL saxpy(OpenAD_Symbol_139,NZHAT,VTILDE)
      CALL saxpy(OpenAD_Symbol_590,WAVE,VTILDE)
      CALL saxpy(OpenAD_Symbol_140,UAVE,VTILDE)
      CALL sax(OpenAD_Symbol_585,NYHAT,WTILDE)
      CALL saxpy(OpenAD_Symbol_145,NXHAT,WTILDE)
      CALL saxpy(OpenAD_Symbol_589,UAVE,WTILDE)
      CALL saxpy(OpenAD_Symbol_146,VAVE,WTILDE)
      CALL sax(OpenAD_Symbol_129,NZHAT,UHAT)
      CALL saxpy(OpenAD_Symbol_130,WAVE,UHAT)
      CALL saxpy(OpenAD_Symbol_127,NYHAT,UHAT)
      CALL saxpy(OpenAD_Symbol_128,VAVE,UHAT)
      CALL saxpy(OpenAD_Symbol_125,NXHAT,UHAT)
      CALL saxpy(OpenAD_Symbol_126,UAVE,UHAT)
      CALL sax(OpenAD_Symbol_583,OpenAD_Symbol_606,LAMCM)
      CALL saxpy(OpenAD_Symbol_129,NZHAT,LAMCM)
      CALL saxpy(OpenAD_Symbol_130,WAVE,LAMCM)
      CALL saxpy(OpenAD_Symbol_127,NYHAT,LAMCM)
      CALL saxpy(OpenAD_Symbol_128,VAVE,LAMCM)
      CALL saxpy(OpenAD_Symbol_125,NXHAT,LAMCM)
      CALL saxpy(OpenAD_Symbol_126,UAVE,LAMCM)
      CALL sax(OpenAD_Symbol_129,NZHAT,LAMU)
      CALL saxpy(OpenAD_Symbol_130,WAVE,LAMU)
      CALL saxpy(OpenAD_Symbol_127,NYHAT,LAMU)
      CALL saxpy(OpenAD_Symbol_128,VAVE,LAMU)
      CALL saxpy(OpenAD_Symbol_125,NXHAT,LAMU)
      CALL saxpy(OpenAD_Symbol_126,UAVE,LAMU)
      CALL sax(OpenAD_Symbol_119,OpenAD_Symbol_606,LAMCP)
      CALL saxpy(OpenAD_Symbol_129,NZHAT,LAMCP)
      CALL saxpy(OpenAD_Symbol_130,WAVE,LAMCP)
      CALL saxpy(OpenAD_Symbol_127,NYHAT,LAMCP)
      CALL saxpy(OpenAD_Symbol_128,VAVE,LAMCP)
      CALL saxpy(OpenAD_Symbol_125,NXHAT,LAMCP)
      CALL saxpy(OpenAD_Symbol_126,UAVE,LAMCP)
      CALL sax(OpenAD_Symbol_593,OpenAD_Symbol_606,LAM2)
      CALL saxpy(OpenAD_Symbol_600,NZHAT,LAM2)
      CALL saxpy(OpenAD_Symbol_601,WAVE,LAM2)
      CALL saxpy(OpenAD_Symbol_602,NYHAT,LAM2)
      CALL saxpy(OpenAD_Symbol_603,VAVE,LAM2)
      CALL saxpy(OpenAD_Symbol_604,NXHAT,LAM2)
      CALL saxpy(OpenAD_Symbol_605,UAVE,LAM2)
      CALL sax(OpenAD_Symbol_584,NLEFIX,DELTA2)
      CALL saxpy(OpenAD_Symbol_592,OpenAD_Symbol_606,DELTA2)
      CALL saxpy(OpenAD_Symbol_594,NZHAT,DELTA2)
      CALL saxpy(OpenAD_Symbol_595,WAVE,DELTA2)
      CALL saxpy(OpenAD_Symbol_596,NYHAT,DELTA2)
      CALL saxpy(OpenAD_Symbol_597,VAVE,DELTA2)
      CALL saxpy(OpenAD_Symbol_598,NXHAT,DELTA2)
      CALL saxpy(OpenAD_Symbol_599,UAVE,DELTA2)
      IF (DELTA2%v .LT. LAM2%v) THEN
        ALAMCM%v = LAMCM%v
        CALL setderiv(ALAMCM,LAMCM)
      ELSE
        OpenAD_Symbol_514 = (DELTA2%v+LAM2%v)
        OpenAD_Symbol_511 = (OpenAD_Symbol_514 * 5.0D-01)
        ALAMCM%v = (OpenAD_Symbol_511/DELTA2%v)
        OpenAD_Symbol_517 = 1_w2f__i8
        OpenAD_Symbol_518 = 1_w2f__i8
        OpenAD_Symbol_515 = 5.0D-01
        OpenAD_Symbol_512 = (INT(1 _w2f__i8)/DELTA2%v)
        OpenAD_Symbol_513 = (-(OpenAD_Symbol_511/(DELTA2%v*DELTA2%v)))
        OpenAD_Symbol_937 = (5.0D-01 * OpenAD_Symbol_512)
        CALL sax(OpenAD_Symbol_937,DELTA2,ALAMCM)
        CALL saxpy(OpenAD_Symbol_937,LAM2,ALAMCM)
        CALL saxpy(OpenAD_Symbol_513,DELTA2,ALAMCM)
      ENDIF
      LAM2%v = (LAMCP%v**2)
      OpenAD_Symbol_162 = (2*(LAMCP%v**(2-INT(1 _w2f__i8))))
      CALL sax(OpenAD_Symbol_162,LAMCP,LAM2)
      IF (DELTA2%v .LT. LAM2%v) THEN
        ALAMCP%v = LAMCP%v
        CALL setderiv(ALAMCP,LAMCP)
      ELSE
        OpenAD_Symbol_506 = (DELTA2%v+LAM2%v)
        OpenAD_Symbol_503 = (OpenAD_Symbol_506 * 5.0D-01)
        ALAMCP%v = (OpenAD_Symbol_503/DELTA2%v)
        OpenAD_Symbol_509 = 1_w2f__i8
        OpenAD_Symbol_510 = 1_w2f__i8
        OpenAD_Symbol_507 = 5.0D-01
        OpenAD_Symbol_504 = (INT(1 _w2f__i8)/DELTA2%v)
        OpenAD_Symbol_505 = (-(OpenAD_Symbol_503/(DELTA2%v*DELTA2%v)))
        OpenAD_Symbol_936 = (5.0D-01 * OpenAD_Symbol_504)
        CALL sax(OpenAD_Symbol_936,DELTA2,ALAMCP)
        CALL saxpy(OpenAD_Symbol_936,LAM2,ALAMCP)
        CALL saxpy(OpenAD_Symbol_505,DELTA2,ALAMCP)
      ENDIF
      OpenAD_Symbol_164 = (CAVE%v+UHAT%v)
      DELTA%v = (LEFIX%v*OpenAD_Symbol_164)
      OpenAD_Symbol_165 = OpenAD_Symbol_164
      OpenAD_Symbol_167 = 1_w2f__i8
      OpenAD_Symbol_168 = 1_w2f__i8
      OpenAD_Symbol_166 = LEFIX%v
      DELTA2%v = (DELTA%v*DELTA%v)
      OpenAD_Symbol_169 = DELTA%v
      OpenAD_Symbol_170 = DELTA%v
      LAM2%v = (LAMU%v**2)
      OpenAD_Symbol_171 = (2*(LAMU%v**(2-INT(1 _w2f__i8))))
      OpenAD_Symbol_607 = (OpenAD_Symbol_169 + OpenAD_Symbol_170)
      OpenAD_Symbol_608 = (OpenAD_Symbol_165 * OpenAD_Symbol_607)
      OpenAD_Symbol_609 = (OpenAD_Symbol_166 * OpenAD_Symbol_607)
      CALL sax(OpenAD_Symbol_171,LAMU,LAM2)
      CALL sax(OpenAD_Symbol_608,LEFIX,DELTA2)
      CALL saxpy(OpenAD_Symbol_609,CAVE,DELTA2)
      CALL saxpy(OpenAD_Symbol_609,UHAT,DELTA2)
      IF (DELTA2%v .LT. LAM2%v) THEN
        ALAMU%v = LAMU%v
        CALL setderiv(ALAMU,LAMU)
      ELSE
        OpenAD_Symbol_498 = (DELTA2%v+LAM2%v)
        OpenAD_Symbol_495 = (OpenAD_Symbol_498 * 5.0D-01)
        ALAMU%v = (OpenAD_Symbol_495/DELTA2%v)
        OpenAD_Symbol_501 = 1_w2f__i8
        OpenAD_Symbol_502 = 1_w2f__i8
        OpenAD_Symbol_499 = 5.0D-01
        OpenAD_Symbol_496 = (INT(1 _w2f__i8)/DELTA2%v)
        OpenAD_Symbol_497 = (-(OpenAD_Symbol_495/(DELTA2%v*DELTA2%v)))
        OpenAD_Symbol_935 = (5.0D-01 * OpenAD_Symbol_496)
        CALL sax(OpenAD_Symbol_935,DELTA2,ALAMU)
        CALL saxpy(OpenAD_Symbol_935,LAM2,ALAMU)
        CALL saxpy(OpenAD_Symbol_497,DELTA2,ALAMU)
      ENDIF
      OpenAD_Symbol_173 = (LAMCM%v-ALAMCM%v)
      ALAMCM%v = (OpenAD_Symbol_173*5.0D-01)
      OpenAD_Symbol_176 = 1_w2f__i8
      OpenAD_Symbol_177 = (-1_w2f__i8)
      OpenAD_Symbol_174 = 5.0D-01
      OpenAD_Symbol_178 = (LAMCP%v-ALAMCP%v)
      ALAMCP%v = (OpenAD_Symbol_178*5.0D-01)
      OpenAD_Symbol_181 = 1_w2f__i8
      OpenAD_Symbol_182 = (-1_w2f__i8)
      OpenAD_Symbol_179 = 5.0D-01
      OpenAD_Symbol_183 = (LAMU%v-ALAMU%v)
      ALAMU%v = (OpenAD_Symbol_183*5.0D-01)
      OpenAD_Symbol_186 = 1_w2f__i8
      OpenAD_Symbol_187 = (-1_w2f__i8)
      OpenAD_Symbol_184 = 5.0D-01
      EL%v = (PRIML(1)%v*GM1INV%v+PRIML(2)%v*THETAL%v)
      OpenAD_Symbol_190 = GM1INV%v
      OpenAD_Symbol_191 = PRIML(1)%v
      OpenAD_Symbol_188 = 1_w2f__i8
      OpenAD_Symbol_192 = THETAL%v
      OpenAD_Symbol_193 = PRIML(2)%v
      OpenAD_Symbol_189 = 1_w2f__i8
      RUL%v = (PRIML(2)%v*PRIML(3)%v)
      OpenAD_Symbol_194 = PRIML(3)%v
      OpenAD_Symbol_195 = PRIML(2)%v
      RVL%v = (PRIML(2)%v*PRIML(4)%v)
      OpenAD_Symbol_196 = PRIML(4)%v
      OpenAD_Symbol_197 = PRIML(2)%v
      RWL%v = (PRIML(2)%v*PRIML(5)%v)
      OpenAD_Symbol_198 = PRIML(5)%v
      OpenAD_Symbol_199 = PRIML(2)%v
      ER%v = (PRIMR(1)%v*GM1INV%v+PRIMR(2)%v*THETAR%v)
      OpenAD_Symbol_202 = GM1INV%v
      OpenAD_Symbol_203 = PRIMR(1)%v
      OpenAD_Symbol_200 = 1_w2f__i8
      OpenAD_Symbol_204 = THETAR%v
      OpenAD_Symbol_205 = PRIMR(2)%v
      OpenAD_Symbol_201 = 1_w2f__i8
      RUR%v = (PRIMR(2)%v*PRIMR(3)%v)
      OpenAD_Symbol_206 = PRIMR(3)%v
      OpenAD_Symbol_207 = PRIMR(2)%v
      RVR%v = (PRIMR(2)%v*PRIMR(4)%v)
      OpenAD_Symbol_208 = PRIMR(4)%v
      OpenAD_Symbol_209 = PRIMR(2)%v
      RWR%v = (PRIMR(2)%v*PRIMR(5)%v)
      OpenAD_Symbol_210 = PRIMR(5)%v
      OpenAD_Symbol_211 = PRIMR(2)%v
      DE%v = (ER%v-EL%v)
      OpenAD_Symbol_212 = 1_w2f__i8
      OpenAD_Symbol_213 = (-1_w2f__i8)
      DR%v = (PRIMR(2)%v-PRIML(2)%v)
      OpenAD_Symbol_214 = 1_w2f__i8
      OpenAD_Symbol_215 = (-1_w2f__i8)
      DRU%v = (RUR%v-RUL%v)
      OpenAD_Symbol_216 = 1_w2f__i8
      OpenAD_Symbol_217 = (-1_w2f__i8)
      DRV%v = (RVR%v-RVL%v)
      OpenAD_Symbol_218 = 1_w2f__i8
      OpenAD_Symbol_219 = (-1_w2f__i8)
      DRW%v = (RWR%v-RWL%v)
      OpenAD_Symbol_220 = 1_w2f__i8
      OpenAD_Symbol_221 = (-1_w2f__i8)
      UDDRU%v = (DRU%v*UAVE%v+DRV%v*VAVE%v+DRW%v*WAVE%v)
      OpenAD_Symbol_226 = UAVE%v
      OpenAD_Symbol_227 = DRU%v
      OpenAD_Symbol_224 = 1_w2f__i8
      OpenAD_Symbol_228 = VAVE%v
      OpenAD_Symbol_229 = DRV%v
      OpenAD_Symbol_225 = 1_w2f__i8
      OpenAD_Symbol_222 = 1_w2f__i8
      OpenAD_Symbol_230 = WAVE%v
      OpenAD_Symbol_231 = DRW%v
      OpenAD_Symbol_223 = 1_w2f__i8
      OpenAD_Symbol_232 = (GM1%v/CAVE%v)
      OpenAD_Symbol_233 = (DE%v+DR%v*THTAVE%v-UDDRU%v)
      OMEGA%v = (OpenAD_Symbol_232*OpenAD_Symbol_233)
      OpenAD_Symbol_236 = (INT(1 _w2f__i8)/CAVE%v)
      OpenAD_Symbol_237 = (-(GM1%v/(CAVE%v*CAVE%v)))
      OpenAD_Symbol_234 = OpenAD_Symbol_233
      OpenAD_Symbol_240 = 1_w2f__i8
      OpenAD_Symbol_242 = THTAVE%v
      OpenAD_Symbol_243 = DR%v
      OpenAD_Symbol_241 = 1_w2f__i8
      OpenAD_Symbol_238 = 1_w2f__i8
      OpenAD_Symbol_239 = (-1_w2f__i8)
      OpenAD_Symbol_235 = OpenAD_Symbol_232
      NDDRU%v = (DRU%v*NXHAT%v+DRV%v*NYHAT%v+DRW%v*NZHAT%v)
      OpenAD_Symbol_248 = NXHAT%v
      OpenAD_Symbol_249 = DRU%v
      OpenAD_Symbol_246 = 1_w2f__i8
      OpenAD_Symbol_250 = NYHAT%v
      OpenAD_Symbol_251 = DRV%v
      OpenAD_Symbol_247 = 1_w2f__i8
      OpenAD_Symbol_244 = 1_w2f__i8
      OpenAD_Symbol_252 = NZHAT%v
      OpenAD_Symbol_253 = DRW%v
      OpenAD_Symbol_245 = 1_w2f__i8
      OpenAD_Symbol_254 = (OMEGA%v+DR%v*UHAT%v-NDDRU%v)
      ALP1%v = (OpenAD_Symbol_254*5.0D-01)
      OpenAD_Symbol_259 = 1_w2f__i8
      OpenAD_Symbol_261 = UHAT%v
      OpenAD_Symbol_262 = DR%v
      OpenAD_Symbol_260 = 1_w2f__i8
      OpenAD_Symbol_257 = 1_w2f__i8
      OpenAD_Symbol_258 = (-1_w2f__i8)
      OpenAD_Symbol_255 = 5.0D-01
      OpenAD_Symbol_271 = (CAVE%v*NXHAT%v-UTILDE%v)
      OpenAD_Symbol_278 = (-NXHAT%v)
      ALP2%v = (DRW%v*NYHAT%v+DR%v*OpenAD_Symbol_271+OMEGA%v*OpenAD_Symb
     +ol_278-DRV%v*NZHAT%v)
      OpenAD_Symbol_265 = NYHAT%v
      OpenAD_Symbol_266 = DRW%v
      OpenAD_Symbol_263 = 1_w2f__i8
      OpenAD_Symbol_272 = OpenAD_Symbol_271
      OpenAD_Symbol_276 = NXHAT%v
      OpenAD_Symbol_277 = CAVE%v
      OpenAD_Symbol_274 = 1_w2f__i8
      OpenAD_Symbol_275 = (-1_w2f__i8)
      OpenAD_Symbol_273 = DR%v
      OpenAD_Symbol_269 = 1_w2f__i8
      OpenAD_Symbol_279 = OpenAD_Symbol_278
      OpenAD_Symbol_281 = (-1_w2f__i8)
      OpenAD_Symbol_280 = OMEGA%v
      OpenAD_Symbol_270 = 1_w2f__i8
      OpenAD_Symbol_267 = 1_w2f__i8
      OpenAD_Symbol_282 = NZHAT%v
      OpenAD_Symbol_283 = DRV%v
      OpenAD_Symbol_268 = (-1_w2f__i8)
      OpenAD_Symbol_264 = 1_w2f__i8
      OpenAD_Symbol_292 = (CAVE%v*NYHAT%v-VTILDE%v)
      OpenAD_Symbol_299 = (-NYHAT%v)
      ALP3%v = (DRU%v*NZHAT%v+DR%v*OpenAD_Symbol_292+OMEGA%v*OpenAD_Symb
     +ol_299-DRW%v*NXHAT%v)
      OpenAD_Symbol_286 = NZHAT%v
      OpenAD_Symbol_287 = DRU%v
      OpenAD_Symbol_284 = 1_w2f__i8
      OpenAD_Symbol_293 = OpenAD_Symbol_292
      OpenAD_Symbol_297 = NYHAT%v
      OpenAD_Symbol_298 = CAVE%v
      OpenAD_Symbol_295 = 1_w2f__i8
      OpenAD_Symbol_296 = (-1_w2f__i8)
      OpenAD_Symbol_294 = DR%v
      OpenAD_Symbol_290 = 1_w2f__i8
      OpenAD_Symbol_300 = OpenAD_Symbol_299
      OpenAD_Symbol_302 = (-1_w2f__i8)
      OpenAD_Symbol_301 = OMEGA%v
      OpenAD_Symbol_291 = 1_w2f__i8
      OpenAD_Symbol_288 = 1_w2f__i8
      OpenAD_Symbol_303 = NXHAT%v
      OpenAD_Symbol_304 = DRW%v
      OpenAD_Symbol_289 = (-1_w2f__i8)
      OpenAD_Symbol_285 = 1_w2f__i8
      OpenAD_Symbol_313 = (CAVE%v*NZHAT%v-WTILDE%v)
      OpenAD_Symbol_320 = (-NZHAT%v)
      ALP4%v = (DRV%v*NXHAT%v+DR%v*OpenAD_Symbol_313+OMEGA%v*OpenAD_Symb
     +ol_320-DRU%v*NYHAT%v)
      OpenAD_Symbol_307 = NXHAT%v
      OpenAD_Symbol_308 = DRV%v
      OpenAD_Symbol_305 = 1_w2f__i8
      OpenAD_Symbol_314 = OpenAD_Symbol_313
      OpenAD_Symbol_318 = NZHAT%v
      OpenAD_Symbol_319 = CAVE%v
      OpenAD_Symbol_316 = 1_w2f__i8
      OpenAD_Symbol_317 = (-1_w2f__i8)
      OpenAD_Symbol_315 = DR%v
      OpenAD_Symbol_311 = 1_w2f__i8
      OpenAD_Symbol_321 = OpenAD_Symbol_320
      OpenAD_Symbol_323 = (-1_w2f__i8)
      OpenAD_Symbol_322 = OMEGA%v
      OpenAD_Symbol_312 = 1_w2f__i8
      OpenAD_Symbol_309 = 1_w2f__i8
      OpenAD_Symbol_324 = NYHAT%v
      OpenAD_Symbol_325 = DRU%v
      OpenAD_Symbol_310 = (-1_w2f__i8)
      OpenAD_Symbol_306 = 1_w2f__i8
      OpenAD_Symbol_326 = (NDDRU%v+OMEGA%v-DR%v*UHAT%v)
      ALP5%v = (OpenAD_Symbol_326*5.0D-01)
      OpenAD_Symbol_329 = 1_w2f__i8
      OpenAD_Symbol_331 = 1_w2f__i8
      OpenAD_Symbol_333 = UHAT%v
      OpenAD_Symbol_334 = DR%v
      OpenAD_Symbol_332 = (-1_w2f__i8)
      OpenAD_Symbol_330 = 1_w2f__i8
      OpenAD_Symbol_327 = 5.0D-01
      OpenAD_Symbol_610 = (OpenAD_Symbol_318 * OpenAD_Symbol_315)
      OpenAD_Symbol_611 = (OpenAD_Symbol_297 * OpenAD_Symbol_294)
      OpenAD_Symbol_612 = (OpenAD_Symbol_276 * OpenAD_Symbol_273)
      OpenAD_Symbol_613 = (OpenAD_Symbol_324 * INT((-1_w2f__i8)))
      OpenAD_Symbol_614 = (OpenAD_Symbol_303 * INT((-1_w2f__i8)))
      OpenAD_Symbol_615 = (OpenAD_Symbol_282 * INT((-1_w2f__i8)))
      OpenAD_Symbol_616 = (OpenAD_Symbol_334 *(-5.0D-01))
      OpenAD_Symbol_617 = (OpenAD_Symbol_262 * 5.0D-01)
      OpenAD_Symbol_618 = (INT((-1_w2f__i8)) * OpenAD_Symbol_315)
      OpenAD_Symbol_619 = (INT((-1_w2f__i8)) * OpenAD_Symbol_294)
      OpenAD_Symbol_620 = (INT((-1_w2f__i8)) * OpenAD_Symbol_273)
      OpenAD_Symbol_621 = (OpenAD_Symbol_325 * INT((-1_w2f__i8)))
      OpenAD_Symbol_622 = (INT((-1_w2f__i8)) * OpenAD_Symbol_322)
      OpenAD_Symbol_623 = (OpenAD_Symbol_319 * OpenAD_Symbol_315)
      OpenAD_Symbol_624 = (OpenAD_Symbol_304 * INT((-1_w2f__i8)))
      OpenAD_Symbol_625 = (INT((-1_w2f__i8)) * OpenAD_Symbol_301)
      OpenAD_Symbol_626 = (OpenAD_Symbol_298 * OpenAD_Symbol_294)
      OpenAD_Symbol_627 = (OpenAD_Symbol_283 * INT((-1_w2f__i8)))
      OpenAD_Symbol_628 = (INT((-1_w2f__i8)) * OpenAD_Symbol_280)
      OpenAD_Symbol_629 = (OpenAD_Symbol_277 * OpenAD_Symbol_273)
      OpenAD_Symbol_630 = (OpenAD_Symbol_230 * INT((-1_w2f__i8)))
      OpenAD_Symbol_631 = (OpenAD_Symbol_231 * INT((-1_w2f__i8)))
      OpenAD_Symbol_632 = (OpenAD_Symbol_228 * INT((-1_w2f__i8)))
      OpenAD_Symbol_633 = (OpenAD_Symbol_229 * INT((-1_w2f__i8)))
      OpenAD_Symbol_634 = (OpenAD_Symbol_226 * INT((-1_w2f__i8)))
      OpenAD_Symbol_635 = (OpenAD_Symbol_227 * INT((-1_w2f__i8)))
      OpenAD_Symbol_636 = (INT((-1_w2f__i8)) * OpenAD_Symbol_242)
      OpenAD_Symbol_637 = (OpenAD_Symbol_192 * INT((-1_w2f__i8)))
      OpenAD_Symbol_638 = (OpenAD_Symbol_193 * INT((-1_w2f__i8)))
      OpenAD_Symbol_639 = (OpenAD_Symbol_190 * INT((-1_w2f__i8)))
      OpenAD_Symbol_640 = (OpenAD_Symbol_191 * INT((-1_w2f__i8)))
      OpenAD_Symbol_641 = (OpenAD_Symbol_250 * 5.0D-01)
      OpenAD_Symbol_642 = (OpenAD_Symbol_250 *(-5.0D-01))
      OpenAD_Symbol_643 = (OpenAD_Symbol_251 * 5.0D-01)
      OpenAD_Symbol_644 = (OpenAD_Symbol_251 *(-5.0D-01))
      OpenAD_Symbol_645 = (OpenAD_Symbol_252 * 5.0D-01)
      OpenAD_Symbol_646 = (OpenAD_Symbol_253 * 5.0D-01)
      OpenAD_Symbol_647 = (OpenAD_Symbol_252 *(-5.0D-01))
      OpenAD_Symbol_648 = (OpenAD_Symbol_253 *(-5.0D-01))
      OpenAD_Symbol_649 = (OpenAD_Symbol_248 * 5.0D-01)
      OpenAD_Symbol_650 = (OpenAD_Symbol_248 *(-5.0D-01))
      OpenAD_Symbol_651 = (OpenAD_Symbol_249 * 5.0D-01)
      OpenAD_Symbol_652 = (OpenAD_Symbol_249 *(-5.0D-01))
      OpenAD_Symbol_653 = (OpenAD_Symbol_236 * OpenAD_Symbol_234)
      OpenAD_Symbol_654 = (OpenAD_Symbol_237 * OpenAD_Symbol_234)
      OpenAD_Symbol_655 = (INT((-1_w2f__i8)) * OpenAD_Symbol_265)
      OpenAD_Symbol_656 = (INT((-1_w2f__i8)) * OpenAD_Symbol_614)
      OpenAD_Symbol_657 = (INT((-1_w2f__i8)) * OpenAD_Symbol_630)
      OpenAD_Symbol_658 = (INT((-1_w2f__i8)) * OpenAD_Symbol_645)
      OpenAD_Symbol_659 = (INT((-1_w2f__i8)) * OpenAD_Symbol_647)
      OpenAD_Symbol_660 = (OpenAD_Symbol_210 * OpenAD_Symbol_630)
      OpenAD_Symbol_661 = (OpenAD_Symbol_211 * OpenAD_Symbol_630)
      OpenAD_Symbol_662 = (OpenAD_Symbol_198 * OpenAD_Symbol_657)
      OpenAD_Symbol_663 = (OpenAD_Symbol_199 * OpenAD_Symbol_657)
      OpenAD_Symbol_664 = (INT((-1_w2f__i8)) * OpenAD_Symbol_307)
      OpenAD_Symbol_665 = (INT((-1_w2f__i8)) * OpenAD_Symbol_615)
      OpenAD_Symbol_666 = (INT((-1_w2f__i8)) * OpenAD_Symbol_632)
      OpenAD_Symbol_667 = (INT((-1_w2f__i8)) * OpenAD_Symbol_641)
      OpenAD_Symbol_668 = (INT((-1_w2f__i8)) * OpenAD_Symbol_642)
      OpenAD_Symbol_669 = (OpenAD_Symbol_208 * OpenAD_Symbol_632)
      OpenAD_Symbol_670 = (OpenAD_Symbol_209 * OpenAD_Symbol_632)
      OpenAD_Symbol_671 = (OpenAD_Symbol_196 * OpenAD_Symbol_666)
      OpenAD_Symbol_672 = (OpenAD_Symbol_197 * OpenAD_Symbol_666)
      OpenAD_Symbol_673 = (INT((-1_w2f__i8)) * OpenAD_Symbol_286)
      OpenAD_Symbol_674 = (INT((-1_w2f__i8)) * OpenAD_Symbol_613)
      OpenAD_Symbol_675 = (INT((-1_w2f__i8)) * OpenAD_Symbol_634)
      OpenAD_Symbol_676 = (INT((-1_w2f__i8)) * OpenAD_Symbol_649)
      OpenAD_Symbol_677 = (INT((-1_w2f__i8)) * OpenAD_Symbol_650)
      OpenAD_Symbol_678 = (OpenAD_Symbol_206 * OpenAD_Symbol_634)
      OpenAD_Symbol_679 = (OpenAD_Symbol_207 * OpenAD_Symbol_634)
      OpenAD_Symbol_680 = (OpenAD_Symbol_194 * OpenAD_Symbol_675)
      OpenAD_Symbol_681 = (OpenAD_Symbol_195 * OpenAD_Symbol_675)
      OpenAD_Symbol_682 = (OpenAD_Symbol_235 * 5.0D-01)
      OpenAD_Symbol_683 = (OpenAD_Symbol_235 * 5.0D-01)
      OpenAD_Symbol_684 = (OpenAD_Symbol_235 * OpenAD_Symbol_321)
      OpenAD_Symbol_685 = (OpenAD_Symbol_235 * OpenAD_Symbol_300)
      OpenAD_Symbol_686 = (OpenAD_Symbol_235 * OpenAD_Symbol_279)
      OpenAD_Symbol_687 = (OpenAD_Symbol_631 * OpenAD_Symbol_682)
      OpenAD_Symbol_688 = (OpenAD_Symbol_631 * OpenAD_Symbol_683)
      OpenAD_Symbol_689 = (OpenAD_Symbol_631 * OpenAD_Symbol_684)
      OpenAD_Symbol_690 = (OpenAD_Symbol_631 * OpenAD_Symbol_685)
      OpenAD_Symbol_691 = (OpenAD_Symbol_631 * OpenAD_Symbol_686)
      OpenAD_Symbol_692 = (OpenAD_Symbol_633 * OpenAD_Symbol_682)
      OpenAD_Symbol_693 = (OpenAD_Symbol_633 * OpenAD_Symbol_683)
      OpenAD_Symbol_694 = (OpenAD_Symbol_633 * OpenAD_Symbol_684)
      OpenAD_Symbol_695 = (OpenAD_Symbol_633 * OpenAD_Symbol_685)
      OpenAD_Symbol_696 = (OpenAD_Symbol_633 * OpenAD_Symbol_686)
      OpenAD_Symbol_697 = (OpenAD_Symbol_635 * OpenAD_Symbol_682)
      OpenAD_Symbol_698 = (OpenAD_Symbol_635 * OpenAD_Symbol_683)
      OpenAD_Symbol_699 = (OpenAD_Symbol_635 * OpenAD_Symbol_684)
      OpenAD_Symbol_700 = (OpenAD_Symbol_635 * OpenAD_Symbol_685)
      OpenAD_Symbol_701 = (OpenAD_Symbol_635 * OpenAD_Symbol_686)
      OpenAD_Symbol_702 = (OpenAD_Symbol_204 * OpenAD_Symbol_682)
      OpenAD_Symbol_703 = (OpenAD_Symbol_204 * OpenAD_Symbol_683)
      OpenAD_Symbol_704 = (OpenAD_Symbol_204 * OpenAD_Symbol_684)
      OpenAD_Symbol_705 = (OpenAD_Symbol_204 * OpenAD_Symbol_685)
      OpenAD_Symbol_706 = (OpenAD_Symbol_204 * OpenAD_Symbol_686)
      OpenAD_Symbol_707 = (OpenAD_Symbol_205 * OpenAD_Symbol_682)
      OpenAD_Symbol_708 = (OpenAD_Symbol_205 * OpenAD_Symbol_683)
      OpenAD_Symbol_709 = (OpenAD_Symbol_205 * OpenAD_Symbol_684)
      OpenAD_Symbol_710 = (OpenAD_Symbol_205 * OpenAD_Symbol_685)
      OpenAD_Symbol_711 = (OpenAD_Symbol_205 * OpenAD_Symbol_686)
      OpenAD_Symbol_712 = (OpenAD_Symbol_202 * OpenAD_Symbol_682)
      OpenAD_Symbol_713 = (OpenAD_Symbol_202 * OpenAD_Symbol_683)
      OpenAD_Symbol_714 = (OpenAD_Symbol_202 * OpenAD_Symbol_684)
      OpenAD_Symbol_715 = (OpenAD_Symbol_202 * OpenAD_Symbol_685)
      OpenAD_Symbol_716 = (OpenAD_Symbol_202 * OpenAD_Symbol_686)
      OpenAD_Symbol_717 = (OpenAD_Symbol_203 * OpenAD_Symbol_682)
      OpenAD_Symbol_718 = (OpenAD_Symbol_203 * OpenAD_Symbol_683)
      OpenAD_Symbol_719 = (OpenAD_Symbol_203 * OpenAD_Symbol_684)
      OpenAD_Symbol_720 = (OpenAD_Symbol_203 * OpenAD_Symbol_685)
      OpenAD_Symbol_721 = (OpenAD_Symbol_203 * OpenAD_Symbol_686)
      OpenAD_Symbol_722 = (OpenAD_Symbol_243 * OpenAD_Symbol_682)
      OpenAD_Symbol_723 = (OpenAD_Symbol_243 * OpenAD_Symbol_683)
      OpenAD_Symbol_724 = (OpenAD_Symbol_243 * OpenAD_Symbol_684)
      OpenAD_Symbol_725 = (OpenAD_Symbol_243 * OpenAD_Symbol_685)
      OpenAD_Symbol_726 = (OpenAD_Symbol_243 * OpenAD_Symbol_686)
      OpenAD_Symbol_727 = (OpenAD_Symbol_261 * 5.0D-01 +
     >  OpenAD_Symbol_242 * OpenAD_Symbol_682)
      OpenAD_Symbol_728 = (OpenAD_Symbol_333 *(-5.0D-01) +
     >  OpenAD_Symbol_242 * OpenAD_Symbol_683)
      OpenAD_Symbol_729 = (OpenAD_Symbol_314 + OpenAD_Symbol_242 *
     >  OpenAD_Symbol_684)
      OpenAD_Symbol_730 = (OpenAD_Symbol_293 + OpenAD_Symbol_242 *
     >  OpenAD_Symbol_685)
      OpenAD_Symbol_731 = (OpenAD_Symbol_272 + OpenAD_Symbol_242 *
     >  OpenAD_Symbol_686)
      OpenAD_Symbol_732 = (INT((-1_w2f__i8)) * OpenAD_Symbol_261 *
     >  5.0D-01 + OpenAD_Symbol_636 * OpenAD_Symbol_682)
      OpenAD_Symbol_733 = (INT((-1_w2f__i8)) * OpenAD_Symbol_333 *(
     > -5.0D-01) + OpenAD_Symbol_636 * OpenAD_Symbol_683)
      OpenAD_Symbol_734 = (INT((-1_w2f__i8)) * OpenAD_Symbol_314 +
     >  OpenAD_Symbol_636 * OpenAD_Symbol_684)
      OpenAD_Symbol_735 = (INT((-1_w2f__i8)) * OpenAD_Symbol_293 +
     >  OpenAD_Symbol_636 * OpenAD_Symbol_685)
      OpenAD_Symbol_736 = (INT((-1_w2f__i8)) * OpenAD_Symbol_272 +
     >  OpenAD_Symbol_636 * OpenAD_Symbol_686)
      OpenAD_Symbol_737 = (OpenAD_Symbol_637 * OpenAD_Symbol_682)
      OpenAD_Symbol_738 = (OpenAD_Symbol_637 * OpenAD_Symbol_683)
      OpenAD_Symbol_739 = (OpenAD_Symbol_637 * OpenAD_Symbol_684)
      OpenAD_Symbol_740 = (OpenAD_Symbol_637 * OpenAD_Symbol_685)
      OpenAD_Symbol_741 = (OpenAD_Symbol_637 * OpenAD_Symbol_686)
      OpenAD_Symbol_742 = (OpenAD_Symbol_638 * OpenAD_Symbol_682)
      OpenAD_Symbol_743 = (OpenAD_Symbol_638 * OpenAD_Symbol_683)
      OpenAD_Symbol_744 = (OpenAD_Symbol_638 * OpenAD_Symbol_684)
      OpenAD_Symbol_745 = (OpenAD_Symbol_638 * OpenAD_Symbol_685)
      OpenAD_Symbol_746 = (OpenAD_Symbol_638 * OpenAD_Symbol_686)
      OpenAD_Symbol_747 = (OpenAD_Symbol_639 * OpenAD_Symbol_682)
      OpenAD_Symbol_748 = (OpenAD_Symbol_639 * OpenAD_Symbol_683)
      OpenAD_Symbol_749 = (OpenAD_Symbol_639 * OpenAD_Symbol_684)
      OpenAD_Symbol_750 = (OpenAD_Symbol_639 * OpenAD_Symbol_685)
      OpenAD_Symbol_751 = (OpenAD_Symbol_639 * OpenAD_Symbol_686)
      OpenAD_Symbol_752 = (OpenAD_Symbol_640 * OpenAD_Symbol_682)
      OpenAD_Symbol_753 = (OpenAD_Symbol_640 * OpenAD_Symbol_683)
      OpenAD_Symbol_754 = (OpenAD_Symbol_640 * OpenAD_Symbol_684)
      OpenAD_Symbol_755 = (OpenAD_Symbol_640 * OpenAD_Symbol_685)
      OpenAD_Symbol_756 = (OpenAD_Symbol_640 * OpenAD_Symbol_686)
      OpenAD_Symbol_757 = (OpenAD_Symbol_210 * OpenAD_Symbol_647 +
     >  OpenAD_Symbol_660 * OpenAD_Symbol_682)
      OpenAD_Symbol_758 = (OpenAD_Symbol_210 * OpenAD_Symbol_645 +
     >  OpenAD_Symbol_660 * OpenAD_Symbol_683)
      OpenAD_Symbol_759 = (OpenAD_Symbol_660 * OpenAD_Symbol_684)
      OpenAD_Symbol_760 = (OpenAD_Symbol_210 * OpenAD_Symbol_614 +
     >  OpenAD_Symbol_660 * OpenAD_Symbol_685)
      OpenAD_Symbol_761 = (OpenAD_Symbol_210 * OpenAD_Symbol_265 +
     >  OpenAD_Symbol_660 * OpenAD_Symbol_686)
      OpenAD_Symbol_762 = (OpenAD_Symbol_211 * OpenAD_Symbol_647 +
     >  OpenAD_Symbol_661 * OpenAD_Symbol_682)
      OpenAD_Symbol_763 = (OpenAD_Symbol_211 * OpenAD_Symbol_645 +
     >  OpenAD_Symbol_661 * OpenAD_Symbol_683)
      OpenAD_Symbol_764 = (OpenAD_Symbol_661 * OpenAD_Symbol_684)
      OpenAD_Symbol_765 = (OpenAD_Symbol_211 * OpenAD_Symbol_614 +
     >  OpenAD_Symbol_661 * OpenAD_Symbol_685)
      OpenAD_Symbol_766 = (OpenAD_Symbol_211 * OpenAD_Symbol_265 +
     >  OpenAD_Symbol_661 * OpenAD_Symbol_686)
      OpenAD_Symbol_767 = (OpenAD_Symbol_198 * OpenAD_Symbol_659 +
     >  OpenAD_Symbol_662 * OpenAD_Symbol_682)
      OpenAD_Symbol_768 = (OpenAD_Symbol_198 * OpenAD_Symbol_658 +
     >  OpenAD_Symbol_662 * OpenAD_Symbol_683)
      OpenAD_Symbol_769 = (OpenAD_Symbol_662 * OpenAD_Symbol_684)
      OpenAD_Symbol_770 = (OpenAD_Symbol_198 * OpenAD_Symbol_656 +
     >  OpenAD_Symbol_662 * OpenAD_Symbol_685)
      OpenAD_Symbol_771 = (OpenAD_Symbol_198 * OpenAD_Symbol_655 +
     >  OpenAD_Symbol_662 * OpenAD_Symbol_686)
      OpenAD_Symbol_772 = (OpenAD_Symbol_199 * OpenAD_Symbol_659 +
     >  OpenAD_Symbol_663 * OpenAD_Symbol_682)
      OpenAD_Symbol_773 = (OpenAD_Symbol_199 * OpenAD_Symbol_658 +
     >  OpenAD_Symbol_663 * OpenAD_Symbol_683)
      OpenAD_Symbol_774 = (OpenAD_Symbol_663 * OpenAD_Symbol_684)
      OpenAD_Symbol_775 = (OpenAD_Symbol_199 * OpenAD_Symbol_656 +
     >  OpenAD_Symbol_663 * OpenAD_Symbol_685)
      OpenAD_Symbol_776 = (OpenAD_Symbol_199 * OpenAD_Symbol_655 +
     >  OpenAD_Symbol_663 * OpenAD_Symbol_686)
      OpenAD_Symbol_777 = (OpenAD_Symbol_208 * OpenAD_Symbol_642 +
     >  OpenAD_Symbol_669 * OpenAD_Symbol_682)
      OpenAD_Symbol_778 = (OpenAD_Symbol_208 * OpenAD_Symbol_641 +
     >  OpenAD_Symbol_669 * OpenAD_Symbol_683)
      OpenAD_Symbol_779 = (OpenAD_Symbol_208 * OpenAD_Symbol_307 +
     >  OpenAD_Symbol_669 * OpenAD_Symbol_684)
      OpenAD_Symbol_780 = (OpenAD_Symbol_669 * OpenAD_Symbol_685)
      OpenAD_Symbol_781 = (OpenAD_Symbol_208 * OpenAD_Symbol_615 +
     >  OpenAD_Symbol_669 * OpenAD_Symbol_686)
      OpenAD_Symbol_782 = (OpenAD_Symbol_209 * OpenAD_Symbol_642 +
     >  OpenAD_Symbol_670 * OpenAD_Symbol_682)
      OpenAD_Symbol_783 = (OpenAD_Symbol_209 * OpenAD_Symbol_641 +
     >  OpenAD_Symbol_670 * OpenAD_Symbol_683)
      OpenAD_Symbol_784 = (OpenAD_Symbol_209 * OpenAD_Symbol_307 +
     >  OpenAD_Symbol_670 * OpenAD_Symbol_684)
      OpenAD_Symbol_785 = (OpenAD_Symbol_670 * OpenAD_Symbol_685)
      OpenAD_Symbol_786 = (OpenAD_Symbol_209 * OpenAD_Symbol_615 +
     >  OpenAD_Symbol_670 * OpenAD_Symbol_686)
      OpenAD_Symbol_787 = (OpenAD_Symbol_196 * OpenAD_Symbol_668 +
     >  OpenAD_Symbol_671 * OpenAD_Symbol_682)
      OpenAD_Symbol_788 = (OpenAD_Symbol_196 * OpenAD_Symbol_667 +
     >  OpenAD_Symbol_671 * OpenAD_Symbol_683)
      OpenAD_Symbol_789 = (OpenAD_Symbol_196 * OpenAD_Symbol_664 +
     >  OpenAD_Symbol_671 * OpenAD_Symbol_684)
      OpenAD_Symbol_790 = (OpenAD_Symbol_671 * OpenAD_Symbol_685)
      OpenAD_Symbol_791 = (OpenAD_Symbol_196 * OpenAD_Symbol_665 +
     >  OpenAD_Symbol_671 * OpenAD_Symbol_686)
      OpenAD_Symbol_792 = (OpenAD_Symbol_197 * OpenAD_Symbol_668 +
     >  OpenAD_Symbol_672 * OpenAD_Symbol_682)
      OpenAD_Symbol_793 = (OpenAD_Symbol_197 * OpenAD_Symbol_667 +
     >  OpenAD_Symbol_672 * OpenAD_Symbol_683)
      OpenAD_Symbol_794 = (OpenAD_Symbol_197 * OpenAD_Symbol_664 +
     >  OpenAD_Symbol_672 * OpenAD_Symbol_684)
      OpenAD_Symbol_795 = (OpenAD_Symbol_672 * OpenAD_Symbol_685)
      OpenAD_Symbol_796 = (OpenAD_Symbol_197 * OpenAD_Symbol_665 +
     >  OpenAD_Symbol_672 * OpenAD_Symbol_686)
      OpenAD_Symbol_797 = (OpenAD_Symbol_206 * OpenAD_Symbol_650 +
     >  OpenAD_Symbol_678 * OpenAD_Symbol_682)
      OpenAD_Symbol_798 = (OpenAD_Symbol_206 * OpenAD_Symbol_649 +
     >  OpenAD_Symbol_678 * OpenAD_Symbol_683)
      OpenAD_Symbol_799 = (OpenAD_Symbol_206 * OpenAD_Symbol_613 +
     >  OpenAD_Symbol_678 * OpenAD_Symbol_684)
      OpenAD_Symbol_800 = (OpenAD_Symbol_206 * OpenAD_Symbol_286 +
     >  OpenAD_Symbol_678 * OpenAD_Symbol_685)
      OpenAD_Symbol_801 = (OpenAD_Symbol_678 * OpenAD_Symbol_686)
      OpenAD_Symbol_802 = (OpenAD_Symbol_207 * OpenAD_Symbol_650 +
     >  OpenAD_Symbol_679 * OpenAD_Symbol_682)
      OpenAD_Symbol_803 = (OpenAD_Symbol_207 * OpenAD_Symbol_649 +
     >  OpenAD_Symbol_679 * OpenAD_Symbol_683)
      OpenAD_Symbol_804 = (OpenAD_Symbol_207 * OpenAD_Symbol_613 +
     >  OpenAD_Symbol_679 * OpenAD_Symbol_684)
      OpenAD_Symbol_805 = (OpenAD_Symbol_207 * OpenAD_Symbol_286 +
     >  OpenAD_Symbol_679 * OpenAD_Symbol_685)
      OpenAD_Symbol_806 = (OpenAD_Symbol_679 * OpenAD_Symbol_686)
      OpenAD_Symbol_807 = (OpenAD_Symbol_653 * 5.0D-01)
      OpenAD_Symbol_808 = (OpenAD_Symbol_654 * 5.0D-01)
      OpenAD_Symbol_809 = (OpenAD_Symbol_194 * OpenAD_Symbol_677 +
     >  OpenAD_Symbol_680 * OpenAD_Symbol_682)
      OpenAD_Symbol_810 = (OpenAD_Symbol_194 * OpenAD_Symbol_676 +
     >  OpenAD_Symbol_680 * OpenAD_Symbol_683)
      OpenAD_Symbol_811 = (OpenAD_Symbol_194 * OpenAD_Symbol_674 +
     >  OpenAD_Symbol_680 * OpenAD_Symbol_684)
      OpenAD_Symbol_812 = (OpenAD_Symbol_194 * OpenAD_Symbol_673 +
     >  OpenAD_Symbol_680 * OpenAD_Symbol_685)
      OpenAD_Symbol_813 = (OpenAD_Symbol_680 * OpenAD_Symbol_686)
      OpenAD_Symbol_814 = (OpenAD_Symbol_653 * 5.0D-01)
      OpenAD_Symbol_815 = (OpenAD_Symbol_654 * 5.0D-01)
      OpenAD_Symbol_816 = (OpenAD_Symbol_653 * OpenAD_Symbol_321)
      OpenAD_Symbol_817 = (OpenAD_Symbol_654 * OpenAD_Symbol_321)
      OpenAD_Symbol_818 = (OpenAD_Symbol_195 * OpenAD_Symbol_677 +
     >  OpenAD_Symbol_681 * OpenAD_Symbol_682)
      OpenAD_Symbol_819 = (OpenAD_Symbol_195 * OpenAD_Symbol_676 +
     >  OpenAD_Symbol_681 * OpenAD_Symbol_683)
      OpenAD_Symbol_820 = (OpenAD_Symbol_195 * OpenAD_Symbol_674 +
     >  OpenAD_Symbol_681 * OpenAD_Symbol_684)
      OpenAD_Symbol_821 = (OpenAD_Symbol_195 * OpenAD_Symbol_673 +
     >  OpenAD_Symbol_681 * OpenAD_Symbol_685)
      OpenAD_Symbol_822 = (OpenAD_Symbol_681 * OpenAD_Symbol_686)
      OpenAD_Symbol_823 = (OpenAD_Symbol_653 * OpenAD_Symbol_300)
      OpenAD_Symbol_824 = (OpenAD_Symbol_654 * OpenAD_Symbol_300)
      OpenAD_Symbol_825 = (OpenAD_Symbol_653 * OpenAD_Symbol_279)
      OpenAD_Symbol_826 = (OpenAD_Symbol_654 * OpenAD_Symbol_279)
      CALL setderiv(OpenAD_Symbol_827,ALAMCM)
      CALL setderiv(OpenAD_Symbol_828,ALAMCP)
      CALL setderiv(OpenAD_Symbol_829,ALAMU)
      CALL sax(OpenAD_Symbol_194,PRIML(2),RUL)
      CALL saxpy(OpenAD_Symbol_195,PRIML(3),RUL)
      CALL sax(OpenAD_Symbol_196,PRIML(2),RVL)
      CALL saxpy(OpenAD_Symbol_197,PRIML(4),RVL)
      CALL sax(OpenAD_Symbol_198,PRIML(2),RWL)
      CALL saxpy(OpenAD_Symbol_199,PRIML(5),RWL)
      CALL sax(5.0D-01,LAMCM,ALAMCM)
      CALL saxpy(-5.0D-01,OpenAD_Symbol_827,ALAMCM)
      CALL sax(5.0D-01,LAMCP,ALAMCP)
      CALL saxpy(-5.0D-01,OpenAD_Symbol_828,ALAMCP)
      CALL sax(5.0D-01,LAMU,ALAMU)
      CALL saxpy(-5.0D-01,OpenAD_Symbol_829,ALAMU)
      CALL sax(OpenAD_Symbol_192,PRIML(2),EL)
      CALL saxpy(OpenAD_Symbol_193,THETAL,EL)
      CALL saxpy(OpenAD_Symbol_190,PRIML(1),EL)
      CALL saxpy(OpenAD_Symbol_191,GM1INV,EL)
      CALL sax(OpenAD_Symbol_617,UHAT,ALP1)
      CALL saxpy(OpenAD_Symbol_644,NYHAT,ALP1)
      CALL saxpy(OpenAD_Symbol_648,NZHAT,ALP1)
      CALL saxpy(OpenAD_Symbol_652,NXHAT,ALP1)
      CALL saxpy(OpenAD_Symbol_687,WAVE,ALP1)
      CALL saxpy(OpenAD_Symbol_692,VAVE,ALP1)
      CALL saxpy(OpenAD_Symbol_697,UAVE,ALP1)
      CALL saxpy(OpenAD_Symbol_702,PRIMR(2),ALP1)
      CALL saxpy(OpenAD_Symbol_707,THETAR,ALP1)
      CALL saxpy(OpenAD_Symbol_712,PRIMR(1),ALP1)
      CALL saxpy(OpenAD_Symbol_717,GM1INV,ALP1)
      CALL saxpy(OpenAD_Symbol_722,THTAVE,ALP1)
      CALL saxpy(OpenAD_Symbol_727,PRIMR(2),ALP1)
      CALL saxpy(OpenAD_Symbol_732,PRIML(2),ALP1)
      CALL saxpy(OpenAD_Symbol_737,PRIML(2),ALP1)
      CALL saxpy(OpenAD_Symbol_742,THETAL,ALP1)
      CALL saxpy(OpenAD_Symbol_747,PRIML(1),ALP1)
      CALL saxpy(OpenAD_Symbol_752,GM1INV,ALP1)
      CALL saxpy(OpenAD_Symbol_757,PRIMR(2),ALP1)
      CALL saxpy(OpenAD_Symbol_762,PRIMR(5),ALP1)
      CALL saxpy(OpenAD_Symbol_767,PRIML(2),ALP1)
      CALL saxpy(OpenAD_Symbol_772,PRIML(5),ALP1)
      CALL saxpy(OpenAD_Symbol_777,PRIMR(2),ALP1)
      CALL saxpy(OpenAD_Symbol_782,PRIMR(4),ALP1)
      CALL saxpy(OpenAD_Symbol_787,PRIML(2),ALP1)
      CALL saxpy(OpenAD_Symbol_792,PRIML(4),ALP1)
      CALL saxpy(OpenAD_Symbol_797,PRIMR(2),ALP1)
      CALL saxpy(OpenAD_Symbol_802,PRIMR(3),ALP1)
      CALL saxpy(OpenAD_Symbol_807,GM1,ALP1)
      CALL saxpy(OpenAD_Symbol_808,CAVE,ALP1)
      CALL saxpy(OpenAD_Symbol_809,PRIML(2),ALP1)
      CALL saxpy(OpenAD_Symbol_818,PRIML(3),ALP1)
      CALL sax(OpenAD_Symbol_616,UHAT,ALP5)
      CALL saxpy(OpenAD_Symbol_643,NYHAT,ALP5)
      CALL saxpy(OpenAD_Symbol_646,NZHAT,ALP5)
      CALL saxpy(OpenAD_Symbol_651,NXHAT,ALP5)
      CALL saxpy(OpenAD_Symbol_688,WAVE,ALP5)
      CALL saxpy(OpenAD_Symbol_693,VAVE,ALP5)
      CALL saxpy(OpenAD_Symbol_698,UAVE,ALP5)
      CALL saxpy(OpenAD_Symbol_703,PRIMR(2),ALP5)
      CALL saxpy(OpenAD_Symbol_708,THETAR,ALP5)
      CALL saxpy(OpenAD_Symbol_713,PRIMR(1),ALP5)
      CALL saxpy(OpenAD_Symbol_718,GM1INV,ALP5)
      CALL saxpy(OpenAD_Symbol_723,THTAVE,ALP5)
      CALL saxpy(OpenAD_Symbol_728,PRIMR(2),ALP5)
      CALL saxpy(OpenAD_Symbol_733,PRIML(2),ALP5)
      CALL saxpy(OpenAD_Symbol_738,PRIML(2),ALP5)
      CALL saxpy(OpenAD_Symbol_743,THETAL,ALP5)
      CALL saxpy(OpenAD_Symbol_748,PRIML(1),ALP5)
      CALL saxpy(OpenAD_Symbol_753,GM1INV,ALP5)
      CALL saxpy(OpenAD_Symbol_758,PRIMR(2),ALP5)
      CALL saxpy(OpenAD_Symbol_763,PRIMR(5),ALP5)
      CALL saxpy(OpenAD_Symbol_768,PRIML(2),ALP5)
      CALL saxpy(OpenAD_Symbol_773,PRIML(5),ALP5)
      CALL saxpy(OpenAD_Symbol_778,PRIMR(2),ALP5)
      CALL saxpy(OpenAD_Symbol_783,PRIMR(4),ALP5)
      CALL saxpy(OpenAD_Symbol_788,PRIML(2),ALP5)
      CALL saxpy(OpenAD_Symbol_793,PRIML(4),ALP5)
      CALL saxpy(OpenAD_Symbol_798,PRIMR(2),ALP5)
      CALL saxpy(OpenAD_Symbol_803,PRIMR(3),ALP5)
      CALL saxpy(OpenAD_Symbol_810,PRIML(2),ALP5)
      CALL saxpy(OpenAD_Symbol_814,GM1,ALP5)
      CALL saxpy(OpenAD_Symbol_815,CAVE,ALP5)
      CALL saxpy(OpenAD_Symbol_819,PRIML(3),ALP5)
      CALL sax(OpenAD_Symbol_612,CAVE,ALP2)
      CALL saxpy(OpenAD_Symbol_620,UTILDE,ALP2)
      CALL saxpy(OpenAD_Symbol_627,NZHAT,ALP2)
      CALL saxpy(OpenAD_Symbol_628,NXHAT,ALP2)
      CALL saxpy(OpenAD_Symbol_629,NXHAT,ALP2)
      CALL saxpy(OpenAD_Symbol_266,NYHAT,ALP2)
      CALL saxpy(OpenAD_Symbol_691,WAVE,ALP2)
      CALL saxpy(OpenAD_Symbol_696,VAVE,ALP2)
      CALL saxpy(OpenAD_Symbol_701,UAVE,ALP2)
      CALL saxpy(OpenAD_Symbol_706,PRIMR(2),ALP2)
      CALL saxpy(OpenAD_Symbol_711,THETAR,ALP2)
      CALL saxpy(OpenAD_Symbol_716,PRIMR(1),ALP2)
      CALL saxpy(OpenAD_Symbol_721,GM1INV,ALP2)
      CALL saxpy(OpenAD_Symbol_726,THTAVE,ALP2)
      CALL saxpy(OpenAD_Symbol_731,PRIMR(2),ALP2)
      CALL saxpy(OpenAD_Symbol_736,PRIML(2),ALP2)
      CALL saxpy(OpenAD_Symbol_741,PRIML(2),ALP2)
      CALL saxpy(OpenAD_Symbol_746,THETAL,ALP2)
      CALL saxpy(OpenAD_Symbol_751,PRIML(1),ALP2)
      CALL saxpy(OpenAD_Symbol_756,GM1INV,ALP2)
      CALL saxpy(OpenAD_Symbol_761,PRIMR(2),ALP2)
      CALL saxpy(OpenAD_Symbol_766,PRIMR(5),ALP2)
      CALL saxpy(OpenAD_Symbol_771,PRIML(2),ALP2)
      CALL saxpy(OpenAD_Symbol_776,PRIML(5),ALP2)
      CALL saxpy(OpenAD_Symbol_781,PRIMR(2),ALP2)
      CALL saxpy(OpenAD_Symbol_786,PRIMR(4),ALP2)
      CALL saxpy(OpenAD_Symbol_791,PRIML(2),ALP2)
      CALL saxpy(OpenAD_Symbol_796,PRIML(4),ALP2)
      CALL saxpy(OpenAD_Symbol_801,PRIMR(2),ALP2)
      CALL saxpy(OpenAD_Symbol_806,PRIMR(3),ALP2)
      CALL saxpy(OpenAD_Symbol_813,PRIML(2),ALP2)
      CALL saxpy(OpenAD_Symbol_822,PRIML(3),ALP2)
      CALL saxpy(OpenAD_Symbol_825,GM1,ALP2)
      CALL saxpy(OpenAD_Symbol_826,CAVE,ALP2)
      CALL sax(OpenAD_Symbol_611,CAVE,ALP3)
      CALL saxpy(OpenAD_Symbol_619,VTILDE,ALP3)
      CALL saxpy(OpenAD_Symbol_624,NXHAT,ALP3)
      CALL saxpy(OpenAD_Symbol_625,NYHAT,ALP3)
      CALL saxpy(OpenAD_Symbol_626,NYHAT,ALP3)
      CALL saxpy(OpenAD_Symbol_287,NZHAT,ALP3)
      CALL saxpy(OpenAD_Symbol_690,WAVE,ALP3)
      CALL saxpy(OpenAD_Symbol_695,VAVE,ALP3)
      CALL saxpy(OpenAD_Symbol_700,UAVE,ALP3)
      CALL saxpy(OpenAD_Symbol_705,PRIMR(2),ALP3)
      CALL saxpy(OpenAD_Symbol_710,THETAR,ALP3)
      CALL saxpy(OpenAD_Symbol_715,PRIMR(1),ALP3)
      CALL saxpy(OpenAD_Symbol_720,GM1INV,ALP3)
      CALL saxpy(OpenAD_Symbol_725,THTAVE,ALP3)
      CALL saxpy(OpenAD_Symbol_730,PRIMR(2),ALP3)
      CALL saxpy(OpenAD_Symbol_735,PRIML(2),ALP3)
      CALL saxpy(OpenAD_Symbol_740,PRIML(2),ALP3)
      CALL saxpy(OpenAD_Symbol_745,THETAL,ALP3)
      CALL saxpy(OpenAD_Symbol_750,PRIML(1),ALP3)
      CALL saxpy(OpenAD_Symbol_755,GM1INV,ALP3)
      CALL saxpy(OpenAD_Symbol_760,PRIMR(2),ALP3)
      CALL saxpy(OpenAD_Symbol_765,PRIMR(5),ALP3)
      CALL saxpy(OpenAD_Symbol_770,PRIML(2),ALP3)
      CALL saxpy(OpenAD_Symbol_775,PRIML(5),ALP3)
      CALL saxpy(OpenAD_Symbol_780,PRIMR(2),ALP3)
      CALL saxpy(OpenAD_Symbol_785,PRIMR(4),ALP3)
      CALL saxpy(OpenAD_Symbol_790,PRIML(2),ALP3)
      CALL saxpy(OpenAD_Symbol_795,PRIML(4),ALP3)
      CALL saxpy(OpenAD_Symbol_800,PRIMR(2),ALP3)
      CALL saxpy(OpenAD_Symbol_805,PRIMR(3),ALP3)
      CALL saxpy(OpenAD_Symbol_812,PRIML(2),ALP3)
      CALL saxpy(OpenAD_Symbol_821,PRIML(3),ALP3)
      CALL saxpy(OpenAD_Symbol_823,GM1,ALP3)
      CALL saxpy(OpenAD_Symbol_824,CAVE,ALP3)
      CALL sax(OpenAD_Symbol_610,CAVE,ALP4)
      CALL saxpy(OpenAD_Symbol_618,WTILDE,ALP4)
      CALL saxpy(OpenAD_Symbol_621,NYHAT,ALP4)
      CALL saxpy(OpenAD_Symbol_622,NZHAT,ALP4)
      CALL saxpy(OpenAD_Symbol_623,NZHAT,ALP4)
      CALL saxpy(OpenAD_Symbol_308,NXHAT,ALP4)
      CALL saxpy(OpenAD_Symbol_689,WAVE,ALP4)
      CALL saxpy(OpenAD_Symbol_694,VAVE,ALP4)
      CALL saxpy(OpenAD_Symbol_699,UAVE,ALP4)
      CALL saxpy(OpenAD_Symbol_704,PRIMR(2),ALP4)
      CALL saxpy(OpenAD_Symbol_709,THETAR,ALP4)
      CALL saxpy(OpenAD_Symbol_714,PRIMR(1),ALP4)
      CALL saxpy(OpenAD_Symbol_719,GM1INV,ALP4)
      CALL saxpy(OpenAD_Symbol_724,THTAVE,ALP4)
      CALL saxpy(OpenAD_Symbol_729,PRIMR(2),ALP4)
      CALL saxpy(OpenAD_Symbol_734,PRIML(2),ALP4)
      CALL saxpy(OpenAD_Symbol_739,PRIML(2),ALP4)
      CALL saxpy(OpenAD_Symbol_744,THETAL,ALP4)
      CALL saxpy(OpenAD_Symbol_749,PRIML(1),ALP4)
      CALL saxpy(OpenAD_Symbol_754,GM1INV,ALP4)
      CALL saxpy(OpenAD_Symbol_759,PRIMR(2),ALP4)
      CALL saxpy(OpenAD_Symbol_764,PRIMR(5),ALP4)
      CALL saxpy(OpenAD_Symbol_769,PRIML(2),ALP4)
      CALL saxpy(OpenAD_Symbol_774,PRIML(5),ALP4)
      CALL saxpy(OpenAD_Symbol_779,PRIMR(2),ALP4)
      CALL saxpy(OpenAD_Symbol_784,PRIMR(4),ALP4)
      CALL saxpy(OpenAD_Symbol_789,PRIML(2),ALP4)
      CALL saxpy(OpenAD_Symbol_794,PRIML(4),ALP4)
      CALL saxpy(OpenAD_Symbol_799,PRIMR(2),ALP4)
      CALL saxpy(OpenAD_Symbol_804,PRIMR(3),ALP4)
      CALL saxpy(OpenAD_Symbol_811,PRIML(2),ALP4)
      CALL saxpy(OpenAD_Symbol_816,GM1,ALP4)
      CALL saxpy(OpenAD_Symbol_817,CAVE,ALP4)
      CALL saxpy(OpenAD_Symbol_820,PRIML(3),ALP4)
      OpenAD_Symbol_337 = (ALAMCM%v*ALP1%v)
      OpenAD_Symbol_335 = ALP1%v
      OpenAD_Symbol_336 = ALAMCM%v
      ALP1%v = OpenAD_Symbol_337
      OpenAD_Symbol_340 = (ALAMU%v*ALP2%v)
      OpenAD_Symbol_338 = ALP2%v
      OpenAD_Symbol_339 = ALAMU%v
      ALP2%v = OpenAD_Symbol_340
      OpenAD_Symbol_343 = (ALAMU%v*ALP3%v)
      OpenAD_Symbol_341 = ALP3%v
      OpenAD_Symbol_342 = ALAMU%v
      ALP3%v = OpenAD_Symbol_343
      OpenAD_Symbol_346 = (ALAMU%v*ALP4%v)
      OpenAD_Symbol_344 = ALP4%v
      OpenAD_Symbol_345 = ALAMU%v
      ALP4%v = OpenAD_Symbol_346
      OpenAD_Symbol_349 = (ALAMCP%v*ALP5%v)
      OpenAD_Symbol_347 = ALP5%v
      OpenAD_Symbol_348 = ALAMCP%v
      ALP5%v = OpenAD_Symbol_349
      ALP15P%v = (ALP1%v+ALP5%v)
      OpenAD_Symbol_350 = 1_w2f__i8
      OpenAD_Symbol_351 = 1_w2f__i8
      ALP15M%v = (ALP1%v-ALP5%v)
      OpenAD_Symbol_352 = 1_w2f__i8
      OpenAD_Symbol_353 = (-1_w2f__i8)
      MU%v = ((ALP15P%v/CAVE%v)+ALP2%v*NXHAT%v+ALP3%v*NYHAT%v+ALP4%v*NZH
     +AT%v)
      OpenAD_Symbol_360 = (INT(1 _w2f__i8)/CAVE%v)
      OpenAD_Symbol_361 = (-(ALP15P%v/(CAVE%v*CAVE%v)))
      OpenAD_Symbol_358 = 1_w2f__i8
      OpenAD_Symbol_362 = NXHAT%v
      OpenAD_Symbol_363 = ALP2%v
      OpenAD_Symbol_359 = 1_w2f__i8
      OpenAD_Symbol_356 = 1_w2f__i8
      OpenAD_Symbol_364 = NYHAT%v
      OpenAD_Symbol_365 = ALP3%v
      OpenAD_Symbol_357 = 1_w2f__i8
      OpenAD_Symbol_354 = 1_w2f__i8
      OpenAD_Symbol_366 = NZHAT%v
      OpenAD_Symbol_367 = ALP4%v
      OpenAD_Symbol_355 = 1_w2f__i8
      OpenAD_Symbol_380 = (GM1INV%v*CAVE%v)
      DSS1%v = (MU%v*THTAVE%v+ALP15P%v*OpenAD_Symbol_380-ALP15M%v*UHAT%v
     ++ALP2%v*UTILDE%v+ALP3%v*VTILDE%v+ALP4%v*WTILDE%v)
      OpenAD_Symbol_376 = THTAVE%v
      OpenAD_Symbol_377 = MU%v
      OpenAD_Symbol_374 = 1_w2f__i8
      OpenAD_Symbol_381 = OpenAD_Symbol_380
      OpenAD_Symbol_383 = CAVE%v
      OpenAD_Symbol_384 = GM1INV%v
      OpenAD_Symbol_382 = ALP15P%v
      OpenAD_Symbol_378 = 1_w2f__i8
      OpenAD_Symbol_385 = UHAT%v
      OpenAD_Symbol_386 = ALP15M%v
      OpenAD_Symbol_379 = (-1_w2f__i8)
      OpenAD_Symbol_375 = 1_w2f__i8
      OpenAD_Symbol_372 = 1_w2f__i8
      OpenAD_Symbol_387 = UTILDE%v
      OpenAD_Symbol_388 = ALP2%v
      OpenAD_Symbol_373 = 1_w2f__i8
      OpenAD_Symbol_370 = 1_w2f__i8
      OpenAD_Symbol_389 = VTILDE%v
      OpenAD_Symbol_390 = ALP3%v
      OpenAD_Symbol_371 = 1_w2f__i8
      OpenAD_Symbol_368 = 1_w2f__i8
      OpenAD_Symbol_391 = WTILDE%v
      OpenAD_Symbol_392 = ALP4%v
      OpenAD_Symbol_369 = 1_w2f__i8
      DSS2%v = MU%v
      DSS3%v = (ALP3%v*NZHAT%v+MU%v*UAVE%v-ALP15M%v*NXHAT%v-ALP4%v*NYHAT
     +%v)
      OpenAD_Symbol_397 = NZHAT%v
      OpenAD_Symbol_398 = ALP3%v
      OpenAD_Symbol_395 = 1_w2f__i8
      OpenAD_Symbol_401 = UAVE%v
      OpenAD_Symbol_402 = MU%v
      OpenAD_Symbol_399 = 1_w2f__i8
      OpenAD_Symbol_403 = NXHAT%v
      OpenAD_Symbol_404 = ALP15M%v
      OpenAD_Symbol_400 = (-1_w2f__i8)
      OpenAD_Symbol_396 = 1_w2f__i8
      OpenAD_Symbol_393 = 1_w2f__i8
      OpenAD_Symbol_405 = NYHAT%v
      OpenAD_Symbol_406 = ALP4%v
      OpenAD_Symbol_394 = (-1_w2f__i8)
      DSS4%v = (ALP4%v*NXHAT%v+MU%v*VAVE%v-ALP15M%v*NYHAT%v-ALP2%v*NZHAT
     +%v)
      OpenAD_Symbol_411 = NXHAT%v
      OpenAD_Symbol_412 = ALP4%v
      OpenAD_Symbol_409 = 1_w2f__i8
      OpenAD_Symbol_415 = VAVE%v
      OpenAD_Symbol_416 = MU%v
      OpenAD_Symbol_413 = 1_w2f__i8
      OpenAD_Symbol_417 = NYHAT%v
      OpenAD_Symbol_418 = ALP15M%v
      OpenAD_Symbol_414 = (-1_w2f__i8)
      OpenAD_Symbol_410 = 1_w2f__i8
      OpenAD_Symbol_407 = 1_w2f__i8
      OpenAD_Symbol_419 = NZHAT%v
      OpenAD_Symbol_420 = ALP2%v
      OpenAD_Symbol_408 = (-1_w2f__i8)
      DSS5%v = (ALP2%v*NYHAT%v+MU%v*WAVE%v-ALP15M%v*NZHAT%v-ALP3%v*NXHAT
     +%v)
      OpenAD_Symbol_425 = NYHAT%v
      OpenAD_Symbol_426 = ALP2%v
      OpenAD_Symbol_423 = 1_w2f__i8
      OpenAD_Symbol_429 = WAVE%v
      OpenAD_Symbol_430 = MU%v
      OpenAD_Symbol_427 = 1_w2f__i8
      OpenAD_Symbol_431 = NZHAT%v
      OpenAD_Symbol_432 = ALP15M%v
      OpenAD_Symbol_428 = (-1_w2f__i8)
      OpenAD_Symbol_424 = 1_w2f__i8
      OpenAD_Symbol_421 = 1_w2f__i8
      OpenAD_Symbol_433 = NXHAT%v
      OpenAD_Symbol_434 = ALP3%v
      OpenAD_Symbol_422 = (-1_w2f__i8)
      UHATL%v = (PRIML(3)%v*NXHAT%v+PRIML(4)%v*NYHAT%v+PRIML(5)%v*NZHAT%
     +v)
      OpenAD_Symbol_439 = NXHAT%v
      OpenAD_Symbol_440 = PRIML(3)%v
      OpenAD_Symbol_437 = 1_w2f__i8
      OpenAD_Symbol_441 = NYHAT%v
      OpenAD_Symbol_442 = PRIML(4)%v
      OpenAD_Symbol_438 = 1_w2f__i8
      OpenAD_Symbol_435 = 1_w2f__i8
      OpenAD_Symbol_443 = NZHAT%v
      OpenAD_Symbol_444 = PRIML(5)%v
      OpenAD_Symbol_436 = 1_w2f__i8
      OpenAD_Symbol_450 = (PRIML(1)%v+EL%v)
      OpenAD_Symbol_445 = (DSS1%v+UHATL%v*OpenAD_Symbol_450)
      FLUX(1)%v = (NSIZE%v*OpenAD_Symbol_445)
      OpenAD_Symbol_446 = OpenAD_Symbol_445
      OpenAD_Symbol_448 = 1_w2f__i8
      OpenAD_Symbol_451 = OpenAD_Symbol_450
      OpenAD_Symbol_453 = 1_w2f__i8
      OpenAD_Symbol_454 = 1_w2f__i8
      OpenAD_Symbol_452 = UHATL%v
      OpenAD_Symbol_449 = 1_w2f__i8
      OpenAD_Symbol_447 = NSIZE%v
      OpenAD_Symbol_830 = (OpenAD_Symbol_434 * INT((-1_w2f__i8)))
      OpenAD_Symbol_831 = (OpenAD_Symbol_420 * INT((-1_w2f__i8)))
      OpenAD_Symbol_832 = (OpenAD_Symbol_406 * INT((-1_w2f__i8)))
      OpenAD_Symbol_833 = (OpenAD_Symbol_376 * OpenAD_Symbol_447)
      OpenAD_Symbol_834 = (OpenAD_Symbol_451 * OpenAD_Symbol_447)
      OpenAD_Symbol_835 = (OpenAD_Symbol_392 * OpenAD_Symbol_447)
      OpenAD_Symbol_836 = (OpenAD_Symbol_390 * OpenAD_Symbol_447)
      OpenAD_Symbol_837 = (OpenAD_Symbol_388 * OpenAD_Symbol_447)
      OpenAD_Symbol_838 = (OpenAD_Symbol_431 * INT((-1_w2f__i8)))
      OpenAD_Symbol_839 = (OpenAD_Symbol_417 * INT((-1_w2f__i8)))
      OpenAD_Symbol_840 = (OpenAD_Symbol_403 * INT((-1_w2f__i8)))
      OpenAD_Symbol_841 = (OpenAD_Symbol_381 * OpenAD_Symbol_447)
      OpenAD_Symbol_842 = (OpenAD_Symbol_377 * OpenAD_Symbol_447)
      OpenAD_Symbol_843 = (OpenAD_Symbol_452 * OpenAD_Symbol_447)
      OpenAD_Symbol_844 = (INT((-1_w2f__i8)) * OpenAD_Symbol_447)
      OpenAD_Symbol_845 = (OpenAD_Symbol_385 * OpenAD_Symbol_844)
      OpenAD_Symbol_846 = (OpenAD_Symbol_382 * OpenAD_Symbol_447)
      OpenAD_Symbol_847 = (OpenAD_Symbol_383 * OpenAD_Symbol_846)
      OpenAD_Symbol_848 = (OpenAD_Symbol_432 * INT((-1_w2f__i8)))
      OpenAD_Symbol_849 = (OpenAD_Symbol_418 * INT((-1_w2f__i8)))
      OpenAD_Symbol_850 = (OpenAD_Symbol_404 * INT((-1_w2f__i8)))
      OpenAD_Symbol_851 = (OpenAD_Symbol_386 * OpenAD_Symbol_844)
      OpenAD_Symbol_852 = (OpenAD_Symbol_384 * OpenAD_Symbol_846)
      OpenAD_Symbol_853 = (OpenAD_Symbol_443 * OpenAD_Symbol_834)
      OpenAD_Symbol_854 = (OpenAD_Symbol_444 * OpenAD_Symbol_834)
      OpenAD_Symbol_855 = (OpenAD_Symbol_441 * OpenAD_Symbol_834)
      OpenAD_Symbol_856 = (OpenAD_Symbol_439 * OpenAD_Symbol_834)
      OpenAD_Symbol_857 = (OpenAD_Symbol_442 * OpenAD_Symbol_834)
      OpenAD_Symbol_858 = (OpenAD_Symbol_440 * OpenAD_Symbol_834)
      OpenAD_Symbol_859 = (OpenAD_Symbol_342 * OpenAD_Symbol_364)
      OpenAD_Symbol_860 = (OpenAD_Symbol_341 * OpenAD_Symbol_364 +
     >  OpenAD_Symbol_338 * OpenAD_Symbol_362)
      OpenAD_Symbol_861 = (OpenAD_Symbol_339 * OpenAD_Symbol_362)
      OpenAD_Symbol_862 = (OpenAD_Symbol_335 * OpenAD_Symbol_360)
      OpenAD_Symbol_863 = (OpenAD_Symbol_336 * OpenAD_Symbol_360)
      OpenAD_Symbol_864 = (INT((-1_w2f__i8)) * OpenAD_Symbol_838)
      OpenAD_Symbol_865 = (INT((-1_w2f__i8)) * OpenAD_Symbol_839)
      OpenAD_Symbol_866 = (INT((-1_w2f__i8)) * OpenAD_Symbol_840)
      OpenAD_Symbol_867 = (INT((-1_w2f__i8)) * OpenAD_Symbol_845)
      OpenAD_Symbol_868 = (OpenAD_Symbol_347 * OpenAD_Symbol_360)
      OpenAD_Symbol_869 = (OpenAD_Symbol_348 * OpenAD_Symbol_360)
      OpenAD_Symbol_870 = (OpenAD_Symbol_344 * OpenAD_Symbol_366)
      OpenAD_Symbol_871 = (OpenAD_Symbol_345 * OpenAD_Symbol_366)
      OpenAD_Symbol_872 = (OpenAD_Symbol_361 * OpenAD_Symbol_833)
      OpenAD_Symbol_873 = (OpenAD_Symbol_361 * OpenAD_Symbol_429)
      OpenAD_Symbol_874 = (OpenAD_Symbol_361 * OpenAD_Symbol_415)
      OpenAD_Symbol_875 = (OpenAD_Symbol_361 * OpenAD_Symbol_401)
      OpenAD_Symbol_876 = (OpenAD_Symbol_365 * OpenAD_Symbol_833)
      OpenAD_Symbol_877 = (OpenAD_Symbol_365 * OpenAD_Symbol_429)
      OpenAD_Symbol_878 = (OpenAD_Symbol_365 * OpenAD_Symbol_415)
      OpenAD_Symbol_879 = (OpenAD_Symbol_365 * OpenAD_Symbol_401)
      OpenAD_Symbol_880 = (OpenAD_Symbol_342 * OpenAD_Symbol_389 *
     >  OpenAD_Symbol_447 + OpenAD_Symbol_859 * OpenAD_Symbol_833)
      OpenAD_Symbol_881 = (OpenAD_Symbol_342 * OpenAD_Symbol_433 * INT(
     > (-1_w2f__i8)) + OpenAD_Symbol_859 * OpenAD_Symbol_429)
      OpenAD_Symbol_882 = (OpenAD_Symbol_859 * OpenAD_Symbol_415)
      OpenAD_Symbol_883 = (OpenAD_Symbol_342 * OpenAD_Symbol_397 +
     >  OpenAD_Symbol_859 * OpenAD_Symbol_401)
      OpenAD_Symbol_884 = (OpenAD_Symbol_363 * OpenAD_Symbol_833)
      OpenAD_Symbol_885 = (OpenAD_Symbol_363 * OpenAD_Symbol_429)
      OpenAD_Symbol_886 = (OpenAD_Symbol_363 * OpenAD_Symbol_415)
      OpenAD_Symbol_887 = (OpenAD_Symbol_363 * OpenAD_Symbol_401)
      OpenAD_Symbol_888 = (OpenAD_Symbol_339 * OpenAD_Symbol_387 *
     >  OpenAD_Symbol_447 + OpenAD_Symbol_861 * OpenAD_Symbol_833)
      OpenAD_Symbol_889 = (OpenAD_Symbol_339 * OpenAD_Symbol_425 +
     >  OpenAD_Symbol_861 * OpenAD_Symbol_429)
      OpenAD_Symbol_890 = (OpenAD_Symbol_339 * OpenAD_Symbol_419 * INT(
     > (-1_w2f__i8)) + OpenAD_Symbol_861 * OpenAD_Symbol_415)
      OpenAD_Symbol_891 = (OpenAD_Symbol_861 * OpenAD_Symbol_401)
      OpenAD_Symbol_892 = (OpenAD_Symbol_335 * OpenAD_Symbol_841 +
     >  OpenAD_Symbol_335 * OpenAD_Symbol_845 + OpenAD_Symbol_862 *
     >  OpenAD_Symbol_833)
      OpenAD_Symbol_893 = (OpenAD_Symbol_335 * OpenAD_Symbol_838 +
     >  OpenAD_Symbol_862 * OpenAD_Symbol_429)
      OpenAD_Symbol_894 = (OpenAD_Symbol_335 * OpenAD_Symbol_839 +
     >  OpenAD_Symbol_862 * OpenAD_Symbol_415)
      OpenAD_Symbol_895 = (OpenAD_Symbol_335 * OpenAD_Symbol_840 +
     >  OpenAD_Symbol_862 * OpenAD_Symbol_401)
      OpenAD_Symbol_896 = (OpenAD_Symbol_860 + OpenAD_Symbol_870)
      OpenAD_Symbol_897 = (OpenAD_Symbol_336 *(OpenAD_Symbol_841 +
     >  OpenAD_Symbol_845) + OpenAD_Symbol_863 * OpenAD_Symbol_833)
      OpenAD_Symbol_898 = (OpenAD_Symbol_336 * OpenAD_Symbol_838 +
     >  OpenAD_Symbol_863 * OpenAD_Symbol_429)
      OpenAD_Symbol_899 = (OpenAD_Symbol_336 * OpenAD_Symbol_839 +
     >  OpenAD_Symbol_863 * OpenAD_Symbol_415)
      OpenAD_Symbol_900 = (OpenAD_Symbol_336 * OpenAD_Symbol_840 +
     >  OpenAD_Symbol_863 * OpenAD_Symbol_401)
      OpenAD_Symbol_901 = (OpenAD_Symbol_367 * OpenAD_Symbol_833)
      OpenAD_Symbol_902 = (OpenAD_Symbol_344 * OpenAD_Symbol_391 *
     >  OpenAD_Symbol_447 + OpenAD_Symbol_341 * OpenAD_Symbol_389 *
     >  OpenAD_Symbol_447 + OpenAD_Symbol_338 * OpenAD_Symbol_387 *
     >  OpenAD_Symbol_447 + OpenAD_Symbol_860 * OpenAD_Symbol_833 +
     >  OpenAD_Symbol_870 * OpenAD_Symbol_833)
      OpenAD_Symbol_903 = (OpenAD_Symbol_345 * OpenAD_Symbol_391 *
     >  OpenAD_Symbol_447 + OpenAD_Symbol_871 * OpenAD_Symbol_833)
      OpenAD_Symbol_904 = (OpenAD_Symbol_347 * OpenAD_Symbol_867 +
     >  OpenAD_Symbol_347 * OpenAD_Symbol_841 + OpenAD_Symbol_868 *
     >  OpenAD_Symbol_833)
      OpenAD_Symbol_905 = (OpenAD_Symbol_347 * OpenAD_Symbol_864 +
     >  OpenAD_Symbol_868 * OpenAD_Symbol_429)
      OpenAD_Symbol_906 = (OpenAD_Symbol_347 * OpenAD_Symbol_865 +
     >  OpenAD_Symbol_868 * OpenAD_Symbol_415)
      OpenAD_Symbol_907 = (OpenAD_Symbol_347 * OpenAD_Symbol_866 +
     >  OpenAD_Symbol_868 * OpenAD_Symbol_401)
      OpenAD_Symbol_908 = (OpenAD_Symbol_367 * OpenAD_Symbol_429)
      OpenAD_Symbol_909 = (OpenAD_Symbol_341 * OpenAD_Symbol_433 * INT(
     > (-1_w2f__i8)) + OpenAD_Symbol_338 * OpenAD_Symbol_425 +
     >  OpenAD_Symbol_860 * OpenAD_Symbol_429 + OpenAD_Symbol_870 *
     >  OpenAD_Symbol_429)
      OpenAD_Symbol_910 = (OpenAD_Symbol_871 * OpenAD_Symbol_429)
      OpenAD_Symbol_911 = (OpenAD_Symbol_367 * OpenAD_Symbol_415)
      OpenAD_Symbol_912 = (OpenAD_Symbol_338 * OpenAD_Symbol_419 * INT(
     > (-1_w2f__i8)) + OpenAD_Symbol_344 * OpenAD_Symbol_411 +
     >  OpenAD_Symbol_860 * OpenAD_Symbol_415 + OpenAD_Symbol_870 *
     >  OpenAD_Symbol_415)
      OpenAD_Symbol_913 = (OpenAD_Symbol_345 * OpenAD_Symbol_411 +
     >  OpenAD_Symbol_871 * OpenAD_Symbol_415)
      OpenAD_Symbol_914 = (OpenAD_Symbol_348 * OpenAD_Symbol_867 +
     >  OpenAD_Symbol_348 * OpenAD_Symbol_841 + OpenAD_Symbol_869 *
     >  OpenAD_Symbol_833)
      OpenAD_Symbol_915 = (OpenAD_Symbol_348 * OpenAD_Symbol_864 +
     >  OpenAD_Symbol_869 * OpenAD_Symbol_429)
      OpenAD_Symbol_916 = (OpenAD_Symbol_348 * OpenAD_Symbol_865 +
     >  OpenAD_Symbol_869 * OpenAD_Symbol_415)
      OpenAD_Symbol_917 = (OpenAD_Symbol_348 * OpenAD_Symbol_866 +
     >  OpenAD_Symbol_869 * OpenAD_Symbol_401)
      OpenAD_Symbol_918 = (OpenAD_Symbol_367 * OpenAD_Symbol_401)
      OpenAD_Symbol_919 = (OpenAD_Symbol_344 * OpenAD_Symbol_405 * INT(
     > (-1_w2f__i8)) + OpenAD_Symbol_341 * OpenAD_Symbol_397 +
     >  OpenAD_Symbol_860 * OpenAD_Symbol_401 + OpenAD_Symbol_870 *
     >  OpenAD_Symbol_401)
      OpenAD_Symbol_920 = (OpenAD_Symbol_345 * OpenAD_Symbol_405 * INT(
     > (-1_w2f__i8)) + OpenAD_Symbol_871 * OpenAD_Symbol_401)
      CALL sax(OpenAD_Symbol_443,PRIML(5),UHATL)
      CALL saxpy(OpenAD_Symbol_444,NZHAT,UHATL)
      CALL saxpy(OpenAD_Symbol_441,PRIML(4),UHATL)
      CALL saxpy(OpenAD_Symbol_439,PRIML(3),UHATL)
      CALL saxpy(OpenAD_Symbol_442,NYHAT,UHATL)
      CALL saxpy(OpenAD_Symbol_440,NXHAT,UHATL)
      CALL sax(OpenAD_Symbol_361,CAVE,DSS2)
      CALL saxpy(OpenAD_Symbol_365,NYHAT,DSS2)
      CALL saxpy(OpenAD_Symbol_859,ALP3,DSS2)
      CALL saxpy(OpenAD_Symbol_363,NXHAT,DSS2)
      CALL saxpy(OpenAD_Symbol_861,ALP2,DSS2)
      CALL saxpy(OpenAD_Symbol_862,ALAMCM,DSS2)
      CALL saxpy(OpenAD_Symbol_367,NZHAT,DSS2)
      CALL saxpy(OpenAD_Symbol_896,ALAMU,DSS2)
      CALL saxpy(OpenAD_Symbol_871,ALP4,DSS2)
      CALL saxpy(OpenAD_Symbol_863,ALP1,DSS2)
      CALL saxpy(OpenAD_Symbol_868,ALAMCP,DSS2)
      CALL saxpy(OpenAD_Symbol_869,ALP5,DSS2)
      CALL sax(OpenAD_Symbol_832,NYHAT,DSS3)
      CALL saxpy(OpenAD_Symbol_398,NZHAT,DSS3)
      CALL saxpy(OpenAD_Symbol_402,UAVE,DSS3)
      CALL saxpy(OpenAD_Symbol_850,NXHAT,DSS3)
      CALL saxpy(OpenAD_Symbol_875,CAVE,DSS3)
      CALL saxpy(OpenAD_Symbol_879,NYHAT,DSS3)
      CALL saxpy(OpenAD_Symbol_883,ALP3,DSS3)
      CALL saxpy(OpenAD_Symbol_887,NXHAT,DSS3)
      CALL saxpy(OpenAD_Symbol_891,ALP2,DSS3)
      CALL saxpy(OpenAD_Symbol_895,ALAMCM,DSS3)
      CALL saxpy(OpenAD_Symbol_900,ALP1,DSS3)
      CALL saxpy(OpenAD_Symbol_907,ALAMCP,DSS3)
      CALL saxpy(OpenAD_Symbol_917,ALP5,DSS3)
      CALL saxpy(OpenAD_Symbol_918,NZHAT,DSS3)
      CALL saxpy(OpenAD_Symbol_919,ALAMU,DSS3)
      CALL saxpy(OpenAD_Symbol_920,ALP4,DSS3)
      CALL sax(OpenAD_Symbol_831,NZHAT,DSS4)
      CALL saxpy(OpenAD_Symbol_412,NXHAT,DSS4)
      CALL saxpy(OpenAD_Symbol_416,VAVE,DSS4)
      CALL saxpy(OpenAD_Symbol_849,NYHAT,DSS4)
      CALL saxpy(OpenAD_Symbol_874,CAVE,DSS4)
      CALL saxpy(OpenAD_Symbol_878,NYHAT,DSS4)
      CALL saxpy(OpenAD_Symbol_882,ALP3,DSS4)
      CALL saxpy(OpenAD_Symbol_886,NXHAT,DSS4)
      CALL saxpy(OpenAD_Symbol_890,ALP2,DSS4)
      CALL saxpy(OpenAD_Symbol_894,ALAMCM,DSS4)
      CALL saxpy(OpenAD_Symbol_899,ALP1,DSS4)
      CALL saxpy(OpenAD_Symbol_906,ALAMCP,DSS4)
      CALL saxpy(OpenAD_Symbol_911,NZHAT,DSS4)
      CALL saxpy(OpenAD_Symbol_912,ALAMU,DSS4)
      CALL saxpy(OpenAD_Symbol_913,ALP4,DSS4)
      CALL saxpy(OpenAD_Symbol_916,ALP5,DSS4)
      CALL sax(OpenAD_Symbol_830,NXHAT,DSS5)
      CALL saxpy(OpenAD_Symbol_426,NYHAT,DSS5)
      CALL saxpy(OpenAD_Symbol_430,WAVE,DSS5)
      CALL saxpy(OpenAD_Symbol_848,NZHAT,DSS5)
      CALL saxpy(OpenAD_Symbol_873,CAVE,DSS5)
      CALL saxpy(OpenAD_Symbol_877,NYHAT,DSS5)
      CALL saxpy(OpenAD_Symbol_881,ALP3,DSS5)
      CALL saxpy(OpenAD_Symbol_885,NXHAT,DSS5)
      CALL saxpy(OpenAD_Symbol_889,ALP2,DSS5)
      CALL saxpy(OpenAD_Symbol_893,ALAMCM,DSS5)
      CALL saxpy(OpenAD_Symbol_898,ALP1,DSS5)
      CALL saxpy(OpenAD_Symbol_905,ALAMCP,DSS5)
      CALL saxpy(OpenAD_Symbol_908,NZHAT,DSS5)
      CALL saxpy(OpenAD_Symbol_909,ALAMU,DSS5)
      CALL saxpy(OpenAD_Symbol_910,ALP4,DSS5)
      CALL saxpy(OpenAD_Symbol_915,ALP5,DSS5)
      CALL sax(OpenAD_Symbol_835,WTILDE,FLUX(1))
      CALL saxpy(OpenAD_Symbol_836,VTILDE,FLUX(1))
      CALL saxpy(OpenAD_Symbol_837,UTILDE,FLUX(1))
      CALL saxpy(OpenAD_Symbol_842,THTAVE,FLUX(1))
      CALL saxpy(OpenAD_Symbol_843,PRIML(1),FLUX(1))
      CALL saxpy(OpenAD_Symbol_847,GM1INV,FLUX(1))
      CALL saxpy(OpenAD_Symbol_843,EL,FLUX(1))
      CALL saxpy(OpenAD_Symbol_851,UHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_852,CAVE,FLUX(1))
      CALL saxpy(OpenAD_Symbol_853,PRIML(5),FLUX(1))
      CALL saxpy(OpenAD_Symbol_854,NZHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_855,PRIML(4),FLUX(1))
      CALL saxpy(OpenAD_Symbol_856,PRIML(3),FLUX(1))
      CALL saxpy(OpenAD_Symbol_857,NYHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_858,NXHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_872,CAVE,FLUX(1))
      CALL saxpy(OpenAD_Symbol_876,NYHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_880,ALP3,FLUX(1))
      CALL saxpy(OpenAD_Symbol_884,NXHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_888,ALP2,FLUX(1))
      CALL saxpy(OpenAD_Symbol_892,ALAMCM,FLUX(1))
      CALL saxpy(OpenAD_Symbol_897,ALP1,FLUX(1))
      CALL saxpy(OpenAD_Symbol_901,NZHAT,FLUX(1))
      CALL saxpy(OpenAD_Symbol_902,ALAMU,FLUX(1))
      CALL saxpy(OpenAD_Symbol_903,ALP4,FLUX(1))
      CALL saxpy(OpenAD_Symbol_904,ALAMCP,FLUX(1))
      CALL saxpy(OpenAD_Symbol_914,ALP5,FLUX(1))
      CALL saxpy(OpenAD_Symbol_446,NSIZE,FLUX(1))
      OpenAD_Symbol_455 = (DSS2%v+PRIML(2)%v*UHATL%v)
      FLUX(2)%v = (NSIZE%v*OpenAD_Symbol_455)
      OpenAD_Symbol_456 = OpenAD_Symbol_455
      OpenAD_Symbol_458 = 1_w2f__i8
      OpenAD_Symbol_460 = UHATL%v
      OpenAD_Symbol_461 = PRIML(2)%v
      OpenAD_Symbol_459 = 1_w2f__i8
      OpenAD_Symbol_457 = NSIZE%v
      OpenAD_Symbol_921 = (OpenAD_Symbol_460 * OpenAD_Symbol_457)
      OpenAD_Symbol_922 = (OpenAD_Symbol_461 * OpenAD_Symbol_457)
      CALL sax(OpenAD_Symbol_457,DSS2,FLUX(2))
      CALL saxpy(OpenAD_Symbol_921,PRIML(2),FLUX(2))
      CALL saxpy(OpenAD_Symbol_922,UHATL,FLUX(2))
      CALL saxpy(OpenAD_Symbol_456,NSIZE,FLUX(2))
      OpenAD_Symbol_462 = (DSS3%v+PRIML(1)%v*NXHAT%v+RUL%v*UHATL%v)
      FLUX(3)%v = (NSIZE%v*OpenAD_Symbol_462)
      OpenAD_Symbol_463 = OpenAD_Symbol_462
      OpenAD_Symbol_465 = 1_w2f__i8
      OpenAD_Symbol_469 = NXHAT%v
      OpenAD_Symbol_470 = PRIML(1)%v
      OpenAD_Symbol_467 = 1_w2f__i8
      OpenAD_Symbol_471 = UHATL%v
      OpenAD_Symbol_472 = RUL%v
      OpenAD_Symbol_468 = 1_w2f__i8
      OpenAD_Symbol_466 = 1_w2f__i8
      OpenAD_Symbol_464 = NSIZE%v
      OpenAD_Symbol_923 = (OpenAD_Symbol_471 * OpenAD_Symbol_464)
      OpenAD_Symbol_924 = (OpenAD_Symbol_472 * OpenAD_Symbol_464)
      OpenAD_Symbol_925 = (OpenAD_Symbol_469 * OpenAD_Symbol_464)
      OpenAD_Symbol_926 = (OpenAD_Symbol_470 * OpenAD_Symbol_464)
      CALL sax(OpenAD_Symbol_464,DSS3,FLUX(3))
      CALL saxpy(OpenAD_Symbol_923,RUL,FLUX(3))
      CALL saxpy(OpenAD_Symbol_924,UHATL,FLUX(3))
      CALL saxpy(OpenAD_Symbol_925,PRIML(1),FLUX(3))
      CALL saxpy(OpenAD_Symbol_926,NXHAT,FLUX(3))
      CALL saxpy(OpenAD_Symbol_463,NSIZE,FLUX(3))
      OpenAD_Symbol_473 = (DSS4%v+PRIML(1)%v*NYHAT%v+RVL%v*UHATL%v)
      FLUX(4)%v = (NSIZE%v*OpenAD_Symbol_473)
      OpenAD_Symbol_474 = OpenAD_Symbol_473
      OpenAD_Symbol_476 = 1_w2f__i8
      OpenAD_Symbol_480 = NYHAT%v
      OpenAD_Symbol_481 = PRIML(1)%v
      OpenAD_Symbol_478 = 1_w2f__i8
      OpenAD_Symbol_482 = UHATL%v
      OpenAD_Symbol_483 = RVL%v
      OpenAD_Symbol_479 = 1_w2f__i8
      OpenAD_Symbol_477 = 1_w2f__i8
      OpenAD_Symbol_475 = NSIZE%v
      OpenAD_Symbol_927 = (OpenAD_Symbol_482 * OpenAD_Symbol_475)
      OpenAD_Symbol_928 = (OpenAD_Symbol_483 * OpenAD_Symbol_475)
      OpenAD_Symbol_929 = (OpenAD_Symbol_480 * OpenAD_Symbol_475)
      OpenAD_Symbol_930 = (OpenAD_Symbol_481 * OpenAD_Symbol_475)
      CALL sax(OpenAD_Symbol_475,DSS4,FLUX(4))
      CALL saxpy(OpenAD_Symbol_927,RVL,FLUX(4))
      CALL saxpy(OpenAD_Symbol_928,UHATL,FLUX(4))
      CALL saxpy(OpenAD_Symbol_929,PRIML(1),FLUX(4))
      CALL saxpy(OpenAD_Symbol_930,NYHAT,FLUX(4))
      CALL saxpy(OpenAD_Symbol_474,NSIZE,FLUX(4))
      OpenAD_Symbol_484 = (DSS5%v+PRIML(1)%v*NZHAT%v+RWL%v*UHATL%v)
      FLUX(5)%v = (NSIZE%v*OpenAD_Symbol_484)
      OpenAD_Symbol_485 = OpenAD_Symbol_484
      OpenAD_Symbol_487 = 1_w2f__i8
      OpenAD_Symbol_491 = NZHAT%v
      OpenAD_Symbol_492 = PRIML(1)%v
      OpenAD_Symbol_489 = 1_w2f__i8
      OpenAD_Symbol_493 = UHATL%v
      OpenAD_Symbol_494 = RWL%v
      OpenAD_Symbol_490 = 1_w2f__i8
      OpenAD_Symbol_488 = 1_w2f__i8
      OpenAD_Symbol_486 = NSIZE%v
      OpenAD_Symbol_931 = (OpenAD_Symbol_493 * OpenAD_Symbol_486)
      OpenAD_Symbol_932 = (OpenAD_Symbol_494 * OpenAD_Symbol_486)
      OpenAD_Symbol_933 = (OpenAD_Symbol_491 * OpenAD_Symbol_486)
      OpenAD_Symbol_934 = (OpenAD_Symbol_492 * OpenAD_Symbol_486)
      CALL sax(OpenAD_Symbol_486,DSS5,FLUX(5))
      CALL saxpy(OpenAD_Symbol_931,RWL,FLUX(5))
      CALL saxpy(OpenAD_Symbol_932,UHATL,FLUX(5))
      CALL saxpy(OpenAD_Symbol_933,PRIML(1),FLUX(5))
      CALL saxpy(OpenAD_Symbol_934,NZHAT,FLUX(5))
      CALL saxpy(OpenAD_Symbol_485,NSIZE,FLUX(5))
      END SUBROUTINE
