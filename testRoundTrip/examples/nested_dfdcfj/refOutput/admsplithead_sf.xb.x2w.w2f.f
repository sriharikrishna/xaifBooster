C ***********************************************************
C Fortran file translated from WHIRL Mon Jul 23 11:18:50 2007
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
      REAL(w2f__8) OpenAD_Symbol_169
      TYPE (OpenADTy_active) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_3
      INTEGER(w2f__i8) OpenAD_Symbol_308
      INTEGER(w2f__i8) OpenAD_Symbol_309
      INTEGER(w2f__i8) OpenAD_Symbol_310
      INTEGER(w2f__i8) OpenAD_Symbol_311
      INTEGER(w2f__i8) OpenAD_Symbol_312
      INTEGER(w2f__i8) OpenAD_Symbol_313
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
      EXTERNAL foo
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR =     4.000000000000000)
      REAL(w2f__8) HX
      REAL(w2f__8) HX2
      REAL(w2f__8) HY
      REAL(w2f__8) HY2
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) N
      REAL(w2f__8) NXP1
      REAL(w2f__8) NYP1
      REAL(w2f__8) ONE
      PARAMETER ( ONE =     1.000000000000000)
      REAL(w2f__8) THREE
      PARAMETER ( THREE =     3.000000000000000)
      REAL(w2f__8) TWO
      PARAMETER ( TWO =     2.000000000000000)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO =     0.000000000000000)
      INTEGER(w2f__i4) t__3
      INTEGER(w2f__i8) OpenAD_Symbol_414
      REAL(w2f__8) OpenAD_Symbol_415
      INTEGER(w2f__i8) OpenAD_Symbol_416
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
      t__2 = MAX(INT(NX * NY), 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
      t__3 = N
      DO K = 1, N, 1
        __value__(FVEC(INT(K))) = (__value__(FVEC(K)) * HX2 * HY2)
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      t__1 = INT(NX * NY)
      t__2 = MAX(INT(NX * NY), 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
      t__3 = N
      OpenAD_Symbol_310 = 0_w2f__i8
      DO K = 1, N, 1
        OpenAD_Symbol_0 = (HX2 * HY2)
        OpenAD_Symbol_3 = (__value__(FVEC(K)) * OpenAD_Symbol_0)
        OpenAD_Symbol_1 = OpenAD_Symbol_0
        __value__(FVEC(INT(K))) = OpenAD_Symbol_3
        OpenAD_Symbol_169 = OpenAD_Symbol_1
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_169)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
        OpenAD_Symbol_310 = (INT(OpenAD_Symbol_310) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_310)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_308)
      OpenAD_Symbol_309 = 1
      DO WHILE(INT(OpenAD_Symbol_309) .LE. INT(OpenAD_Symbol_308))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_414)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_415)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_415, __deriv__(FVEC(INT(
     > OpenAD_Symbol_414))), __deriv__(OpenAD_Symbol_170))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_414))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_416)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_170), __deriv__(FVEC(INT(
     > OpenAD_Symbol_416))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_170))
        OpenAD_Symbol_309 = INT(OpenAD_Symbol_309) + 1
      END DO
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(R)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NX)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(R)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(R)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(X))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NY)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(NX)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FVEC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      t__1 = INT(NX * NY)
      t__2 = MAX(INT(NX * NY), 0_w2f__i8)
      N = NX * NY
      NXP1 = (NX + INT(1_w2f__i8))
      NYP1 = (NY + INT(1_w2f__i8))
      HX = (1.0D00 / NXP1)
      HY = (1.0D00 / NYP1)
      HY2 = (HY * HY)
      HX2 = (HX * HX)
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
      t__3 = N
      OpenAD_Symbol_313 = 0_w2f__i8
      DO K = 1, N, 1
        OpenAD_Symbol_0 = (HX2 * HY2)
        OpenAD_Symbol_3 = (__value__(FVEC(K)) * OpenAD_Symbol_0)
        OpenAD_Symbol_1 = OpenAD_Symbol_0
        __value__(FVEC(INT(K))) = OpenAD_Symbol_3
        OpenAD_Symbol_169 = OpenAD_Symbol_1
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_169)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(K)
        OpenAD_Symbol_313 = (INT(OpenAD_Symbol_313) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_313)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_311)
      OpenAD_Symbol_312 = 1
      DO WHILE(INT(OpenAD_Symbol_312) .LE. INT(OpenAD_Symbol_311))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_414)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_415)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_415, __deriv__(FVEC(INT(
     > OpenAD_Symbol_414))), __deriv__(OpenAD_Symbol_170))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_414))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_416)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_170), __deriv__(FVEC(INT(
     > OpenAD_Symbol_416))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_170))
        OpenAD_Symbol_312 = INT(OpenAD_Symbol_312) + 1
      END DO
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
      REAL(w2f__8) OpenAD_Symbol_17
      TYPE (OpenADTy_active) OpenAD_Symbol_171
      TYPE (OpenADTy_active) OpenAD_Symbol_172
      TYPE (OpenADTy_active) OpenAD_Symbol_173
      TYPE (OpenADTy_active) OpenAD_Symbol_174
      TYPE (OpenADTy_active) OpenAD_Symbol_175
      REAL(w2f__8) OpenAD_Symbol_176
      TYPE (OpenADTy_active) OpenAD_Symbol_177
      REAL(w2f__8) OpenAD_Symbol_178
      TYPE (OpenADTy_active) OpenAD_Symbol_179
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_180
      TYPE (OpenADTy_active) OpenAD_Symbol_181
      REAL(w2f__8) OpenAD_Symbol_182
      TYPE (OpenADTy_active) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_190
      TYPE (OpenADTy_active) OpenAD_Symbol_191
      REAL(w2f__8) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      TYPE (OpenADTy_active) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      TYPE (OpenADTy_active) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_200
      TYPE (OpenADTy_active) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      REAL(w2f__8) OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      TYPE (OpenADTy_active) OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      REAL(w2f__8) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      TYPE (OpenADTy_active) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      TYPE (OpenADTy_active) OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      TYPE (OpenADTy_active) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      TYPE (OpenADTy_active) OpenAD_Symbol_220
      TYPE (OpenADTy_active) OpenAD_Symbol_221
      TYPE (OpenADTy_active) OpenAD_Symbol_222
      TYPE (OpenADTy_active) OpenAD_Symbol_223
      TYPE (OpenADTy_active) OpenAD_Symbol_224
      TYPE (OpenADTy_active) OpenAD_Symbol_225
      TYPE (OpenADTy_active) OpenAD_Symbol_226
      TYPE (OpenADTy_active) OpenAD_Symbol_227
      TYPE (OpenADTy_active) OpenAD_Symbol_228
      TYPE (OpenADTy_active) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_23
      TYPE (OpenADTy_active) OpenAD_Symbol_230
      TYPE (OpenADTy_active) OpenAD_Symbol_231
      TYPE (OpenADTy_active) OpenAD_Symbol_232
      TYPE (OpenADTy_active) OpenAD_Symbol_233
      TYPE (OpenADTy_active) OpenAD_Symbol_234
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_30
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
      INTEGER(w2f__i8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
      INTEGER(w2f__i8) OpenAD_Symbol_359
      REAL(w2f__8) OpenAD_Symbol_36
      INTEGER(w2f__i8) OpenAD_Symbol_360
      INTEGER(w2f__i8) OpenAD_Symbol_361
      INTEGER(w2f__i8) OpenAD_Symbol_362
      INTEGER(w2f__i8) OpenAD_Symbol_363
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
      REAL(w2f__8) OpenAD_Symbol_38
      INTEGER(w2f__i8) OpenAD_Symbol_380
      INTEGER(w2f__i8) OpenAD_Symbol_381
      INTEGER(w2f__i8) OpenAD_Symbol_382
      INTEGER(w2f__i8) OpenAD_Symbol_383
      INTEGER(w2f__i8) OpenAD_Symbol_384
      INTEGER(w2f__i8) OpenAD_Symbol_385
      INTEGER(w2f__i8) OpenAD_Symbol_386
      INTEGER(w2f__i8) OpenAD_Symbol_387
      INTEGER(w2f__i8) OpenAD_Symbol_388
      INTEGER(w2f__i8) OpenAD_Symbol_389
      INTEGER(w2f__i8) OpenAD_Symbol_390
      INTEGER(w2f__i8) OpenAD_Symbol_391
      INTEGER(w2f__i8) OpenAD_Symbol_392
      INTEGER(w2f__i8) OpenAD_Symbol_393
      INTEGER(w2f__i8) OpenAD_Symbol_394
      INTEGER(w2f__i8) OpenAD_Symbol_395
      INTEGER(w2f__i8) OpenAD_Symbol_396
      INTEGER(w2f__i8) OpenAD_Symbol_397
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
      REAL(w2f__8) OpenAD_Symbol_62
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
      INTEGER(w2f__i8) t__4
      INTEGER(w2f__i8) t__5
      EXTERNAL bar
      TYPE (OpenADTy_active) DPDX
      TYPE (OpenADTy_active) DPDY
      REAL(w2f__8) FOUR
      PARAMETER ( FOUR =     4.000000000000000)
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
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
      INTEGER(w2f__i4) t__6
      INTEGER(w2f__i4) t__7
      INTEGER(w2f__i8) OpenAD_Symbol_398
      INTEGER(w2f__i8) OpenAD_Symbol_399
      INTEGER(w2f__i8) OpenAD_Symbol_400
      INTEGER(w2f__i8) OpenAD_Symbol_401
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
      INTEGER(w2f__i8) OpenAD_Symbol_417
      INTEGER(w2f__i8) OpenAD_Symbol_418
      INTEGER(w2f__i8) OpenAD_Symbol_419
      INTEGER(w2f__i8) OpenAD_Symbol_420
      INTEGER(w2f__i8) OpenAD_Symbol_421
      INTEGER(w2f__i8) OpenAD_Symbol_422
      REAL(w2f__8) OpenAD_Symbol_423
      INTEGER(w2f__i8) OpenAD_Symbol_424
      REAL(w2f__8) OpenAD_Symbol_425
      INTEGER(w2f__i8) OpenAD_Symbol_426
      REAL(w2f__8) OpenAD_Symbol_427
      INTEGER(w2f__i8) OpenAD_Symbol_428
      REAL(w2f__8) OpenAD_Symbol_429
      INTEGER(w2f__i8) OpenAD_Symbol_430
      REAL(w2f__8) OpenAD_Symbol_431
      INTEGER(w2f__i8) OpenAD_Symbol_432
      REAL(w2f__8) OpenAD_Symbol_433
      INTEGER(w2f__i8) OpenAD_Symbol_434
      REAL(w2f__8) OpenAD_Symbol_435
      INTEGER(w2f__i8) OpenAD_Symbol_436
      REAL(w2f__8) OpenAD_Symbol_437
      INTEGER(w2f__i8) OpenAD_Symbol_438
      REAL(w2f__8) OpenAD_Symbol_439
      INTEGER(w2f__i8) OpenAD_Symbol_440
      REAL(w2f__8) OpenAD_Symbol_441
      INTEGER(w2f__i8) OpenAD_Symbol_442
      REAL(w2f__8) OpenAD_Symbol_443
      INTEGER(w2f__i8) OpenAD_Symbol_444
      REAL(w2f__8) OpenAD_Symbol_445
      REAL(w2f__8) OpenAD_Symbol_446
      REAL(w2f__8) OpenAD_Symbol_447
      REAL(w2f__8) OpenAD_Symbol_448
      REAL(w2f__8) OpenAD_Symbol_449
      INTEGER(w2f__i8) OpenAD_Symbol_450
      REAL(w2f__8) OpenAD_Symbol_451
      INTEGER(w2f__i8) OpenAD_Symbol_452
      INTEGER(w2f__i8) OpenAD_Symbol_453
      INTEGER(w2f__i8) OpenAD_Symbol_454
      INTEGER(w2f__i8) OpenAD_Symbol_455
      INTEGER(w2f__i8) OpenAD_Symbol_456
      INTEGER(w2f__i8) OpenAD_Symbol_457
      INTEGER(w2f__i8) OpenAD_Symbol_458
      INTEGER(w2f__i8) OpenAD_Symbol_459
      INTEGER(w2f__i8) OpenAD_Symbol_460
      INTEGER(w2f__i8) OpenAD_Symbol_461
      INTEGER(w2f__i8) OpenAD_Symbol_462
      INTEGER(w2f__i8) OpenAD_Symbol_463
      INTEGER(w2f__i8) OpenAD_Symbol_464
      INTEGER(w2f__i8) OpenAD_Symbol_465
      INTEGER(w2f__i8) OpenAD_Symbol_466
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      t__4 = INT(NX * NY)
      t__5 = MAX(INT(NX * NY), 0_w2f__i8)
      t__6 = NY
      DO I = 1, NY, 1
        t__7 = NX
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      t__4 = INT(NX * NY)
      t__5 = MAX(INT(NX * NY), 0_w2f__i8)
      t__6 = NY
      OpenAD_Symbol_330 = 0_w2f__i8
      DO I = 1, NY, 1
        t__7 = NX
        OpenAD_Symbol_331 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_332 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_332)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_413 = (K - NX + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_413)
            OpenAD_Symbol_333 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_333)
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_336 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_336)
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_410 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_410)
              OpenAD_Symbol_334 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_334)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_411 = (K - NX * INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_411)
              OpenAD_Symbol_412 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_412)
              OpenAD_Symbol_335 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_335)
            ENDIF
            OpenAD_Symbol_337 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_337)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_338 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_338)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_409 = (K - NX + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_409)
            OpenAD_Symbol_339 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_339)
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_342 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_342)
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_406 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_406)
              OpenAD_Symbol_340 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_340)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_407 = (K + INT((-2_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_407)
              OpenAD_Symbol_408 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_408)
              OpenAD_Symbol_341 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_341)
            ENDIF
            OpenAD_Symbol_343 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_343)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_398 = (K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_398)
            OpenAD_Symbol_346 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_346)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_344 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_344)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_404 = (K + INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_404)
              OpenAD_Symbol_405 = (K + INT(1_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_405)
              OpenAD_Symbol_345 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_345)
            ENDIF
            OpenAD_Symbol_347 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_347)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_348 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_348)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_403 = (NX + K + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_403)
            OpenAD_Symbol_349 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_349)
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_399 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_399)
            OpenAD_Symbol_352 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_352)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
              OpenAD_Symbol_62 = 1_w2f__i8
              OpenAD_Symbol_219 = OpenAD_Symbol_62
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
C             $OpenAD$ INLINE push(subst)
              CALL push(OpenAD_Symbol_219)
              OpenAD_Symbol_350 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_350)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_401 = (K + NX * INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_401)
              OpenAD_Symbol_402 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_402)
              OpenAD_Symbol_351 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_351)
            ENDIF
            OpenAD_Symbol_353 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_353)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_354 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_354)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_400 = (NX + K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_400)
            OpenAD_Symbol_355 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_355)
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
          OpenAD_Symbol_176 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_178 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
          OpenAD_Symbol_180 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
          OpenAD_Symbol_182 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_176)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_178)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_180)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_182)
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
          OpenAD_Symbol_61 = ((OpenAD_Symbol_20 / HY2) +(
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
          __value__(FVEC(INT(K))) = OpenAD_Symbol_61
          OpenAD_Symbol_184 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
          OpenAD_Symbol_185 = (OpenAD_Symbol_19 * OpenAD_Symbol_16)
          OpenAD_Symbol_186 = (OpenAD_Symbol_40 * OpenAD_Symbol_17)
          OpenAD_Symbol_187 = (OpenAD_Symbol_41 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_42 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_30 * OpenAD_Symbol_185)
          OpenAD_Symbol_190 = (OpenAD_Symbol_32 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_33 * OpenAD_Symbol_189)
          OpenAD_Symbol_193 = (OpenAD_Symbol_34 * OpenAD_Symbol_192)
          OpenAD_Symbol_195 = (OpenAD_Symbol_35 * OpenAD_Symbol_192)
          OpenAD_Symbol_196 = (OpenAD_Symbol_21 * OpenAD_Symbol_184)
          OpenAD_Symbol_197 = (OpenAD_Symbol_23 * OpenAD_Symbol_196)
          OpenAD_Symbol_199 = (OpenAD_Symbol_24 * OpenAD_Symbol_196)
          OpenAD_Symbol_200 = (OpenAD_Symbol_25 * OpenAD_Symbol_199)
          OpenAD_Symbol_202 = (OpenAD_Symbol_26 * OpenAD_Symbol_199)
          OpenAD_Symbol_203 = (OpenAD_Symbol_54 * OpenAD_Symbol_188)
          OpenAD_Symbol_204 = (OpenAD_Symbol_57 * OpenAD_Symbol_203)
          OpenAD_Symbol_206 = (OpenAD_Symbol_58 * OpenAD_Symbol_203)
          OpenAD_Symbol_207 = (OpenAD_Symbol_59 * OpenAD_Symbol_206)
          OpenAD_Symbol_208 = (OpenAD_Symbol_60 * OpenAD_Symbol_206)
          OpenAD_Symbol_209 = (OpenAD_Symbol_45 * OpenAD_Symbol_187)
          OpenAD_Symbol_210 = (OpenAD_Symbol_48 * OpenAD_Symbol_209)
          OpenAD_Symbol_212 = (OpenAD_Symbol_49 * OpenAD_Symbol_209)
          OpenAD_Symbol_213 = (OpenAD_Symbol_50 * OpenAD_Symbol_212)
          OpenAD_Symbol_214 = (OpenAD_Symbol_51 * OpenAD_Symbol_212)
          OpenAD_Symbol_215 = (OpenAD_Symbol_36 * OpenAD_Symbol_195)
          OpenAD_Symbol_217 = (OpenAD_Symbol_27 * OpenAD_Symbol_202)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_190)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_193)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_197)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_200)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_204)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_207)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_208)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_210)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_213)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_214)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_215)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_217)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_331 = (INT(OpenAD_Symbol_331) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_331)
        OpenAD_Symbol_330 = (INT(OpenAD_Symbol_330) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_330)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_314)
      OpenAD_Symbol_315 = 1
      DO WHILE(INT(OpenAD_Symbol_315) .LE. INT(OpenAD_Symbol_314))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_316)
        OpenAD_Symbol_317 = 1
        DO WHILE(INT(OpenAD_Symbol_317) .LE. INT(OpenAD_Symbol_316))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_422)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_423)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_423, __deriv__(FVEC(INT(
     > OpenAD_Symbol_422))), __deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_424)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_425)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_425, __deriv__(FVEC(INT(
     > OpenAD_Symbol_424))), __deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_426)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_427)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_427, __deriv__(FVEC(INT(
     > OpenAD_Symbol_426))), __deriv__(OpenAD_Symbol_191))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_428)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_429)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_429, __deriv__(FVEC(INT(
     > OpenAD_Symbol_428))), __deriv__(OpenAD_Symbol_194))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_430)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_431)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_431, __deriv__(FVEC(INT(
     > OpenAD_Symbol_430))), __deriv__(OpenAD_Symbol_211))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_432)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_433)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_433, __deriv__(FVEC(INT(
     > OpenAD_Symbol_432))), __deriv__(OpenAD_Symbol_198))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_434)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_435)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_435, __deriv__(FVEC(INT(
     > OpenAD_Symbol_434))), __deriv__(OpenAD_Symbol_201))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_436)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_437)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_437, __deriv__(FVEC(INT(
     > OpenAD_Symbol_436))), __deriv__(OpenAD_Symbol_205))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_438)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_439)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_439, __deriv__(FVEC(INT(
     > OpenAD_Symbol_438))), __deriv__(OpenAD_Symbol_201))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_440)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_441)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_441, __deriv__(FVEC(INT(
     > OpenAD_Symbol_440))), __deriv__(OpenAD_Symbol_198))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_442)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_443)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_443, __deriv__(FVEC(INT(
     > OpenAD_Symbol_442))), __deriv__(OpenAD_Symbol_194))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_444)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_445)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_445, __deriv__(FVEC(INT(
     > OpenAD_Symbol_444))), __deriv__(OpenAD_Symbol_191))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_444))))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_191), __deriv__(PLLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_191))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_194), __deriv__(PRLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_194))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_198), __deriv__(PBLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_198))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_201), __deriv__(PTLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_201))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_205), __deriv__(DPDX))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_205))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_211), __deriv__(DPDY))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_211))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_216), __deriv__(PLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_216))
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_446)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_446, __deriv__(DPDX), __deriv__(
     > OpenAD_Symbol_183))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_447)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_447, __deriv__(DPDX), __deriv__(
     > OpenAD_Symbol_181))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDX))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_448)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_448, __deriv__(DPDY), __deriv__(
     > OpenAD_Symbol_179))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_449)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_449, __deriv__(DPDY), __deriv__(
     > OpenAD_Symbol_177))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDY))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_177), __deriv__(PT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_177))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_179), __deriv__(PB))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_179))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_181), __deriv__(PR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_181))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_183), __deriv__(PL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_183))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_318)
          IF(OpenAD_Symbol_318 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTR), __deriv__(
     > OpenAD_Symbol_218))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_450)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_218), __deriv__(X(INT
     > (OpenAD_Symbol_450))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_218))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_319)
          IF(OpenAD_Symbol_319 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_175))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_421)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_175), __deriv__(X(INT
     > (OpenAD_Symbol_421))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_175))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_320)
            IF(OpenAD_Symbol_320 .ne. 0) THEN
