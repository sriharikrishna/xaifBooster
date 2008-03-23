
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
      REAL(w2f__8) OpenAD_Symbol_163
      TYPE (OpenADTy_active) OpenAD_Symbol_164
      INTEGER(w2f__i8) OpenAD_Symbol_257
      INTEGER(w2f__i8) OpenAD_Symbol_258
      INTEGER(w2f__i8) OpenAD_Symbol_259
      INTEGER(w2f__i8) OpenAD_Symbol_260
      INTEGER(w2f__i8) OpenAD_Symbol_261
      INTEGER(w2f__i8) OpenAD_Symbol_262
      REAL(w2f__8) OpenAD_Symbol_3
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
      EXTERNAL foo
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      REAL(w2f__8) HX
      REAL(w2f__8) HX2
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) N
      REAL(w2f__8) NXP1
      REAL(w2f__8) NYP1
      REAL(w2f__8) ONE
      PARAMETER ( ONE = 1.0D00)
      REAL(w2f__8) THREE
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
      INTEGER(w2f__i8) OpenAD_Symbol_363
      REAL(w2f__8) OpenAD_Symbol_364
      INTEGER(w2f__i8) OpenAD_Symbol_365
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
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
      DO K = 1, N, 1
        __value__(FVEC(INT(K))) = (__value__(FVEC(K)) * HX2 * HY2)
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
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(NX)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(NY)
      OpenAD_Symbol_259 = 0_w2f__i8
      DO K = 1, N, 1
        OpenAD_Symbol_0 = (HX2 * HY2)
        OpenAD_Symbol_3 = (__value__(FVEC(K)) * OpenAD_Symbol_0)
        OpenAD_Symbol_1 = OpenAD_Symbol_0
        __value__(FVEC(INT(K))) = OpenAD_Symbol_3
        OpenAD_Symbol_163 = OpenAD_Symbol_1
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_163)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
        OpenAD_Symbol_259 = (INT(OpenAD_Symbol_259) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_259)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_257)
      OpenAD_Symbol_258 = 1
      DO WHILE(INT(OpenAD_Symbol_258) .LE. INT(OpenAD_Symbol_257))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_363)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_364)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_364, __deriv__(FVEC(INT(
     > OpenAD_Symbol_363))), __deriv__(OpenAD_Symbol_164))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_363))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_365)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_164), __deriv__(FVEC(INT(
     > OpenAD_Symbol_365))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_164))
        OpenAD_Symbol_258 = INT(OpenAD_Symbol_258) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(NX)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(NY)
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
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
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(NX)
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(NY)
      OpenAD_Symbol_262 = 0_w2f__i8
      DO K = 1, N, 1
        OpenAD_Symbol_0 = (HX2 * HY2)
        OpenAD_Symbol_3 = (__value__(FVEC(K)) * OpenAD_Symbol_0)
        OpenAD_Symbol_1 = OpenAD_Symbol_0
        __value__(FVEC(INT(K))) = OpenAD_Symbol_3
        OpenAD_Symbol_163 = OpenAD_Symbol_1
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_163)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
        OpenAD_Symbol_262 = (INT(OpenAD_Symbol_262) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_262)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_260)
      OpenAD_Symbol_261 = 1
      DO WHILE(INT(OpenAD_Symbol_261) .LE. INT(OpenAD_Symbol_260))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_363)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_364)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_364, __deriv__(FVEC(INT(
     > OpenAD_Symbol_363))), __deriv__(OpenAD_Symbol_164))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_363))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_365)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_164), __deriv__(FVEC(INT(
     > OpenAD_Symbol_365))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_164))
        OpenAD_Symbol_261 = INT(OpenAD_Symbol_261) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(NX)
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(NY)
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE foo(NX, NY, X, FVEC, R, N, HX, HY, HY2, HX2)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
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
      REAL(w2f__8) OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
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
      REAL(w2f__8) OpenAD_Symbol_29
      INTEGER(w2f__i8) OpenAD_Symbol_290
      INTEGER(w2f__i8) OpenAD_Symbol_291
      INTEGER(w2f__i8) OpenAD_Symbol_292
      INTEGER(w2f__i8) OpenAD_Symbol_293
      INTEGER(w2f__i8) OpenAD_Symbol_294
      INTEGER(w2f__i8) OpenAD_Symbol_295
      INTEGER(w2f__i8) OpenAD_Symbol_296
      INTEGER(w2f__i8) OpenAD_Symbol_297
      INTEGER(w2f__i8) OpenAD_Symbol_298
      INTEGER(w2f__i8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_30
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
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_44
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_47
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_50
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) NX
      INTEGER(w2f__i4) NY
      TYPE (OpenADTy_active) X(1 : INT((NX * NY)))
      TYPE (OpenADTy_active) FVEC(1 : INT((NX * NY)))
      REAL(w2f__8) R
      INTEGER(w2f__i4) N
      REAL(w2f__8) HX
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      REAL(w2f__8) HX2
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
      TYPE (OpenADTy_active) DPDX
      TYPE (OpenADTy_active) DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
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
      INTEGER(w2f__i8) OpenAD_Symbol_347
      INTEGER(w2f__i8) OpenAD_Symbol_348
      INTEGER(w2f__i8) OpenAD_Symbol_349
      INTEGER(w2f__i8) OpenAD_Symbol_350
      INTEGER(w2f__i8) OpenAD_Symbol_351
      INTEGER(w2f__i8) OpenAD_Symbol_352
      INTEGER(w2f__i8) OpenAD_Symbol_353
      INTEGER(w2f__i8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
      INTEGER(w2f__i8) OpenAD_Symbol_359
      INTEGER(w2f__i8) OpenAD_Symbol_360
      INTEGER(w2f__i8) OpenAD_Symbol_361
      INTEGER(w2f__i8) OpenAD_Symbol_362
      INTEGER(w2f__i8) OpenAD_Symbol_366
      INTEGER(w2f__i8) OpenAD_Symbol_367
      INTEGER(w2f__i8) OpenAD_Symbol_368
      INTEGER(w2f__i8) OpenAD_Symbol_369
      INTEGER(w2f__i8) OpenAD_Symbol_370
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
      REAL(w2f__8) OpenAD_Symbol_395
      REAL(w2f__8) OpenAD_Symbol_396
      REAL(w2f__8) OpenAD_Symbol_397
      REAL(w2f__8) OpenAD_Symbol_398
      INTEGER(w2f__i8) OpenAD_Symbol_399
      INTEGER(w2f__i8) OpenAD_Symbol_400
      REAL(w2f__8) OpenAD_Symbol_401
      INTEGER(w2f__i8) OpenAD_Symbol_402
      INTEGER(w2f__i8) OpenAD_Symbol_403
      INTEGER(w2f__i8) OpenAD_Symbol_404
      INTEGER(w2f__i8) OpenAD_Symbol_405
      INTEGER(w2f__i8) OpenAD_Symbol_406
      INTEGER(w2f__i8) OpenAD_Symbol_407
      INTEGER(w2f__i8) OpenAD_Symbol_408
      INTEGER(w2f__i8) OpenAD_Symbol_409
      INTEGER(w2f__i8) OpenAD_Symbol_410
      INTEGER(w2f__i8) OpenAD_Symbol_411
      INTEGER(w2f__i8) OpenAD_Symbol_412
      INTEGER(w2f__i8) OpenAD_Symbol_413
      INTEGER(w2f__i8) OpenAD_Symbol_414
      INTEGER(w2f__i8) OpenAD_Symbol_415
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
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
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
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
      OpenAD_Symbol_279 = 0_w2f__i8
      DO I = 1, NY, 1
        OpenAD_Symbol_280 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_281 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_281)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_362 = (K - NX +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_362)
            OpenAD_Symbol_282 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_282)
          ENDIF
          IF(I .eq. 1) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_285 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_285)
          ELSE
            IF(I .eq. 2) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_359 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_359)
              OpenAD_Symbol_283 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_283)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_360 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_360)
              OpenAD_Symbol_361 = (K - NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_361)
              OpenAD_Symbol_284 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_284)
            ENDIF
            OpenAD_Symbol_286 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_286)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_287 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_287)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_358 = (K - NX + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_358)
            OpenAD_Symbol_288 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_288)
          ENDIF
          IF(J .eq. 1) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_291 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_291)
          ELSE
            IF(J .eq. 2) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_355 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_355)
              OpenAD_Symbol_289 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_289)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_356 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_356)
              OpenAD_Symbol_357 = (K +(-2))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_357)
              OpenAD_Symbol_290 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_290)
            ENDIF
            OpenAD_Symbol_292 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_292)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX +(-1))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_347 = (K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_347)
            OpenAD_Symbol_295 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_295)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_293 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_293)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_353 = (K + 1)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_353)
              OpenAD_Symbol_354 = (K + 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_354)
              OpenAD_Symbol_294 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_294)
            ENDIF
            OpenAD_Symbol_296 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_296)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_297 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_297)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_352 = (NX + K +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_352)
            OpenAD_Symbol_298 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_298)
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_348 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_348)
            OpenAD_Symbol_301 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_301)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
              OpenAD_Symbol_61 = 1_w2f__i8
              OpenAD_Symbol_196 = OpenAD_Symbol_61
