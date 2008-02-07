
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) ALPHA
      REAL(w2f__8) AREA(1 : 3)
      REAL(w2f__8) BETA
      REAL(w2f__8) BHEIGHT(1 : 3)
      REAL(w2f__8) BLENGTH(1 : 3)
      REAL(w2f__8) BWIDTH
      REAL(w2f__8) DAY
      REAL(w2f__8) DAYS_PER_50M_MIXED_LAYER
      REAL(w2f__8) DELTA
      REAL(w2f__8) DELTA_T
      REAL(w2f__8) EPSILON_IC
      REAL(w2f__8) EPSILON_REGULARIZE
      REAL(w2f__8) FDEPS
      REAL(w2f__8) FW(1 : 2)
      REAL(w2f__8) GAMMA_S
      REAL(w2f__8) GAMMA_T
      REAL(w2f__8) HUNDRED
      REAL(w2f__8) INTEGRATION_TIME
      REAL(w2f__8) METRIC
      REAL(w2f__8) METRIC1
      REAL(w2f__8) METRIC2
      REAL(w2f__8) NOISE_CORRELATION_TIME
      REAL(w2f__8) NULLFORCE(1 : 2)
      INTEGER(w2f__i4) N_MAX
      REAL(w2f__8) PROJ_S(1 : 6)
      REAL(w2f__8) PROJ_T(1 : 6)
      REAL(w2f__8) R(1 : 6)
      REAL(w2f__8) R1(1 : 6)
      TYPE (OpenADTy_active) RHO(1 : 3)
      REAL(w2f__8) ROBERT_FILTER_COEFF
      REAL(w2f__8) R_S(1 : 6)
      REAL(w2f__8) R_T(1 : 6)
      TYPE (OpenADTy_active) S(1 : 3)
      TYPE (OpenADTy_active) SNEW(1 : 3)
      TYPE (OpenADTy_active) SNOW(1 : 3)
      TYPE (OpenADTy_active) SOLD(1 : 3)
      REAL(w2f__8) SSTAR(1 : 2)
      REAL(w2f__8) SV
      TYPE (OpenADTy_active) T(1 : 3)
      REAL(w2f__8) THC_S
      REAL(w2f__8) THC_T
      REAL(w2f__8) THC_TOT
      REAL(w2f__8) THOUSAND
      TYPE (OpenADTy_active) TNEW(1 : 3)
      TYPE (OpenADTy_active) TNOW(1 : 3)
      TYPE (OpenADTy_active) TOLD(1 : 3)
      REAL(w2f__8) TSTAR(1 : 2)
      REAL(w2f__8) TSVEC(1 : 6)
      REAL(w2f__8) U0
      REAL(w2f__8) UBAR
      TYPE (OpenADTy_active) UVEL
      LOGICAL(w2f__i4) VERBMODE
      REAL(w2f__8) VOL(1 : 3)
      REAL(w2f__8) X(1 : 6, 1 : 6)
      TYPE (OpenADTy_active) XX(1 : 6)
      REAL(w2f__8) Y(1 : 6)
      REAL(w2f__8) YEAR
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) NDIM
      PARAMETER ( NDIM = 3)
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE box_forward(ILEV1)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
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
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) ILEV1
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_cycle_fields
      EXTERNAL box_density
      EXTERNAL box_robert_filter
      EXTERNAL box_timestep
      EXTERNAL box_transport
      INTEGER(w2f__i4) IKEY
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_365
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      IKEY = ILEV1
      CALL box_density(__deriv__(TNOW), __deriv__(SNOW), __deriv__(RHO)
     > )
      CALL box_transport(__deriv__(RHO), __deriv__(UVEL))
      CALL box_timestep(GAMMA_T, TSTAR, NULLFORCE, __deriv__(UVEL),
     >  __deriv__(TNOW), __deriv__(TOLD), __deriv__(TNEW))
      CALL box_timestep(GAMMA_S, SSTAR, FW, __deriv__(UVEL), __deriv__(
     > SNOW), __deriv__(SOLD), __deriv__(SNEW))
      CALL box_robert_filter(__deriv__(TNOW), __deriv__(TOLD),
     >  __deriv__(TNEW))
      CALL box_robert_filter(__deriv__(SNOW), __deriv__(SOLD),
     >  __deriv__(SNEW))
      CALL box_cycle_fields()
      DO L = 1, 3, 1
        IF(__value__(TNOW(L)) .LT.(-2.0D00)) THEN
          __value__(TNOW(INT(L))) = 2.0
        ENDIF
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      IKEY = ILEV1
      CALL box_density(__deriv__(TNOW), __deriv__(SNOW), __deriv__(RHO)
     > )
      CALL box_transport(__deriv__(RHO), __deriv__(UVEL))
      CALL box_timestep(GAMMA_T, TSTAR, NULLFORCE, __deriv__(UVEL),
     >  __deriv__(TNOW), __deriv__(TOLD), __deriv__(TNEW))
      CALL box_timestep(GAMMA_S, SSTAR, FW, __deriv__(UVEL), __deriv__(
     > SNOW), __deriv__(SOLD), __deriv__(SNEW))
      CALL box_robert_filter(__deriv__(TNOW), __deriv__(TOLD),
     >  __deriv__(TNEW))
      CALL box_robert_filter(__deriv__(SNOW), __deriv__(SOLD),
     >  __deriv__(SNEW))
      CALL box_cycle_fields()
      OpenAD_Symbol_217 = 0_w2f__i8
      DO L = 1, 3, 1
        IF(__value__(TNOW(L)) .LT.(-2.0D00)) THEN
          __value__(TNOW(INT(L))) = 2.0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(L)
          OpenAD_Symbol_218 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_218)
        ELSE
          OpenAD_Symbol_219 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_219)
        ENDIF
        OpenAD_Symbol_217 = (INT(OpenAD_Symbol_217) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_217)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_214)
      OpenAD_Symbol_215 = 1
      DO WHILE(INT(OpenAD_Symbol_215) .LE. INT(OpenAD_Symbol_214))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_216)
        IF(OpenAD_Symbol_216 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_365)
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_365))))
        ENDIF
        OpenAD_Symbol_215 = INT(OpenAD_Symbol_215) + 1
      END DO
      CALL box_cycle_fields()
      CALL box_robert_filter(__deriv__(SNOW), __deriv__(SOLD),
     >  __deriv__(SNEW))
      CALL box_robert_filter(__deriv__(TNOW), __deriv__(TOLD),
     >  __deriv__(TNEW))
      CALL box_timestep(GAMMA_S, SSTAR, FW, __deriv__(UVEL), __deriv__(
     > SNOW), __deriv__(SOLD), __deriv__(SNEW))
      CALL box_timestep(GAMMA_T, TSTAR, NULLFORCE, __deriv__(UVEL),
     >  __deriv__(TNOW), __deriv__(TOLD), __deriv__(TNEW))
      CALL box_transport(__deriv__(RHO), __deriv__(UVEL))
      CALL box_density(__deriv__(TNOW), __deriv__(SNOW), __deriv__(RHO)
     > )
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMA_S)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(ILEV1)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(VOL)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(ILEV1)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMA_S)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(ILEV1)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(ILEV1)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      IKEY = ILEV1
      CALL box_density(__deriv__(TNOW), __deriv__(SNOW), __deriv__(RHO)
     > )
      CALL box_transport(__deriv__(RHO), __deriv__(UVEL))
      CALL box_timestep(GAMMA_T, TSTAR, NULLFORCE, __deriv__(UVEL),
     >  __deriv__(TNOW), __deriv__(TOLD), __deriv__(TNEW))
      CALL box_timestep(GAMMA_S, SSTAR, FW, __deriv__(UVEL), __deriv__(
     > SNOW), __deriv__(SOLD), __deriv__(SNEW))
      CALL box_robert_filter(__deriv__(TNOW), __deriv__(TOLD),
     >  __deriv__(TNEW))
      CALL box_robert_filter(__deriv__(SNOW), __deriv__(SOLD),
     >  __deriv__(SNEW))
      CALL box_cycle_fields()
      OpenAD_Symbol_223 = 0_w2f__i8
      DO L = 1, 3, 1
        IF(__value__(TNOW(L)) .LT.(-2.0D00)) THEN
          __value__(TNOW(INT(L))) = 2.0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(L)
          OpenAD_Symbol_224 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_224)
        ELSE
          OpenAD_Symbol_225 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_225)
        ENDIF
        OpenAD_Symbol_223 = (INT(OpenAD_Symbol_223) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_223)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_220)
      OpenAD_Symbol_221 = 1
      DO WHILE(INT(OpenAD_Symbol_221) .LE. INT(OpenAD_Symbol_220))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_222)
        IF(OpenAD_Symbol_222 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_365)
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_365))))
        ENDIF
        OpenAD_Symbol_221 = INT(OpenAD_Symbol_221) + 1
      END DO
      CALL box_cycle_fields()
      CALL box_robert_filter(__deriv__(SNOW), __deriv__(SOLD),
     >  __deriv__(SNEW))
      CALL box_robert_filter(__deriv__(TNOW), __deriv__(TOLD),
     >  __deriv__(TNEW))
      CALL box_timestep(GAMMA_S, SSTAR, FW, __deriv__(UVEL), __deriv__(
     > SNOW), __deriv__(SOLD), __deriv__(SNEW))
      CALL box_timestep(GAMMA_T, TSTAR, NULLFORCE, __deriv__(UVEL),
     >  __deriv__(TNOW), __deriv__(TOLD), __deriv__(TNEW))
      CALL box_transport(__deriv__(RHO), __deriv__(UVEL))
      CALL box_density(__deriv__(TNOW), __deriv__(SNOW), __deriv__(RHO)
     > )
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_final_state()
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
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
      INTEGER(w2f__i8) OpenAD_Symbol_260
      INTEGER(w2f__i8) OpenAD_Symbol_261
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
      END DO
      DO L = 1, 3, 1
        TSVEC(INT(L)) = __value__(TNOW(L))
        TSVEC(INT(L + 3)) = __value__(SNOW(L))
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_254 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_254 = (INT(OpenAD_Symbol_254) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_254)
      OpenAD_Symbol_255 = 0_w2f__i8
      DO L = 1, 3, 1
        TSVEC(INT(L)) = __value__(TNOW(L))
        TSVEC(INT(L + 3)) = __value__(SNOW(L))
        OpenAD_Symbol_255 = (INT(OpenAD_Symbol_255) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_255)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_250)
      OpenAD_Symbol_251 = 1
      DO WHILE(INT(OpenAD_Symbol_251) .LE. INT(OpenAD_Symbol_250))
        OpenAD_Symbol_251 = INT(OpenAD_Symbol_251) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_252)
      OpenAD_Symbol_253 = 1
      DO WHILE(INT(OpenAD_Symbol_253) .LE. INT(OpenAD_Symbol_252))
        OpenAD_Symbol_253 = INT(OpenAD_Symbol_253) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSVEC)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSVEC)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_260 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_260 = (INT(OpenAD_Symbol_260) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_260)
      OpenAD_Symbol_261 = 0_w2f__i8
      DO L = 1, 3, 1
        TSVEC(INT(L)) = __value__(TNOW(L))
        TSVEC(INT(L + 3)) = __value__(SNOW(L))
        OpenAD_Symbol_261 = (INT(OpenAD_Symbol_261) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_261)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_256)
      OpenAD_Symbol_257 = 1
      DO WHILE(INT(OpenAD_Symbol_257) .LE. INT(OpenAD_Symbol_256))
        OpenAD_Symbol_257 = INT(OpenAD_Symbol_257) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_258)
      OpenAD_Symbol_259 = 1
      DO WHILE(INT(OpenAD_Symbol_259) .LE. INT(OpenAD_Symbol_258))
        OpenAD_Symbol_259 = INT(OpenAD_Symbol_259) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_ini_fields()
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_206
      TYPE (OpenADTy_active) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      TYPE (OpenADTy_active) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      INTEGER(w2f__i8) OpenAD_Symbol_262
      INTEGER(w2f__i8) OpenAD_Symbol_263
      INTEGER(w2f__i8) OpenAD_Symbol_264
      INTEGER(w2f__i8) OpenAD_Symbol_265
      INTEGER(w2f__i8) OpenAD_Symbol_266
      INTEGER(w2f__i8) OpenAD_Symbol_267
      INTEGER(w2f__i8) OpenAD_Symbol_268
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
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_280
      INTEGER(w2f__i8) OpenAD_Symbol_417
      INTEGER(w2f__i8) OpenAD_Symbol_418
      REAL(w2f__8) OpenAD_Symbol_419
      INTEGER(w2f__i8) OpenAD_Symbol_420
      REAL(w2f__8) OpenAD_Symbol_421
      INTEGER(w2f__i8) OpenAD_Symbol_422
      INTEGER(w2f__i8) OpenAD_Symbol_423
      REAL(w2f__8) OpenAD_Symbol_424
      INTEGER(w2f__i8) OpenAD_Symbol_425
      REAL(w2f__8) OpenAD_Symbol_426
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
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      THC_TOT = 0.0D00
      THC_T = 0.0D00
      THC_S = 0.0D00
      METRIC1 = 0.0D00
      METRIC2 = 0.0D00
      METRIC = 0.0D00
      NULLFORCE(1) = 0.0D00
      NULLFORCE(2) = 0.0D00
      FW(1) = (AREA(1) *(HUNDRED / YEAR) * 3.5D+01)
      FW(2) = (- FW(1))
      TSTAR(1) = 2.2D+01
      TSTAR(2) = 0.0D00
      SSTAR(1) = 3.6D+01
      SSTAR(2) = 3.4D+01
      UBAR = (SV * 2.0D+01)
      __value__(T(1)) = 2.0D+01
      __value__(T(2)) = 1.0D00
      __value__(T(3)) = 1.0D00
      __value__(S(1)) = 3.55D+01
      __value__(S(2)) = 3.45D+01
      __value__(S(3)) = 3.45D+01
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
      END DO
      DO L = 1, 3, 1
        __value__(T(INT(L))) = (__value__(T(L)) + __value__(XX(L)))
        __value__(S(INT(L))) = (__value__(S(L)) + __value__(XX(L + 3)))
      END DO
      DO L = 1, 3, 1
        __value__(TNEW(INT(L))) = __value__(T(L))
        __value__(SNEW(INT(L))) = __value__(S(L))
        __value__(TOLD(INT(L))) = __value__(T(L))
        __value__(SOLD(INT(L))) = __value__(S(L))
        __value__(TNOW(INT(L))) = __value__(T(L))
        __value__(SNOW(INT(L))) = __value__(S(L))
      END DO
      __value__(UVEL) = UBAR
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      THC_TOT = 0.0D00
      THC_T = 0.0D00
      THC_S = 0.0D00
      METRIC1 = 0.0D00
      METRIC2 = 0.0D00
      METRIC = 0.0D00
      NULLFORCE(1) = 0.0D00
      NULLFORCE(2) = 0.0D00
      FW(1) = (AREA(1) *(HUNDRED / YEAR) * 3.5D+01)
      FW(2) = (- FW(1))
      TSTAR(1) = 2.2D+01
      TSTAR(2) = 0.0D00
      SSTAR(1) = 3.6D+01
      SSTAR(2) = 3.4D+01
      UBAR = (SV * 2.0D+01)
      __value__(T(1)) = 2.0D+01
      __value__(T(2)) = 1.0D00
      __value__(T(3)) = 1.0D00
      __value__(S(1)) = 3.55D+01
      __value__(S(2)) = 3.45D+01
      __value__(S(3)) = 3.45D+01
      OpenAD_Symbol_268 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_268 = (INT(OpenAD_Symbol_268) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_268)
      OpenAD_Symbol_269 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(T(INT(L))) = (__value__(T(L)) + __value__(XX(L)))
        OpenAD_Symbol_128 = 1_w2f__i8
        OpenAD_Symbol_129 = 1_w2f__i8
        __value__(S(INT(L))) = (__value__(S(L)) + __value__(XX(L + 3)))
        OpenAD_Symbol_130 = 1_w2f__i8
        OpenAD_Symbol_131 = 1_w2f__i8
        OpenAD_Symbol_206 = OpenAD_Symbol_128
        OpenAD_Symbol_208 = OpenAD_Symbol_129
        OpenAD_Symbol_209 = OpenAD_Symbol_130
        OpenAD_Symbol_211 = OpenAD_Symbol_131
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_206)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_208)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_209)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_211)
        OpenAD_Symbol_280 = (L + 3)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_280)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_269 = (INT(OpenAD_Symbol_269) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_269)
      OpenAD_Symbol_270 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(TNEW(INT(L))) = __value__(T(L))
        __value__(SNEW(INT(L))) = __value__(S(L))
        __value__(TOLD(INT(L))) = __value__(T(L))
        __value__(SOLD(INT(L))) = __value__(S(L))
        __value__(TNOW(INT(L))) = __value__(T(L))
        __value__(SNOW(INT(L))) = __value__(S(L))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_270 = (INT(OpenAD_Symbol_270) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_270)
      __value__(UVEL) = UBAR
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVEL))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_262)
      OpenAD_Symbol_263 = 1
      DO WHILE(INT(OpenAD_Symbol_263) .LE. INT(OpenAD_Symbol_262))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_429)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_430)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_429))),
     >  __deriv__(S(INT(OpenAD_Symbol_430))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_429))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_431)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_432)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_431))),
     >  __deriv__(T(INT(OpenAD_Symbol_432))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_431))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_433)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_434)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_433))),
     >  __deriv__(S(INT(OpenAD_Symbol_434))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_433))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_435)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_436)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_435))),
     >  __deriv__(T(INT(OpenAD_Symbol_436))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_435))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_437)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_438)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SNEW(INT(OpenAD_Symbol_437))),
     >  __deriv__(S(INT(OpenAD_Symbol_438))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SNEW(INT(OpenAD_Symbol_437))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_439)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_440)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TNEW(INT(OpenAD_Symbol_439))),
     >  __deriv__(T(INT(OpenAD_Symbol_440))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TNEW(INT(OpenAD_Symbol_439))))
        OpenAD_Symbol_263 = INT(OpenAD_Symbol_263) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_264)
      OpenAD_Symbol_265 = 1
      DO WHILE(INT(OpenAD_Symbol_265) .LE. INT(OpenAD_Symbol_264))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_417)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_418)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_419)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_419, __deriv__(S(INT(OpenAD_Symbol_417
     > ))), __deriv__(XX(INT(OpenAD_Symbol_418))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_420)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_421)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_421, __deriv__(S(INT(OpenAD_Symbol_420
     > ))), __deriv__(OpenAD_Symbol_210))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(S(INT(OpenAD_Symbol_420))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_422)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_423)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_424)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_424, __deriv__(T(INT(OpenAD_Symbol_422
     > ))), __deriv__(XX(INT(OpenAD_Symbol_423))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_425)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_426)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_426, __deriv__(T(INT(OpenAD_Symbol_425
     > ))), __deriv__(OpenAD_Symbol_207))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(T(INT(OpenAD_Symbol_425))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_427)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_207), __deriv__(T(INT(
     > OpenAD_Symbol_427))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_207))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_428)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_210), __deriv__(S(INT(
     > OpenAD_Symbol_428))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_210))
        OpenAD_Symbol_265 = INT(OpenAD_Symbol_265) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_266)
      OpenAD_Symbol_267 = 1
      DO WHILE(INT(OpenAD_Symbol_267) .LE. INT(OpenAD_Symbol_266))
        OpenAD_Symbol_267 = INT(OpenAD_Symbol_267) + 1
      END DO
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(S(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(S(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(S(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T(1)))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(XX))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(XX))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HUNDRED)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(METRIC)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(METRIC1)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(METRIC2)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THC_S)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THC_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THC_TOT)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSVEC)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(XX))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(XX))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSVEC)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THC_TOT)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THC_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THC_S)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(METRIC2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(METRIC1)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(METRIC)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      THC_TOT = 0.0D00
      THC_T = 0.0D00
      THC_S = 0.0D00
      METRIC1 = 0.0D00
      METRIC2 = 0.0D00
      METRIC = 0.0D00
      NULLFORCE(1) = 0.0D00
      NULLFORCE(2) = 0.0D00
      FW(1) = (AREA(1) *(HUNDRED / YEAR) * 3.5D+01)
      FW(2) = (- FW(1))
      TSTAR(1) = 2.2D+01
      TSTAR(2) = 0.0D00
      SSTAR(1) = 3.6D+01
      SSTAR(2) = 3.4D+01
      UBAR = (SV * 2.0D+01)
      __value__(T(1)) = 2.0D+01
      __value__(T(2)) = 1.0D00
      __value__(T(3)) = 1.0D00
      __value__(S(1)) = 3.55D+01
      __value__(S(2)) = 3.45D+01
      __value__(S(3)) = 3.45D+01
      OpenAD_Symbol_277 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_277 = (INT(OpenAD_Symbol_277) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_277)
      OpenAD_Symbol_278 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(T(INT(L))) = (__value__(T(L)) + __value__(XX(L)))
        OpenAD_Symbol_128 = 1_w2f__i8
        OpenAD_Symbol_129 = 1_w2f__i8
        __value__(S(INT(L))) = (__value__(S(L)) + __value__(XX(L + 3)))
        OpenAD_Symbol_130 = 1_w2f__i8
        OpenAD_Symbol_131 = 1_w2f__i8
        OpenAD_Symbol_206 = OpenAD_Symbol_128
        OpenAD_Symbol_208 = OpenAD_Symbol_129
        OpenAD_Symbol_209 = OpenAD_Symbol_130
        OpenAD_Symbol_211 = OpenAD_Symbol_131
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_206)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_208)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_209)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_211)
        OpenAD_Symbol_280 = (L + 3)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_280)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_278 = (INT(OpenAD_Symbol_278) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_278)
      OpenAD_Symbol_279 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(TNEW(INT(L))) = __value__(T(L))
        __value__(SNEW(INT(L))) = __value__(S(L))
        __value__(TOLD(INT(L))) = __value__(T(L))
        __value__(SOLD(INT(L))) = __value__(S(L))
        __value__(TNOW(INT(L))) = __value__(T(L))
        __value__(SNOW(INT(L))) = __value__(S(L))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_279 = (INT(OpenAD_Symbol_279) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_279)
      __value__(UVEL) = UBAR
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVEL))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_271)
      OpenAD_Symbol_272 = 1
      DO WHILE(INT(OpenAD_Symbol_272) .LE. INT(OpenAD_Symbol_271))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_429)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_430)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_429))),
     >  __deriv__(S(INT(OpenAD_Symbol_430))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_429))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_431)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_432)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_431))),
     >  __deriv__(T(INT(OpenAD_Symbol_432))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_431))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_433)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_434)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_433))),
     >  __deriv__(S(INT(OpenAD_Symbol_434))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_433))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_435)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_436)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_435))),
     >  __deriv__(T(INT(OpenAD_Symbol_436))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_435))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_437)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_438)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SNEW(INT(OpenAD_Symbol_437))),
     >  __deriv__(S(INT(OpenAD_Symbol_438))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SNEW(INT(OpenAD_Symbol_437))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_439)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_440)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TNEW(INT(OpenAD_Symbol_439))),
     >  __deriv__(T(INT(OpenAD_Symbol_440))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TNEW(INT(OpenAD_Symbol_439))))
        OpenAD_Symbol_272 = INT(OpenAD_Symbol_272) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_273)
      OpenAD_Symbol_274 = 1
      DO WHILE(INT(OpenAD_Symbol_274) .LE. INT(OpenAD_Symbol_273))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_417)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_418)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_419)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_419, __deriv__(S(INT(OpenAD_Symbol_417
     > ))), __deriv__(XX(INT(OpenAD_Symbol_418))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_420)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_421)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_421, __deriv__(S(INT(OpenAD_Symbol_420
     > ))), __deriv__(OpenAD_Symbol_210))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(S(INT(OpenAD_Symbol_420))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_422)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_423)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_424)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_424, __deriv__(T(INT(OpenAD_Symbol_422
     > ))), __deriv__(XX(INT(OpenAD_Symbol_423))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_425)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_426)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_426, __deriv__(T(INT(OpenAD_Symbol_425
     > ))), __deriv__(OpenAD_Symbol_207))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(T(INT(OpenAD_Symbol_425))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_427)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_207), __deriv__(T(INT(
     > OpenAD_Symbol_427))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_207))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_428)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_210), __deriv__(S(INT(
     > OpenAD_Symbol_428))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_210))
        OpenAD_Symbol_274 = INT(OpenAD_Symbol_274) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_275)
      OpenAD_Symbol_276 = 1
      DO WHILE(INT(OpenAD_Symbol_276) .LE. INT(OpenAD_Symbol_275))
        OpenAD_Symbol_276 = INT(OpenAD_Symbol_276) + 1
      END DO
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(S(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(S(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(S(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(T(1)))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_ini_params()
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
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
      INTEGER(w2f__i8) OpenAD_Symbol_297
      INTEGER(w2f__i8) OpenAD_Symbol_298
      INTEGER(w2f__i8) OpenAD_Symbol_299
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
      INTEGER(w2f__i8) OpenAD_Symbol_320
      INTEGER(w2f__i8) OpenAD_Symbol_321
      INTEGER(w2f__i8) OpenAD_Symbol_322
      INTEGER(w2f__i8) OpenAD_Symbol_323
      INTEGER(w2f__i8) OpenAD_Symbol_324
      INTEGER(w2f__i8) OpenAD_Symbol_325
      INTEGER(w2f__i8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      VERBMODE = .FALSE.
      BLENGTH(1) = 5.0D+08
      BLENGTH(2) = 1.0D+08
      BLENGTH(3) = BLENGTH(1)
      BHEIGHT(1) = 1.0D+05
      BHEIGHT(3) = 4.0D+05
      BHEIGHT(2) = (BHEIGHT(1) + BHEIGHT(3))
      DELTA = (BHEIGHT(1) /(BHEIGHT(1) + BHEIGHT(3)))
      BWIDTH = 4.0D+08
      AREA(1) = (BLENGTH(1) * BWIDTH)
      AREA(2) = (BLENGTH(2) * BWIDTH)
      AREA(3) = (BLENGTH(3) * BWIDTH)
      VOL(1) = (AREA(1) * BHEIGHT(1))
      VOL(2) = (AREA(2) *(BHEIGHT(1) + BHEIGHT(3)))
      VOL(3) = (AREA(3) * BHEIGHT(3))
      ROBERT_FILTER_COEFF = 2.5D-01
      HUNDRED = 1.0D+02
      THOUSAND = 1.0D+03
      DAY = 8.64D+04
      YEAR = (DAY * 3.65D+02)
      SV = 1.0D+12
      U0 = ((SV * 1.6D+01) / 4.00000000000000019169D-04)
      ALPHA = 1.6679999999999998864D-04
      BETA = 7.81000000000000010186D-04
      DAYS_PER_50M_MIXED_LAYER = 5.0D+01
      GAMMA_T = (1.0D00 /(DAY * 3.0D+02))
      GAMMA_S = (0.0D00 /((BHEIGHT(1) / 5.0D+03) * DAY *
     >  DAYS_PER_50M_MIXED_LAYER))
      EPSILON_IC = (-1.00000000000000004792D-04)
      NOISE_CORRELATION_TIME = (DAY * 1.5D+01)
      DELTA_T = (DAY * 5.0D00)
      INTEGRATION_TIME = (YEAR * 5.0D+01)
      N_MAX = INT((INTEGRATION_TIME / DELTA_T))
      FDEPS = 9.99999999999999954748D-07
      Y(1) = (THOUSAND / 3.2680000000000000715D-02)
      Y(2) = (THOUSAND / 7.9399999999999991418D-03)
      Y(3) = (THOUSAND / 1.39999999999999998578D-03)
      Y(4) = (THOUSAND / 1.41699999999999992628D-01)
      Y(5) = (THOUSAND / 1.28599999999999992095D-01)
      Y(6) = (THOUSAND / 8.7800000000000003042D-02)
      R(1) = (ALPHA * DELTA)
      R(2) = (- ALPHA)
      R(3) = (ALPHA *(1.0D00 - DELTA))
      R(4) = (-(BETA * DELTA))
      R(5) = BETA
      R(6) = (-(BETA *(1.0D00 - DELTA)))
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
      END DO
      DO L = 1, 6, 1
        IF(L .LE. 3) THEN
          PROJ_T(INT(L)) = 1.0
          PROJ_S(INT(L)) = 0.0
        ELSE
          PROJ_T(INT(L)) = 0.0
          PROJ_S(INT(L)) = 1.0
        ENDIF
      END DO
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
      END DO
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      DO J = 1, 6, 1
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
        END DO
      END DO
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      DO J = 1, 6, 1
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
        END DO
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      VERBMODE = .FALSE.
      BLENGTH(1) = 5.0D+08
      BLENGTH(2) = 1.0D+08
      BLENGTH(3) = BLENGTH(1)
      BHEIGHT(1) = 1.0D+05
      BHEIGHT(3) = 4.0D+05
      BHEIGHT(2) = (BHEIGHT(1) + BHEIGHT(3))
      DELTA = (BHEIGHT(1) /(BHEIGHT(1) + BHEIGHT(3)))
      BWIDTH = 4.0D+08
      AREA(1) = (BLENGTH(1) * BWIDTH)
      AREA(2) = (BLENGTH(2) * BWIDTH)
      AREA(3) = (BLENGTH(3) * BWIDTH)
      VOL(1) = (AREA(1) * BHEIGHT(1))
      VOL(2) = (AREA(2) *(BHEIGHT(1) + BHEIGHT(3)))
      VOL(3) = (AREA(3) * BHEIGHT(3))
      ROBERT_FILTER_COEFF = 2.5D-01
      HUNDRED = 1.0D+02
      THOUSAND = 1.0D+03
      DAY = 8.64D+04
      YEAR = (DAY * 3.65D+02)
      SV = 1.0D+12
      U0 = ((SV * 1.6D+01) / 4.00000000000000019169D-04)
      ALPHA = 1.6679999999999998864D-04
      BETA = 7.81000000000000010186D-04
      DAYS_PER_50M_MIXED_LAYER = 5.0D+01
      GAMMA_T = (1.0D00 /(DAY * 3.0D+02))
      GAMMA_S = (0.0D00 /((BHEIGHT(1) / 5.0D+03) * DAY *
     >  DAYS_PER_50M_MIXED_LAYER))
      EPSILON_IC = (-1.00000000000000004792D-04)
      NOISE_CORRELATION_TIME = (DAY * 1.5D+01)
      DELTA_T = (DAY * 5.0D00)
      INTEGRATION_TIME = (YEAR * 5.0D+01)
      N_MAX = INT((INTEGRATION_TIME / DELTA_T))
      FDEPS = 9.99999999999999954748D-07
      Y(1) = (THOUSAND / 3.2680000000000000715D-02)
      Y(2) = (THOUSAND / 7.9399999999999991418D-03)
      Y(3) = (THOUSAND / 1.39999999999999998578D-03)
      Y(4) = (THOUSAND / 1.41699999999999992628D-01)
      Y(5) = (THOUSAND / 1.28599999999999992095D-01)
      Y(6) = (THOUSAND / 8.7800000000000003042D-02)
      R(1) = (ALPHA * DELTA)
      R(2) = (- ALPHA)
      R(3) = (ALPHA *(1.0D00 - DELTA))
      R(4) = (-(BETA * DELTA))
      R(5) = BETA
      R(6) = (-(BETA *(1.0D00 - DELTA)))
      OpenAD_Symbol_296 = 0_w2f__i8
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
        OpenAD_Symbol_296 = (INT(OpenAD_Symbol_296) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_296)
      OpenAD_Symbol_297 = 0_w2f__i8
      DO L = 1, 6, 1
        IF(L .LE. 3) THEN
          PROJ_T(INT(L)) = 1.0
          PROJ_S(INT(L)) = 0.0
          OpenAD_Symbol_298 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_298)
        ELSE
          PROJ_T(INT(L)) = 0.0
          PROJ_S(INT(L)) = 1.0
          OpenAD_Symbol_299 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_299)
        ENDIF
        OpenAD_Symbol_297 = (INT(OpenAD_Symbol_297) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_297)
      OpenAD_Symbol_300 = 0_w2f__i8
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
        OpenAD_Symbol_300 = (INT(OpenAD_Symbol_300) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_300)
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      OpenAD_Symbol_301 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_302 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
          OpenAD_Symbol_302 = (INT(OpenAD_Symbol_302) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_302)
        OpenAD_Symbol_301 = (INT(OpenAD_Symbol_301) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_301)
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      OpenAD_Symbol_303 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_304 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
          OpenAD_Symbol_304 = (INT(OpenAD_Symbol_304) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_304)
        OpenAD_Symbol_303 = (INT(OpenAD_Symbol_303) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_303)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_281)
      OpenAD_Symbol_282 = 1
      DO WHILE(INT(OpenAD_Symbol_282) .LE. INT(OpenAD_Symbol_281))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_283)
        OpenAD_Symbol_284 = 1
        DO WHILE(INT(OpenAD_Symbol_284) .LE. INT(OpenAD_Symbol_283))
          OpenAD_Symbol_284 = INT(OpenAD_Symbol_284) + 1
        END DO
        OpenAD_Symbol_282 = INT(OpenAD_Symbol_282) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_285)
      OpenAD_Symbol_286 = 1
      DO WHILE(INT(OpenAD_Symbol_286) .LE. INT(OpenAD_Symbol_285))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_287)
        OpenAD_Symbol_288 = 1
        DO WHILE(INT(OpenAD_Symbol_288) .LE. INT(OpenAD_Symbol_287))
          OpenAD_Symbol_288 = INT(OpenAD_Symbol_288) + 1
        END DO
        OpenAD_Symbol_286 = INT(OpenAD_Symbol_286) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_289)
      OpenAD_Symbol_290 = 1
      DO WHILE(INT(OpenAD_Symbol_290) .LE. INT(OpenAD_Symbol_289))
        OpenAD_Symbol_290 = INT(OpenAD_Symbol_290) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_291)
      OpenAD_Symbol_292 = 1
      DO WHILE(INT(OpenAD_Symbol_292) .LE. INT(OpenAD_Symbol_291))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_293)
        IF(OpenAD_Symbol_293 .ne. 0) THEN
        ENDIF
        OpenAD_Symbol_292 = INT(OpenAD_Symbol_292) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_294)
      OpenAD_Symbol_295 = 1
      DO WHILE(INT(OpenAD_Symbol_295) .LE. INT(OpenAD_Symbol_294))
        OpenAD_Symbol_295 = INT(OpenAD_Symbol_295) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BWIDTH)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DAY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DAYS_PER_50M_MIXED_LAYER)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(EPSILON_REGULARIZE)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(INTEGRATION_TIME)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THOUSAND)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(BHEIGHT)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(BLENGTH)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(PROJ_S)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(PROJ_T)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(R)