C             $OpenAD$ INLINE Pop(subst)
              CALL Pop(OpenAD_Symbol_451)
C             $OpenAD$ INLINE Saxpy(subst,subst,subst)
              CALL Saxpy(OpenAD_Symbol_451, __deriv__(PTT), __deriv__(
     > OpenAD_Symbol_220))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_452)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_220), __deriv__(X(
     > INT(OpenAD_Symbol_452))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_220))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PTT), __deriv__(
     > OpenAD_Symbol_222))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_221))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_453)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_221), __deriv__(X(
     > INT(OpenAD_Symbol_453))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_221))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_454)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_222), __deriv__(X(
     > INT(OpenAD_Symbol_454))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_222))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_321)
          IF(OpenAD_Symbol_321 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTL), __deriv__(
     > OpenAD_Symbol_223))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_455)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_223), __deriv__(X(INT
     > (OpenAD_Symbol_455))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_223))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_322)
          IF(OpenAD_Symbol_322 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_174))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_420)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_174), __deriv__(X(INT
     > (OpenAD_Symbol_420))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_174))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_323)
            IF(OpenAD_Symbol_323 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_224))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_456)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_224), __deriv__(X(
     > INT(OpenAD_Symbol_456))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_224))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_226))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_225))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_457)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_225), __deriv__(X(
     > INT(OpenAD_Symbol_457))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_225))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_458)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_226), __deriv__(X(
     > INT(OpenAD_Symbol_458))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_226))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(P), __deriv__(
     > OpenAD_Symbol_173))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_419)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_173), __deriv__(X(INT(
     > OpenAD_Symbol_419))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_173))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_324)
          IF(OpenAD_Symbol_324 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_172))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_418)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_172), __deriv__(X(INT
     > (OpenAD_Symbol_418))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_172))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_325)
            IF(OpenAD_Symbol_325 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_227))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_459)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_227), __deriv__(X(
     > INT(OpenAD_Symbol_459))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_227))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_229))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_228))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_460)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_228), __deriv__(X(
     > INT(OpenAD_Symbol_460))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_228))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_461)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_229), __deriv__(X(
     > INT(OpenAD_Symbol_461))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_229))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_326)
          IF(OpenAD_Symbol_326 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBR), __deriv__(
     > OpenAD_Symbol_230))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_462)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_230), __deriv__(X(INT
     > (OpenAD_Symbol_462))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_230))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_327)
          IF(OpenAD_Symbol_327 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_171))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_417)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_171), __deriv__(X(INT
     > (OpenAD_Symbol_417))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_171))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_328)
            IF(OpenAD_Symbol_328 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_231))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_463)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_231), __deriv__(X(
     > INT(OpenAD_Symbol_463))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_231))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_233))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_232))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_464)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_232), __deriv__(X(
     > INT(OpenAD_Symbol_464))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_232))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_465)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_233), __deriv__(X(
     > INT(OpenAD_Symbol_465))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_233))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_329)
          IF(OpenAD_Symbol_329 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBL), __deriv__(
     > OpenAD_Symbol_234))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_466)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_234), __deriv__(X(INT
     > (OpenAD_Symbol_466))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_234))
          ENDIF
          OpenAD_Symbol_317 = INT(OpenAD_Symbol_317) + 1
        END DO
        OpenAD_Symbol_315 = INT(OpenAD_Symbol_315) + 1
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
      t__4 = INT(NX * NY)
      t__5 = MAX(INT(NX * NY), 0_w2f__i8)
      t__6 = NY
      OpenAD_Symbol_372 = 0_w2f__i8
      DO I = 1, NY, 1
        t__7 = NX
        OpenAD_Symbol_373 = 0_w2f__i8
        DO J = 1, NX, 1
          K = J + NX *(I +(-1))
          IF((I .eq. INT(1_w2f__i8)) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PBL) = 0.0D00
            OpenAD_Symbol_374 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_374)
          ELSE
            __value__(PBL) = __value__(X(K - NX + (-1)))
            OpenAD_Symbol_413 = (K - NX + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_413)
            OpenAD_Symbol_375 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_375)
          ENDIF
          IF(I .eq. INT(1_w2f__i8)) THEN
            __value__(PB) = 0.0D00
            __value__(PBB) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_378 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_378)
          ELSE
            IF(I .eq. INT(2_w2f__i8)) THEN
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = 0.0D00
              OpenAD_Symbol_410 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_410)
              OpenAD_Symbol_376 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_376)
            ELSE
              __value__(PB) = __value__(X(K - NX))
              __value__(PBB) = __value__(X(K - NX * 2))
              OpenAD_Symbol_411 = (K - NX * INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_411)
              OpenAD_Symbol_412 = (K - NX)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_412)
              OpenAD_Symbol_377 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_377)
            ENDIF
            OpenAD_Symbol_379 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_379)
          ENDIF
          IF((NX .eq. J) .OR.(I .eq. INT(1_w2f__i8))) THEN
            __value__(PBR) = 0.0D00
            OpenAD_Symbol_380 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_380)
          ELSE
            __value__(PBR) = __value__(X(K - NX + 1))
            OpenAD_Symbol_409 = (K - NX + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_409)
            OpenAD_Symbol_381 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_381)
          ENDIF
          IF(J .eq. INT(1_w2f__i8)) THEN
            __value__(PL) = 0.0D00
            __value__(PLL) = __value__(X(K))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(K)
            OpenAD_Symbol_384 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_384)
          ELSE
            IF(J .eq. INT(2_w2f__i8)) THEN
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = 0.0D00
              OpenAD_Symbol_406 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_406)
              OpenAD_Symbol_382 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_382)
            ELSE
              __value__(PL) = __value__(X(K + (-1)))
              __value__(PLL) = __value__(X(K + (-2)))
              OpenAD_Symbol_407 = (K + INT((-2_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_407)
              OpenAD_Symbol_408 = (K + INT((-1_w2f__i8)))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_408)
              OpenAD_Symbol_383 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_383)
            ENDIF
            OpenAD_Symbol_385 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_385)
          ENDIF
          __value__(P) = __value__(X(K))
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          IF(J .eq.(NX + INT((-1_w2f__i8)))) THEN
            __value__(PR) = __value__(X(K + 1))
            __value__(PRR) = 0.0D00
            OpenAD_Symbol_398 = (K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_398)
            OpenAD_Symbol_388 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_388)
          ELSE
            IF(NX .eq. J) THEN
              __value__(PR) = 0.0D00
              __value__(PRR) = __value__(X(K))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
              OpenAD_Symbol_386 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_386)
            ELSE
              __value__(PR) = __value__(X(K + 1))
              __value__(PRR) = __value__(X(K + 2))
              OpenAD_Symbol_404 = (K + INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_404)
              OpenAD_Symbol_405 = (K + INT(1_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_405)
              OpenAD_Symbol_387 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_387)
            ENDIF
            OpenAD_Symbol_389 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_389)
          ENDIF
          IF((NY .eq. I) .OR.(J .eq. INT(1_w2f__i8))) THEN
            __value__(PTL) = 0.0D00
            OpenAD_Symbol_390 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_390)
          ELSE
            __value__(PTL) = __value__(X(NX + K + (-1)))
            OpenAD_Symbol_403 = (NX + K + INT((-1_w2f__i8)))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_403)
            OpenAD_Symbol_391 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_391)
          ENDIF
          IF(I .eq.(NY + INT((-1_w2f__i8)))) THEN
            __value__(PT) = __value__(X(NX + K))
            __value__(PTT) = 0.0D00
            OpenAD_Symbol_399 = (NX + K)
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_399)
            OpenAD_Symbol_394 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_394)
          ELSE
            IF(NY .eq. I) THEN
              __value__(PT) = 0.0D00
              __value__(PTT) = (__value__(X(K)) + HY * 2.0D00)
              OpenAD_Symbol_62 = 1_w2f__i8
              OpenAD_Symbol_219 = OpenAD_Symbol_62
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(K)
C             $OpenAD$ INLINE push(subst)
              CALL push(OpenAD_Symbol_219)
              OpenAD_Symbol_392 = 1_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_392)
            ELSE
              __value__(PT) = __value__(X(NX + K))
              __value__(PTT) = __value__(X(K + NX * 2))
              OpenAD_Symbol_401 = (K + NX * INT(2_w2f__i8))
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_401)
              OpenAD_Symbol_402 = (NX + K)
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_402)
              OpenAD_Symbol_393 = 0_w2f__i8