C             $OpenAD$ INLINE push(subst)
              CALL push(OpenAD_Symbol_196)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_299 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_299)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_350 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_350)
              OpenAD_Symbol_351 = (K + NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_351)
              OpenAD_Symbol_300 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_300)
            ENDIF
            OpenAD_Symbol_302 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_302)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_303 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_303)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_349 = (NX + K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_349)
            OpenAD_Symbol_304 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_304)
          ENDIF
          OpenAD_Symbol_4 = (__value__(PT) - __value__(PB))
          OpenAD_Symbol_5 = (HY * 2.0D00)
          __value__(DPDY) = (OpenAD_Symbol_4 / OpenAD_Symbol_5)
          OpenAD_Symbol_8 = 1_w2f__i8
          OpenAD_Symbol_9 = (-1_w2f__i8)
          OpenAD_Symbol_6 = (INT(1_w2f__i8) / OpenAD_Symbol_5)
          OpenAD_Symbol_10 = (__value__(PR) - __value__(PL))
          OpenAD_Symbol_11 = (HX * 2.0D00)
          __value__(DPDX) = (OpenAD_Symbol_10 / OpenAD_Symbol_11)
          OpenAD_Symbol_14 = 1_w2f__i8
          OpenAD_Symbol_15 = (-1_w2f__i8)
          OpenAD_Symbol_12 = (INT(1_w2f__i8) / OpenAD_Symbol_11)
          OpenAD_Symbol_165 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_166 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
          OpenAD_Symbol_167 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
          OpenAD_Symbol_168 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_165)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_166)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_167)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_168)
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
          OpenAD_Symbol_20 = (__value__(PBLAP) + __value__(PTLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_29 = (__value__(PLLAP) + __value__(PRLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_47 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_43 = (__value__(DPDY) * OpenAD_Symbol_47)
          OpenAD_Symbol_44 = (HX * 2.0D00)
          OpenAD_Symbol_56 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_52 = (__value__(DPDX) * OpenAD_Symbol_56)
          OpenAD_Symbol_53 = (HY * 2.0D00)
          OpenAD_Symbol_38 = ((OpenAD_Symbol_43 / OpenAD_Symbol_44) -(
     > OpenAD_Symbol_52 / OpenAD_Symbol_53))
          __value__(FVEC(INT(K))) = ((OpenAD_Symbol_20 / HY2) +(
     > OpenAD_Symbol_29 / HX2) - R * OpenAD_Symbol_38)
          OpenAD_Symbol_23 = 1_w2f__i8
          OpenAD_Symbol_25 = 1_w2f__i8
          OpenAD_Symbol_27 = 2.0D00
          OpenAD_Symbol_26 = (-1_w2f__i8)
          OpenAD_Symbol_24 = 1_w2f__i8
          OpenAD_Symbol_21 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_32 = 1_w2f__i8
          OpenAD_Symbol_34 = 1_w2f__i8
          OpenAD_Symbol_36 = 2.0D00
          OpenAD_Symbol_35 = (-1_w2f__i8)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_30 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_16 = 1_w2f__i8
          OpenAD_Symbol_48 = OpenAD_Symbol_47
          OpenAD_Symbol_50 = 1_w2f__i8
          OpenAD_Symbol_51 = (-1_w2f__i8)
          OpenAD_Symbol_49 = __value__(DPDY)
          OpenAD_Symbol_45 = (INT(1_w2f__i8) / OpenAD_Symbol_44)
          OpenAD_Symbol_41 = 1_w2f__i8
          OpenAD_Symbol_57 = OpenAD_Symbol_56
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_60 = (-1_w2f__i8)
          OpenAD_Symbol_58 = __value__(DPDX)
          OpenAD_Symbol_54 = (INT(1_w2f__i8) / OpenAD_Symbol_53)
          OpenAD_Symbol_42 = (-1_w2f__i8)
          OpenAD_Symbol_40 = R
          OpenAD_Symbol_17 = (-1_w2f__i8)
          OpenAD_Symbol_169 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
          OpenAD_Symbol_170 = (OpenAD_Symbol_19 * OpenAD_Symbol_16)
          OpenAD_Symbol_171 = (OpenAD_Symbol_40 * OpenAD_Symbol_17)
          OpenAD_Symbol_172 = (OpenAD_Symbol_41 * OpenAD_Symbol_171)
          OpenAD_Symbol_173 = (OpenAD_Symbol_42 * OpenAD_Symbol_171)
          OpenAD_Symbol_174 = (OpenAD_Symbol_30 * OpenAD_Symbol_170)
          OpenAD_Symbol_175 = (OpenAD_Symbol_32 * OpenAD_Symbol_174)
          OpenAD_Symbol_176 = (OpenAD_Symbol_33 * OpenAD_Symbol_174)
          OpenAD_Symbol_177 = (OpenAD_Symbol_34 * OpenAD_Symbol_176)
          OpenAD_Symbol_178 = (OpenAD_Symbol_35 * OpenAD_Symbol_176)
          OpenAD_Symbol_179 = (OpenAD_Symbol_21 * OpenAD_Symbol_169)
          OpenAD_Symbol_180 = (OpenAD_Symbol_23 * OpenAD_Symbol_179)
          OpenAD_Symbol_181 = (OpenAD_Symbol_24 * OpenAD_Symbol_179)
          OpenAD_Symbol_182 = (OpenAD_Symbol_25 * OpenAD_Symbol_181)
          OpenAD_Symbol_183 = (OpenAD_Symbol_26 * OpenAD_Symbol_181)
          OpenAD_Symbol_184 = (OpenAD_Symbol_54 * OpenAD_Symbol_173)
          OpenAD_Symbol_185 = (OpenAD_Symbol_57 * OpenAD_Symbol_184)
          OpenAD_Symbol_186 = (OpenAD_Symbol_58 * OpenAD_Symbol_184)
          OpenAD_Symbol_187 = (OpenAD_Symbol_59 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_60 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_45 * OpenAD_Symbol_172)
          OpenAD_Symbol_190 = (OpenAD_Symbol_48 * OpenAD_Symbol_189)
          OpenAD_Symbol_191 = (OpenAD_Symbol_49 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_50 * OpenAD_Symbol_191)
          OpenAD_Symbol_193 = (OpenAD_Symbol_51 * OpenAD_Symbol_191)
          OpenAD_Symbol_194 = (OpenAD_Symbol_36 * OpenAD_Symbol_178)
          OpenAD_Symbol_195 = (OpenAD_Symbol_27 * OpenAD_Symbol_183)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_175)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_177)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_180)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_182)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_185)
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
          CALL push(OpenAD_Symbol_190)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_192)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_193)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_194)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_195)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_280 = (INT(OpenAD_Symbol_280) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_280)
        OpenAD_Symbol_279 = (INT(OpenAD_Symbol_279) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_279)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_263)
      OpenAD_Symbol_264 = 1
      DO WHILE(INT(OpenAD_Symbol_264) .LE. INT(OpenAD_Symbol_263))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_265)
        OpenAD_Symbol_266 = 1
        DO WHILE(INT(OpenAD_Symbol_266) .LE. INT(OpenAD_Symbol_265))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_371)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_372)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_372, __deriv__(FVEC(INT(
     > OpenAD_Symbol_371))), __deriv__(PLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_373)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_374)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_374, __deriv__(FVEC(INT(
     > OpenAD_Symbol_373))), __deriv__(PLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_375)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_376)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_376, __deriv__(FVEC(INT(
     > OpenAD_Symbol_375))), __deriv__(PLLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_377)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_378)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_378, __deriv__(FVEC(INT(
     > OpenAD_Symbol_377))), __deriv__(PRLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_379)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_380)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_380, __deriv__(FVEC(INT(
     > OpenAD_Symbol_379))), __deriv__(DPDY))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_381)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_382)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_382, __deriv__(FVEC(INT(
     > OpenAD_Symbol_381))), __deriv__(PBLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_383)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_384)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_384, __deriv__(FVEC(INT(
     > OpenAD_Symbol_383))), __deriv__(PTLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_385)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_386)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_386, __deriv__(FVEC(INT(
     > OpenAD_Symbol_385))), __deriv__(DPDX))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_387)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_388)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_388, __deriv__(FVEC(INT(
     > OpenAD_Symbol_387))), __deriv__(PTLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_389)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_390)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_390, __deriv__(FVEC(INT(
     > OpenAD_Symbol_389))), __deriv__(PBLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_391)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_392)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_392, __deriv__(FVEC(INT(
     > OpenAD_Symbol_391))), __deriv__(PRLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_393)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_394)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_394, __deriv__(FVEC(INT(
     > OpenAD_Symbol_393))), __deriv__(PLLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_393))))
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_395)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_395, __deriv__(DPDX), __deriv__(PL))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_396)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_396, __deriv__(DPDX), __deriv__(PR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDX))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_397)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_397, __deriv__(DPDY), __deriv__(PB))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_398)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_398, __deriv__(DPDY), __deriv__(PT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDY))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_267)
          IF(OpenAD_Symbol_267 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_399)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTR), __deriv__(X(INT(
     > OpenAD_Symbol_399))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_268)
          IF(OpenAD_Symbol_268 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_370)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_370))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PT))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_269)
            IF(OpenAD_Symbol_269 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_400)