C     $OpenAD$ INLINE cp_arg_store_real_matrix(subst)
      CALL cp_arg_store_real_matrix(X)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_matrix(subst)
      CALL cp_arg_restore_real_matrix(X)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(R)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(PROJ_T)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(PROJ_S)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(BLENGTH)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(BHEIGHT)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THOUSAND)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(INTEGRATION_TIME)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(EPSILON_REGULARIZE)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DAYS_PER_50M_MIXED_LAYER)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DAY)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BWIDTH)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BWIDTH)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DAY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DAYS_PER_50M_MIXED_LAYER)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(EPSILON_IC)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(EPSILON_REGULARIZE)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(FDEPS)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMA_S)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(INTEGRATION_TIME)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(NOISE_CORRELATION_TIME)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(N_MAX)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THOUSAND)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_bool_scalar(subst)
      CALL cp_arg_store_bool_scalar(VERBMODE)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(BHEIGHT)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(BLENGTH)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(PROJ_S)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(PROJ_T)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(R)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(R1)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(R_S)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(R_T)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_store_real_matrix(subst)
      CALL cp_arg_store_real_matrix(X)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(Y)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BWIDTH)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DAY)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DAYS_PER_50M_MIXED_LAYER)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(EPSILON_REGULARIZE)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(INTEGRATION_TIME)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THOUSAND)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(BHEIGHT)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(BLENGTH)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(PROJ_S)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(PROJ_T)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(R)