C             $OpenAD$ INLINE push_i(subst)
              CALL push_i(OpenAD_Symbol_393)
            ENDIF
            OpenAD_Symbol_395 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_395)
          ENDIF
          IF((NX .eq. J) .OR.(NY .eq. I)) THEN
            __value__(PTR) = 0.0D00
            OpenAD_Symbol_396 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_396)
          ELSE
            __value__(PTR) = __value__(X(NX + K + 1))
            OpenAD_Symbol_400 = (NX + K + INT(1_w2f__i8))
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_400)
            OpenAD_Symbol_397 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_397)
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
          OpenAD_Symbol_176 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
          OpenAD_Symbol_178 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
          OpenAD_Symbol_180 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
          OpenAD_Symbol_182 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_176)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_178)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_180)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_182)
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
          OpenAD_Symbol_61 = ((OpenAD_Symbol_20 / HY2) +(
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
          __value__(FVEC(INT(K))) = OpenAD_Symbol_61
          OpenAD_Symbol_184 = (OpenAD_Symbol_18 * OpenAD_Symbol_16)
          OpenAD_Symbol_185 = (OpenAD_Symbol_19 * OpenAD_Symbol_16)
          OpenAD_Symbol_186 = (OpenAD_Symbol_40 * OpenAD_Symbol_17)
          OpenAD_Symbol_187 = (OpenAD_Symbol_41 * OpenAD_Symbol_186)
          OpenAD_Symbol_188 = (OpenAD_Symbol_42 * OpenAD_Symbol_186)
          OpenAD_Symbol_189 = (OpenAD_Symbol_30 * OpenAD_Symbol_185)
          OpenAD_Symbol_190 = (OpenAD_Symbol_32 * OpenAD_Symbol_189)
          OpenAD_Symbol_192 = (OpenAD_Symbol_33 * OpenAD_Symbol_189)
          OpenAD_Symbol_193 = (OpenAD_Symbol_34 * OpenAD_Symbol_192)
          OpenAD_Symbol_195 = (OpenAD_Symbol_35 * OpenAD_Symbol_192)
          OpenAD_Symbol_196 = (OpenAD_Symbol_21 * OpenAD_Symbol_184)
          OpenAD_Symbol_197 = (OpenAD_Symbol_23 * OpenAD_Symbol_196)
          OpenAD_Symbol_199 = (OpenAD_Symbol_24 * OpenAD_Symbol_196)
          OpenAD_Symbol_200 = (OpenAD_Symbol_25 * OpenAD_Symbol_199)
          OpenAD_Symbol_202 = (OpenAD_Symbol_26 * OpenAD_Symbol_199)
          OpenAD_Symbol_203 = (OpenAD_Symbol_54 * OpenAD_Symbol_188)
          OpenAD_Symbol_204 = (OpenAD_Symbol_57 * OpenAD_Symbol_203)
          OpenAD_Symbol_206 = (OpenAD_Symbol_58 * OpenAD_Symbol_203)
          OpenAD_Symbol_207 = (OpenAD_Symbol_59 * OpenAD_Symbol_206)
          OpenAD_Symbol_208 = (OpenAD_Symbol_60 * OpenAD_Symbol_206)
          OpenAD_Symbol_209 = (OpenAD_Symbol_45 * OpenAD_Symbol_187)
          OpenAD_Symbol_210 = (OpenAD_Symbol_48 * OpenAD_Symbol_209)
          OpenAD_Symbol_212 = (OpenAD_Symbol_49 * OpenAD_Symbol_209)
          OpenAD_Symbol_213 = (OpenAD_Symbol_50 * OpenAD_Symbol_212)
          OpenAD_Symbol_214 = (OpenAD_Symbol_51 * OpenAD_Symbol_212)
          OpenAD_Symbol_215 = (OpenAD_Symbol_36 * OpenAD_Symbol_195)
          OpenAD_Symbol_217 = (OpenAD_Symbol_27 * OpenAD_Symbol_202)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_190)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_193)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_197)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_200)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_204)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_207)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_208)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_210)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_213)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_214)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_215)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