C             $OpenAD$ INLINE Pop(subst)
              CALL Pop(OpenAD_Symbol_401)
C             $OpenAD$ INLINE Saxpy(subst,subst,subst)
              CALL Saxpy(OpenAD_Symbol_401, __deriv__(PTT), __deriv__(X
     > (INT(OpenAD_Symbol_400))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_402)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PTT), __deriv__(X(INT(
     > OpenAD_Symbol_402))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_403)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_403))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_270)
          IF(OpenAD_Symbol_270 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_404)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTL), __deriv__(X(INT(
     > OpenAD_Symbol_404))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_271)
          IF(OpenAD_Symbol_271 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_369)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_369))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_272)
            IF(OpenAD_Symbol_272 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_405)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_405))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_406)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_406))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_407)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_407))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_368)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(P), __deriv__(X(INT(OpenAD_Symbol_368
     > ))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_273)
          IF(OpenAD_Symbol_273 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_367)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_367))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PLL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_274)
            IF(OpenAD_Symbol_274 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_408)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_408))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_409)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_409))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_410)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_410))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_275)
          IF(OpenAD_Symbol_275 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_411)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBR), __deriv__(X(INT(
     > OpenAD_Symbol_411))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_276)
          IF(OpenAD_Symbol_276 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_366)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_366))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBB))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_277)
            IF(OpenAD_Symbol_277 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_412)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_412))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_413)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_413))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_414)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_414))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_278)
          IF(OpenAD_Symbol_278 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_415)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBL), __deriv__(X(INT(
     > OpenAD_Symbol_415))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ENDIF
          OpenAD_Symbol_266 = INT(OpenAD_Symbol_266) + 1
        END DO
        OpenAD_Symbol_264 = INT(OpenAD_Symbol_264) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HX2)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HX)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HY)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HY)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HX)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HX2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HY2)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HX2)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HX)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HY)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HY)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HX)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HX2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_321 = 0_w2f__i8
      DO I = 1, NY, 1
        OpenAD_Symbol_322 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. 1) .OR.(J .eq. 1)) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_323 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_323)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_362 = (K - NX +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_362)
            OpenAD_Symbol_324 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_324)
          ENDIF
          IF(I .eq. 1) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_327 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_327)
          ELSE
            IF(I .eq. 2) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_359 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_359)
              OpenAD_Symbol_325 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_325)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_360 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_360)
              OpenAD_Symbol_361 = (K - NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_361)
              OpenAD_Symbol_326 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_326)
            ENDIF
            OpenAD_Symbol_328 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_328)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. 1)) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_329 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_329)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_358 = (K - NX + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_358)
            OpenAD_Symbol_330 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_330)
          ENDIF
          IF(J .eq. 1) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_333 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_333)
          ELSE
            IF(J .eq. 2) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_355 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_355)
              OpenAD_Symbol_331 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_331)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_356 = (K +(-1))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_356)
              OpenAD_Symbol_357 = (K +(-2))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_357)
              OpenAD_Symbol_332 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_332)
            ENDIF
            OpenAD_Symbol_334 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_334)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX +(-1))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_347 = (K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_347)
            OpenAD_Symbol_337 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_337)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_335 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_335)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_353 = (K + 1)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_353)
              OpenAD_Symbol_354 = (K + 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_354)
              OpenAD_Symbol_336 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_336)
            ENDIF
            OpenAD_Symbol_338 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_338)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. 1)) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_339 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_339)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_352 = (NX + K +(-1))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_352)
            OpenAD_Symbol_340 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_340)
          ENDIF
          IF(I .eq.(NY +(-1))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_348 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_348)
            OpenAD_Symbol_343 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_343)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
              OpenAD_Symbol_61 = 1_w2f__i8
              OpenAD_Symbol_196 = OpenAD_Symbol_61