C     $OpenAD$ INLINE cp_arg_store_real_matrix(subst)
      CALL cp_arg_store_real_matrix(X)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_matrix(subst)
      CALL cp_arg_restore_real_matrix(X)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(R)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(PROJ_T)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(PROJ_S)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(BLENGTH)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(BHEIGHT)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THOUSAND)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(INTEGRATION_TIME)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(EPSILON_REGULARIZE)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DAYS_PER_50M_MIXED_LAYER)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DAY)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BWIDTH)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(Y)
C     $OpenAD$ INLINE cp_arg_restore_real_matrix(subst)
      CALL cp_arg_restore_real_matrix(X)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(R_T)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(R_S)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(R1)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(R)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(PROJ_T)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(PROJ_S)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(BLENGTH)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(BHEIGHT)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_restore_bool_scalar(subst)
      CALL cp_arg_restore_bool_scalar(VERBMODE)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THOUSAND)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(N_MAX)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(NOISE_CORRELATION_TIME)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(INTEGRATION_TIME)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMA_S)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(FDEPS)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(EPSILON_REGULARIZE)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(EPSILON_IC)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DAYS_PER_50M_MIXED_LAYER)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DAY)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BWIDTH)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      VERBMODE = .FALSE.
      BLENGTH(1) = 5.0D+08
      BLENGTH(2) = 1.0D+08
      BLENGTH(3) = BLENGTH(1)
      BHEIGHT(1) = 1.0D+05
      BHEIGHT(3) = 4.0D+05
      BHEIGHT(2) = (BHEIGHT(1) + BHEIGHT(3))
      DELTA = (BHEIGHT(1) /(BHEIGHT(1) + BHEIGHT(3)))
      BWIDTH = 4.0D+08
      AREA(1) = (BLENGTH(1) * BWIDTH)
      AREA(2) = (BLENGTH(2) * BWIDTH)
      AREA(3) = (BLENGTH(3) * BWIDTH)
      VOL(1) = (AREA(1) * BHEIGHT(1))
      VOL(2) = (AREA(2) *(BHEIGHT(1) + BHEIGHT(3)))
      VOL(3) = (AREA(3) * BHEIGHT(3))
      ROBERT_FILTER_COEFF = 2.5D-01
      HUNDRED = 1.0D+02
      THOUSAND = 1.0D+03
      DAY = 8.64D+04
      YEAR = (DAY * 3.65D+02)
      SV = 1.0D+12
      U0 = ((SV * 1.6D+01) / 4.00000000000000019169D-04)
      ALPHA = 1.6679999999999998864D-04
      BETA = 7.81000000000000010186D-04
      DAYS_PER_50M_MIXED_LAYER = 5.0D+01
      GAMMA_T = (1.0D00 /(DAY * 3.0D+02))
      GAMMA_S = (0.0D00 /((BHEIGHT(1) / 5.0D+03) * DAY *
     >  DAYS_PER_50M_MIXED_LAYER))
      EPSILON_IC = (-1.00000000000000004792D-04)
      NOISE_CORRELATION_TIME = (DAY * 1.5D+01)
      DELTA_T = (DAY * 5.0D00)
      INTEGRATION_TIME = (YEAR * 5.0D+01)
      N_MAX = INT((INTEGRATION_TIME / DELTA_T))
      FDEPS = 9.99999999999999954748D-07
      Y(1) = (THOUSAND / 3.2680000000000000715D-02)
      Y(2) = (THOUSAND / 7.9399999999999991418D-03)
      Y(3) = (THOUSAND / 1.39999999999999998578D-03)
      Y(4) = (THOUSAND / 1.41699999999999992628D-01)
      Y(5) = (THOUSAND / 1.28599999999999992095D-01)
      Y(6) = (THOUSAND / 8.7800000000000003042D-02)
      R(1) = (ALPHA * DELTA)
      R(2) = (- ALPHA)
      R(3) = (ALPHA *(1.0D00 - DELTA))
      R(4) = (-(BETA * DELTA))
      R(5) = BETA
      R(6) = (-(BETA *(1.0D00 - DELTA)))
      OpenAD_Symbol_320 = 0_w2f__i8
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
        OpenAD_Symbol_320 = (INT(OpenAD_Symbol_320) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_320)
      OpenAD_Symbol_321 = 0_w2f__i8
      DO L = 1, 6, 1
        IF(L .LE. 3) THEN
          PROJ_T(INT(L)) = 1.0
          PROJ_S(INT(L)) = 0.0
          OpenAD_Symbol_322 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_322)
        ELSE
          PROJ_T(INT(L)) = 0.0
          PROJ_S(INT(L)) = 1.0
          OpenAD_Symbol_323 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_323)
        ENDIF
        OpenAD_Symbol_321 = (INT(OpenAD_Symbol_321) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_321)
      OpenAD_Symbol_324 = 0_w2f__i8
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
        OpenAD_Symbol_324 = (INT(OpenAD_Symbol_324) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_324)
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      OpenAD_Symbol_325 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_326 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
          OpenAD_Symbol_326 = (INT(OpenAD_Symbol_326) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_326)
        OpenAD_Symbol_325 = (INT(OpenAD_Symbol_325) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_325)
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      OpenAD_Symbol_327 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_328 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
          OpenAD_Symbol_328 = (INT(OpenAD_Symbol_328) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_328)
        OpenAD_Symbol_327 = (INT(OpenAD_Symbol_327) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_327)
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
          OpenAD_Symbol_308 = INT(OpenAD_Symbol_308) + 1
        END DO
        OpenAD_Symbol_306 = INT(OpenAD_Symbol_306) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_309)
      OpenAD_Symbol_310 = 1
      DO WHILE(INT(OpenAD_Symbol_310) .LE. INT(OpenAD_Symbol_309))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_311)
        OpenAD_Symbol_312 = 1
        DO WHILE(INT(OpenAD_Symbol_312) .LE. INT(OpenAD_Symbol_311))
          OpenAD_Symbol_312 = INT(OpenAD_Symbol_312) + 1
        END DO
        OpenAD_Symbol_310 = INT(OpenAD_Symbol_310) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_313)
      OpenAD_Symbol_314 = 1
      DO WHILE(INT(OpenAD_Symbol_314) .LE. INT(OpenAD_Symbol_313))
        OpenAD_Symbol_314 = INT(OpenAD_Symbol_314) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_315)
      OpenAD_Symbol_316 = 1
      DO WHILE(INT(OpenAD_Symbol_316) .LE. INT(OpenAD_Symbol_315))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_317)
        IF(OpenAD_Symbol_317 .ne. 0) THEN
        ENDIF
        OpenAD_Symbol_316 = INT(OpenAD_Symbol_316) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_318)
      OpenAD_Symbol_319 = 1
      DO WHILE(INT(OpenAD_Symbol_319) .LE. INT(OpenAD_Symbol_318))
        OpenAD_Symbol_319 = INT(OpenAD_Symbol_319) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_model_body()
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      INTEGER(w2f__i8) OpenAD_Symbol_329
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
      INTEGER(w2f__i8) OpenAD_Symbol_350
      INTEGER(w2f__i8) OpenAD_Symbol_351
      INTEGER(w2f__i8) OpenAD_Symbol_352
      INTEGER(w2f__i8) OpenAD_Symbol_353
      INTEGER(w2f__i8) OpenAD_Symbol_354
      INTEGER(w2f__i8) OpenAD_Symbol_355
      INTEGER(w2f__i8) OpenAD_Symbol_356
      INTEGER(w2f__i8) OpenAD_Symbol_357
      INTEGER(w2f__i8) OpenAD_Symbol_358
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_final_state
      EXTERNAL box_forward
      EXTERNAL box_ini_fields
      INTEGER(w2f__i4) ILEV1
      INTEGER(w2f__i4) ILEV2
      INTEGER(w2f__i4) ILOOP
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) MAXLEV2
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(XX)
C$OPENAD DEPENDENT(TNEW)
C$OPENAD DEPENDENT(SNEW)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      CALL box_ini_fields()
      MAXLEV2 = (N_MAX / 73) + 1
      IF(N_MAX .GT. 3650) THEN
        WRITE(*, *) 'NEED TO SET nlev1*nlev2 >= n_max '
      ELSE
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
              ENDIF
            END DO
          ENDIF
        END DO
        CALL box_final_state()
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      CALL box_ini_fields()
      MAXLEV2 = (N_MAX / 73) + 1
      IF(N_MAX .GT. 3650) THEN
        WRITE(*, *) 'NEED TO SET nlev1*nlev2 >= n_max '
        OpenAD_Symbol_342 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_342)
      ELSE
        OpenAD_Symbol_336 = 0_w2f__i8
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            OpenAD_Symbol_337 = 0_w2f__i8
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
                OpenAD_Symbol_338 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_338)
              ELSE
                OpenAD_Symbol_339 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_339)
              ENDIF
              OpenAD_Symbol_337 = (INT(OpenAD_Symbol_337) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_337)
            OpenAD_Symbol_341 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_341)
          ELSE
            OpenAD_Symbol_340 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_340)
          ENDIF
          OpenAD_Symbol_336 = (INT(OpenAD_Symbol_336) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_336)
        CALL box_final_state()
        OpenAD_Symbol_343 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_343)
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_329)
      IF(OpenAD_Symbol_329 .ne. 0) THEN
      ELSE
        CALL box_final_state()
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_330)
        OpenAD_Symbol_331 = 1
        DO WHILE(INT(OpenAD_Symbol_331) .LE. INT(OpenAD_Symbol_330))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_332)
          IF(OpenAD_Symbol_332 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_333)
            OpenAD_Symbol_334 = 1
            DO WHILE(INT(OpenAD_Symbol_334) .LE. INT(OpenAD_Symbol_333)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_335)
              IF(OpenAD_Symbol_335 .ne. 0) THEN
                CALL box_forward(ILEV1)
              ENDIF
              OpenAD_Symbol_334 = INT(OpenAD_Symbol_334) + 1
            END DO
          ENDIF
          OpenAD_Symbol_331 = INT(OpenAD_Symbol_331) + 1
        END DO
      ENDIF
      CALL box_ini_fields()
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMA_S)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(N_MAX)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(XX))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(XX))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(AREA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(YEAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(SV)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(N_MAX)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(HUNDRED)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMA_S)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(METRIC)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(METRIC1)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(METRIC2)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THC_S)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THC_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(THC_TOT)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(TSVEC)
C     $OpenAD$ INLINE cp_arg_store_integer_scalar(subst)
      CALL cp_arg_store_integer_scalar(N_MAX)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_integer_scalar(subst)
      CALL cp_arg_restore_integer_scalar(N_MAX)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSVEC)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(TSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(T))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(SSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(S))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHO))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(NULLFORCE)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FW)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVEL))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(UBAR)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THC_TOT)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THC_T)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(THC_S)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(METRIC2)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(METRIC1)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(METRIC)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      CALL box_ini_fields()
      MAXLEV2 = (N_MAX / 73) + 1
      IF(N_MAX .GT. 3650) THEN
        WRITE(*, *) 'NEED TO SET nlev1*nlev2 >= n_max '
        OpenAD_Symbol_357 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_357)
      ELSE
        OpenAD_Symbol_351 = 0_w2f__i8
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            OpenAD_Symbol_352 = 0_w2f__i8
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
                OpenAD_Symbol_353 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_353)
              ELSE
                OpenAD_Symbol_354 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_354)
              ENDIF
              OpenAD_Symbol_352 = (INT(OpenAD_Symbol_352) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_352)
            OpenAD_Symbol_356 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_356)
          ELSE
            OpenAD_Symbol_355 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_355)
          ENDIF
          OpenAD_Symbol_351 = (INT(OpenAD_Symbol_351) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_351)
        CALL box_final_state()
        OpenAD_Symbol_358 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_358)
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_344)
      IF(OpenAD_Symbol_344 .ne. 0) THEN
      ELSE
        CALL box_final_state()
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_345)
        OpenAD_Symbol_346 = 1
        DO WHILE(INT(OpenAD_Symbol_346) .LE. INT(OpenAD_Symbol_345))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_347)
          IF(OpenAD_Symbol_347 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_348)
            OpenAD_Symbol_349 = 1
            DO WHILE(INT(OpenAD_Symbol_349) .LE. INT(OpenAD_Symbol_348)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_350)
              IF(OpenAD_Symbol_350 .ne. 0) THEN
                CALL box_forward(ILEV1)
              ENDIF
              OpenAD_Symbol_349 = INT(OpenAD_Symbol_349) + 1
            END DO
          ENDIF
          OpenAD_Symbol_346 = INT(OpenAD_Symbol_346) + 1
        END DO
      ENDIF
      CALL box_ini_fields()
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_density(TLOC, SLOC, RHOLOC)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_226
      INTEGER(w2f__i8) OpenAD_Symbol_227
      INTEGER(w2f__i8) OpenAD_Symbol_228
      INTEGER(w2f__i8) OpenAD_Symbol_229
      INTEGER(w2f__i8) OpenAD_Symbol_230
      INTEGER(w2f__i8) OpenAD_Symbol_231
      REAL(w2f__8) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) TLOC(1 : 3)
      TYPE (OpenADTy_active) SLOC(1 : 3)
      TYPE (OpenADTy_active) RHOLOC(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_366
      INTEGER(w2f__i8) OpenAD_Symbol_367
      REAL(w2f__8) OpenAD_Symbol_368
      INTEGER(w2f__i8) OpenAD_Symbol_369
      INTEGER(w2f__i8) OpenAD_Symbol_370
      REAL(w2f__8) OpenAD_Symbol_371
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        __value__(RHOLOC(INT(L))) = (__value__(SLOC(L)) * BETA -
     >  __value__(TLOC(L)) * ALPHA)
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_228 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(RHOLOC(INT(L))) = (__value__(SLOC(L)) * BETA -
     >  __value__(TLOC(L)) * ALPHA)
        OpenAD_Symbol_2 = BETA
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_4 = ALPHA
        OpenAD_Symbol_1 = (-1_w2f__i8)
        OpenAD_Symbol_137 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
        OpenAD_Symbol_138 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_137)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_138)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_228 = (INT(OpenAD_Symbol_228) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_228)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_226)
      OpenAD_Symbol_227 = 1
      DO WHILE(INT(OpenAD_Symbol_227) .LE. INT(OpenAD_Symbol_226))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_366)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_367)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_368)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_368, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_366))), __deriv__(TLOC(INT(OpenAD_Symbol_367))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_369)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_370)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_371)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_371, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_369))), __deriv__(SLOC(INT(OpenAD_Symbol_370))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(RHOLOC(INT(OpenAD_Symbol_369))))
        OpenAD_Symbol_227 = INT(OpenAD_Symbol_227) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TLOC))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHOLOC))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TLOC))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(BETA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ALPHA)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHOLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_231 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(RHOLOC(INT(L))) = (__value__(SLOC(L)) * BETA -
     >  __value__(TLOC(L)) * ALPHA)
        OpenAD_Symbol_2 = BETA
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_4 = ALPHA
        OpenAD_Symbol_1 = (-1_w2f__i8)
        OpenAD_Symbol_137 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
        OpenAD_Symbol_138 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_137)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_138)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_231 = (INT(OpenAD_Symbol_231) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_231)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_229)
      OpenAD_Symbol_230 = 1
      DO WHILE(INT(OpenAD_Symbol_230) .LE. INT(OpenAD_Symbol_229))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_366)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_367)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_368)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_368, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_366))), __deriv__(TLOC(INT(OpenAD_Symbol_367))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_369)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_370)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_371)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_371, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_369))), __deriv__(SLOC(INT(OpenAD_Symbol_370))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(RHOLOC(INT(OpenAD_Symbol_369))))
        OpenAD_Symbol_230 = INT(OpenAD_Symbol_230) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_transport(RHOLOC, UVELLOC)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_144
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) RHOLOC(1 : 3)
      TYPE (OpenADTy_active) UVELLOC
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      REAL(w2f__8) OpenAD_Symbol_372
      REAL(w2f__8) OpenAD_Symbol_373
      REAL(w2f__8) OpenAD_Symbol_374
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(UVELLOC) = (-(U0 *(__value__(RHOLOC(1)) * DELTA +
     >  __value__(RHOLOC(3)) *(1.0D00 - DELTA) - __value__(RHOLOC(2))))
     > )
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_16 = (1.0D00 - DELTA)
      OpenAD_Symbol_7 = (__value__(RHOLOC(1)) * DELTA + __value__(
     > RHOLOC(3)) * OpenAD_Symbol_16 - __value__(RHOLOC(2)))
      __value__(UVELLOC) = (-(U0 * OpenAD_Symbol_7))
      OpenAD_Symbol_14 = DELTA
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_17 = OpenAD_Symbol_16
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_10 = 1_w2f__i8
      OpenAD_Symbol_11 = (-1_w2f__i8)
      OpenAD_Symbol_9 = U0
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_139 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
      OpenAD_Symbol_140 = (OpenAD_Symbol_10 * OpenAD_Symbol_139)
      OpenAD_Symbol_141 = (OpenAD_Symbol_11 * OpenAD_Symbol_139)
      OpenAD_Symbol_142 = (OpenAD_Symbol_12 * OpenAD_Symbol_140)
      OpenAD_Symbol_143 = (OpenAD_Symbol_13 * OpenAD_Symbol_140)
      OpenAD_Symbol_144 = (OpenAD_Symbol_17 * OpenAD_Symbol_143)
      OpenAD_Symbol_145 = (OpenAD_Symbol_14 * OpenAD_Symbol_142)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_141)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_144)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_145)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_372)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_372, __deriv__(UVELLOC), __deriv__(
     > RHOLOC(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_373)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_373, __deriv__(UVELLOC), __deriv__(
     > RHOLOC(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_374)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_374, __deriv__(UVELLOC), __deriv__(
     > RHOLOC(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVELLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHOLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHOLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVELLOC))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(RHOLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(RHOLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(U0)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVELLOC))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_16 = (1.0D00 - DELTA)
      OpenAD_Symbol_7 = (__value__(RHOLOC(1)) * DELTA + __value__(
     > RHOLOC(3)) * OpenAD_Symbol_16 - __value__(RHOLOC(2)))
      __value__(UVELLOC) = (-(U0 * OpenAD_Symbol_7))
      OpenAD_Symbol_14 = DELTA
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_17 = OpenAD_Symbol_16
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_10 = 1_w2f__i8
      OpenAD_Symbol_11 = (-1_w2f__i8)
      OpenAD_Symbol_9 = U0
      OpenAD_Symbol_6 = (-1_w2f__i8)
      OpenAD_Symbol_139 = (OpenAD_Symbol_9 * OpenAD_Symbol_6)
      OpenAD_Symbol_140 = (OpenAD_Symbol_10 * OpenAD_Symbol_139)
      OpenAD_Symbol_141 = (OpenAD_Symbol_11 * OpenAD_Symbol_139)
      OpenAD_Symbol_142 = (OpenAD_Symbol_12 * OpenAD_Symbol_140)
      OpenAD_Symbol_143 = (OpenAD_Symbol_13 * OpenAD_Symbol_140)
      OpenAD_Symbol_144 = (OpenAD_Symbol_17 * OpenAD_Symbol_143)
      OpenAD_Symbol_145 = (OpenAD_Symbol_14 * OpenAD_Symbol_142)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_141)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_144)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_145)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_372)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_372, __deriv__(UVELLOC), __deriv__(
     > RHOLOC(1)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_373)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_373, __deriv__(UVELLOC), __deriv__(
     > RHOLOC(3)))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_374)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_374, __deriv__(UVELLOC), __deriv__(
     > RHOLOC(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVELLOC))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_robert_filter(FLDNOW, FLDOLD, FLDNEW)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_117
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_127
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      REAL(w2f__8) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_200
      TYPE (OpenADTy_active) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      TYPE (OpenADTy_active) OpenAD_Symbol_203
      INTEGER(w2f__i8) OpenAD_Symbol_238
      INTEGER(w2f__i8) OpenAD_Symbol_239
      INTEGER(w2f__i8) OpenAD_Symbol_240
      INTEGER(w2f__i8) OpenAD_Symbol_241
      INTEGER(w2f__i8) OpenAD_Symbol_242
      INTEGER(w2f__i8) OpenAD_Symbol_243
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) FLDNOW(1 : 3)
      TYPE (OpenADTy_active) FLDOLD(1 : 3)
      TYPE (OpenADTy_active) FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_397
      REAL(w2f__8) OpenAD_Symbol_398
      INTEGER(w2f__i8) OpenAD_Symbol_399
      REAL(w2f__8) OpenAD_Symbol_400
      INTEGER(w2f__i8) OpenAD_Symbol_401
      INTEGER(w2f__i8) OpenAD_Symbol_402
      REAL(w2f__8) OpenAD_Symbol_403
      INTEGER(w2f__i8) OpenAD_Symbol_404
      INTEGER(w2f__i8) OpenAD_Symbol_405
      REAL(w2f__8) OpenAD_Symbol_406
      INTEGER(w2f__i8) OpenAD_Symbol_407
      INTEGER(w2f__i8) OpenAD_Symbol_408
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        __value__(FLDNOW(INT(L))) = (__value__(FLDNOW(L)) +
     >  ROBERT_FILTER_COEFF *(__value__(FLDOLD(L)) + __value__(FLDNEW(L
     > )) - __value__(FLDNOW(L)) * 2.0D00))
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_240 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_118 = (__value__(FLDOLD(L)) + __value__(FLDNEW(L)
     > ) - __value__(FLDNOW(L)) * 2.0D00)
        OpenAD_Symbol_127 = (__value__(FLDNOW(L)) + ROBERT_FILTER_COEFF
     >  * OpenAD_Symbol_118)
        OpenAD_Symbol_116 = 1_w2f__i8
        OpenAD_Symbol_121 = 1_w2f__i8
        OpenAD_Symbol_123 = 1_w2f__i8
        OpenAD_Symbol_125 = 2.0D00
        OpenAD_Symbol_124 = (-1_w2f__i8)
        OpenAD_Symbol_122 = 1_w2f__i8
        OpenAD_Symbol_120 = ROBERT_FILTER_COEFF
        OpenAD_Symbol_117 = 1_w2f__i8
        __value__(FLDNOW(INT(L))) = OpenAD_Symbol_127
        OpenAD_Symbol_195 = (OpenAD_Symbol_120 * OpenAD_Symbol_117)
        OpenAD_Symbol_196 = (OpenAD_Symbol_121 * OpenAD_Symbol_195)
        OpenAD_Symbol_197 = (OpenAD_Symbol_122 * OpenAD_Symbol_195)
        OpenAD_Symbol_198 = (OpenAD_Symbol_123 * OpenAD_Symbol_197)
        OpenAD_Symbol_199 = (OpenAD_Symbol_124 * OpenAD_Symbol_197)
        OpenAD_Symbol_200 = (OpenAD_Symbol_125 * OpenAD_Symbol_199)
        OpenAD_Symbol_202 = OpenAD_Symbol_116
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_196)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_198)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_200)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_202)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_240 = (INT(OpenAD_Symbol_240) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_240)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_238)
      OpenAD_Symbol_239 = 1
      DO WHILE(INT(OpenAD_Symbol_239) .LE. INT(OpenAD_Symbol_238))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_397)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_398)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_398, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_397))), __deriv__(OpenAD_Symbol_203))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_399)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_400)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_400, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_399))), __deriv__(OpenAD_Symbol_201))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_401)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_402)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_403)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_403, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_401))), __deriv__(FLDNEW(INT(OpenAD_Symbol_402))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_404)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_405)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_406)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_406, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_404))), __deriv__(FLDOLD(INT(OpenAD_Symbol_405))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNOW(INT(OpenAD_Symbol_404))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_407)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_201), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_407))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_201))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_408)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_203), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_408))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_203))
        OpenAD_Symbol_239 = INT(OpenAD_Symbol_239) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(ROBERT_FILTER_COEFF)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_243 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_118 = (__value__(FLDOLD(L)) + __value__(FLDNEW(L)
     > ) - __value__(FLDNOW(L)) * 2.0D00)
        OpenAD_Symbol_127 = (__value__(FLDNOW(L)) + ROBERT_FILTER_COEFF
     >  * OpenAD_Symbol_118)
        OpenAD_Symbol_116 = 1_w2f__i8
        OpenAD_Symbol_121 = 1_w2f__i8
        OpenAD_Symbol_123 = 1_w2f__i8
        OpenAD_Symbol_125 = 2.0D00
        OpenAD_Symbol_124 = (-1_w2f__i8)
        OpenAD_Symbol_122 = 1_w2f__i8
        OpenAD_Symbol_120 = ROBERT_FILTER_COEFF
        OpenAD_Symbol_117 = 1_w2f__i8
        __value__(FLDNOW(INT(L))) = OpenAD_Symbol_127
        OpenAD_Symbol_195 = (OpenAD_Symbol_120 * OpenAD_Symbol_117)
        OpenAD_Symbol_196 = (OpenAD_Symbol_121 * OpenAD_Symbol_195)
        OpenAD_Symbol_197 = (OpenAD_Symbol_122 * OpenAD_Symbol_195)
        OpenAD_Symbol_198 = (OpenAD_Symbol_123 * OpenAD_Symbol_197)
        OpenAD_Symbol_199 = (OpenAD_Symbol_124 * OpenAD_Symbol_197)
        OpenAD_Symbol_200 = (OpenAD_Symbol_125 * OpenAD_Symbol_199)
        OpenAD_Symbol_202 = OpenAD_Symbol_116
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_196)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_198)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_200)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_202)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_243 = (INT(OpenAD_Symbol_243) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_243)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_241)
      OpenAD_Symbol_242 = 1
      DO WHILE(INT(OpenAD_Symbol_242) .LE. INT(OpenAD_Symbol_241))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_397)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_398)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_398, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_397))), __deriv__(OpenAD_Symbol_203))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_399)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_400)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_400, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_399))), __deriv__(OpenAD_Symbol_201))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_401)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_402)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_403)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_403, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_401))), __deriv__(FLDNEW(INT(OpenAD_Symbol_402))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_404)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_405)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_406)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_406, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_404))), __deriv__(FLDOLD(INT(OpenAD_Symbol_405))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNOW(INT(OpenAD_Symbol_404))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_407)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_201), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_407))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_201))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_408)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_203), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_408))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_203))
        OpenAD_Symbol_242 = INT(OpenAD_Symbol_242) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_cycle_fields()
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_204
      TYPE (OpenADTy_active) OpenAD_Symbol_205
      INTEGER(w2f__i8) OpenAD_Symbol_244
      INTEGER(w2f__i8) OpenAD_Symbol_245
      INTEGER(w2f__i8) OpenAD_Symbol_246
      INTEGER(w2f__i8) OpenAD_Symbol_247
      INTEGER(w2f__i8) OpenAD_Symbol_248
      INTEGER(w2f__i8) OpenAD_Symbol_249
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_409
      INTEGER(w2f__i8) OpenAD_Symbol_410
      INTEGER(w2f__i8) OpenAD_Symbol_411
      INTEGER(w2f__i8) OpenAD_Symbol_412
      INTEGER(w2f__i8) OpenAD_Symbol_413
      INTEGER(w2f__i8) OpenAD_Symbol_414
      INTEGER(w2f__i8) OpenAD_Symbol_415
      INTEGER(w2f__i8) OpenAD_Symbol_416
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        __value__(TOLD(INT(L))) = __value__(TNOW(L))
        __value__(TNOW(INT(L))) = __value__(TNEW(L))
        __value__(SOLD(INT(L))) = __value__(SNOW(L))
        __value__(SNOW(INT(L))) = __value__(SNEW(L))
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_246 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(TOLD(INT(L))) = __value__(TNOW(L))
        __value__(TNOW(INT(L))) = __value__(TNEW(L))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        __value__(SOLD(INT(L))) = __value__(SNOW(L))
        __value__(SNOW(INT(L))) = __value__(SNEW(L))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_246 = (INT(OpenAD_Symbol_246) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_246)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_244)
      OpenAD_Symbol_245 = 1
      DO WHILE(INT(OpenAD_Symbol_245) .LE. INT(OpenAD_Symbol_244))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_409)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_410)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_409))),
     >  __deriv__(SNEW(INT(OpenAD_Symbol_410))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_409))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_411)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_411))),
     >  __deriv__(OpenAD_Symbol_205))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_411))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_412)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_205), __deriv__(SNOW(INT(
     > OpenAD_Symbol_412))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_205))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_413)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_414)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_413))),
     >  __deriv__(TNEW(INT(OpenAD_Symbol_414))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_413))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_415)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_415))),
     >  __deriv__(OpenAD_Symbol_204))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_415))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_416)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_204), __deriv__(TNOW(INT(
     > OpenAD_Symbol_416))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_204))
        OpenAD_Symbol_245 = INT(OpenAD_Symbol_245) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(TNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(SNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_249 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(TOLD(INT(L))) = __value__(TNOW(L))
        __value__(TNOW(INT(L))) = __value__(TNEW(L))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        __value__(SOLD(INT(L))) = __value__(SNOW(L))
        __value__(SNOW(INT(L))) = __value__(SNEW(L))
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_249 = (INT(OpenAD_Symbol_249) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_249)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_247)
      OpenAD_Symbol_248 = 1
      DO WHILE(INT(OpenAD_Symbol_248) .LE. INT(OpenAD_Symbol_247))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_409)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_410)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_409))),
     >  __deriv__(SNEW(INT(OpenAD_Symbol_410))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_409))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_411)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_411))),
     >  __deriv__(OpenAD_Symbol_205))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_411))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_412)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_205), __deriv__(SNOW(INT(
     > OpenAD_Symbol_412))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_205))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_413)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_414)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_413))),
     >  __deriv__(TNEW(INT(OpenAD_Symbol_414))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_413))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_415)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_415))),
     >  __deriv__(OpenAD_Symbol_204))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_415))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_416)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_204), __deriv__(TNOW(INT(
     > OpenAD_Symbol_416))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_204))
        OpenAD_Symbol_248 = INT(OpenAD_Symbol_248) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_update(FLDNEW, FLDOLD, DFLDDT)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_134
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      INTEGER(w2f__i8) OpenAD_Symbol_359
      INTEGER(w2f__i8) OpenAD_Symbol_360
      INTEGER(w2f__i8) OpenAD_Symbol_361
      INTEGER(w2f__i8) OpenAD_Symbol_362
      INTEGER(w2f__i8) OpenAD_Symbol_363
      INTEGER(w2f__i8) OpenAD_Symbol_364
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) FLDNEW(1 : 3)
      TYPE (OpenADTy_active) FLDOLD(1 : 3)
      TYPE (OpenADTy_active) DFLDDT(1 : 3)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) L
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      INTEGER(w2f__i8) OpenAD_Symbol_441
      INTEGER(w2f__i8) OpenAD_Symbol_442
      REAL(w2f__8) OpenAD_Symbol_443
      INTEGER(w2f__i8) OpenAD_Symbol_444
      INTEGER(w2f__i8) OpenAD_Symbol_445
      REAL(w2f__8) OpenAD_Symbol_446
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        __value__(FLDNEW(INT(L))) = (__value__(FLDOLD(L)) + __value__(
     > DFLDDT(L)) * DELTA_T * 2.0D00)
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_361 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_134 = (DELTA_T * 2.0D00)
        __value__(FLDNEW(INT(L))) = (__value__(FLDOLD(L)) + __value__(
     > DFLDDT(L)) * OpenAD_Symbol_134)
        OpenAD_Symbol_132 = 1_w2f__i8
        OpenAD_Symbol_135 = OpenAD_Symbol_134
        OpenAD_Symbol_133 = 1_w2f__i8
        OpenAD_Symbol_212 = (OpenAD_Symbol_135 * OpenAD_Symbol_133)
        OpenAD_Symbol_213 = OpenAD_Symbol_132
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_212)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_213)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_361 = (INT(OpenAD_Symbol_361) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_361)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_359)
      OpenAD_Symbol_360 = 1
      DO WHILE(INT(OpenAD_Symbol_360) .LE. INT(OpenAD_Symbol_359))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_441)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_442)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_443)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_443, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_441))), __deriv__(FLDOLD(INT(OpenAD_Symbol_442))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_444)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_445)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_446)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_446, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_444))), __deriv__(DFLDDT(INT(OpenAD_Symbol_445))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNEW(INT(OpenAD_Symbol_444))))
        OpenAD_Symbol_360 = INT(OpenAD_Symbol_360) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(DFLDDT))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(DFLDDT))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(DFLDDT))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(DFLDDT))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_364 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_134 = (DELTA_T * 2.0D00)
        __value__(FLDNEW(INT(L))) = (__value__(FLDOLD(L)) + __value__(
     > DFLDDT(L)) * OpenAD_Symbol_134)
        OpenAD_Symbol_132 = 1_w2f__i8
        OpenAD_Symbol_135 = OpenAD_Symbol_134
        OpenAD_Symbol_133 = 1_w2f__i8
        OpenAD_Symbol_212 = (OpenAD_Symbol_135 * OpenAD_Symbol_133)
        OpenAD_Symbol_213 = OpenAD_Symbol_132
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_212)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_213)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_364 = (INT(OpenAD_Symbol_364) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_364)
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_362)
      OpenAD_Symbol_363 = 1
      DO WHILE(INT(OpenAD_Symbol_363) .LE. INT(OpenAD_Symbol_362))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_441)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_442)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_443)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_443, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_441))), __deriv__(FLDOLD(INT(OpenAD_Symbol_442))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_444)
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_445)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_446)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_446, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_444))), __deriv__(DFLDDT(INT(OpenAD_Symbol_445))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNEW(INT(OpenAD_Symbol_444))))
        OpenAD_Symbol_363 = INT(OpenAD_Symbol_363) + 1
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE box_timestep(GAMMALOC, FLDSTAR, EXTFORLOC, UVELLOC,
     >  FLDNOW, FLDOLD, FLDNEW)
      use w2f__types
      use all_globals_mod
      use all_globals_mod
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_101
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_104
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
      REAL(w2f__8) OpenAD_Symbol_146
      REAL(w2f__8) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      REAL(w2f__8) OpenAD_Symbol_149
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
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      INTEGER(w2f__i8) OpenAD_Symbol_232
      INTEGER(w2f__i8) OpenAD_Symbol_233
      INTEGER(w2f__i8) OpenAD_Symbol_234
      INTEGER(w2f__i8) OpenAD_Symbol_235
      INTEGER(w2f__i8) OpenAD_Symbol_236
      INTEGER(w2f__i8) OpenAD_Symbol_237
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_53
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_55
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_65
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_74
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_77
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_83
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_85
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
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
      REAL(w2f__8) GAMMALOC
      REAL(w2f__8) FLDSTAR(1 : 2)
      REAL(w2f__8) EXTFORLOC(1 : 2)
      TYPE (OpenADTy_active) UVELLOC
      TYPE (OpenADTy_active) FLDNOW(1 : 3)
      TYPE (OpenADTy_active) FLDOLD(1 : 3)
      TYPE (OpenADTy_active) FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_update
      TYPE (OpenADTy_active) DFLDDT(1 : 3)
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
      REAL(w2f__8) OpenAD_Symbol_375
      REAL(w2f__8) OpenAD_Symbol_376
      REAL(w2f__8) OpenAD_Symbol_377
      REAL(w2f__8) OpenAD_Symbol_378
      REAL(w2f__8) OpenAD_Symbol_379
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
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      IF(__value__(UVELLOC) .GE. 0.0D00) THEN
        __value__(DFLDDT(1)) = ((EXTFORLOC(1) + VOL(1) * GAMMALOC *(
     > FLDSTAR(1) - __value__(FLDNOW(1))) + __value__(UVELLOC) *(
     > __value__(FLDNOW(3)) - __value__(FLDNOW(1)))) / VOL(1))
        __value__(DFLDDT(2)) = ((EXTFORLOC(2) + VOL(2) * GAMMALOC *(
     > FLDSTAR(2) - __value__(FLDNOW(2))) + __value__(UVELLOC) *(
     > __value__(FLDNOW(1)) - __value__(FLDNOW(2)))) / VOL(2))
        __value__(DFLDDT(3)) = ((__value__(UVELLOC) *(__value__(FLDNOW(
     > 2)) - __value__(FLDNOW(3)))) / VOL(3))
      ELSE
        __value__(DFLDDT(1)) = ((EXTFORLOC(1) + VOL(1) * GAMMALOC *(
     > FLDSTAR(1) - __value__(FLDNOW(1))) - __value__(UVELLOC) *(
     > __value__(FLDNOW(2)) - __value__(FLDNOW(1)))) / VOL(1))
        __value__(DFLDDT(2)) = ((EXTFORLOC(2) + VOL(2) * GAMMALOC *(
     > FLDSTAR(2) - __value__(FLDNOW(2))) - __value__(UVELLOC) *(
     > __value__(FLDNOW(3)) - __value__(FLDNOW(2)))) / VOL(2))
        __value__(DFLDDT(3)) = (-((__value__(UVELLOC) *(__value__(
     > FLDNOW(1)) - __value__(FLDNOW(3)))) / VOL(3)))
      ENDIF
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      IF(__value__(UVELLOC) .GE. 0.0D00) THEN
        OpenAD_Symbol_29 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_26 = (GAMMALOC * OpenAD_Symbol_29)
        OpenAD_Symbol_34 = (__value__(FLDNOW(3)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_19 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_26 +
     >  __value__(UVELLOC) * OpenAD_Symbol_34)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_19 / VOL(1))
        OpenAD_Symbol_33 = (-1_w2f__i8)
        OpenAD_Symbol_31 = GAMMALOC
        OpenAD_Symbol_28 = VOL(1)
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = 1_w2f__i8
        OpenAD_Symbol_35 = OpenAD_Symbol_34
        OpenAD_Symbol_37 = 1_w2f__i8
        OpenAD_Symbol_38 = (-1_w2f__i8)
        OpenAD_Symbol_36 = __value__(UVELLOC)
        OpenAD_Symbol_23 = 1_w2f__i8
        OpenAD_Symbol_20 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_49 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_46 = (GAMMALOC * OpenAD_Symbol_49)
        OpenAD_Symbol_54 = (__value__(FLDNOW(1)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_39 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_46 +
     >  __value__(UVELLOC) * OpenAD_Symbol_54)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_39 / VOL(2))
        OpenAD_Symbol_53 = (-1_w2f__i8)
        OpenAD_Symbol_51 = GAMMALOC
        OpenAD_Symbol_48 = VOL(2)
        OpenAD_Symbol_45 = 1_w2f__i8
        OpenAD_Symbol_42 = 1_w2f__i8
        OpenAD_Symbol_55 = OpenAD_Symbol_54
        OpenAD_Symbol_57 = 1_w2f__i8
        OpenAD_Symbol_58 = (-1_w2f__i8)
        OpenAD_Symbol_56 = __value__(UVELLOC)
        OpenAD_Symbol_43 = 1_w2f__i8
        OpenAD_Symbol_40 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_62 = (__value__(FLDNOW(2)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_59 = (__value__(UVELLOC) * OpenAD_Symbol_62)
        __value__(DFLDDT(3)) = (OpenAD_Symbol_59 / VOL(3))
        OpenAD_Symbol_63 = OpenAD_Symbol_62
        OpenAD_Symbol_65 = 1_w2f__i8
        OpenAD_Symbol_66 = (-1_w2f__i8)
        OpenAD_Symbol_64 = __value__(UVELLOC)
        OpenAD_Symbol_60 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_146 = (OpenAD_Symbol_42 * OpenAD_Symbol_40)
        OpenAD_Symbol_147 = (OpenAD_Symbol_43 * OpenAD_Symbol_40)
        OpenAD_Symbol_148 = (OpenAD_Symbol_22 * OpenAD_Symbol_20)
        OpenAD_Symbol_149 = (OpenAD_Symbol_23 * OpenAD_Symbol_20)
        OpenAD_Symbol_150 = (OpenAD_Symbol_63 * OpenAD_Symbol_60)
        OpenAD_Symbol_151 = (OpenAD_Symbol_64 * OpenAD_Symbol_60)
        OpenAD_Symbol_152 = (OpenAD_Symbol_55 * OpenAD_Symbol_147)
        OpenAD_Symbol_153 = (OpenAD_Symbol_56 * OpenAD_Symbol_147)
        OpenAD_Symbol_154 = (OpenAD_Symbol_35 * OpenAD_Symbol_149)
        OpenAD_Symbol_155 = (OpenAD_Symbol_36 * OpenAD_Symbol_149)
        OpenAD_Symbol_156 = (OpenAD_Symbol_65 * OpenAD_Symbol_151)
        OpenAD_Symbol_157 = (OpenAD_Symbol_66 * OpenAD_Symbol_151)
        OpenAD_Symbol_158 = (OpenAD_Symbol_57 * OpenAD_Symbol_153)
        OpenAD_Symbol_159 = (OpenAD_Symbol_58 * OpenAD_Symbol_153)
        OpenAD_Symbol_160 = (OpenAD_Symbol_37 * OpenAD_Symbol_155)
        OpenAD_Symbol_161 = (OpenAD_Symbol_38 * OpenAD_Symbol_155)
        OpenAD_Symbol_162 = (OpenAD_Symbol_45 * OpenAD_Symbol_146)
        OpenAD_Symbol_163 = (OpenAD_Symbol_25 * OpenAD_Symbol_148)
        OpenAD_Symbol_164 = (OpenAD_Symbol_48 * OpenAD_Symbol_162)
        OpenAD_Symbol_165 = (OpenAD_Symbol_28 * OpenAD_Symbol_163)
        OpenAD_Symbol_166 = (OpenAD_Symbol_51 * OpenAD_Symbol_164)
        OpenAD_Symbol_167 = (OpenAD_Symbol_31 * OpenAD_Symbol_165)
        OpenAD_Symbol_168 = (OpenAD_Symbol_53 * OpenAD_Symbol_166)
        OpenAD_Symbol_169 = (OpenAD_Symbol_33 * OpenAD_Symbol_167)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_150)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_152)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_154)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_156)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_157)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_158)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_159)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_160)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_161)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_168)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_169)
        OpenAD_Symbol_233 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_233)
      ELSE
        OpenAD_Symbol_77 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_74 = (GAMMALOC * OpenAD_Symbol_77)
        OpenAD_Symbol_82 = (__value__(FLDNOW(2)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_67 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_74 -
     >  __value__(UVELLOC) * OpenAD_Symbol_82)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_67 / VOL(1))
        OpenAD_Symbol_81 = (-1_w2f__i8)
        OpenAD_Symbol_79 = GAMMALOC
        OpenAD_Symbol_76 = VOL(1)
        OpenAD_Symbol_73 = 1_w2f__i8
        OpenAD_Symbol_70 = 1_w2f__i8
        OpenAD_Symbol_83 = OpenAD_Symbol_82
        OpenAD_Symbol_85 = 1_w2f__i8
        OpenAD_Symbol_86 = (-1_w2f__i8)
        OpenAD_Symbol_84 = __value__(UVELLOC)
        OpenAD_Symbol_71 = (-1_w2f__i8)
        OpenAD_Symbol_68 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_97 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_94 = (GAMMALOC * OpenAD_Symbol_97)
        OpenAD_Symbol_102 = (__value__(FLDNOW(3)) - __value__(FLDNOW(2)
     > ))
        OpenAD_Symbol_87 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_94 -
     >  __value__(UVELLOC) * OpenAD_Symbol_102)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_87 / VOL(2))
        OpenAD_Symbol_101 = (-1_w2f__i8)
        OpenAD_Symbol_99 = GAMMALOC
        OpenAD_Symbol_96 = VOL(2)
        OpenAD_Symbol_93 = 1_w2f__i8
        OpenAD_Symbol_90 = 1_w2f__i8
        OpenAD_Symbol_103 = OpenAD_Symbol_102
        OpenAD_Symbol_105 = 1_w2f__i8
        OpenAD_Symbol_106 = (-1_w2f__i8)
        OpenAD_Symbol_104 = __value__(UVELLOC)
        OpenAD_Symbol_91 = (-1_w2f__i8)
        OpenAD_Symbol_88 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_111 = (__value__(FLDNOW(1)) - __value__(FLDNOW(3)
     > ))
        OpenAD_Symbol_108 = (__value__(UVELLOC) * OpenAD_Symbol_111)
        __value__(DFLDDT(3)) = (-(OpenAD_Symbol_108 / VOL(3)))
        OpenAD_Symbol_112 = OpenAD_Symbol_111
        OpenAD_Symbol_114 = 1_w2f__i8
        OpenAD_Symbol_115 = (-1_w2f__i8)
        OpenAD_Symbol_113 = __value__(UVELLOC)
        OpenAD_Symbol_109 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_107 = (-1_w2f__i8)
        OpenAD_Symbol_170 = (OpenAD_Symbol_90 * OpenAD_Symbol_88)
        OpenAD_Symbol_171 = (OpenAD_Symbol_91 * OpenAD_Symbol_88)
        OpenAD_Symbol_172 = (OpenAD_Symbol_70 * OpenAD_Symbol_68)
        OpenAD_Symbol_173 = (OpenAD_Symbol_71 * OpenAD_Symbol_68)
        OpenAD_Symbol_174 = (OpenAD_Symbol_103 * OpenAD_Symbol_171)
        OpenAD_Symbol_175 = (OpenAD_Symbol_104 * OpenAD_Symbol_171)
        OpenAD_Symbol_176 = (OpenAD_Symbol_83 * OpenAD_Symbol_173)
        OpenAD_Symbol_177 = (OpenAD_Symbol_84 * OpenAD_Symbol_173)
        OpenAD_Symbol_178 = (OpenAD_Symbol_105 * OpenAD_Symbol_175)
        OpenAD_Symbol_179 = (OpenAD_Symbol_106 * OpenAD_Symbol_175)
        OpenAD_Symbol_180 = (OpenAD_Symbol_85 * OpenAD_Symbol_177)
        OpenAD_Symbol_181 = (OpenAD_Symbol_86 * OpenAD_Symbol_177)
        OpenAD_Symbol_182 = (OpenAD_Symbol_93 * OpenAD_Symbol_170)
        OpenAD_Symbol_183 = (OpenAD_Symbol_73 * OpenAD_Symbol_172)
        OpenAD_Symbol_184 = (OpenAD_Symbol_109 * OpenAD_Symbol_107)
        OpenAD_Symbol_185 = (OpenAD_Symbol_112 * OpenAD_Symbol_184)
        OpenAD_Symbol_186 = (OpenAD_Symbol_113 * OpenAD_Symbol_184)
        OpenAD_Symbol_187 = (OpenAD_Symbol_114 * OpenAD_Symbol_186)
        OpenAD_Symbol_188 = (OpenAD_Symbol_115 * OpenAD_Symbol_186)
        OpenAD_Symbol_189 = (OpenAD_Symbol_96 * OpenAD_Symbol_182)
        OpenAD_Symbol_190 = (OpenAD_Symbol_76 * OpenAD_Symbol_183)
        OpenAD_Symbol_191 = (OpenAD_Symbol_99 * OpenAD_Symbol_189)
        OpenAD_Symbol_192 = (OpenAD_Symbol_79 * OpenAD_Symbol_190)
        OpenAD_Symbol_193 = (OpenAD_Symbol_101 * OpenAD_Symbol_191)
        OpenAD_Symbol_194 = (OpenAD_Symbol_81 * OpenAD_Symbol_192)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_174)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_176)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_178)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_179)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_180)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_181)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_185)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_187)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_188)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_193)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_194)
        OpenAD_Symbol_234 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_234)
      ENDIF
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_232)
      IF(OpenAD_Symbol_232 .ne. 0) THEN
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_375)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_375, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_376)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_376, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_377)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_377, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_378)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_378, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_379)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_379, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_380)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_380, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_381)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_381, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_382)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_382, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_383)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_383, __deriv__(DFLDDT(1)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_384)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_384, __deriv__(DFLDDT(2)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_385)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_385, __deriv__(DFLDDT(3)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_386)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_386, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_387)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_387, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_388)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_388, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_389)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_389, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_390)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_390, __deriv__(DFLDDT(3)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_391)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_391, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_392)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_392, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_393)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_393, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_394)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_394, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_395)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_395, __deriv__(DFLDDT(1)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_396)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_396, __deriv__(DFLDDT(2)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
      ENDIF
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 4
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMALOC)
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVELLOC))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FLDSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(EXTFORLOC)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 5
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 6
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(EXTFORLOC)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FLDSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVELLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMALOC)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(DELTA_T)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 7
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 8
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_store_real_scalar(subst)
      CALL cp_arg_store_real_scalar(GAMMALOC)