C         $OpenAD$ INLINE push(subst)
          CALL push(OpenAD_Symbol_217)
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(K)
          OpenAD_Symbol_373 = (INT(OpenAD_Symbol_373) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_373)
        OpenAD_Symbol_372 = (INT(OpenAD_Symbol_372) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_372)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_356)
      OpenAD_Symbol_357 = 1
      DO WHILE(INT(OpenAD_Symbol_357) .LE. INT(OpenAD_Symbol_356))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_358)
        OpenAD_Symbol_359 = 1
        DO WHILE(INT(OpenAD_Symbol_359) .LE. INT(OpenAD_Symbol_358))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_422)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_423)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_423, __deriv__(FVEC(INT(
     > OpenAD_Symbol_422))), __deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_424)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_425)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_425, __deriv__(FVEC(INT(
     > OpenAD_Symbol_424))), __deriv__(OpenAD_Symbol_216))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_426)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_427)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_427, __deriv__(FVEC(INT(
     > OpenAD_Symbol_426))), __deriv__(OpenAD_Symbol_191))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_428)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_429)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_429, __deriv__(FVEC(INT(
     > OpenAD_Symbol_428))), __deriv__(OpenAD_Symbol_194))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_430)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_431)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_431, __deriv__(FVEC(INT(
     > OpenAD_Symbol_430))), __deriv__(OpenAD_Symbol_211))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_432)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_433)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_433, __deriv__(FVEC(INT(
     > OpenAD_Symbol_432))), __deriv__(OpenAD_Symbol_198))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_434)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_435)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_435, __deriv__(FVEC(INT(
     > OpenAD_Symbol_434))), __deriv__(OpenAD_Symbol_201))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_436)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_437)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_437, __deriv__(FVEC(INT(
     > OpenAD_Symbol_436))), __deriv__(OpenAD_Symbol_205))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_438)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_439)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_439, __deriv__(FVEC(INT(
     > OpenAD_Symbol_438))), __deriv__(OpenAD_Symbol_201))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_440)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_441)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_441, __deriv__(FVEC(INT(
     > OpenAD_Symbol_440))), __deriv__(OpenAD_Symbol_198))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_442)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_443)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_443, __deriv__(FVEC(INT(
     > OpenAD_Symbol_442))), __deriv__(OpenAD_Symbol_194))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_444)
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_445)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_445, __deriv__(FVEC(INT(
     > OpenAD_Symbol_444))), __deriv__(OpenAD_Symbol_191))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(FVEC(INT(OpenAD_Symbol_444))))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_191), __deriv__(PLLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_191))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_194), __deriv__(PRLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_194))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_198), __deriv__(PBLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_198))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_201), __deriv__(PTLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_201))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_205), __deriv__(DPDX))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_205))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_211), __deriv__(DPDY))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_211))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_216), __deriv__(PLAP))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_216))
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_446)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_446, __deriv__(DPDX), __deriv__(
     > OpenAD_Symbol_183))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_447)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_447, __deriv__(DPDX), __deriv__(
     > OpenAD_Symbol_181))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDX))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_448)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_448, __deriv__(DPDY), __deriv__(
     > OpenAD_Symbol_179))
C         $OpenAD$ INLINE Pop(subst)
          CALL Pop(OpenAD_Symbol_449)