C             $OpenAD$ INLINE push(subst)
              CALL push(OpenAD_Symbol_196)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_341 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_341)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_350 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_350)
              OpenAD_Symbol_351 = (K + NX * 2)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_351)
              OpenAD_Symbol_342 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_342)
            ENDIF
            OpenAD_Symbol_344 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_344)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_345 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_345)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_349 = (NX + K + 1)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_349)
            OpenAD_Symbol_346 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_346)
          ENDIF
          OpenAD_Symbol_4 = (__value__(PT) - __value__(PB))
          OpenAD_Symbol_5 = (HY * 2.0D00)
          __value__(DPDY) = (OpenAD_Symbol_4 / OpenAD_Symbol_5)
          OpenAD_Symbol_8 = 1_w2f__i8
          OpenAD_Symbol_9 = (-1_w2f__i8)
          OpenAD_Symbol_6 = (INT(1_w2f__i8) / OpenAD_Symbol_5)
          OpenAD_Symbol_10 = (__value__(PR) - __value__(PL))
          OpenAD_Symbol_11 = (HX * 2.0D00)
          __value__(DPDX) = (OpenAD_Symbol_10 / OpenAD_Symbol_11)
          OpenAD_Symbol_14 = 1_w2f__i8
          OpenAD_Symbol_15 = (-1_w2f__i8)
          OpenAD_Symbol_12 = (INT(1_w2f__i8) / OpenAD_Symbol_11)
          OpenAD_Symbol_165 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_166 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
          OpenAD_Symbol_167 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
          OpenAD_Symbol_168 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_165)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_166)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_167)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_168)
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
          OpenAD_Symbol_20 = (__value__(PBLAP) + __value__(PTLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_29 = (__value__(PLLAP) + __value__(PRLAP) -
     >  __value__(PLAP) * 2.0D00)
          OpenAD_Symbol_47 = (__value__(PRLAP) - __value__(PLLAP))
          OpenAD_Symbol_43 = (__value__(DPDY) * OpenAD_Symbol_47)
          OpenAD_Symbol_44 = (HX * 2.0D00)
          OpenAD_Symbol_56 = (__value__(PTLAP) - __value__(PBLAP))
          OpenAD_Symbol_52 = (__value__(DPDX) * OpenAD_Symbol_56)
          OpenAD_Symbol_53 = (HY * 2.0D00)
          OpenAD_Symbol_38 = ((OpenAD_Symbol_43 / OpenAD_Symbol_44) -(
     > OpenAD_Symbol_52 / OpenAD_Symbol_53))
          __value__(FVEC(INT(K))) = ((OpenAD_Symbol_20 / HY2) +(
     > OpenAD_Symbol_29 / HX2) - R * OpenAD_Symbol_38)
          OpenAD_Symbol_23 = 1_w2f__i8
          OpenAD_Symbol_25 = 1_w2f__i8
          OpenAD_Symbol_27 = 2.0D00
          OpenAD_Symbol_26 = (-1_w2f__i8)
          OpenAD_Symbol_24 = 1_w2f__i8
          OpenAD_Symbol_21 = (INT(1_w2f__i8) / HY2)
          OpenAD_Symbol_18 = 1_w2f__i8
          OpenAD_Symbol_32 = 1_w2f__i8
          OpenAD_Symbol_34 = 1_w2f__i8
          OpenAD_Symbol_36 = 2.0D00
          OpenAD_Symbol_35 = (-1_w2f__i8)
          OpenAD_Symbol_33 = 1_w2f__i8
          OpenAD_Symbol_30 = (INT(1_w2f__i8) / HX2)
          OpenAD_Symbol_19 = 1_w2f__i8
          OpenAD_Symbol_16 = 1_w2f__i8
          OpenAD_Symbol_48 = OpenAD_Symbol_47
          OpenAD_Symbol_50 = 1_w2f__i8
          OpenAD_Symbol_51 = (-1_w2f__i8)
          OpenAD_Symbol_49 = __value__(DPDY)
          OpenAD_Symbol_45 = (INT(1_w2f__i8) / OpenAD_Symbol_44)
          OpenAD_Symbol_41 = 1_w2f__i8
          OpenAD_Symbol_57 = OpenAD_Symbol_56
          OpenAD_Symbol_59 = 1_w2f__i8
          OpenAD_Symbol_60 = (-1_w2f__i8)
          OpenAD_Symbol_58 = __value__(DPDX)
          OpenAD_Symbol_54 = (INT(1_w2f__i8) / OpenAD_Symbol_53)
          OpenAD_Symbol_42 = (-1_w2f__i8)
          OpenAD_Symbol_40 = R
          OpenAD_Symbol_17 = (-1_w2f__i8)
          OpenAD_Symbol_169 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
          OpenAD_Symbol_170 = (OpenAD_Symbol_19 * OpenAD_Symbol_16)
          OpenAD_Symbol_171 = (OpenAD_Symbol_40 * OpenAD_Symbol_17)
          OpenAD_Symbol_172 = (OpenAD_Symbol_41 * OpenAD_Symbol_171)
          OpenAD_Symbol_173 = (OpenAD_Symbol_42 * OpenAD_Symbol_171)
          OpenAD_Symbol_174 = (OpenAD_Symbol_30 * OpenAD_Symbol_170)
          OpenAD_Symbol_175 = (OpenAD_Symbol_32 * OpenAD_Symbol_174)
          OpenAD_Symbol_176 = (OpenAD_Symbol_33 * OpenAD_Symbol_174)
          OpenAD_Symbol_177 = (OpenAD_Symbol_34 * OpenAD_Symbol_176)
          OpenAD_Symbol_178 = (OpenAD_Symbol_35 * OpenAD_Symbol_176)
          OpenAD_Symbol_179 = (OpenAD_Symbol_21 * OpenAD_Symbol_169)
          OpenAD_Symbol_180 = (OpenAD_Symbol_23 * OpenAD_Symbol_179)
          OpenAD_Symbol_181 = (OpenAD_Symbol_24 * OpenAD_Symbol_179)
          OpenAD_Symbol_182 = (OpenAD_Symbol_25 * OpenAD_Symbol_181)
          OpenAD_Symbol_183 = (OpenAD_Symbol_26 * OpenAD_Symbol_181)
          OpenAD_Symbol_184 = (OpenAD_Symbol_54 * OpenAD_Symbol_173)
          OpenAD_Symbol_185 = (OpenAD_Symbol_57 * OpenAD_Symbol_184)
          OpenAD_Symbol_186 = (OpenAD_Symbol_58 * OpenAD_Symbol_184)
          OpenAD_Symbol_187 = (OpenAD_Symbol_59 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_60 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_45 * OpenAD_Symbol_172)
          OpenAD_Symbol_190 = (OpenAD_Symbol_48 * OpenAD_Symbol_189)
          OpenAD_Symbol_191 = (OpenAD_Symbol_49 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_50 * OpenAD_Symbol_191)
          OpenAD_Symbol_193 = (OpenAD_Symbol_51 * OpenAD_Symbol_191)
          OpenAD_Symbol_194 = (OpenAD_Symbol_36 * OpenAD_Symbol_178)
          OpenAD_Symbol_195 = (OpenAD_Symbol_27 * OpenAD_Symbol_183)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_175)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_177)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_180)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_182)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_185)
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
          CALL push(OpenAD_Symbol_190)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_192)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_193)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_194)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_195)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_322 = (INT(OpenAD_Symbol_322) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_322)
        OpenAD_Symbol_321 = (INT(OpenAD_Symbol_321) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_321)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_305)
      OpenAD_Symbol_306 = 1
      DO WHILE(INT(OpenAD_Symbol_306) .LE. INT(OpenAD_Symbol_305))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_307)
        OpenAD_Symbol_308 = 1
        DO WHILE(INT(OpenAD_Symbol_308) .LE. INT(OpenAD_Symbol_307))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_371)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_372)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_372, __deriv__(FVEC(INT(
     > OpenAD_Symbol_371))), __deriv__(PLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_373)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_374)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_374, __deriv__(FVEC(INT(
     > OpenAD_Symbol_373))), __deriv__(PLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_375)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_376)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_376, __deriv__(FVEC(INT(
     > OpenAD_Symbol_375))), __deriv__(PLLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_377)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_378)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_378, __deriv__(FVEC(INT(
     > OpenAD_Symbol_377))), __deriv__(PRLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_379)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_380)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_380, __deriv__(FVEC(INT(
     > OpenAD_Symbol_379))), __deriv__(DPDY))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_381)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_382)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_382, __deriv__(FVEC(INT(
     > OpenAD_Symbol_381))), __deriv__(PBLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_383)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_384)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_384, __deriv__(FVEC(INT(
     > OpenAD_Symbol_383))), __deriv__(PTLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_385)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_386)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_386, __deriv__(FVEC(INT(
     > OpenAD_Symbol_385))), __deriv__(DPDX))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_387)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_388)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_388, __deriv__(FVEC(INT(
     > OpenAD_Symbol_387))), __deriv__(PTLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_389)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_390)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_390, __deriv__(FVEC(INT(
     > OpenAD_Symbol_389))), __deriv__(PBLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_391)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_392)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_392, __deriv__(FVEC(INT(
     > OpenAD_Symbol_391))), __deriv__(PRLAP))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_393)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_394)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_394, __deriv__(FVEC(INT(
     > OpenAD_Symbol_393))), __deriv__(PLLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_393))))
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_395)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_395, __deriv__(DPDX), __deriv__(PL))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_396)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_396, __deriv__(DPDX), __deriv__(PR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDX))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_397)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_397, __deriv__(DPDY), __deriv__(PB))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_398)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_398, __deriv__(DPDY), __deriv__(PT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDY))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_309)
          IF(OpenAD_Symbol_309 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_399)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTR), __deriv__(X(INT(
     > OpenAD_Symbol_399))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_310)
          IF(OpenAD_Symbol_310 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_370)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_370))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PT))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_311)
            IF(OpenAD_Symbol_311 .ne. 0) THEN
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_400)
C             $OpenAD$ INLINE Pop(subst)
              CALL Pop(OpenAD_Symbol_401)