C     $OpenAD$ INLINE cp_arg_store_real_scalar_a(subst)
      CALL cp_arg_store_real_scalar_a(__deriv__(UVELLOC))
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(FLDSTAR)
C     $OpenAD$ INLINE cp_arg_store_real_vector(subst)
      CALL cp_arg_store_real_vector(EXTFORLOC)
C     $OpenAD$ INLINE cp_arg_store_real_vector_a(subst)
      CALL cp_arg_store_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 9
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNOW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(EXTFORLOC)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(FLDSTAR)
C     $OpenAD$ INLINE cp_arg_restore_real_vector(subst)
      CALL cp_arg_restore_real_vector(VOL)
C     $OpenAD$ INLINE cp_arg_restore_real_scalar_a(subst)
      CALL cp_arg_restore_real_scalar_a(__deriv__(UVELLOC))
C     $OpenAD$ INLINE cp_arg_restore_real_scalar(subst)
      CALL cp_arg_restore_real_scalar(GAMMALOC)
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDOLD))
C     $OpenAD$ INLINE cp_arg_restore_real_vector_a(subst)
      CALL cp_arg_restore_real_vector_a(__deriv__(FLDNEW))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 10
C$OPENAD XXX Template ad_template.f
      IF(__value__(UVELLOC) .GE. 0.0D00) THEN
        OpenAD_Symbol_29 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_26 = (GAMMALOC * OpenAD_Symbol_29)
        OpenAD_Symbol_34 = (__value__(FLDNOW(3)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_19 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_26 +
     >  __value__(UVELLOC) * OpenAD_Symbol_34)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_19 / VOL(1))
        OpenAD_Symbol_33 = (-1_w2f__i8)
        OpenAD_Symbol_31 = GAMMALOC
        OpenAD_Symbol_28 = VOL(1)
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = 1_w2f__i8
        OpenAD_Symbol_35 = OpenAD_Symbol_34
        OpenAD_Symbol_37 = 1_w2f__i8
        OpenAD_Symbol_38 = (-1_w2f__i8)
        OpenAD_Symbol_36 = __value__(UVELLOC)
        OpenAD_Symbol_23 = 1_w2f__i8
        OpenAD_Symbol_20 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_49 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_46 = (GAMMALOC * OpenAD_Symbol_49)
        OpenAD_Symbol_54 = (__value__(FLDNOW(1)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_39 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_46 +
     >  __value__(UVELLOC) * OpenAD_Symbol_54)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_39 / VOL(2))
        OpenAD_Symbol_53 = (-1_w2f__i8)
        OpenAD_Symbol_51 = GAMMALOC
        OpenAD_Symbol_48 = VOL(2)
        OpenAD_Symbol_45 = 1_w2f__i8
        OpenAD_Symbol_42 = 1_w2f__i8
        OpenAD_Symbol_55 = OpenAD_Symbol_54
        OpenAD_Symbol_57 = 1_w2f__i8
        OpenAD_Symbol_58 = (-1_w2f__i8)
        OpenAD_Symbol_56 = __value__(UVELLOC)
        OpenAD_Symbol_43 = 1_w2f__i8
        OpenAD_Symbol_40 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_62 = (__value__(FLDNOW(2)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_59 = (__value__(UVELLOC) * OpenAD_Symbol_62)
        __value__(DFLDDT(3)) = (OpenAD_Symbol_59 / VOL(3))
        OpenAD_Symbol_63 = OpenAD_Symbol_62
        OpenAD_Symbol_65 = 1_w2f__i8
        OpenAD_Symbol_66 = (-1_w2f__i8)
        OpenAD_Symbol_64 = __value__(UVELLOC)
        OpenAD_Symbol_60 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_146 = (OpenAD_Symbol_42 * OpenAD_Symbol_40)
        OpenAD_Symbol_147 = (OpenAD_Symbol_43 * OpenAD_Symbol_40)
        OpenAD_Symbol_148 = (OpenAD_Symbol_22 * OpenAD_Symbol_20)
        OpenAD_Symbol_149 = (OpenAD_Symbol_23 * OpenAD_Symbol_20)
        OpenAD_Symbol_150 = (OpenAD_Symbol_63 * OpenAD_Symbol_60)
        OpenAD_Symbol_151 = (OpenAD_Symbol_64 * OpenAD_Symbol_60)
        OpenAD_Symbol_152 = (OpenAD_Symbol_55 * OpenAD_Symbol_147)
        OpenAD_Symbol_153 = (OpenAD_Symbol_56 * OpenAD_Symbol_147)
        OpenAD_Symbol_154 = (OpenAD_Symbol_35 * OpenAD_Symbol_149)
        OpenAD_Symbol_155 = (OpenAD_Symbol_36 * OpenAD_Symbol_149)
        OpenAD_Symbol_156 = (OpenAD_Symbol_65 * OpenAD_Symbol_151)
        OpenAD_Symbol_157 = (OpenAD_Symbol_66 * OpenAD_Symbol_151)
        OpenAD_Symbol_158 = (OpenAD_Symbol_57 * OpenAD_Symbol_153)
        OpenAD_Symbol_159 = (OpenAD_Symbol_58 * OpenAD_Symbol_153)
        OpenAD_Symbol_160 = (OpenAD_Symbol_37 * OpenAD_Symbol_155)
        OpenAD_Symbol_161 = (OpenAD_Symbol_38 * OpenAD_Symbol_155)
        OpenAD_Symbol_162 = (OpenAD_Symbol_45 * OpenAD_Symbol_146)
        OpenAD_Symbol_163 = (OpenAD_Symbol_25 * OpenAD_Symbol_148)
        OpenAD_Symbol_164 = (OpenAD_Symbol_48 * OpenAD_Symbol_162)
        OpenAD_Symbol_165 = (OpenAD_Symbol_28 * OpenAD_Symbol_163)
        OpenAD_Symbol_166 = (OpenAD_Symbol_51 * OpenAD_Symbol_164)
        OpenAD_Symbol_167 = (OpenAD_Symbol_31 * OpenAD_Symbol_165)
        OpenAD_Symbol_168 = (OpenAD_Symbol_53 * OpenAD_Symbol_166)
        OpenAD_Symbol_169 = (OpenAD_Symbol_33 * OpenAD_Symbol_167)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_150)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_152)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_154)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_156)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_157)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_158)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_159)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_160)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_161)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_168)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_169)
        OpenAD_Symbol_236 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_236)
      ELSE
        OpenAD_Symbol_77 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_74 = (GAMMALOC * OpenAD_Symbol_77)
        OpenAD_Symbol_82 = (__value__(FLDNOW(2)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_67 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_74 -
     >  __value__(UVELLOC) * OpenAD_Symbol_82)
        __value__(DFLDDT(1)) = (OpenAD_Symbol_67 / VOL(1))
        OpenAD_Symbol_81 = (-1_w2f__i8)
        OpenAD_Symbol_79 = GAMMALOC
        OpenAD_Symbol_76 = VOL(1)
        OpenAD_Symbol_73 = 1_w2f__i8
        OpenAD_Symbol_70 = 1_w2f__i8
        OpenAD_Symbol_83 = OpenAD_Symbol_82
        OpenAD_Symbol_85 = 1_w2f__i8
        OpenAD_Symbol_86 = (-1_w2f__i8)
        OpenAD_Symbol_84 = __value__(UVELLOC)
        OpenAD_Symbol_71 = (-1_w2f__i8)
        OpenAD_Symbol_68 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_97 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_94 = (GAMMALOC * OpenAD_Symbol_97)
        OpenAD_Symbol_102 = (__value__(FLDNOW(3)) - __value__(FLDNOW(2)
     > ))
        OpenAD_Symbol_87 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_94 -
     >  __value__(UVELLOC) * OpenAD_Symbol_102)
        __value__(DFLDDT(2)) = (OpenAD_Symbol_87 / VOL(2))
        OpenAD_Symbol_101 = (-1_w2f__i8)
        OpenAD_Symbol_99 = GAMMALOC
        OpenAD_Symbol_96 = VOL(2)
        OpenAD_Symbol_93 = 1_w2f__i8
        OpenAD_Symbol_90 = 1_w2f__i8
        OpenAD_Symbol_103 = OpenAD_Symbol_102
        OpenAD_Symbol_105 = 1_w2f__i8
        OpenAD_Symbol_106 = (-1_w2f__i8)
        OpenAD_Symbol_104 = __value__(UVELLOC)
        OpenAD_Symbol_91 = (-1_w2f__i8)
        OpenAD_Symbol_88 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_111 = (__value__(FLDNOW(1)) - __value__(FLDNOW(3)
     > ))
        OpenAD_Symbol_108 = (__value__(UVELLOC) * OpenAD_Symbol_111)
        __value__(DFLDDT(3)) = (-(OpenAD_Symbol_108 / VOL(3)))
        OpenAD_Symbol_112 = OpenAD_Symbol_111
        OpenAD_Symbol_114 = 1_w2f__i8
        OpenAD_Symbol_115 = (-1_w2f__i8)
        OpenAD_Symbol_113 = __value__(UVELLOC)
        OpenAD_Symbol_109 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_107 = (-1_w2f__i8)
        OpenAD_Symbol_170 = (OpenAD_Symbol_90 * OpenAD_Symbol_88)
        OpenAD_Symbol_171 = (OpenAD_Symbol_91 * OpenAD_Symbol_88)
        OpenAD_Symbol_172 = (OpenAD_Symbol_70 * OpenAD_Symbol_68)
        OpenAD_Symbol_173 = (OpenAD_Symbol_71 * OpenAD_Symbol_68)
        OpenAD_Symbol_174 = (OpenAD_Symbol_103 * OpenAD_Symbol_171)
        OpenAD_Symbol_175 = (OpenAD_Symbol_104 * OpenAD_Symbol_171)
        OpenAD_Symbol_176 = (OpenAD_Symbol_83 * OpenAD_Symbol_173)
        OpenAD_Symbol_177 = (OpenAD_Symbol_84 * OpenAD_Symbol_173)
        OpenAD_Symbol_178 = (OpenAD_Symbol_105 * OpenAD_Symbol_175)
        OpenAD_Symbol_179 = (OpenAD_Symbol_106 * OpenAD_Symbol_175)
        OpenAD_Symbol_180 = (OpenAD_Symbol_85 * OpenAD_Symbol_177)
        OpenAD_Symbol_181 = (OpenAD_Symbol_86 * OpenAD_Symbol_177)
        OpenAD_Symbol_182 = (OpenAD_Symbol_93 * OpenAD_Symbol_170)
        OpenAD_Symbol_183 = (OpenAD_Symbol_73 * OpenAD_Symbol_172)
        OpenAD_Symbol_184 = (OpenAD_Symbol_109 * OpenAD_Symbol_107)
        OpenAD_Symbol_185 = (OpenAD_Symbol_112 * OpenAD_Symbol_184)
        OpenAD_Symbol_186 = (OpenAD_Symbol_113 * OpenAD_Symbol_184)
        OpenAD_Symbol_187 = (OpenAD_Symbol_114 * OpenAD_Symbol_186)
        OpenAD_Symbol_188 = (OpenAD_Symbol_115 * OpenAD_Symbol_186)
        OpenAD_Symbol_189 = (OpenAD_Symbol_96 * OpenAD_Symbol_182)
        OpenAD_Symbol_190 = (OpenAD_Symbol_76 * OpenAD_Symbol_183)
        OpenAD_Symbol_191 = (OpenAD_Symbol_99 * OpenAD_Symbol_189)
        OpenAD_Symbol_192 = (OpenAD_Symbol_79 * OpenAD_Symbol_190)
        OpenAD_Symbol_193 = (OpenAD_Symbol_101 * OpenAD_Symbol_191)
        OpenAD_Symbol_194 = (OpenAD_Symbol_81 * OpenAD_Symbol_192)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_174)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_176)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_178)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_179)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_180)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_181)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_185)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_187)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_188)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_193)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_194)
        OpenAD_Symbol_237 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_237)
      ENDIF
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_235)
      IF(OpenAD_Symbol_235 .ne. 0) THEN
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_375)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_375, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_376)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_376, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_377)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_377, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_378)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_378, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_379)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_379, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_380)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_380, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_381)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_381, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_382)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_382, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_383)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_383, __deriv__(DFLDDT(1)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_384)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_384, __deriv__(DFLDDT(2)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_385)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_385, __deriv__(DFLDDT(3)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_386)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_386, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_387)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_387, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_388)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_388, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_389)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_389, __deriv__(DFLDDT(3)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_390)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_390, __deriv__(DFLDDT(3)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_391)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_391, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_392)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_392, __deriv__(DFLDDT(1)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_393)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_393, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_394)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_394, __deriv__(DFLDDT(2)), __deriv__(
     > FLDNOW(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_395)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_395, __deriv__(DFLDDT(1)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_396)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_396, __deriv__(DFLDDT(2)), __deriv__(
     > UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
      ENDIF
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