C         $OpenAD$ INLINE Saxpy(subst,subst,subst)
          CALL Saxpy(OpenAD_Symbol_449, __deriv__(DPDY), __deriv__(
     > OpenAD_Symbol_177))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(DPDY))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_177), __deriv__(PT))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_177))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_179), __deriv__(PB))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_179))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_181), __deriv__(PR))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_181))
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_183), __deriv__(PL))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_183))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_360)
          IF(OpenAD_Symbol_360 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTR), __deriv__(
     > OpenAD_Symbol_218))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_450)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_218), __deriv__(X(INT
     > (OpenAD_Symbol_450))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_218))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_361)
          IF(OpenAD_Symbol_361 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTT))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_175))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_421)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_175), __deriv__(X(INT
     > (OpenAD_Symbol_421))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_175))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_362)
            IF(OpenAD_Symbol_362 .ne. 0) THEN
C             $OpenAD$ INLINE Pop(subst)
              CALL Pop(OpenAD_Symbol_451)
C             $OpenAD$ INLINE Saxpy(subst,subst,subst)
              CALL Saxpy(OpenAD_Symbol_451, __deriv__(PTT), __deriv__(
     > OpenAD_Symbol_220))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PTT))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PT))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_452)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_220), __deriv__(X(
     > INT(OpenAD_Symbol_452))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_220))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PTT), __deriv__(
     > OpenAD_Symbol_222))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PT), __deriv__(
     > OpenAD_Symbol_221))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_453)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_221), __deriv__(X(
     > INT(OpenAD_Symbol_453))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_221))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_454)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_222), __deriv__(X(
     > INT(OpenAD_Symbol_454))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_222))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_363)
          IF(OpenAD_Symbol_363 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PTL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PTL), __deriv__(
     > OpenAD_Symbol_223))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_455)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_223), __deriv__(X(INT
     > (OpenAD_Symbol_455))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_223))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_364)
          IF(OpenAD_Symbol_364 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PRR))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_174))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_420)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_174), __deriv__(X(INT
     > (OpenAD_Symbol_420))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_174))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_365)
            IF(OpenAD_Symbol_365 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PR))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_224))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_456)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_224), __deriv__(X(
     > INT(OpenAD_Symbol_456))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_224))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PRR), __deriv__(
     > OpenAD_Symbol_226))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PR), __deriv__(
     > OpenAD_Symbol_225))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_457)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_225), __deriv__(X(
     > INT(OpenAD_Symbol_457))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_225))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_458)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_226), __deriv__(X(
     > INT(OpenAD_Symbol_458))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_226))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
          CALL CondIncZeroDeriv(__deriv__(P), __deriv__(
     > OpenAD_Symbol_173))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_419)
C         $OpenAD$ INLINE IncDeriv(subst,subst)
          CALL IncDeriv(__deriv__(OpenAD_Symbol_173), __deriv__(X(INT(
     > OpenAD_Symbol_419))))
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(OpenAD_Symbol_173))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_366)
          IF(OpenAD_Symbol_366 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PL))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_172))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_418)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_172), __deriv__(X(INT
     > (OpenAD_Symbol_418))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_172))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_367)
            IF(OpenAD_Symbol_367 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PLL))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_227))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_459)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_227), __deriv__(X(
     > INT(OpenAD_Symbol_459))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_227))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PLL), __deriv__(
     > OpenAD_Symbol_229))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PL), __deriv__(
     > OpenAD_Symbol_228))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_460)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_228), __deriv__(X(
     > INT(OpenAD_Symbol_460))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_228))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_461)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_229), __deriv__(X(
     > INT(OpenAD_Symbol_461))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_229))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_368)
          IF(OpenAD_Symbol_368 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBR))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBR), __deriv__(
     > OpenAD_Symbol_230))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_462)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_230), __deriv__(X(INT
     > (OpenAD_Symbol_462))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_230))
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_369)
          IF(OpenAD_Symbol_369 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PB))
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_171))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_417)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_171), __deriv__(X(INT
     > (OpenAD_Symbol_417))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_171))
          ELSE
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_370)
            IF(OpenAD_Symbol_370 .ne. 0) THEN
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(PBB))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_231))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_463)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_231), __deriv__(X(
     > INT(OpenAD_Symbol_463))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_231))
            ELSE
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PBB), __deriv__(
     > OpenAD_Symbol_233))
C             $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
              CALL CondIncZeroDeriv(__deriv__(PB), __deriv__(
     > OpenAD_Symbol_232))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_464)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_232), __deriv__(X(
     > INT(OpenAD_Symbol_464))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_232))
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_465)
C             $OpenAD$ INLINE IncDeriv(subst,subst)
              CALL IncDeriv(__deriv__(OpenAD_Symbol_233), __deriv__(X(
     > INT(OpenAD_Symbol_465))))
C             $OpenAD$ INLINE ZeroDeriv(subst)
              CALL ZeroDeriv(__deriv__(OpenAD_Symbol_233))
            ENDIF
          ENDIF
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_371)
          IF(OpenAD_Symbol_371 .ne. 0) THEN
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(PBL))
          ELSE
C           $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
            CALL CondIncZeroDeriv(__deriv__(PBL), __deriv__(
     > OpenAD_Symbol_234))
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_466)
C           $OpenAD$ INLINE IncDeriv(subst,subst)
            CALL IncDeriv(__deriv__(OpenAD_Symbol_234), __deriv__(X(INT
     > (OpenAD_Symbol_466))))