C             $OpenAD$ INLINE Saxpy(subst,subst,subst)
              CALL Saxpy(OpenAD_Symbol_401, __deriv__(PTT), __deriv__(X
     > (INT(OpenAD_Symbol_400))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_402)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PTT), __deriv__(X(INT(
     > OpenAD_Symbol_402))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_403)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PT), __deriv__(X(INT(
     > OpenAD_Symbol_403))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_312)
          IF(OpenAD_Symbol_312 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_404)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PTL), __deriv__(X(INT(
     > OpenAD_Symbol_404))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_313)
          IF(OpenAD_Symbol_313 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_369)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_369))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_314)
            IF(OpenAD_Symbol_314 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_405)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_405))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_406)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PRR), __deriv__(X(INT(
     > OpenAD_Symbol_406))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PRR))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_407)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PR), __deriv__(X(INT(
     > OpenAD_Symbol_407))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_368)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(P), __deriv__(X(INT(OpenAD_Symbol_368
     > ))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(P))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_315)
          IF(OpenAD_Symbol_315 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_367)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_367))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PLL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_316)
            IF(OpenAD_Symbol_316 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_408)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_408))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_409)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PLL), __deriv__(X(INT(
     > OpenAD_Symbol_409))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_410)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PL), __deriv__(X(INT(
     > OpenAD_Symbol_410))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PL))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_317)
          IF(OpenAD_Symbol_317 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_411)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBR), __deriv__(X(INT(
     > OpenAD_Symbol_411))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_318)
          IF(OpenAD_Symbol_318 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_366)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_366))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBB))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_319)
            IF(OpenAD_Symbol_319 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_412)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_412))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
            ELSE
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_413)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PBB), __deriv__(X(INT(
     > OpenAD_Symbol_413))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_414)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(PB), __deriv__(X(INT(
     > OpenAD_Symbol_414))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PB))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_320)
          IF(OpenAD_Symbol_320 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_415)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(PBL), __deriv__(X(INT(
     > OpenAD_Symbol_415))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ENDIF
          OpenAD_Symbol_308 = INT(OpenAD_Symbol_308) + 1
        END DO
        OpenAD_Symbol_306 = INT(OpenAD_Symbol_306) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE bar(PBB, PBL, PB, PBR, PLL, PL, P, PR, PRR, PTL, PT,
     >  PTR, PTT, HY2, HX2, PLAP, PBLAP, PLLAP, PRLAP, PTLAP)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
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
      REAL(w2f__8) OpenAD_Symbol_250
      REAL(w2f__8) OpenAD_Symbol_251
      REAL(w2f__8) OpenAD_Symbol_252
      REAL(w2f__8) OpenAD_Symbol_253
      REAL(w2f__8) OpenAD_Symbol_254
      REAL(w2f__8) OpenAD_Symbol_255
      REAL(w2f__8) OpenAD_Symbol_256
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_95
      REAL(w2f__8) OpenAD_Symbol_97
      REAL(w2f__8) OpenAD_Symbol_98
      REAL(w2f__8) OpenAD_Symbol_99
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) PBB
      TYPE (OpenADTy_active) PBL
      TYPE (OpenADTy_active) PB
      TYPE (OpenADTy_active) PBR
      TYPE (OpenADTy_active) PLL
      TYPE (OpenADTy_active) PL
      TYPE (OpenADTy_active) P
      TYPE (OpenADTy_active) PR
      TYPE (OpenADTy_active) PRR
      TYPE (OpenADTy_active) PTL
      TYPE (OpenADTy_active) PT
      TYPE (OpenADTy_active) PTR
      TYPE (OpenADTy_active) PTT
      REAL(w2f__8) HY2
      REAL(w2f__8) HX2
      TYPE (OpenADTy_active) PLAP
      TYPE (OpenADTy_active) PBLAP
      TYPE (OpenADTy_active) PLLAP
      TYPE (OpenADTy_active) PRLAP
      TYPE (OpenADTy_active) PTLAP
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR = 4.0D00)
      REAL(w2f__8) ONE
      PARAMETER ( ONE = 1.0D00)
      REAL(w2f__8) THREE
      PARAMETER ( THREE = 3.0D00)
      REAL(w2f__8) TWO
      PARAMETER ( TWO = 2.0D00)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO = 0.0D00)
      REAL(w2f__8) OpenAD_Symbol_416
      REAL(w2f__8) OpenAD_Symbol_417
      REAL(w2f__8) OpenAD_Symbol_418
      REAL(w2f__8) OpenAD_Symbol_419
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
      REAL(w2f__8) OpenAD_Symbol_440
      REAL(w2f__8) OpenAD_Symbol_441
      REAL(w2f__8) OpenAD_Symbol_442
      REAL(w2f__8) OpenAD_Symbol_443
      REAL(w2f__8) OpenAD_Symbol_444
      REAL(w2f__8) OpenAD_Symbol_445
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(PBLAP) = (((__value__(PBB) + __value__(P) - __value__(
     > PB) * 2.0D00) / HY2) +((__value__(PBL) + __value__(PBR) -
     >  __value__(PB) * 2.0D00) / HX2))
      __value__(PLLAP) = (((__value__(PBL) + __value__(PTL) - __value__
     > (PL) * 2.0D00) / HY2) +((__value__(PLL) + __value__(P) -
     >  __value__(PL) * 2.0D00) / HX2))
      __value__(PLAP) = (((__value__(PB) + __value__(PT) - __value__(P)
     >  * 2.0D00) / HY2) +((__value__(PL) + __value__(PR) - __value__(P
     > ) * 2.0D00) / HX2))
      __value__(PRLAP) = (((__value__(PBR) + __value__(PTR) - __value__
     > (PR) * 2.0D00) / HY2) +((__value__(P) + __value__(PRR) -
     >  __value__(PR) * 2.0D00) / HX2))
      __value__(PTLAP) = (((__value__(P) + __value__(PTT) - __value__(
     > PT) * 2.0D00) / HY2) +((__value__(PTL) + __value__(PTR) -
     >  __value__(PT) * 2.0D00) / HX2))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_65 = (__value__(PBB) + __value__(P) - __value__(PB)
     >  * 2.0D00)
      OpenAD_Symbol_74 = (__value__(PBL) + __value__(PBR) - __value__(
     > PB) * 2.0D00)
      __value__(PBLAP) = ((OpenAD_Symbol_65 / HY2) +(OpenAD_Symbol_74 /
     >  HX2))
      OpenAD_Symbol_68 = 1_w2f__i8
      OpenAD_Symbol_70 = 1_w2f__i8
      OpenAD_Symbol_72 = 2.0D00
      OpenAD_Symbol_71 = (-1_w2f__i8)
      OpenAD_Symbol_69 = 1_w2f__i8
      OpenAD_Symbol_66 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_63 = 1_w2f__i8
      OpenAD_Symbol_77 = 1_w2f__i8
      OpenAD_Symbol_79 = 1_w2f__i8
      OpenAD_Symbol_81 = 2.0D00
      OpenAD_Symbol_80 = (-1_w2f__i8)
      OpenAD_Symbol_78 = 1_w2f__i8
      OpenAD_Symbol_75 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_64 = 1_w2f__i8
      OpenAD_Symbol_85 = (__value__(PBL) + __value__(PTL) - __value__(
     > PL) * 2.0D00)
      OpenAD_Symbol_94 = (__value__(PLL) + __value__(P) - __value__(PL)
     >  * 2.0D00)
      __value__(PLLAP) = ((OpenAD_Symbol_85 / HY2) +(OpenAD_Symbol_94 /
     >  HX2))
      OpenAD_Symbol_88 = 1_w2f__i8
      OpenAD_Symbol_90 = 1_w2f__i8
      OpenAD_Symbol_92 = 2.0D00
      OpenAD_Symbol_91 = (-1_w2f__i8)
      OpenAD_Symbol_89 = 1_w2f__i8
      OpenAD_Symbol_86 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_83 = 1_w2f__i8
      OpenAD_Symbol_97 = 1_w2f__i8
      OpenAD_Symbol_99 = 1_w2f__i8
      OpenAD_Symbol_101 = 2.0D00
      OpenAD_Symbol_100 = (-1_w2f__i8)
      OpenAD_Symbol_98 = 1_w2f__i8
      OpenAD_Symbol_95 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_84 = 1_w2f__i8
      OpenAD_Symbol_105 = (__value__(PB) + __value__(PT) - __value__(P)
     >  * 2.0D00)
      OpenAD_Symbol_114 = (__value__(PL) + __value__(PR) - __value__(P)
     >  * 2.0D00)
      __value__(PLAP) = ((OpenAD_Symbol_105 / HY2) +(OpenAD_Symbol_114
     >  / HX2))
      OpenAD_Symbol_108 = 1_w2f__i8
      OpenAD_Symbol_110 = 1_w2f__i8
      OpenAD_Symbol_112 = 2.0D00
      OpenAD_Symbol_111 = (-1_w2f__i8)
      OpenAD_Symbol_109 = 1_w2f__i8
      OpenAD_Symbol_106 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_103 = 1_w2f__i8
      OpenAD_Symbol_117 = 1_w2f__i8
      OpenAD_Symbol_119 = 1_w2f__i8
      OpenAD_Symbol_121 = 2.0D00
      OpenAD_Symbol_120 = (-1_w2f__i8)
      OpenAD_Symbol_118 = 1_w2f__i8
      OpenAD_Symbol_115 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_104 = 1_w2f__i8
      OpenAD_Symbol_125 = (__value__(PBR) + __value__(PTR) - __value__(
     > PR) * 2.0D00)
      OpenAD_Symbol_134 = (__value__(P) + __value__(PRR) - __value__(PR
     > ) * 2.0D00)
      __value__(PRLAP) = ((OpenAD_Symbol_125 / HY2) +(OpenAD_Symbol_134
     >  / HX2))
      OpenAD_Symbol_128 = 1_w2f__i8
      OpenAD_Symbol_130 = 1_w2f__i8
      OpenAD_Symbol_132 = 2.0D00
      OpenAD_Symbol_131 = (-1_w2f__i8)
      OpenAD_Symbol_129 = 1_w2f__i8
      OpenAD_Symbol_126 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_123 = 1_w2f__i8
      OpenAD_Symbol_137 = 1_w2f__i8
      OpenAD_Symbol_139 = 1_w2f__i8
      OpenAD_Symbol_141 = 2.0D00
      OpenAD_Symbol_140 = (-1_w2f__i8)
      OpenAD_Symbol_138 = 1_w2f__i8
      OpenAD_Symbol_135 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_124 = 1_w2f__i8
      OpenAD_Symbol_145 = (__value__(P) + __value__(PTT) - __value__(PT
     > ) * 2.0D00)
      OpenAD_Symbol_154 = (__value__(PTL) + __value__(PTR) - __value__(
     > PT) * 2.0D00)
      __value__(PTLAP) = ((OpenAD_Symbol_145 / HY2) +(OpenAD_Symbol_154
     >  / HX2))
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_150 = 1_w2f__i8
      OpenAD_Symbol_152 = 2.0D00
      OpenAD_Symbol_151 = (-1_w2f__i8)
      OpenAD_Symbol_149 = 1_w2f__i8
      OpenAD_Symbol_146 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_157 = 1_w2f__i8
      OpenAD_Symbol_159 = 1_w2f__i8
      OpenAD_Symbol_161 = 2.0D00
      OpenAD_Symbol_160 = (-1_w2f__i8)
      OpenAD_Symbol_158 = 1_w2f__i8
      OpenAD_Symbol_155 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_144 = 1_w2f__i8
      OpenAD_Symbol_197 = (OpenAD_Symbol_155 * OpenAD_Symbol_144)
      OpenAD_Symbol_198 = (OpenAD_Symbol_157 * OpenAD_Symbol_197)
      OpenAD_Symbol_199 = (OpenAD_Symbol_158 * OpenAD_Symbol_197)
      OpenAD_Symbol_200 = (OpenAD_Symbol_159 * OpenAD_Symbol_199)
      OpenAD_Symbol_201 = (OpenAD_Symbol_160 * OpenAD_Symbol_199)
      OpenAD_Symbol_202 = (OpenAD_Symbol_146 * OpenAD_Symbol_143)
      OpenAD_Symbol_203 = (OpenAD_Symbol_148 * OpenAD_Symbol_202)
      OpenAD_Symbol_204 = (OpenAD_Symbol_149 * OpenAD_Symbol_202)
      OpenAD_Symbol_205 = (OpenAD_Symbol_150 * OpenAD_Symbol_204)
      OpenAD_Symbol_206 = (OpenAD_Symbol_151 * OpenAD_Symbol_204)
      OpenAD_Symbol_207 = (OpenAD_Symbol_135 * OpenAD_Symbol_124)
      OpenAD_Symbol_208 = (OpenAD_Symbol_137 * OpenAD_Symbol_207)
      OpenAD_Symbol_209 = (OpenAD_Symbol_138 * OpenAD_Symbol_207)
      OpenAD_Symbol_210 = (OpenAD_Symbol_139 * OpenAD_Symbol_209)
      OpenAD_Symbol_211 = (OpenAD_Symbol_140 * OpenAD_Symbol_209)
      OpenAD_Symbol_212 = (OpenAD_Symbol_126 * OpenAD_Symbol_123)
      OpenAD_Symbol_213 = (OpenAD_Symbol_128 * OpenAD_Symbol_212)
      OpenAD_Symbol_214 = (OpenAD_Symbol_129 * OpenAD_Symbol_212)
      OpenAD_Symbol_215 = (OpenAD_Symbol_130 * OpenAD_Symbol_214)
      OpenAD_Symbol_216 = (OpenAD_Symbol_131 * OpenAD_Symbol_214)
      OpenAD_Symbol_217 = (OpenAD_Symbol_115 * OpenAD_Symbol_104)
      OpenAD_Symbol_218 = (OpenAD_Symbol_117 * OpenAD_Symbol_217)
      OpenAD_Symbol_219 = (OpenAD_Symbol_118 * OpenAD_Symbol_217)
      OpenAD_Symbol_220 = (OpenAD_Symbol_119 * OpenAD_Symbol_219)
      OpenAD_Symbol_221 = (OpenAD_Symbol_120 * OpenAD_Symbol_219)
      OpenAD_Symbol_222 = (OpenAD_Symbol_106 * OpenAD_Symbol_103)
      OpenAD_Symbol_223 = (OpenAD_Symbol_108 * OpenAD_Symbol_222)
      OpenAD_Symbol_224 = (OpenAD_Symbol_109 * OpenAD_Symbol_222)
      OpenAD_Symbol_225 = (OpenAD_Symbol_110 * OpenAD_Symbol_224)
      OpenAD_Symbol_226 = (OpenAD_Symbol_111 * OpenAD_Symbol_224)
      OpenAD_Symbol_227 = (OpenAD_Symbol_95 * OpenAD_Symbol_84)
      OpenAD_Symbol_228 = (OpenAD_Symbol_97 * OpenAD_Symbol_227)
      OpenAD_Symbol_229 = (OpenAD_Symbol_98 * OpenAD_Symbol_227)
      OpenAD_Symbol_230 = (OpenAD_Symbol_99 * OpenAD_Symbol_229)
      OpenAD_Symbol_231 = (OpenAD_Symbol_100 * OpenAD_Symbol_229)
      OpenAD_Symbol_232 = (OpenAD_Symbol_86 * OpenAD_Symbol_83)
      OpenAD_Symbol_233 = (OpenAD_Symbol_88 * OpenAD_Symbol_232)
      OpenAD_Symbol_234 = (OpenAD_Symbol_89 * OpenAD_Symbol_232)
      OpenAD_Symbol_235 = (OpenAD_Symbol_90 * OpenAD_Symbol_234)
      OpenAD_Symbol_236 = (OpenAD_Symbol_91 * OpenAD_Symbol_234)
      OpenAD_Symbol_237 = (OpenAD_Symbol_75 * OpenAD_Symbol_64)
      OpenAD_Symbol_238 = (OpenAD_Symbol_77 * OpenAD_Symbol_237)
      OpenAD_Symbol_239 = (OpenAD_Symbol_78 * OpenAD_Symbol_237)
      OpenAD_Symbol_240 = (OpenAD_Symbol_79 * OpenAD_Symbol_239)
      OpenAD_Symbol_241 = (OpenAD_Symbol_80 * OpenAD_Symbol_239)
      OpenAD_Symbol_242 = (OpenAD_Symbol_66 * OpenAD_Symbol_63)
      OpenAD_Symbol_243 = (OpenAD_Symbol_68 * OpenAD_Symbol_242)
      OpenAD_Symbol_244 = (OpenAD_Symbol_69 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_70 * OpenAD_Symbol_244)
      OpenAD_Symbol_246 = (OpenAD_Symbol_71 * OpenAD_Symbol_244)
      OpenAD_Symbol_247 = (OpenAD_Symbol_161 * OpenAD_Symbol_201)
      OpenAD_Symbol_248 = (OpenAD_Symbol_152 * OpenAD_Symbol_206)
      OpenAD_Symbol_249 = (OpenAD_Symbol_141 * OpenAD_Symbol_211)
      OpenAD_Symbol_250 = (OpenAD_Symbol_132 * OpenAD_Symbol_216)
      OpenAD_Symbol_251 = (OpenAD_Symbol_121 * OpenAD_Symbol_221)
      OpenAD_Symbol_252 = (OpenAD_Symbol_112 * OpenAD_Symbol_226)
      OpenAD_Symbol_253 = (OpenAD_Symbol_101 * OpenAD_Symbol_231)
      OpenAD_Symbol_254 = (OpenAD_Symbol_92 * OpenAD_Symbol_236)
      OpenAD_Symbol_255 = (OpenAD_Symbol_81 * OpenAD_Symbol_241)
      OpenAD_Symbol_256 = (OpenAD_Symbol_72 * OpenAD_Symbol_246)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_198)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_200)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_205)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_208)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_210)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_213)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_215)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_218)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_220)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_223)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_225)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_228)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_230)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_233)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_235)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_238)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_240)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_243)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_245)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_248)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_249)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_250)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_251)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_252)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_253)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_254)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_255)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_256)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_416)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_416, __deriv__(PBLAP), __deriv__(PB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_417)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_417, __deriv__(PBLAP), __deriv__(PB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_418)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_418, __deriv__(PLLAP), __deriv__(PL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_419)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_419, __deriv__(PLLAP), __deriv__(PL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_420)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_420, __deriv__(PLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_421)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_421, __deriv__(PLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_422)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_422, __deriv__(PRLAP), __deriv__(PR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_423)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_423, __deriv__(PRLAP), __deriv__(PR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_424)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_424, __deriv__(PTLAP), __deriv__(PT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_425)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_425, __deriv__(PTLAP), __deriv__(PT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_426)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_426, __deriv__(PBLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_427)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_427, __deriv__(PBLAP), __deriv__(PBB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_428)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_428, __deriv__(PBLAP), __deriv__(PBR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_429)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_429, __deriv__(PBLAP), __deriv__(PBL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PBLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_430)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_430, __deriv__(PLLAP), __deriv__(PTL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_431)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_431, __deriv__(PLLAP), __deriv__(PBL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_432)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_432, __deriv__(PLLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_433)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_433, __deriv__(PLLAP), __deriv__(PLL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_434)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_434, __deriv__(PLAP), __deriv__(PT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_435)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_435, __deriv__(PLAP), __deriv__(PB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_436)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_436, __deriv__(PLAP), __deriv__(PR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_437)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_437, __deriv__(PLAP), __deriv__(PL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_438)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_438, __deriv__(PRLAP), __deriv__(PTR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_439)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_439, __deriv__(PRLAP), __deriv__(PBR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_440)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_440, __deriv__(PRLAP), __deriv__(PRR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_441)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_441, __deriv__(PRLAP), __deriv__(P))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PRLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_442)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_442, __deriv__(PTLAP), __deriv__(PTT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_443)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_443, __deriv__(PTLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_444)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_444, __deriv__(PTLAP), __deriv__(PTR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_445)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_445, __deriv__(PTLAP), __deriv__(PTL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PTLAP))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBB))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PB))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PLL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(P))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PRR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PT))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTT))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HX2)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HX2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTT))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PT))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PRR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(P))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PLL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PB))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBB))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PLAP))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBLAP))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PLLAP))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PRLAP))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTLAP))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBB))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PB))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PBR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PLL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(P))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PRR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PT))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTR))
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(PTT))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HX2)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HX2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HY2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTT))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PT))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PRR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(P))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PLL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBR))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PB))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBB))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PTLAP))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PRLAP))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PLLAP))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PBLAP))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(PLAP))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_65 = (__value__(PBB) + __value__(P) - __value__(PB)
     >  * 2.0D00)
      OpenAD_Symbol_74 = (__value__(PBL) + __value__(PBR) - __value__(
     > PB) * 2.0D00)
      __value__(PBLAP) = ((OpenAD_Symbol_65 / HY2) +(OpenAD_Symbol_74 /
     >  HX2))
      OpenAD_Symbol_68 = 1_w2f__i8
      OpenAD_Symbol_70 = 1_w2f__i8
      OpenAD_Symbol_72 = 2.0D00
      OpenAD_Symbol_71 = (-1_w2f__i8)
      OpenAD_Symbol_69 = 1_w2f__i8
      OpenAD_Symbol_66 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_63 = 1_w2f__i8
      OpenAD_Symbol_77 = 1_w2f__i8
      OpenAD_Symbol_79 = 1_w2f__i8
      OpenAD_Symbol_81 = 2.0D00
      OpenAD_Symbol_80 = (-1_w2f__i8)
      OpenAD_Symbol_78 = 1_w2f__i8
      OpenAD_Symbol_75 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_64 = 1_w2f__i8
      OpenAD_Symbol_85 = (__value__(PBL) + __value__(PTL) - __value__(
     > PL) * 2.0D00)
      OpenAD_Symbol_94 = (__value__(PLL) + __value__(P) - __value__(PL)
     >  * 2.0D00)
      __value__(PLLAP) = ((OpenAD_Symbol_85 / HY2) +(OpenAD_Symbol_94 /
     >  HX2))
      OpenAD_Symbol_88 = 1_w2f__i8
      OpenAD_Symbol_90 = 1_w2f__i8
      OpenAD_Symbol_92 = 2.0D00
      OpenAD_Symbol_91 = (-1_w2f__i8)
      OpenAD_Symbol_89 = 1_w2f__i8
      OpenAD_Symbol_86 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_83 = 1_w2f__i8
      OpenAD_Symbol_97 = 1_w2f__i8
      OpenAD_Symbol_99 = 1_w2f__i8
      OpenAD_Symbol_101 = 2.0D00
      OpenAD_Symbol_100 = (-1_w2f__i8)
      OpenAD_Symbol_98 = 1_w2f__i8
      OpenAD_Symbol_95 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_84 = 1_w2f__i8
      OpenAD_Symbol_105 = (__value__(PB) + __value__(PT) - __value__(P)
     >  * 2.0D00)
      OpenAD_Symbol_114 = (__value__(PL) + __value__(PR) - __value__(P)
     >  * 2.0D00)
      __value__(PLAP) = ((OpenAD_Symbol_105 / HY2) +(OpenAD_Symbol_114
     >  / HX2))
      OpenAD_Symbol_108 = 1_w2f__i8
      OpenAD_Symbol_110 = 1_w2f__i8
      OpenAD_Symbol_112 = 2.0D00
      OpenAD_Symbol_111 = (-1_w2f__i8)
      OpenAD_Symbol_109 = 1_w2f__i8
      OpenAD_Symbol_106 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_103 = 1_w2f__i8
      OpenAD_Symbol_117 = 1_w2f__i8
      OpenAD_Symbol_119 = 1_w2f__i8
      OpenAD_Symbol_121 = 2.0D00
      OpenAD_Symbol_120 = (-1_w2f__i8)
      OpenAD_Symbol_118 = 1_w2f__i8
      OpenAD_Symbol_115 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_104 = 1_w2f__i8
      OpenAD_Symbol_125 = (__value__(PBR) + __value__(PTR) - __value__(
     > PR) * 2.0D00)
      OpenAD_Symbol_134 = (__value__(P) + __value__(PRR) - __value__(PR
     > ) * 2.0D00)
      __value__(PRLAP) = ((OpenAD_Symbol_125 / HY2) +(OpenAD_Symbol_134
     >  / HX2))
      OpenAD_Symbol_128 = 1_w2f__i8
      OpenAD_Symbol_130 = 1_w2f__i8
      OpenAD_Symbol_132 = 2.0D00
      OpenAD_Symbol_131 = (-1_w2f__i8)
      OpenAD_Symbol_129 = 1_w2f__i8
      OpenAD_Symbol_126 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_123 = 1_w2f__i8
      OpenAD_Symbol_137 = 1_w2f__i8
      OpenAD_Symbol_139 = 1_w2f__i8
      OpenAD_Symbol_141 = 2.0D00
      OpenAD_Symbol_140 = (-1_w2f__i8)
      OpenAD_Symbol_138 = 1_w2f__i8
      OpenAD_Symbol_135 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_124 = 1_w2f__i8
      OpenAD_Symbol_145 = (__value__(P) + __value__(PTT) - __value__(PT
     > ) * 2.0D00)
      OpenAD_Symbol_154 = (__value__(PTL) + __value__(PTR) - __value__(
     > PT) * 2.0D00)
      __value__(PTLAP) = ((OpenAD_Symbol_145 / HY2) +(OpenAD_Symbol_154
     >  / HX2))
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_150 = 1_w2f__i8
      OpenAD_Symbol_152 = 2.0D00
      OpenAD_Symbol_151 = (-1_w2f__i8)
      OpenAD_Symbol_149 = 1_w2f__i8
      OpenAD_Symbol_146 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_157 = 1_w2f__i8
      OpenAD_Symbol_159 = 1_w2f__i8
      OpenAD_Symbol_161 = 2.0D00
      OpenAD_Symbol_160 = (-1_w2f__i8)
      OpenAD_Symbol_158 = 1_w2f__i8
      OpenAD_Symbol_155 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_144 = 1_w2f__i8
      OpenAD_Symbol_197 = (OpenAD_Symbol_155 * OpenAD_Symbol_144)
      OpenAD_Symbol_198 = (OpenAD_Symbol_157 * OpenAD_Symbol_197)
      OpenAD_Symbol_199 = (OpenAD_Symbol_158 * OpenAD_Symbol_197)
      OpenAD_Symbol_200 = (OpenAD_Symbol_159 * OpenAD_Symbol_199)
      OpenAD_Symbol_201 = (OpenAD_Symbol_160 * OpenAD_Symbol_199)
      OpenAD_Symbol_202 = (OpenAD_Symbol_146 * OpenAD_Symbol_143)
      OpenAD_Symbol_203 = (OpenAD_Symbol_148 * OpenAD_Symbol_202)
      OpenAD_Symbol_204 = (OpenAD_Symbol_149 * OpenAD_Symbol_202)
      OpenAD_Symbol_205 = (OpenAD_Symbol_150 * OpenAD_Symbol_204)
      OpenAD_Symbol_206 = (OpenAD_Symbol_151 * OpenAD_Symbol_204)
      OpenAD_Symbol_207 = (OpenAD_Symbol_135 * OpenAD_Symbol_124)
      OpenAD_Symbol_208 = (OpenAD_Symbol_137 * OpenAD_Symbol_207)
      OpenAD_Symbol_209 = (OpenAD_Symbol_138 * OpenAD_Symbol_207)
      OpenAD_Symbol_210 = (OpenAD_Symbol_139 * OpenAD_Symbol_209)
      OpenAD_Symbol_211 = (OpenAD_Symbol_140 * OpenAD_Symbol_209)
      OpenAD_Symbol_212 = (OpenAD_Symbol_126 * OpenAD_Symbol_123)
      OpenAD_Symbol_213 = (OpenAD_Symbol_128 * OpenAD_Symbol_212)
      OpenAD_Symbol_214 = (OpenAD_Symbol_129 * OpenAD_Symbol_212)
      OpenAD_Symbol_215 = (OpenAD_Symbol_130 * OpenAD_Symbol_214)
      OpenAD_Symbol_216 = (OpenAD_Symbol_131 * OpenAD_Symbol_214)
      OpenAD_Symbol_217 = (OpenAD_Symbol_115 * OpenAD_Symbol_104)
      OpenAD_Symbol_218 = (OpenAD_Symbol_117 * OpenAD_Symbol_217)
      OpenAD_Symbol_219 = (OpenAD_Symbol_118 * OpenAD_Symbol_217)
      OpenAD_Symbol_220 = (OpenAD_Symbol_119 * OpenAD_Symbol_219)
      OpenAD_Symbol_221 = (OpenAD_Symbol_120 * OpenAD_Symbol_219)
      OpenAD_Symbol_222 = (OpenAD_Symbol_106 * OpenAD_Symbol_103)
      OpenAD_Symbol_223 = (OpenAD_Symbol_108 * OpenAD_Symbol_222)
      OpenAD_Symbol_224 = (OpenAD_Symbol_109 * OpenAD_Symbol_222)
      OpenAD_Symbol_225 = (OpenAD_Symbol_110 * OpenAD_Symbol_224)
      OpenAD_Symbol_226 = (OpenAD_Symbol_111 * OpenAD_Symbol_224)
      OpenAD_Symbol_227 = (OpenAD_Symbol_95 * OpenAD_Symbol_84)
      OpenAD_Symbol_228 = (OpenAD_Symbol_97 * OpenAD_Symbol_227)
      OpenAD_Symbol_229 = (OpenAD_Symbol_98 * OpenAD_Symbol_227)
      OpenAD_Symbol_230 = (OpenAD_Symbol_99 * OpenAD_Symbol_229)
      OpenAD_Symbol_231 = (OpenAD_Symbol_100 * OpenAD_Symbol_229)
      OpenAD_Symbol_232 = (OpenAD_Symbol_86 * OpenAD_Symbol_83)
      OpenAD_Symbol_233 = (OpenAD_Symbol_88 * OpenAD_Symbol_232)
      OpenAD_Symbol_234 = (OpenAD_Symbol_89 * OpenAD_Symbol_232)
      OpenAD_Symbol_235 = (OpenAD_Symbol_90 * OpenAD_Symbol_234)
      OpenAD_Symbol_236 = (OpenAD_Symbol_91 * OpenAD_Symbol_234)
      OpenAD_Symbol_237 = (OpenAD_Symbol_75 * OpenAD_Symbol_64)
      OpenAD_Symbol_238 = (OpenAD_Symbol_77 * OpenAD_Symbol_237)
      OpenAD_Symbol_239 = (OpenAD_Symbol_78 * OpenAD_Symbol_237)
      OpenAD_Symbol_240 = (OpenAD_Symbol_79 * OpenAD_Symbol_239)
      OpenAD_Symbol_241 = (OpenAD_Symbol_80 * OpenAD_Symbol_239)
      OpenAD_Symbol_242 = (OpenAD_Symbol_66 * OpenAD_Symbol_63)
      OpenAD_Symbol_243 = (OpenAD_Symbol_68 * OpenAD_Symbol_242)
      OpenAD_Symbol_244 = (OpenAD_Symbol_69 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_70 * OpenAD_Symbol_244)
      OpenAD_Symbol_246 = (OpenAD_Symbol_71 * OpenAD_Symbol_244)
      OpenAD_Symbol_247 = (OpenAD_Symbol_161 * OpenAD_Symbol_201)
      OpenAD_Symbol_248 = (OpenAD_Symbol_152 * OpenAD_Symbol_206)
      OpenAD_Symbol_249 = (OpenAD_Symbol_141 * OpenAD_Symbol_211)
      OpenAD_Symbol_250 = (OpenAD_Symbol_132 * OpenAD_Symbol_216)
      OpenAD_Symbol_251 = (OpenAD_Symbol_121 * OpenAD_Symbol_221)
      OpenAD_Symbol_252 = (OpenAD_Symbol_112 * OpenAD_Symbol_226)
      OpenAD_Symbol_253 = (OpenAD_Symbol_101 * OpenAD_Symbol_231)
      OpenAD_Symbol_254 = (OpenAD_Symbol_92 * OpenAD_Symbol_236)
      OpenAD_Symbol_255 = (OpenAD_Symbol_81 * OpenAD_Symbol_241)
      OpenAD_Symbol_256 = (OpenAD_Symbol_72 * OpenAD_Symbol_246)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_198)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_200)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_203)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_205)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_208)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_210)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_213)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_215)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_218)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_220)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_223)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_225)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_228)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_230)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_233)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_235)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_238)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_240)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_243)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_245)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_247)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_248)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_249)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_250)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_251)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_252)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_253)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_254)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_255)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_256)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_416)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_416, __deriv__(PBLAP), __deriv__(PB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_417)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_417, __deriv__(PBLAP), __deriv__(PB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_418)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_418, __deriv__(PLLAP), __deriv__(PL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_419)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_419, __deriv__(PLLAP), __deriv__(PL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_420)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_420, __deriv__(PLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_421)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_421, __deriv__(PLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_422)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_422, __deriv__(PRLAP), __deriv__(PR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_423)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_423, __deriv__(PRLAP), __deriv__(PR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_424)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_424, __deriv__(PTLAP), __deriv__(PT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_425)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_425, __deriv__(PTLAP), __deriv__(PT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_426)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_426, __deriv__(PBLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_427)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_427, __deriv__(PBLAP), __deriv__(PBB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_428)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_428, __deriv__(PBLAP), __deriv__(PBR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_429)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_429, __deriv__(PBLAP), __deriv__(PBL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PBLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_430)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_430, __deriv__(PLLAP), __deriv__(PTL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_431)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_431, __deriv__(PLLAP), __deriv__(PBL))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_432)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_432, __deriv__(PLLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_433)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_433, __deriv__(PLLAP), __deriv__(PLL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_434)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_434, __deriv__(PLAP), __deriv__(PT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_435)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_435, __deriv__(PLAP), __deriv__(PB))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_436)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_436, __deriv__(PLAP), __deriv__(PR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_437)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_437, __deriv__(PLAP), __deriv__(PL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_438)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_438, __deriv__(PRLAP), __deriv__(PTR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_439)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_439, __deriv__(PRLAP), __deriv__(PBR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_440)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_440, __deriv__(PRLAP), __deriv__(PRR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_441)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_441, __deriv__(PRLAP), __deriv__(P))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PRLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_442)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_442, __deriv__(PTLAP), __deriv__(PTT))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_443)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_443, __deriv__(PTLAP), __deriv__(P))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_444)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_444, __deriv__(PTLAP), __deriv__(PTR))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_445)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_445, __deriv__(PTLAP), __deriv__(PTL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PTLAP))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