C           $OpenAD$ INLINE ZeroDeriv(subst)
            CALL ZeroDeriv(__deriv__(OpenAD_Symbol_234))
          ENDIF
          OpenAD_Symbol_359 = INT(OpenAD_Symbol_359) + 1
        END DO
        OpenAD_Symbol_357 = INT(OpenAD_Symbol_357) + 1
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
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_106
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      REAL(w2f__8) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      REAL(w2f__8) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      TYPE (OpenADTy_active) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_238
      REAL(w2f__8) OpenAD_Symbol_239
      TYPE (OpenADTy_active) OpenAD_Symbol_240
      REAL(w2f__8) OpenAD_Symbol_241
      REAL(w2f__8) OpenAD_Symbol_242
      REAL(w2f__8) OpenAD_Symbol_243
      TYPE (OpenADTy_active) OpenAD_Symbol_244
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
      TYPE (OpenADTy_active) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      REAL(w2f__8) OpenAD_Symbol_259
      REAL(w2f__8) OpenAD_Symbol_260
      REAL(w2f__8) OpenAD_Symbol_261
      REAL(w2f__8) OpenAD_Symbol_262
      TYPE (OpenADTy_active) OpenAD_Symbol_263
      REAL(w2f__8) OpenAD_Symbol_264
      REAL(w2f__8) OpenAD_Symbol_265
      TYPE (OpenADTy_active) OpenAD_Symbol_266
      REAL(w2f__8) OpenAD_Symbol_267
      REAL(w2f__8) OpenAD_Symbol_268
      REAL(w2f__8) OpenAD_Symbol_269
      TYPE (OpenADTy_active) OpenAD_Symbol_270
      REAL(w2f__8) OpenAD_Symbol_271
      REAL(w2f__8) OpenAD_Symbol_272
      TYPE (OpenADTy_active) OpenAD_Symbol_273
      REAL(w2f__8) OpenAD_Symbol_274
      REAL(w2f__8) OpenAD_Symbol_275
      REAL(w2f__8) OpenAD_Symbol_276
      TYPE (OpenADTy_active) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_278
      REAL(w2f__8) OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_280
      REAL(w2f__8) OpenAD_Symbol_281
      REAL(w2f__8) OpenAD_Symbol_282
      TYPE (OpenADTy_active) OpenAD_Symbol_283
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
      TYPE (OpenADTy_active) OpenAD_Symbol_294
      REAL(w2f__8) OpenAD_Symbol_295
      REAL(w2f__8) OpenAD_Symbol_296
      REAL(w2f__8) OpenAD_Symbol_297
      REAL(w2f__8) OpenAD_Symbol_298
      REAL(w2f__8) OpenAD_Symbol_299
      REAL(w2f__8) OpenAD_Symbol_300
      REAL(w2f__8) OpenAD_Symbol_301
      REAL(w2f__8) OpenAD_Symbol_302
      REAL(w2f__8) OpenAD_Symbol_303
      REAL(w2f__8) OpenAD_Symbol_304
      REAL(w2f__8) OpenAD_Symbol_305
      REAL(w2f__8) OpenAD_Symbol_306
      REAL(w2f__8) OpenAD_Symbol_307
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_80
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_90
      REAL(w2f__8) OpenAD_Symbol_91
      REAL(w2f__8) OpenAD_Symbol_92
      REAL(w2f__8) OpenAD_Symbol_93
      REAL(w2f__8) OpenAD_Symbol_94
      REAL(w2f__8) OpenAD_Symbol_96
      REAL(w2f__8) OpenAD_Symbol_97
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
      PARAMETER ( FOUR =     4.000000000000000)
      REAL(w2f__8) ONE
      PARAMETER ( ONE =     1.000000000000000)
      REAL(w2f__8) THREE
      PARAMETER ( THREE =     3.000000000000000)
      REAL(w2f__8) TWO
      PARAMETER ( TWO =     2.000000000000000)
      REAL(w2f__8) ZERO
      PARAMETER ( ZERO =     0.000000000000000)
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_66 = (__value__(PBB) + __value__(P) - __value__(PB)
     >  * 2.0D00)
      OpenAD_Symbol_75 = (__value__(PBL) + __value__(PBR) - __value__(
     > PB) * 2.0D00)
      OpenAD_Symbol_84 = ((OpenAD_Symbol_66 / HY2) +(OpenAD_Symbol_75 /
     >  HX2))
      OpenAD_Symbol_69 = 1_w2f__i8
      OpenAD_Symbol_71 = 1_w2f__i8
      OpenAD_Symbol_73 = 2.0D00
      OpenAD_Symbol_72 = (-1_w2f__i8)
      OpenAD_Symbol_70 = 1_w2f__i8
      OpenAD_Symbol_67 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_64 = 1_w2f__i8
      OpenAD_Symbol_78 = 1_w2f__i8
      OpenAD_Symbol_80 = 1_w2f__i8
      OpenAD_Symbol_82 = 2.0D00
      OpenAD_Symbol_81 = (-1_w2f__i8)
      OpenAD_Symbol_79 = 1_w2f__i8
      OpenAD_Symbol_76 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_65 = 1_w2f__i8
      __value__(PBLAP) = OpenAD_Symbol_84
      OpenAD_Symbol_87 = (__value__(PBL) + __value__(PTL) - __value__(
     > PL) * 2.0D00)
      OpenAD_Symbol_96 = (__value__(PLL) + __value__(P) - __value__(PL)
     >  * 2.0D00)
      OpenAD_Symbol_105 = ((OpenAD_Symbol_87 / HY2) +(OpenAD_Symbol_96
     >  / HX2))
      OpenAD_Symbol_90 = 1_w2f__i8
      OpenAD_Symbol_92 = 1_w2f__i8
      OpenAD_Symbol_94 = 2.0D00
      OpenAD_Symbol_93 = (-1_w2f__i8)
      OpenAD_Symbol_91 = 1_w2f__i8
      OpenAD_Symbol_88 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_85 = 1_w2f__i8
      OpenAD_Symbol_99 = 1_w2f__i8
      OpenAD_Symbol_101 = 1_w2f__i8
      OpenAD_Symbol_103 = 2.0D00
      OpenAD_Symbol_102 = (-1_w2f__i8)
      OpenAD_Symbol_100 = 1_w2f__i8
      OpenAD_Symbol_97 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_86 = 1_w2f__i8
      __value__(PLLAP) = OpenAD_Symbol_105
      OpenAD_Symbol_108 = (__value__(PB) + __value__(PT) - __value__(P)
     >  * 2.0D00)
      OpenAD_Symbol_117 = (__value__(PL) + __value__(PR) - __value__(P)
     >  * 2.0D00)
      OpenAD_Symbol_126 = ((OpenAD_Symbol_108 / HY2) +(
     > OpenAD_Symbol_117 / HX2))
      OpenAD_Symbol_111 = 1_w2f__i8
      OpenAD_Symbol_113 = 1_w2f__i8
      OpenAD_Symbol_115 = 2.0D00
      OpenAD_Symbol_114 = (-1_w2f__i8)
      OpenAD_Symbol_112 = 1_w2f__i8
      OpenAD_Symbol_109 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_106 = 1_w2f__i8
      OpenAD_Symbol_120 = 1_w2f__i8
      OpenAD_Symbol_122 = 1_w2f__i8
      OpenAD_Symbol_124 = 2.0D00
      OpenAD_Symbol_123 = (-1_w2f__i8)
      OpenAD_Symbol_121 = 1_w2f__i8
      OpenAD_Symbol_118 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_107 = 1_w2f__i8
      __value__(PLAP) = OpenAD_Symbol_126
      OpenAD_Symbol_129 = (__value__(PBR) + __value__(PTR) - __value__(
     > PR) * 2.0D00)
      OpenAD_Symbol_138 = (__value__(P) + __value__(PRR) - __value__(PR
     > ) * 2.0D00)
      OpenAD_Symbol_147 = ((OpenAD_Symbol_129 / HY2) +(
     > OpenAD_Symbol_138 / HX2))
      OpenAD_Symbol_132 = 1_w2f__i8
      OpenAD_Symbol_134 = 1_w2f__i8
      OpenAD_Symbol_136 = 2.0D00
      OpenAD_Symbol_135 = (-1_w2f__i8)
      OpenAD_Symbol_133 = 1_w2f__i8
      OpenAD_Symbol_130 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_127 = 1_w2f__i8
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_145 = 2.0D00
      OpenAD_Symbol_144 = (-1_w2f__i8)
      OpenAD_Symbol_142 = 1_w2f__i8
      OpenAD_Symbol_139 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_128 = 1_w2f__i8
      __value__(PRLAP) = OpenAD_Symbol_147
      OpenAD_Symbol_150 = (__value__(P) + __value__(PTT) - __value__(PT
     > ) * 2.0D00)
      OpenAD_Symbol_159 = (__value__(PTL) + __value__(PTR) - __value__(
     > PT) * 2.0D00)
      OpenAD_Symbol_168 = ((OpenAD_Symbol_150 / HY2) +(
     > OpenAD_Symbol_159 / HX2))
      OpenAD_Symbol_153 = 1_w2f__i8
      OpenAD_Symbol_155 = 1_w2f__i8
      OpenAD_Symbol_157 = 2.0D00
      OpenAD_Symbol_156 = (-1_w2f__i8)
      OpenAD_Symbol_154 = 1_w2f__i8
      OpenAD_Symbol_151 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_162 = 1_w2f__i8
      OpenAD_Symbol_164 = 1_w2f__i8
      OpenAD_Symbol_166 = 2.0D00
      OpenAD_Symbol_165 = (-1_w2f__i8)
      OpenAD_Symbol_163 = 1_w2f__i8
      OpenAD_Symbol_160 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_149 = 1_w2f__i8
      __value__(PTLAP) = OpenAD_Symbol_168
      OpenAD_Symbol_235 = (OpenAD_Symbol_160 * OpenAD_Symbol_149)
      OpenAD_Symbol_236 = (OpenAD_Symbol_162 * OpenAD_Symbol_235)
      OpenAD_Symbol_238 = (OpenAD_Symbol_163 * OpenAD_Symbol_235)
      OpenAD_Symbol_239 = (OpenAD_Symbol_164 * OpenAD_Symbol_238)
      OpenAD_Symbol_241 = (OpenAD_Symbol_165 * OpenAD_Symbol_238)
      OpenAD_Symbol_242 = (OpenAD_Symbol_151 * OpenAD_Symbol_148)
      OpenAD_Symbol_243 = (OpenAD_Symbol_153 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_154 * OpenAD_Symbol_242)
      OpenAD_Symbol_246 = (OpenAD_Symbol_155 * OpenAD_Symbol_245)
      OpenAD_Symbol_248 = (OpenAD_Symbol_156 * OpenAD_Symbol_245)
      OpenAD_Symbol_249 = (OpenAD_Symbol_139 * OpenAD_Symbol_128)
      OpenAD_Symbol_250 = (OpenAD_Symbol_141 * OpenAD_Symbol_249)
      OpenAD_Symbol_251 = (OpenAD_Symbol_142 * OpenAD_Symbol_249)
      OpenAD_Symbol_252 = (OpenAD_Symbol_143 * OpenAD_Symbol_251)
      OpenAD_Symbol_254 = (OpenAD_Symbol_144 * OpenAD_Symbol_251)
      OpenAD_Symbol_255 = (OpenAD_Symbol_130 * OpenAD_Symbol_127)
      OpenAD_Symbol_256 = (OpenAD_Symbol_132 * OpenAD_Symbol_255)
      OpenAD_Symbol_258 = (OpenAD_Symbol_133 * OpenAD_Symbol_255)
      OpenAD_Symbol_259 = (OpenAD_Symbol_134 * OpenAD_Symbol_258)
      OpenAD_Symbol_260 = (OpenAD_Symbol_135 * OpenAD_Symbol_258)
      OpenAD_Symbol_261 = (OpenAD_Symbol_118 * OpenAD_Symbol_107)
      OpenAD_Symbol_262 = (OpenAD_Symbol_120 * OpenAD_Symbol_261)
      OpenAD_Symbol_264 = (OpenAD_Symbol_121 * OpenAD_Symbol_261)
      OpenAD_Symbol_265 = (OpenAD_Symbol_122 * OpenAD_Symbol_264)
      OpenAD_Symbol_267 = (OpenAD_Symbol_123 * OpenAD_Symbol_264)
      OpenAD_Symbol_268 = (OpenAD_Symbol_109 * OpenAD_Symbol_106)
      OpenAD_Symbol_269 = (OpenAD_Symbol_111 * OpenAD_Symbol_268)
      OpenAD_Symbol_271 = (OpenAD_Symbol_112 * OpenAD_Symbol_268)
      OpenAD_Symbol_272 = (OpenAD_Symbol_113 * OpenAD_Symbol_271)
      OpenAD_Symbol_274 = (OpenAD_Symbol_114 * OpenAD_Symbol_271)
      OpenAD_Symbol_275 = (OpenAD_Symbol_97 * OpenAD_Symbol_86)
      OpenAD_Symbol_276 = (OpenAD_Symbol_99 * OpenAD_Symbol_275)
      OpenAD_Symbol_278 = (OpenAD_Symbol_100 * OpenAD_Symbol_275)
      OpenAD_Symbol_279 = (OpenAD_Symbol_101 * OpenAD_Symbol_278)
      OpenAD_Symbol_280 = (OpenAD_Symbol_102 * OpenAD_Symbol_278)
      OpenAD_Symbol_281 = (OpenAD_Symbol_88 * OpenAD_Symbol_85)
      OpenAD_Symbol_282 = (OpenAD_Symbol_90 * OpenAD_Symbol_281)
      OpenAD_Symbol_284 = (OpenAD_Symbol_91 * OpenAD_Symbol_281)
      OpenAD_Symbol_285 = (OpenAD_Symbol_92 * OpenAD_Symbol_284)
      OpenAD_Symbol_286 = (OpenAD_Symbol_93 * OpenAD_Symbol_284)
      OpenAD_Symbol_287 = (OpenAD_Symbol_76 * OpenAD_Symbol_65)
      OpenAD_Symbol_288 = (OpenAD_Symbol_78 * OpenAD_Symbol_287)
      OpenAD_Symbol_289 = (OpenAD_Symbol_79 * OpenAD_Symbol_287)
      OpenAD_Symbol_290 = (OpenAD_Symbol_80 * OpenAD_Symbol_289)
      OpenAD_Symbol_291 = (OpenAD_Symbol_81 * OpenAD_Symbol_289)
      OpenAD_Symbol_292 = (OpenAD_Symbol_67 * OpenAD_Symbol_64)
      OpenAD_Symbol_293 = (OpenAD_Symbol_69 * OpenAD_Symbol_292)
      OpenAD_Symbol_295 = (OpenAD_Symbol_70 * OpenAD_Symbol_292)
      OpenAD_Symbol_296 = (OpenAD_Symbol_71 * OpenAD_Symbol_295)
      OpenAD_Symbol_297 = (OpenAD_Symbol_72 * OpenAD_Symbol_295)
      OpenAD_Symbol_298 = (OpenAD_Symbol_166 * OpenAD_Symbol_241)
      OpenAD_Symbol_299 = (OpenAD_Symbol_157 * OpenAD_Symbol_248)
      OpenAD_Symbol_300 = (OpenAD_Symbol_145 * OpenAD_Symbol_254)
      OpenAD_Symbol_301 = (OpenAD_Symbol_136 * OpenAD_Symbol_260)
      OpenAD_Symbol_302 = (OpenAD_Symbol_124 * OpenAD_Symbol_267)
      OpenAD_Symbol_303 = (OpenAD_Symbol_115 * OpenAD_Symbol_274)
      OpenAD_Symbol_304 = (OpenAD_Symbol_103 * OpenAD_Symbol_280)
      OpenAD_Symbol_305 = (OpenAD_Symbol_94 * OpenAD_Symbol_286)
      OpenAD_Symbol_306 = (OpenAD_Symbol_82 * OpenAD_Symbol_291)
      OpenAD_Symbol_307 = (OpenAD_Symbol_73 * OpenAD_Symbol_297)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_236)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_239)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_243)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_246)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_250)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_252)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_256)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_259)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_262)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_265)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_269)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_272)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_276)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_279)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_282)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_285)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_288)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_290)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_293)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_296)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_298)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_299)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_300)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_301)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_302)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_303)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_304)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_305)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_306)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_307)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_467)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_467, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_270))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_468)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_468, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_270))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_469)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_469, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_263))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_470)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_470, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_263))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_471)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_471, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_472)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_472, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_473)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_473, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_266))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_474)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_474, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_266))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_475)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_475, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_273))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_476)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_476, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_273))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_477)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_477, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_478)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_478, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_294))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_479)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_479, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_257))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_480)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_480, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_283))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PBLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_481)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_481, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_237))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_482)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_482, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_283))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_483)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_483, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_484)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_484, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_277))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_485)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_485, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_273))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_486)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_486, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_270))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_487)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_487, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_266))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_488)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_488, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_263))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_489)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_489, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_240))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_490)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_490, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_257))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_491)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_491, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_253))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_492)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_492, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PRLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_493)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_493, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_247))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_494)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_494, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_495)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_495, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_240))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_496)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_496, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_237))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PTLAP))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_237), __deriv__(PTL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_237))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_240), __deriv__(PTR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_240))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_244), __deriv__(P))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_244))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_247), __deriv__(PTT))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_247))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_253), __deriv__(PRR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_253))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_257), __deriv__(PBR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_257))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_263), __deriv__(PL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_263))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_266), __deriv__(PR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_266))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_270), __deriv__(PB))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_270))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_273), __deriv__(PT))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_273))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_277), __deriv__(PLL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_277))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_283), __deriv__(PBL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_283))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_294), __deriv__(PBB))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_294))
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
      OpenAD_Symbol_66 = (__value__(PBB) + __value__(P) - __value__(PB)
     >  * 2.0D00)
      OpenAD_Symbol_75 = (__value__(PBL) + __value__(PBR) - __value__(
     > PB) * 2.0D00)
      OpenAD_Symbol_84 = ((OpenAD_Symbol_66 / HY2) +(OpenAD_Symbol_75 /
     >  HX2))
      OpenAD_Symbol_69 = 1_w2f__i8
      OpenAD_Symbol_71 = 1_w2f__i8
      OpenAD_Symbol_73 = 2.0D00
      OpenAD_Symbol_72 = (-1_w2f__i8)
      OpenAD_Symbol_70 = 1_w2f__i8
      OpenAD_Symbol_67 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_64 = 1_w2f__i8
      OpenAD_Symbol_78 = 1_w2f__i8
      OpenAD_Symbol_80 = 1_w2f__i8
      OpenAD_Symbol_82 = 2.0D00
      OpenAD_Symbol_81 = (-1_w2f__i8)
      OpenAD_Symbol_79 = 1_w2f__i8
      OpenAD_Symbol_76 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_65 = 1_w2f__i8
      __value__(PBLAP) = OpenAD_Symbol_84
      OpenAD_Symbol_87 = (__value__(PBL) + __value__(PTL) - __value__(
     > PL) * 2.0D00)
      OpenAD_Symbol_96 = (__value__(PLL) + __value__(P) - __value__(PL)
     >  * 2.0D00)
      OpenAD_Symbol_105 = ((OpenAD_Symbol_87 / HY2) +(OpenAD_Symbol_96
     >  / HX2))
      OpenAD_Symbol_90 = 1_w2f__i8
      OpenAD_Symbol_92 = 1_w2f__i8
      OpenAD_Symbol_94 = 2.0D00
      OpenAD_Symbol_93 = (-1_w2f__i8)
      OpenAD_Symbol_91 = 1_w2f__i8
      OpenAD_Symbol_88 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_85 = 1_w2f__i8
      OpenAD_Symbol_99 = 1_w2f__i8
      OpenAD_Symbol_101 = 1_w2f__i8
      OpenAD_Symbol_103 = 2.0D00
      OpenAD_Symbol_102 = (-1_w2f__i8)
      OpenAD_Symbol_100 = 1_w2f__i8
      OpenAD_Symbol_97 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_86 = 1_w2f__i8
      __value__(PLLAP) = OpenAD_Symbol_105
      OpenAD_Symbol_108 = (__value__(PB) + __value__(PT) - __value__(P)
     >  * 2.0D00)
      OpenAD_Symbol_117 = (__value__(PL) + __value__(PR) - __value__(P)
     >  * 2.0D00)
      OpenAD_Symbol_126 = ((OpenAD_Symbol_108 / HY2) +(
     > OpenAD_Symbol_117 / HX2))
      OpenAD_Symbol_111 = 1_w2f__i8
      OpenAD_Symbol_113 = 1_w2f__i8
      OpenAD_Symbol_115 = 2.0D00
      OpenAD_Symbol_114 = (-1_w2f__i8)
      OpenAD_Symbol_112 = 1_w2f__i8
      OpenAD_Symbol_109 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_106 = 1_w2f__i8
      OpenAD_Symbol_120 = 1_w2f__i8
      OpenAD_Symbol_122 = 1_w2f__i8
      OpenAD_Symbol_124 = 2.0D00
      OpenAD_Symbol_123 = (-1_w2f__i8)
      OpenAD_Symbol_121 = 1_w2f__i8
      OpenAD_Symbol_118 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_107 = 1_w2f__i8
      __value__(PLAP) = OpenAD_Symbol_126
      OpenAD_Symbol_129 = (__value__(PBR) + __value__(PTR) - __value__(
     > PR) * 2.0D00)
      OpenAD_Symbol_138 = (__value__(P) + __value__(PRR) - __value__(PR
     > ) * 2.0D00)
      OpenAD_Symbol_147 = ((OpenAD_Symbol_129 / HY2) +(
     > OpenAD_Symbol_138 / HX2))
      OpenAD_Symbol_132 = 1_w2f__i8
      OpenAD_Symbol_134 = 1_w2f__i8
      OpenAD_Symbol_136 = 2.0D00
      OpenAD_Symbol_135 = (-1_w2f__i8)
      OpenAD_Symbol_133 = 1_w2f__i8
      OpenAD_Symbol_130 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_127 = 1_w2f__i8
      OpenAD_Symbol_141 = 1_w2f__i8
      OpenAD_Symbol_143 = 1_w2f__i8
      OpenAD_Symbol_145 = 2.0D00
      OpenAD_Symbol_144 = (-1_w2f__i8)
      OpenAD_Symbol_142 = 1_w2f__i8
      OpenAD_Symbol_139 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_128 = 1_w2f__i8
      __value__(PRLAP) = OpenAD_Symbol_147
      OpenAD_Symbol_150 = (__value__(P) + __value__(PTT) - __value__(PT
     > ) * 2.0D00)
      OpenAD_Symbol_159 = (__value__(PTL) + __value__(PTR) - __value__(
     > PT) * 2.0D00)
      OpenAD_Symbol_168 = ((OpenAD_Symbol_150 / HY2) +(
     > OpenAD_Symbol_159 / HX2))
      OpenAD_Symbol_153 = 1_w2f__i8
      OpenAD_Symbol_155 = 1_w2f__i8
      OpenAD_Symbol_157 = 2.0D00
      OpenAD_Symbol_156 = (-1_w2f__i8)
      OpenAD_Symbol_154 = 1_w2f__i8
      OpenAD_Symbol_151 = (INT(1_w2f__i8) / HY2)
      OpenAD_Symbol_148 = 1_w2f__i8
      OpenAD_Symbol_162 = 1_w2f__i8
      OpenAD_Symbol_164 = 1_w2f__i8
      OpenAD_Symbol_166 = 2.0D00
      OpenAD_Symbol_165 = (-1_w2f__i8)
      OpenAD_Symbol_163 = 1_w2f__i8
      OpenAD_Symbol_160 = (INT(1_w2f__i8) / HX2)
      OpenAD_Symbol_149 = 1_w2f__i8
      __value__(PTLAP) = OpenAD_Symbol_168
      OpenAD_Symbol_235 = (OpenAD_Symbol_160 * OpenAD_Symbol_149)
      OpenAD_Symbol_236 = (OpenAD_Symbol_162 * OpenAD_Symbol_235)
      OpenAD_Symbol_238 = (OpenAD_Symbol_163 * OpenAD_Symbol_235)
      OpenAD_Symbol_239 = (OpenAD_Symbol_164 * OpenAD_Symbol_238)
      OpenAD_Symbol_241 = (OpenAD_Symbol_165 * OpenAD_Symbol_238)
      OpenAD_Symbol_242 = (OpenAD_Symbol_151 * OpenAD_Symbol_148)
      OpenAD_Symbol_243 = (OpenAD_Symbol_153 * OpenAD_Symbol_242)
      OpenAD_Symbol_245 = (OpenAD_Symbol_154 * OpenAD_Symbol_242)
      OpenAD_Symbol_246 = (OpenAD_Symbol_155 * OpenAD_Symbol_245)
      OpenAD_Symbol_248 = (OpenAD_Symbol_156 * OpenAD_Symbol_245)
      OpenAD_Symbol_249 = (OpenAD_Symbol_139 * OpenAD_Symbol_128)
      OpenAD_Symbol_250 = (OpenAD_Symbol_141 * OpenAD_Symbol_249)
      OpenAD_Symbol_251 = (OpenAD_Symbol_142 * OpenAD_Symbol_249)
      OpenAD_Symbol_252 = (OpenAD_Symbol_143 * OpenAD_Symbol_251)
      OpenAD_Symbol_254 = (OpenAD_Symbol_144 * OpenAD_Symbol_251)
      OpenAD_Symbol_255 = (OpenAD_Symbol_130 * OpenAD_Symbol_127)
      OpenAD_Symbol_256 = (OpenAD_Symbol_132 * OpenAD_Symbol_255)
      OpenAD_Symbol_258 = (OpenAD_Symbol_133 * OpenAD_Symbol_255)
      OpenAD_Symbol_259 = (OpenAD_Symbol_134 * OpenAD_Symbol_258)
      OpenAD_Symbol_260 = (OpenAD_Symbol_135 * OpenAD_Symbol_258)
      OpenAD_Symbol_261 = (OpenAD_Symbol_118 * OpenAD_Symbol_107)
      OpenAD_Symbol_262 = (OpenAD_Symbol_120 * OpenAD_Symbol_261)
      OpenAD_Symbol_264 = (OpenAD_Symbol_121 * OpenAD_Symbol_261)
      OpenAD_Symbol_265 = (OpenAD_Symbol_122 * OpenAD_Symbol_264)
      OpenAD_Symbol_267 = (OpenAD_Symbol_123 * OpenAD_Symbol_264)
      OpenAD_Symbol_268 = (OpenAD_Symbol_109 * OpenAD_Symbol_106)
      OpenAD_Symbol_269 = (OpenAD_Symbol_111 * OpenAD_Symbol_268)
      OpenAD_Symbol_271 = (OpenAD_Symbol_112 * OpenAD_Symbol_268)
      OpenAD_Symbol_272 = (OpenAD_Symbol_113 * OpenAD_Symbol_271)
      OpenAD_Symbol_274 = (OpenAD_Symbol_114 * OpenAD_Symbol_271)
      OpenAD_Symbol_275 = (OpenAD_Symbol_97 * OpenAD_Symbol_86)
      OpenAD_Symbol_276 = (OpenAD_Symbol_99 * OpenAD_Symbol_275)
      OpenAD_Symbol_278 = (OpenAD_Symbol_100 * OpenAD_Symbol_275)
      OpenAD_Symbol_279 = (OpenAD_Symbol_101 * OpenAD_Symbol_278)
      OpenAD_Symbol_280 = (OpenAD_Symbol_102 * OpenAD_Symbol_278)
      OpenAD_Symbol_281 = (OpenAD_Symbol_88 * OpenAD_Symbol_85)
      OpenAD_Symbol_282 = (OpenAD_Symbol_90 * OpenAD_Symbol_281)
      OpenAD_Symbol_284 = (OpenAD_Symbol_91 * OpenAD_Symbol_281)
      OpenAD_Symbol_285 = (OpenAD_Symbol_92 * OpenAD_Symbol_284)
      OpenAD_Symbol_286 = (OpenAD_Symbol_93 * OpenAD_Symbol_284)
      OpenAD_Symbol_287 = (OpenAD_Symbol_76 * OpenAD_Symbol_65)
      OpenAD_Symbol_288 = (OpenAD_Symbol_78 * OpenAD_Symbol_287)
      OpenAD_Symbol_289 = (OpenAD_Symbol_79 * OpenAD_Symbol_287)
      OpenAD_Symbol_290 = (OpenAD_Symbol_80 * OpenAD_Symbol_289)
      OpenAD_Symbol_291 = (OpenAD_Symbol_81 * OpenAD_Symbol_289)
      OpenAD_Symbol_292 = (OpenAD_Symbol_67 * OpenAD_Symbol_64)
      OpenAD_Symbol_293 = (OpenAD_Symbol_69 * OpenAD_Symbol_292)
      OpenAD_Symbol_295 = (OpenAD_Symbol_70 * OpenAD_Symbol_292)
      OpenAD_Symbol_296 = (OpenAD_Symbol_71 * OpenAD_Symbol_295)
      OpenAD_Symbol_297 = (OpenAD_Symbol_72 * OpenAD_Symbol_295)
      OpenAD_Symbol_298 = (OpenAD_Symbol_166 * OpenAD_Symbol_241)
      OpenAD_Symbol_299 = (OpenAD_Symbol_157 * OpenAD_Symbol_248)
      OpenAD_Symbol_300 = (OpenAD_Symbol_145 * OpenAD_Symbol_254)
      OpenAD_Symbol_301 = (OpenAD_Symbol_136 * OpenAD_Symbol_260)
      OpenAD_Symbol_302 = (OpenAD_Symbol_124 * OpenAD_Symbol_267)
      OpenAD_Symbol_303 = (OpenAD_Symbol_115 * OpenAD_Symbol_274)
      OpenAD_Symbol_304 = (OpenAD_Symbol_103 * OpenAD_Symbol_280)
      OpenAD_Symbol_305 = (OpenAD_Symbol_94 * OpenAD_Symbol_286)
      OpenAD_Symbol_306 = (OpenAD_Symbol_82 * OpenAD_Symbol_291)
      OpenAD_Symbol_307 = (OpenAD_Symbol_73 * OpenAD_Symbol_297)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_236)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_239)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_243)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_246)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_250)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_252)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_256)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_259)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_262)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_265)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_269)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_272)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_276)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_279)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_282)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_285)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_288)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_290)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_293)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_296)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_298)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_299)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_300)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_301)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_302)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_303)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_304)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_305)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_306)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_307)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_467)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_467, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_270))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_468)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_468, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_270))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_469)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_469, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_263))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_470)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_470, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_263))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_471)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_471, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_472)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_472, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_473)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_473, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_266))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_474)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_474, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_266))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_475)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_475, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_273))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_476)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_476, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_273))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_477)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_477, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_478)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_478, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_294))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_479)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_479, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_257))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_480)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_480, __deriv__(PBLAP), __deriv__(
     > OpenAD_Symbol_283))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PBLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_481)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_481, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_237))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_482)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_482, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_283))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_483)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_483, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_484)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_484, __deriv__(PLLAP), __deriv__(
     > OpenAD_Symbol_277))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_485)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_485, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_273))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_486)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_486, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_270))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_487)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_487, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_266))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_488)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_488, __deriv__(PLAP), __deriv__(
     > OpenAD_Symbol_263))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_489)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_489, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_240))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_490)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_490, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_257))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_491)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_491, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_253))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_492)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_492, __deriv__(PRLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PRLAP))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_493)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_493, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_247))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_494)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_494, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_244))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_495)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_495, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_240))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_496)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_496, __deriv__(PTLAP), __deriv__(
     > OpenAD_Symbol_237))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(PTLAP))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_237), __deriv__(PTL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_237))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_240), __deriv__(PTR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_240))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_244), __deriv__(P))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_244))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_247), __deriv__(PTT))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_247))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_253), __deriv__(PRR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_253))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_257), __deriv__(PBR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_257))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_263), __deriv__(PL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_263))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_266), __deriv__(PR))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_266))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_270), __deriv__(PB))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_270))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_273), __deriv__(PT))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_273))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_277), __deriv__(PLL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_277))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_283), __deriv__(PBL))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_283))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_294), __deriv__(PBB))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_294))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
