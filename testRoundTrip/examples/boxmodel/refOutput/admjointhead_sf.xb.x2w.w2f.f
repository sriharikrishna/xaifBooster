
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
      INTEGER(w2f__i8) OpenAD_Symbol_270
      INTEGER(w2f__i8) OpenAD_Symbol_271
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
      INTEGER(w2f__i8) OpenAD_Symbol_411
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
      RETURN
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
      OpenAD_Symbol_263 = 0_w2f__i8
      DO L = 1, 3, 1
        IF(__value__(TNOW(L)) .LT.(-2.0D00)) THEN
          __value__(TNOW(INT(L))) = 2.0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(L)
          OpenAD_Symbol_264 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_264)
        ELSE
          OpenAD_Symbol_265 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_265)
        ENDIF
        OpenAD_Symbol_263 = (INT(OpenAD_Symbol_263) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_263)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_260)
      OpenAD_Symbol_261 = 1
      DO WHILE(INT(OpenAD_Symbol_261) .LE. INT(OpenAD_Symbol_260))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_262)
        IF(OpenAD_Symbol_262 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_411)
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_411))))
        ENDIF
        OpenAD_Symbol_261 = INT(OpenAD_Symbol_261) + 1
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
      OpenAD_Symbol_269 = 0_w2f__i8
      DO L = 1, 3, 1
        IF(__value__(TNOW(L)) .LT.(-2.0D00)) THEN
          __value__(TNOW(INT(L))) = 2.0
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(L)
          OpenAD_Symbol_270 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_270)
        ELSE
          OpenAD_Symbol_271 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_271)
        ENDIF
        OpenAD_Symbol_269 = (INT(OpenAD_Symbol_269) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_269)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_266)
      OpenAD_Symbol_267 = 1
      DO WHILE(INT(OpenAD_Symbol_267) .LE. INT(OpenAD_Symbol_266))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_268)
        IF(OpenAD_Symbol_268 .ne. 0) THEN
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_411)
C         $OpenAD$ INLINE ZeroDeriv(subst)
          CALL ZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_411))))
        ENDIF
        OpenAD_Symbol_267 = INT(OpenAD_Symbol_267) + 1
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_300 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_300 = (INT(OpenAD_Symbol_300) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_300)
      OpenAD_Symbol_301 = 0_w2f__i8
      DO L = 1, 3, 1
        TSVEC(INT(L)) = __value__(TNOW(L))
        TSVEC(INT(L + 3)) = __value__(SNOW(L))
        OpenAD_Symbol_301 = (INT(OpenAD_Symbol_301) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_301)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_296)
      OpenAD_Symbol_297 = 1
      DO WHILE(INT(OpenAD_Symbol_297) .LE. INT(OpenAD_Symbol_296))
        OpenAD_Symbol_297 = INT(OpenAD_Symbol_297) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_298)
      OpenAD_Symbol_299 = 1
      DO WHILE(INT(OpenAD_Symbol_299) .LE. INT(OpenAD_Symbol_298))
        OpenAD_Symbol_299 = INT(OpenAD_Symbol_299) + 1
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
      OpenAD_Symbol_306 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_306 = (INT(OpenAD_Symbol_306) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_306)
      OpenAD_Symbol_307 = 0_w2f__i8
      DO L = 1, 3, 1
        TSVEC(INT(L)) = __value__(TNOW(L))
        TSVEC(INT(L + 3)) = __value__(SNOW(L))
        OpenAD_Symbol_307 = (INT(OpenAD_Symbol_307) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_307)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_302)
      OpenAD_Symbol_303 = 1
      DO WHILE(INT(OpenAD_Symbol_303) .LE. INT(OpenAD_Symbol_302))
        OpenAD_Symbol_303 = INT(OpenAD_Symbol_303) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_304)
      OpenAD_Symbol_305 = 1
      DO WHILE(INT(OpenAD_Symbol_305) .LE. INT(OpenAD_Symbol_304))
        OpenAD_Symbol_305 = INT(OpenAD_Symbol_305) + 1
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
      REAL(w2f__8) OpenAD_Symbol_136
      REAL(w2f__8) OpenAD_Symbol_137
      REAL(w2f__8) OpenAD_Symbol_138
      REAL(w2f__8) OpenAD_Symbol_139
      REAL(w2f__8) OpenAD_Symbol_242
      TYPE (OpenADTy_active) OpenAD_Symbol_243
      REAL(w2f__8) OpenAD_Symbol_244
      TYPE (OpenADTy_active) OpenAD_Symbol_245
      REAL(w2f__8) OpenAD_Symbol_246
      TYPE (OpenADTy_active) OpenAD_Symbol_247
      REAL(w2f__8) OpenAD_Symbol_248
      TYPE (OpenADTy_active) OpenAD_Symbol_249
      TYPE (OpenADTy_active) OpenAD_Symbol_250
      TYPE (OpenADTy_active) OpenAD_Symbol_251
      TYPE (OpenADTy_active) OpenAD_Symbol_252
      TYPE (OpenADTy_active) OpenAD_Symbol_253
      TYPE (OpenADTy_active) OpenAD_Symbol_254
      TYPE (OpenADTy_active) OpenAD_Symbol_255
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
      INTEGER(w2f__i8) OpenAD_Symbol_326
      INTEGER(w2f__i8) OpenAD_Symbol_463
      REAL(w2f__8) OpenAD_Symbol_464
      INTEGER(w2f__i8) OpenAD_Symbol_465
      REAL(w2f__8) OpenAD_Symbol_466
      INTEGER(w2f__i8) OpenAD_Symbol_467
      REAL(w2f__8) OpenAD_Symbol_468
      INTEGER(w2f__i8) OpenAD_Symbol_469
      REAL(w2f__8) OpenAD_Symbol_470
      INTEGER(w2f__i8) OpenAD_Symbol_471
      INTEGER(w2f__i8) OpenAD_Symbol_472
      INTEGER(w2f__i8) OpenAD_Symbol_473
      INTEGER(w2f__i8) OpenAD_Symbol_474
      INTEGER(w2f__i8) OpenAD_Symbol_475
      INTEGER(w2f__i8) OpenAD_Symbol_476
      INTEGER(w2f__i8) OpenAD_Symbol_477
      INTEGER(w2f__i8) OpenAD_Symbol_478
      INTEGER(w2f__i8) OpenAD_Symbol_479
      INTEGER(w2f__i8) OpenAD_Symbol_480
      INTEGER(w2f__i8) OpenAD_Symbol_481
      INTEGER(w2f__i8) OpenAD_Symbol_482
      INTEGER(w2f__i8) OpenAD_Symbol_483
      INTEGER(w2f__i8) OpenAD_Symbol_484
      INTEGER(w2f__i8) OpenAD_Symbol_485
      INTEGER(w2f__i8) OpenAD_Symbol_486
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
      RETURN
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
      OpenAD_Symbol_314 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_314 = (INT(OpenAD_Symbol_314) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_314)
      OpenAD_Symbol_315 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(T(INT(L))) = (__value__(T(L)) + __value__(XX(L)))
        OpenAD_Symbol_136 = 1_w2f__i8
        OpenAD_Symbol_137 = 1_w2f__i8
        __value__(S(INT(L))) = (__value__(S(L)) + __value__(XX(L + 3)))
        OpenAD_Symbol_138 = 1_w2f__i8
        OpenAD_Symbol_139 = 1_w2f__i8
        OpenAD_Symbol_242 = OpenAD_Symbol_136
        OpenAD_Symbol_244 = OpenAD_Symbol_137
        OpenAD_Symbol_246 = OpenAD_Symbol_138
        OpenAD_Symbol_248 = OpenAD_Symbol_139
        OpenAD_Symbol_326 = (L + 3)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_326)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_242)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_244)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_246)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_248)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_315 = (INT(OpenAD_Symbol_315) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_315)
      OpenAD_Symbol_316 = 0_w2f__i8
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
        OpenAD_Symbol_316 = (INT(OpenAD_Symbol_316) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_316)
      __value__(UVEL) = UBAR
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVEL))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_308)
      OpenAD_Symbol_309 = 1
      DO WHILE(INT(OpenAD_Symbol_309) .LE. INT(OpenAD_Symbol_308))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_475)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_475))),
     >  __deriv__(OpenAD_Symbol_255))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_476)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_476))),
     >  __deriv__(OpenAD_Symbol_254))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_477)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_477))),
     >  __deriv__(OpenAD_Symbol_253))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_478)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_478))),
     >  __deriv__(OpenAD_Symbol_252))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_479)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SNEW(INT(OpenAD_Symbol_479))),
     >  __deriv__(OpenAD_Symbol_251))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_480)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TNEW(INT(OpenAD_Symbol_480))),
     >  __deriv__(OpenAD_Symbol_250))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_481)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_250), __deriv__(T(INT(
     > OpenAD_Symbol_481))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_250))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_482)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_251), __deriv__(S(INT(
     > OpenAD_Symbol_482))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_251))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_483)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_252), __deriv__(T(INT(
     > OpenAD_Symbol_483))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_252))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_484)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_253), __deriv__(S(INT(
     > OpenAD_Symbol_484))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_253))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_485)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_254), __deriv__(T(INT(
     > OpenAD_Symbol_485))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_254))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_486)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_255), __deriv__(S(INT(
     > OpenAD_Symbol_486))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_255))
        OpenAD_Symbol_309 = INT(OpenAD_Symbol_309) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_310)
      OpenAD_Symbol_311 = 1
      DO WHILE(INT(OpenAD_Symbol_311) .LE. INT(OpenAD_Symbol_310))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_463)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_464)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_464, __deriv__(S(INT(OpenAD_Symbol_463
     > ))), __deriv__(OpenAD_Symbol_249))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_465)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_466)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_466, __deriv__(S(INT(OpenAD_Symbol_465
     > ))), __deriv__(OpenAD_Symbol_247))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(S(INT(OpenAD_Symbol_465))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_467)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_468)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_468, __deriv__(T(INT(OpenAD_Symbol_467
     > ))), __deriv__(OpenAD_Symbol_245))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_469)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_470)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_470, __deriv__(T(INT(OpenAD_Symbol_469
     > ))), __deriv__(OpenAD_Symbol_243))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(T(INT(OpenAD_Symbol_469))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_471)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_243), __deriv__(T(INT(
     > OpenAD_Symbol_471))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_243))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_472)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_245), __deriv__(XX(INT(
     > OpenAD_Symbol_472))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_245))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_473)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_247), __deriv__(S(INT(
     > OpenAD_Symbol_473))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_247))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_474)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_249), __deriv__(XX(INT(
     > OpenAD_Symbol_474))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_249))
        OpenAD_Symbol_311 = INT(OpenAD_Symbol_311) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_312)
      OpenAD_Symbol_313 = 1
      DO WHILE(INT(OpenAD_Symbol_313) .LE. INT(OpenAD_Symbol_312))
        OpenAD_Symbol_313 = INT(OpenAD_Symbol_313) + 1
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
      OpenAD_Symbol_323 = 0_w2f__i8
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
        OpenAD_Symbol_323 = (INT(OpenAD_Symbol_323) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_323)
      OpenAD_Symbol_324 = 0_w2f__i8
      DO L = 1, 3, 1
        __value__(T(INT(L))) = (__value__(T(L)) + __value__(XX(L)))
        OpenAD_Symbol_136 = 1_w2f__i8
        OpenAD_Symbol_137 = 1_w2f__i8
        __value__(S(INT(L))) = (__value__(S(L)) + __value__(XX(L + 3)))
        OpenAD_Symbol_138 = 1_w2f__i8
        OpenAD_Symbol_139 = 1_w2f__i8
        OpenAD_Symbol_242 = OpenAD_Symbol_136
        OpenAD_Symbol_244 = OpenAD_Symbol_137
        OpenAD_Symbol_246 = OpenAD_Symbol_138
        OpenAD_Symbol_248 = OpenAD_Symbol_139
        OpenAD_Symbol_326 = (L + 3)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_326)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_242)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_244)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_246)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_248)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_324 = (INT(OpenAD_Symbol_324) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_324)
      OpenAD_Symbol_325 = 0_w2f__i8
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
        OpenAD_Symbol_325 = (INT(OpenAD_Symbol_325) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_325)
      __value__(UVEL) = UBAR
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVEL))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_317)
      OpenAD_Symbol_318 = 1
      DO WHILE(INT(OpenAD_Symbol_318) .LE. INT(OpenAD_Symbol_317))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_475)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_475))),
     >  __deriv__(OpenAD_Symbol_255))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_476)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_476))),
     >  __deriv__(OpenAD_Symbol_254))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_477)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_477))),
     >  __deriv__(OpenAD_Symbol_253))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_478)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_478))),
     >  __deriv__(OpenAD_Symbol_252))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_479)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SNEW(INT(OpenAD_Symbol_479))),
     >  __deriv__(OpenAD_Symbol_251))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_480)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TNEW(INT(OpenAD_Symbol_480))),
     >  __deriv__(OpenAD_Symbol_250))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_481)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_250), __deriv__(T(INT(
     > OpenAD_Symbol_481))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_250))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_482)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_251), __deriv__(S(INT(
     > OpenAD_Symbol_482))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_251))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_483)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_252), __deriv__(T(INT(
     > OpenAD_Symbol_483))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_252))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_484)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_253), __deriv__(S(INT(
     > OpenAD_Symbol_484))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_253))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_485)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_254), __deriv__(T(INT(
     > OpenAD_Symbol_485))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_254))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_486)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_255), __deriv__(S(INT(
     > OpenAD_Symbol_486))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_255))
        OpenAD_Symbol_318 = INT(OpenAD_Symbol_318) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_319)
      OpenAD_Symbol_320 = 1
      DO WHILE(INT(OpenAD_Symbol_320) .LE. INT(OpenAD_Symbol_319))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_463)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_464)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_464, __deriv__(S(INT(OpenAD_Symbol_463
     > ))), __deriv__(OpenAD_Symbol_249))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_465)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_466)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_466, __deriv__(S(INT(OpenAD_Symbol_465
     > ))), __deriv__(OpenAD_Symbol_247))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(S(INT(OpenAD_Symbol_465))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_467)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_468)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_468, __deriv__(T(INT(OpenAD_Symbol_467
     > ))), __deriv__(OpenAD_Symbol_245))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_469)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_470)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_470, __deriv__(T(INT(OpenAD_Symbol_469
     > ))), __deriv__(OpenAD_Symbol_243))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(T(INT(OpenAD_Symbol_469))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_471)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_243), __deriv__(T(INT(
     > OpenAD_Symbol_471))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_243))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_472)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_245), __deriv__(XX(INT(
     > OpenAD_Symbol_472))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_245))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_473)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_247), __deriv__(S(INT(
     > OpenAD_Symbol_473))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_247))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_474)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_249), __deriv__(XX(INT(
     > OpenAD_Symbol_474))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_249))
        OpenAD_Symbol_320 = INT(OpenAD_Symbol_320) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_321)
      OpenAD_Symbol_322 = 1
      DO WHILE(INT(OpenAD_Symbol_322) .LE. INT(OpenAD_Symbol_321))
        OpenAD_Symbol_322 = INT(OpenAD_Symbol_322) + 1
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
      INTEGER(w2f__i8) OpenAD_Symbol_327
      INTEGER(w2f__i8) OpenAD_Symbol_328
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
      INTEGER(w2f__i8) OpenAD_Symbol_359
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
      RETURN
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
      OpenAD_Symbol_342 = 0_w2f__i8
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
        OpenAD_Symbol_342 = (INT(OpenAD_Symbol_342) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_342)
      OpenAD_Symbol_343 = 0_w2f__i8
      DO L = 1, 6, 1
        IF(L .LE. 3) THEN
          PROJ_T(INT(L)) = 1.0
          PROJ_S(INT(L)) = 0.0
          OpenAD_Symbol_344 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_344)
        ELSE
          PROJ_T(INT(L)) = 0.0
          PROJ_S(INT(L)) = 1.0
          OpenAD_Symbol_345 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_345)
        ENDIF
        OpenAD_Symbol_343 = (INT(OpenAD_Symbol_343) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_343)
      OpenAD_Symbol_346 = 0_w2f__i8
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
        OpenAD_Symbol_346 = (INT(OpenAD_Symbol_346) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_346)
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      OpenAD_Symbol_347 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_348 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
          OpenAD_Symbol_348 = (INT(OpenAD_Symbol_348) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_348)
        OpenAD_Symbol_347 = (INT(OpenAD_Symbol_347) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_347)
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      OpenAD_Symbol_349 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_350 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
          OpenAD_Symbol_350 = (INT(OpenAD_Symbol_350) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_350)
        OpenAD_Symbol_349 = (INT(OpenAD_Symbol_349) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_349)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_327)
      OpenAD_Symbol_328 = 1
      DO WHILE(INT(OpenAD_Symbol_328) .LE. INT(OpenAD_Symbol_327))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_329)
        OpenAD_Symbol_330 = 1
        DO WHILE(INT(OpenAD_Symbol_330) .LE. INT(OpenAD_Symbol_329))
          OpenAD_Symbol_330 = INT(OpenAD_Symbol_330) + 1
        END DO
        OpenAD_Symbol_328 = INT(OpenAD_Symbol_328) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_331)
      OpenAD_Symbol_332 = 1
      DO WHILE(INT(OpenAD_Symbol_332) .LE. INT(OpenAD_Symbol_331))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_333)
        OpenAD_Symbol_334 = 1
        DO WHILE(INT(OpenAD_Symbol_334) .LE. INT(OpenAD_Symbol_333))
          OpenAD_Symbol_334 = INT(OpenAD_Symbol_334) + 1
        END DO
        OpenAD_Symbol_332 = INT(OpenAD_Symbol_332) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_335)
      OpenAD_Symbol_336 = 1
      DO WHILE(INT(OpenAD_Symbol_336) .LE. INT(OpenAD_Symbol_335))
        OpenAD_Symbol_336 = INT(OpenAD_Symbol_336) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_337)
      OpenAD_Symbol_338 = 1
      DO WHILE(INT(OpenAD_Symbol_338) .LE. INT(OpenAD_Symbol_337))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_339)
        IF(OpenAD_Symbol_339 .ne. 0) THEN
        ENDIF
        OpenAD_Symbol_338 = INT(OpenAD_Symbol_338) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_340)
      OpenAD_Symbol_341 = 1
      DO WHILE(INT(OpenAD_Symbol_341) .LE. INT(OpenAD_Symbol_340))
        OpenAD_Symbol_341 = INT(OpenAD_Symbol_341) + 1
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
      OpenAD_Symbol_366 = 0_w2f__i8
      DO L = 1, 6, 1
        R(INT(L)) = ((R(L) * U0) / SV)
        OpenAD_Symbol_366 = (INT(OpenAD_Symbol_366) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_366)
      OpenAD_Symbol_367 = 0_w2f__i8
      DO L = 1, 6, 1
        IF(L .LE. 3) THEN
          PROJ_T(INT(L)) = 1.0
          PROJ_S(INT(L)) = 0.0
          OpenAD_Symbol_368 = 1_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_368)
        ELSE
          PROJ_T(INT(L)) = 0.0
          PROJ_S(INT(L)) = 1.0
          OpenAD_Symbol_369 = 0_w2f__i8
C         $OpenAD$ INLINE push_i(subst)
          CALL push_i(OpenAD_Symbol_369)
        ENDIF
        OpenAD_Symbol_367 = (INT(OpenAD_Symbol_367) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_367)
      OpenAD_Symbol_370 = 0_w2f__i8
      DO L = 1, 6, 1
        R_T(INT(L)) = (PROJ_T(L) * R(L))
        R_S(INT(L)) = (PROJ_S(L) * R(L))
        OpenAD_Symbol_370 = (INT(OpenAD_Symbol_370) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_370)
      R1(1) = 1.0D00
      R1(2) = (-1.0D00)
      R1(3) = 0.0D00
      R1(4) = 0.0D00
      R1(5) = 0.0D00
      R1(6) = 0.0D00
      OpenAD_Symbol_371 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_372 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (R(I) * R(J))
          OpenAD_Symbol_372 = (INT(OpenAD_Symbol_372) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_372)
        OpenAD_Symbol_371 = (INT(OpenAD_Symbol_371) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_371)
      EPSILON_REGULARIZE = 1.00000000000000002092D-08
      OpenAD_Symbol_373 = 0_w2f__i8
      DO J = 1, 6, 1
        OpenAD_Symbol_374 = 0_w2f__i8
        DO I = 1, 6, 1
          X(INT(I), INT(J)) = (X(I, J) + EPSILON_REGULARIZE)
          OpenAD_Symbol_374 = (INT(OpenAD_Symbol_374) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_374)
        OpenAD_Symbol_373 = (INT(OpenAD_Symbol_373) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_373)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_351)
      OpenAD_Symbol_352 = 1
      DO WHILE(INT(OpenAD_Symbol_352) .LE. INT(OpenAD_Symbol_351))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_353)
        OpenAD_Symbol_354 = 1
        DO WHILE(INT(OpenAD_Symbol_354) .LE. INT(OpenAD_Symbol_353))
          OpenAD_Symbol_354 = INT(OpenAD_Symbol_354) + 1
        END DO
        OpenAD_Symbol_352 = INT(OpenAD_Symbol_352) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_355)
      OpenAD_Symbol_356 = 1
      DO WHILE(INT(OpenAD_Symbol_356) .LE. INT(OpenAD_Symbol_355))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_357)
        OpenAD_Symbol_358 = 1
        DO WHILE(INT(OpenAD_Symbol_358) .LE. INT(OpenAD_Symbol_357))
          OpenAD_Symbol_358 = INT(OpenAD_Symbol_358) + 1
        END DO
        OpenAD_Symbol_356 = INT(OpenAD_Symbol_356) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_359)
      OpenAD_Symbol_360 = 1
      DO WHILE(INT(OpenAD_Symbol_360) .LE. INT(OpenAD_Symbol_359))
        OpenAD_Symbol_360 = INT(OpenAD_Symbol_360) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_361)
      OpenAD_Symbol_362 = 1
      DO WHILE(INT(OpenAD_Symbol_362) .LE. INT(OpenAD_Symbol_361))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_363)
        IF(OpenAD_Symbol_363 .ne. 0) THEN
        ENDIF
        OpenAD_Symbol_362 = INT(OpenAD_Symbol_362) + 1
      END DO
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_364)
      OpenAD_Symbol_365 = 1
      DO WHILE(INT(OpenAD_Symbol_365) .LE. INT(OpenAD_Symbol_364))
        OpenAD_Symbol_365 = INT(OpenAD_Symbol_365) + 1
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
      INTEGER(w2f__i8) OpenAD_Symbol_375
      INTEGER(w2f__i8) OpenAD_Symbol_376
      INTEGER(w2f__i8) OpenAD_Symbol_377
      INTEGER(w2f__i8) OpenAD_Symbol_378
      INTEGER(w2f__i8) OpenAD_Symbol_379
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
      INTEGER(w2f__i8) OpenAD_Symbol_398
      INTEGER(w2f__i8) OpenAD_Symbol_399
      INTEGER(w2f__i8) OpenAD_Symbol_400
      INTEGER(w2f__i8) OpenAD_Symbol_401
      INTEGER(w2f__i8) OpenAD_Symbol_402
      INTEGER(w2f__i8) OpenAD_Symbol_403
      INTEGER(w2f__i8) OpenAD_Symbol_404
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      CALL box_ini_fields()
      MAXLEV2 = (N_MAX / 73) + 1
      IF(N_MAX .GT. 3650) THEN
        WRITE(*, *) 'NEED TO SET nlev1*nlev2 >= n_max '
        OpenAD_Symbol_388 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_388)
      ELSE
        OpenAD_Symbol_382 = 0_w2f__i8
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            OpenAD_Symbol_383 = 0_w2f__i8
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
                OpenAD_Symbol_384 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_384)
              ELSE
                OpenAD_Symbol_385 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_385)
              ENDIF
              OpenAD_Symbol_383 = (INT(OpenAD_Symbol_383) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_383)
            OpenAD_Symbol_387 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_387)
          ELSE
            OpenAD_Symbol_386 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_386)
          ENDIF
          OpenAD_Symbol_382 = (INT(OpenAD_Symbol_382) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_382)
        CALL box_final_state()
        OpenAD_Symbol_389 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_389)
      ENDIF
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_375)
      IF(OpenAD_Symbol_375 .ne. 0) THEN
      ELSE
        CALL box_final_state()
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_376)
        OpenAD_Symbol_377 = 1
        DO WHILE(INT(OpenAD_Symbol_377) .LE. INT(OpenAD_Symbol_376))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_378)
          IF(OpenAD_Symbol_378 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_379)
            OpenAD_Symbol_380 = 1
            DO WHILE(INT(OpenAD_Symbol_380) .LE. INT(OpenAD_Symbol_379)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_381)
              IF(OpenAD_Symbol_381 .ne. 0) THEN
                CALL box_forward(ILEV1)
              ENDIF
              OpenAD_Symbol_380 = INT(OpenAD_Symbol_380) + 1
            END DO
          ENDIF
          OpenAD_Symbol_377 = INT(OpenAD_Symbol_377) + 1
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
        OpenAD_Symbol_403 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_403)
      ELSE
        OpenAD_Symbol_397 = 0_w2f__i8
        DO ILEV2 = 1, 50, 1
          IF(ILEV2 .LE. MAXLEV2) THEN
            OpenAD_Symbol_398 = 0_w2f__i8
            DO ILEV1 = 1, 73, 1
              ILOOP = ILEV1 + ILEV2 * 73 +(-73)
              IF(ILOOP .LE. N_MAX) THEN
                CALL box_forward(ILEV1)
                OpenAD_Symbol_399 = 1_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_399)
              ELSE
                OpenAD_Symbol_400 = 0_w2f__i8
C               $OpenAD$ INLINE push_i(subst)
                CALL push_i(OpenAD_Symbol_400)
              ENDIF
              OpenAD_Symbol_398 = (INT(OpenAD_Symbol_398) + INT(
     > 1_w2f__i8))
            END DO
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_398)
            OpenAD_Symbol_402 = 1_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_402)
          ELSE
            OpenAD_Symbol_401 = 0_w2f__i8
C           $OpenAD$ INLINE push_i(subst)
            CALL push_i(OpenAD_Symbol_401)
          ENDIF
          OpenAD_Symbol_397 = (INT(OpenAD_Symbol_397) + INT(1_w2f__i8))
        END DO
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_397)
        CALL box_final_state()
        OpenAD_Symbol_404 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_404)
      ENDIF
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_390)
      IF(OpenAD_Symbol_390 .ne. 0) THEN
      ELSE
        CALL box_final_state()
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_391)
        OpenAD_Symbol_392 = 1
        DO WHILE(INT(OpenAD_Symbol_392) .LE. INT(OpenAD_Symbol_391))
C         $OpenAD$ INLINE pop_i(subst)
          CALL pop_i(OpenAD_Symbol_393)
          IF(OpenAD_Symbol_393 .ne. 0) THEN
C           $OpenAD$ INLINE pop_i(subst)
            CALL pop_i(OpenAD_Symbol_394)
            OpenAD_Symbol_395 = 1
            DO WHILE(INT(OpenAD_Symbol_395) .LE. INT(OpenAD_Symbol_394)
     > )
C             $OpenAD$ INLINE pop_i(subst)
              CALL pop_i(OpenAD_Symbol_396)
              IF(OpenAD_Symbol_396 .ne. 0) THEN
                CALL box_forward(ILEV1)
              ENDIF
              OpenAD_Symbol_395 = INT(OpenAD_Symbol_395) + 1
            END DO
          ENDIF
          OpenAD_Symbol_392 = INT(OpenAD_Symbol_392) + 1
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
      REAL(w2f__8) OpenAD_Symbol_146
      TYPE (OpenADTy_active) OpenAD_Symbol_147
      REAL(w2f__8) OpenAD_Symbol_148
      TYPE (OpenADTy_active) OpenAD_Symbol_149
      REAL(w2f__8) OpenAD_Symbol_2
      INTEGER(w2f__i8) OpenAD_Symbol_272
      INTEGER(w2f__i8) OpenAD_Symbol_273
      INTEGER(w2f__i8) OpenAD_Symbol_274
      INTEGER(w2f__i8) OpenAD_Symbol_275
      INTEGER(w2f__i8) OpenAD_Symbol_276
      INTEGER(w2f__i8) OpenAD_Symbol_277
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
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
      INTEGER(w2f__i8) OpenAD_Symbol_412
      REAL(w2f__8) OpenAD_Symbol_413
      INTEGER(w2f__i8) OpenAD_Symbol_414
      REAL(w2f__8) OpenAD_Symbol_415
      INTEGER(w2f__i8) OpenAD_Symbol_416
      INTEGER(w2f__i8) OpenAD_Symbol_417
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        __value__(RHOLOC(INT(L))) = (__value__(SLOC(L)) * BETA -
     >  __value__(TLOC(L)) * ALPHA)
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_274 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_6 = (__value__(SLOC(L)) * BETA - __value__(TLOC(L
     > )) * ALPHA)
        OpenAD_Symbol_2 = BETA
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_4 = ALPHA
        OpenAD_Symbol_1 = (-1_w2f__i8)
        __value__(RHOLOC(INT(L))) = OpenAD_Symbol_6
        OpenAD_Symbol_146 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
        OpenAD_Symbol_148 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_146)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_148)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_274 = (INT(OpenAD_Symbol_274) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_274)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_272)
      OpenAD_Symbol_273 = 1
      DO WHILE(INT(OpenAD_Symbol_273) .LE. INT(OpenAD_Symbol_272))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_412)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_413)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_413, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_412))), __deriv__(OpenAD_Symbol_149))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_414)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_415)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_415, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_414))), __deriv__(OpenAD_Symbol_147))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(RHOLOC(INT(OpenAD_Symbol_414))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_416)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_147), __deriv__(SLOC(INT(
     > OpenAD_Symbol_416))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_147))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_417)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_149), __deriv__(TLOC(INT(
     > OpenAD_Symbol_417))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_149))
        OpenAD_Symbol_273 = INT(OpenAD_Symbol_273) + 1
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
      OpenAD_Symbol_277 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_6 = (__value__(SLOC(L)) * BETA - __value__(TLOC(L
     > )) * ALPHA)
        OpenAD_Symbol_2 = BETA
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_4 = ALPHA
        OpenAD_Symbol_1 = (-1_w2f__i8)
        __value__(RHOLOC(INT(L))) = OpenAD_Symbol_6
        OpenAD_Symbol_146 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
        OpenAD_Symbol_148 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_146)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_148)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_277 = (INT(OpenAD_Symbol_277) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_277)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_275)
      OpenAD_Symbol_276 = 1
      DO WHILE(INT(OpenAD_Symbol_276) .LE. INT(OpenAD_Symbol_275))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_412)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_413)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_413, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_412))), __deriv__(OpenAD_Symbol_149))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_414)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_415)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_415, __deriv__(RHOLOC(INT(
     > OpenAD_Symbol_414))), __deriv__(OpenAD_Symbol_147))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(RHOLOC(INT(OpenAD_Symbol_414))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_416)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_147), __deriv__(SLOC(INT(
     > OpenAD_Symbol_416))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_147))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_417)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_149), __deriv__(TLOC(INT(
     > OpenAD_Symbol_417))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_149))
        OpenAD_Symbol_276 = INT(OpenAD_Symbol_276) + 1
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
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_150
      REAL(w2f__8) OpenAD_Symbol_151
      REAL(w2f__8) OpenAD_Symbol_152
      TYPE (OpenADTy_active) OpenAD_Symbol_153
      REAL(w2f__8) OpenAD_Symbol_154
      REAL(w2f__8) OpenAD_Symbol_155
      REAL(w2f__8) OpenAD_Symbol_156
      TYPE (OpenADTy_active) OpenAD_Symbol_157
      REAL(w2f__8) OpenAD_Symbol_158
      TYPE (OpenADTy_active) OpenAD_Symbol_159
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
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
      REAL(w2f__8) OpenAD_Symbol_418
      REAL(w2f__8) OpenAD_Symbol_419
      REAL(w2f__8) OpenAD_Symbol_420
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(UVELLOC) = (-(U0 *(__value__(RHOLOC(1)) * DELTA +
     >  __value__(RHOLOC(3)) *(1.0D00 - DELTA) - __value__(RHOLOC(2))))
     > )
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_17 = (1.0D00 - DELTA)
      OpenAD_Symbol_8 = (__value__(RHOLOC(1)) * DELTA + __value__(
     > RHOLOC(3)) * OpenAD_Symbol_17 - __value__(RHOLOC(2)))
      OpenAD_Symbol_20 = (-(U0 * OpenAD_Symbol_8))
      OpenAD_Symbol_15 = DELTA
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_18 = OpenAD_Symbol_17
      OpenAD_Symbol_14 = 1_w2f__i8
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_10 = U0
      OpenAD_Symbol_7 = (-1_w2f__i8)
      __value__(UVELLOC) = OpenAD_Symbol_20
      OpenAD_Symbol_150 = (OpenAD_Symbol_10 * OpenAD_Symbol_7)
      OpenAD_Symbol_151 = (OpenAD_Symbol_11 * OpenAD_Symbol_150)
      OpenAD_Symbol_152 = (OpenAD_Symbol_12 * OpenAD_Symbol_150)
      OpenAD_Symbol_154 = (OpenAD_Symbol_13 * OpenAD_Symbol_151)
      OpenAD_Symbol_155 = (OpenAD_Symbol_14 * OpenAD_Symbol_151)
      OpenAD_Symbol_156 = (OpenAD_Symbol_18 * OpenAD_Symbol_155)
      OpenAD_Symbol_158 = (OpenAD_Symbol_15 * OpenAD_Symbol_154)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_152)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_156)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_158)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_418)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_418, __deriv__(UVELLOC), __deriv__(
     > OpenAD_Symbol_159))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_419)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_419, __deriv__(UVELLOC), __deriv__(
     > OpenAD_Symbol_157))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_420)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_420, __deriv__(UVELLOC), __deriv__(
     > OpenAD_Symbol_153))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVELLOC))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_153), __deriv__(RHOLOC(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_153))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_157), __deriv__(RHOLOC(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_157))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_159), __deriv__(RHOLOC(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_159))
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
      OpenAD_Symbol_17 = (1.0D00 - DELTA)
      OpenAD_Symbol_8 = (__value__(RHOLOC(1)) * DELTA + __value__(
     > RHOLOC(3)) * OpenAD_Symbol_17 - __value__(RHOLOC(2)))
      OpenAD_Symbol_20 = (-(U0 * OpenAD_Symbol_8))
      OpenAD_Symbol_15 = DELTA
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_18 = OpenAD_Symbol_17
      OpenAD_Symbol_14 = 1_w2f__i8
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = (-1_w2f__i8)
      OpenAD_Symbol_10 = U0
      OpenAD_Symbol_7 = (-1_w2f__i8)
      __value__(UVELLOC) = OpenAD_Symbol_20
      OpenAD_Symbol_150 = (OpenAD_Symbol_10 * OpenAD_Symbol_7)
      OpenAD_Symbol_151 = (OpenAD_Symbol_11 * OpenAD_Symbol_150)
      OpenAD_Symbol_152 = (OpenAD_Symbol_12 * OpenAD_Symbol_150)
      OpenAD_Symbol_154 = (OpenAD_Symbol_13 * OpenAD_Symbol_151)
      OpenAD_Symbol_155 = (OpenAD_Symbol_14 * OpenAD_Symbol_151)
      OpenAD_Symbol_156 = (OpenAD_Symbol_18 * OpenAD_Symbol_155)
      OpenAD_Symbol_158 = (OpenAD_Symbol_15 * OpenAD_Symbol_154)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_152)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_156)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_158)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_418)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_418, __deriv__(UVELLOC), __deriv__(
     > OpenAD_Symbol_159))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_419)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_419, __deriv__(UVELLOC), __deriv__(
     > OpenAD_Symbol_157))
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_420)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_420, __deriv__(UVELLOC), __deriv__(
     > OpenAD_Symbol_153))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(UVELLOC))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_153), __deriv__(RHOLOC(2)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_153))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_157), __deriv__(RHOLOC(3)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_157))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_159), __deriv__(RHOLOC(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_159))
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
      REAL(w2f__8) OpenAD_Symbol_124
      REAL(w2f__8) OpenAD_Symbol_125
      REAL(w2f__8) OpenAD_Symbol_126
      REAL(w2f__8) OpenAD_Symbol_128
      REAL(w2f__8) OpenAD_Symbol_129
      REAL(w2f__8) OpenAD_Symbol_130
      REAL(w2f__8) OpenAD_Symbol_131
      REAL(w2f__8) OpenAD_Symbol_132
      REAL(w2f__8) OpenAD_Symbol_133
      REAL(w2f__8) OpenAD_Symbol_135
      REAL(w2f__8) OpenAD_Symbol_227
      REAL(w2f__8) OpenAD_Symbol_228
      TYPE (OpenADTy_active) OpenAD_Symbol_229
      REAL(w2f__8) OpenAD_Symbol_230
      REAL(w2f__8) OpenAD_Symbol_231
      TYPE (OpenADTy_active) OpenAD_Symbol_232
      REAL(w2f__8) OpenAD_Symbol_233
      REAL(w2f__8) OpenAD_Symbol_234
      TYPE (OpenADTy_active) OpenAD_Symbol_235
      REAL(w2f__8) OpenAD_Symbol_236
      TYPE (OpenADTy_active) OpenAD_Symbol_237
      INTEGER(w2f__i8) OpenAD_Symbol_284
      INTEGER(w2f__i8) OpenAD_Symbol_285
      INTEGER(w2f__i8) OpenAD_Symbol_286
      INTEGER(w2f__i8) OpenAD_Symbol_287
      INTEGER(w2f__i8) OpenAD_Symbol_288
      INTEGER(w2f__i8) OpenAD_Symbol_289
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
      INTEGER(w2f__i8) OpenAD_Symbol_443
      REAL(w2f__8) OpenAD_Symbol_444
      INTEGER(w2f__i8) OpenAD_Symbol_445
      REAL(w2f__8) OpenAD_Symbol_446
      INTEGER(w2f__i8) OpenAD_Symbol_447
      REAL(w2f__8) OpenAD_Symbol_448
      INTEGER(w2f__i8) OpenAD_Symbol_449
      REAL(w2f__8) OpenAD_Symbol_450
      INTEGER(w2f__i8) OpenAD_Symbol_451
      INTEGER(w2f__i8) OpenAD_Symbol_452
      INTEGER(w2f__i8) OpenAD_Symbol_453
      INTEGER(w2f__i8) OpenAD_Symbol_454
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_286 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_126 = (__value__(FLDOLD(L)) + __value__(FLDNEW(L)
     > ) - __value__(FLDNOW(L)) * 2.0D00)
        OpenAD_Symbol_135 = (__value__(FLDNOW(L)) + ROBERT_FILTER_COEFF
     >  * OpenAD_Symbol_126)
        OpenAD_Symbol_124 = 1_w2f__i8
        OpenAD_Symbol_129 = 1_w2f__i8
        OpenAD_Symbol_131 = 1_w2f__i8
        OpenAD_Symbol_133 = 2.0D00
        OpenAD_Symbol_132 = (-1_w2f__i8)
        OpenAD_Symbol_130 = 1_w2f__i8
        OpenAD_Symbol_128 = ROBERT_FILTER_COEFF
        OpenAD_Symbol_125 = 1_w2f__i8
        __value__(FLDNOW(INT(L))) = OpenAD_Symbol_135
        OpenAD_Symbol_227 = (OpenAD_Symbol_128 * OpenAD_Symbol_125)
        OpenAD_Symbol_228 = (OpenAD_Symbol_129 * OpenAD_Symbol_227)
        OpenAD_Symbol_230 = (OpenAD_Symbol_130 * OpenAD_Symbol_227)
        OpenAD_Symbol_231 = (OpenAD_Symbol_131 * OpenAD_Symbol_230)
        OpenAD_Symbol_233 = (OpenAD_Symbol_132 * OpenAD_Symbol_230)
        OpenAD_Symbol_234 = (OpenAD_Symbol_133 * OpenAD_Symbol_233)
        OpenAD_Symbol_236 = OpenAD_Symbol_124
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_228)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_231)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_234)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_236)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_286 = (INT(OpenAD_Symbol_286) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_286)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_284)
      OpenAD_Symbol_285 = 1
      DO WHILE(INT(OpenAD_Symbol_285) .LE. INT(OpenAD_Symbol_284))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_443)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_444)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_444, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_443))), __deriv__(OpenAD_Symbol_237))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_445)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_446)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_446, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_445))), __deriv__(OpenAD_Symbol_235))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_447)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_448)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_448, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_447))), __deriv__(OpenAD_Symbol_232))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_449)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_450)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_450, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_449))), __deriv__(OpenAD_Symbol_229))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNOW(INT(OpenAD_Symbol_449))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_451)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_229), __deriv__(FLDOLD(
     > INT(OpenAD_Symbol_451))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_229))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_452)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_232), __deriv__(FLDNEW(
     > INT(OpenAD_Symbol_452))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_232))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_453)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_235), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_453))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_235))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_454)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_237), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_454))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_237))
        OpenAD_Symbol_285 = INT(OpenAD_Symbol_285) + 1
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
      OpenAD_Symbol_289 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_126 = (__value__(FLDOLD(L)) + __value__(FLDNEW(L)
     > ) - __value__(FLDNOW(L)) * 2.0D00)
        OpenAD_Symbol_135 = (__value__(FLDNOW(L)) + ROBERT_FILTER_COEFF
     >  * OpenAD_Symbol_126)
        OpenAD_Symbol_124 = 1_w2f__i8
        OpenAD_Symbol_129 = 1_w2f__i8
        OpenAD_Symbol_131 = 1_w2f__i8
        OpenAD_Symbol_133 = 2.0D00
        OpenAD_Symbol_132 = (-1_w2f__i8)
        OpenAD_Symbol_130 = 1_w2f__i8
        OpenAD_Symbol_128 = ROBERT_FILTER_COEFF
        OpenAD_Symbol_125 = 1_w2f__i8
        __value__(FLDNOW(INT(L))) = OpenAD_Symbol_135
        OpenAD_Symbol_227 = (OpenAD_Symbol_128 * OpenAD_Symbol_125)
        OpenAD_Symbol_228 = (OpenAD_Symbol_129 * OpenAD_Symbol_227)
        OpenAD_Symbol_230 = (OpenAD_Symbol_130 * OpenAD_Symbol_227)
        OpenAD_Symbol_231 = (OpenAD_Symbol_131 * OpenAD_Symbol_230)
        OpenAD_Symbol_233 = (OpenAD_Symbol_132 * OpenAD_Symbol_230)
        OpenAD_Symbol_234 = (OpenAD_Symbol_133 * OpenAD_Symbol_233)
        OpenAD_Symbol_236 = OpenAD_Symbol_124
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_228)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_231)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_234)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_236)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_289 = (INT(OpenAD_Symbol_289) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_289)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_287)
      OpenAD_Symbol_288 = 1
      DO WHILE(INT(OpenAD_Symbol_288) .LE. INT(OpenAD_Symbol_287))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_443)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_444)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_444, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_443))), __deriv__(OpenAD_Symbol_237))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_445)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_446)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_446, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_445))), __deriv__(OpenAD_Symbol_235))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_447)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_448)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_448, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_447))), __deriv__(OpenAD_Symbol_232))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_449)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_450)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_450, __deriv__(FLDNOW(INT(
     > OpenAD_Symbol_449))), __deriv__(OpenAD_Symbol_229))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNOW(INT(OpenAD_Symbol_449))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_451)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_229), __deriv__(FLDOLD(
     > INT(OpenAD_Symbol_451))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_229))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_452)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_232), __deriv__(FLDNEW(
     > INT(OpenAD_Symbol_452))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_232))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_453)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_235), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_453))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_235))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_454)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_237), __deriv__(FLDNOW(
     > INT(OpenAD_Symbol_454))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_237))
        OpenAD_Symbol_288 = INT(OpenAD_Symbol_288) + 1
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
      TYPE (OpenADTy_active) OpenAD_Symbol_238
      TYPE (OpenADTy_active) OpenAD_Symbol_239
      TYPE (OpenADTy_active) OpenAD_Symbol_240
      TYPE (OpenADTy_active) OpenAD_Symbol_241
      INTEGER(w2f__i8) OpenAD_Symbol_290
      INTEGER(w2f__i8) OpenAD_Symbol_291
      INTEGER(w2f__i8) OpenAD_Symbol_292
      INTEGER(w2f__i8) OpenAD_Symbol_293
      INTEGER(w2f__i8) OpenAD_Symbol_294
      INTEGER(w2f__i8) OpenAD_Symbol_295
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
      INTEGER(w2f__i8) OpenAD_Symbol_455
      INTEGER(w2f__i8) OpenAD_Symbol_456
      INTEGER(w2f__i8) OpenAD_Symbol_457
      INTEGER(w2f__i8) OpenAD_Symbol_458
      INTEGER(w2f__i8) OpenAD_Symbol_459
      INTEGER(w2f__i8) OpenAD_Symbol_460
      INTEGER(w2f__i8) OpenAD_Symbol_461
      INTEGER(w2f__i8) OpenAD_Symbol_462
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_292 = 0_w2f__i8
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
        OpenAD_Symbol_292 = (INT(OpenAD_Symbol_292) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_292)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_290)
      OpenAD_Symbol_291 = 1
      DO WHILE(INT(OpenAD_Symbol_291) .LE. INT(OpenAD_Symbol_290))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_455)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_455))),
     >  __deriv__(OpenAD_Symbol_241))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_456)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_456))),
     >  __deriv__(OpenAD_Symbol_240))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_457)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_240), __deriv__(SNOW(INT(
     > OpenAD_Symbol_457))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_240))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_458)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_241), __deriv__(SNEW(INT(
     > OpenAD_Symbol_458))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_241))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_459)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_459))),
     >  __deriv__(OpenAD_Symbol_239))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_460)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_460))),
     >  __deriv__(OpenAD_Symbol_238))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_461)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_238), __deriv__(TNOW(INT(
     > OpenAD_Symbol_461))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_238))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_462)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_239), __deriv__(TNEW(INT(
     > OpenAD_Symbol_462))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_239))
        OpenAD_Symbol_291 = INT(OpenAD_Symbol_291) + 1
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
      OpenAD_Symbol_295 = 0_w2f__i8
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
        OpenAD_Symbol_295 = (INT(OpenAD_Symbol_295) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_295)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_293)
      OpenAD_Symbol_294 = 1
      DO WHILE(INT(OpenAD_Symbol_294) .LE. INT(OpenAD_Symbol_293))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_455)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SNOW(INT(OpenAD_Symbol_455))),
     >  __deriv__(OpenAD_Symbol_241))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_456)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(SOLD(INT(OpenAD_Symbol_456))),
     >  __deriv__(OpenAD_Symbol_240))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_457)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_240), __deriv__(SNOW(INT(
     > OpenAD_Symbol_457))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_240))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_458)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_241), __deriv__(SNEW(INT(
     > OpenAD_Symbol_458))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_241))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_459)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TNOW(INT(OpenAD_Symbol_459))),
     >  __deriv__(OpenAD_Symbol_239))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_460)
C       $OpenAD$ INLINE CondIncZeroDeriv(subst,subst)
        CALL CondIncZeroDeriv(__deriv__(TOLD(INT(OpenAD_Symbol_460))),
     >  __deriv__(OpenAD_Symbol_238))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_461)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_238), __deriv__(TNOW(INT(
     > OpenAD_Symbol_461))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_238))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_462)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_239), __deriv__(TNEW(INT(
     > OpenAD_Symbol_462))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_239))
        OpenAD_Symbol_294 = INT(OpenAD_Symbol_294) + 1
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
      REAL(w2f__8) OpenAD_Symbol_140
      REAL(w2f__8) OpenAD_Symbol_141
      REAL(w2f__8) OpenAD_Symbol_142
      REAL(w2f__8) OpenAD_Symbol_143
      REAL(w2f__8) OpenAD_Symbol_145
      REAL(w2f__8) OpenAD_Symbol_256
      TYPE (OpenADTy_active) OpenAD_Symbol_257
      REAL(w2f__8) OpenAD_Symbol_258
      TYPE (OpenADTy_active) OpenAD_Symbol_259
      INTEGER(w2f__i8) OpenAD_Symbol_405
      INTEGER(w2f__i8) OpenAD_Symbol_406
      INTEGER(w2f__i8) OpenAD_Symbol_407
      INTEGER(w2f__i8) OpenAD_Symbol_408
      INTEGER(w2f__i8) OpenAD_Symbol_409
      INTEGER(w2f__i8) OpenAD_Symbol_410
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
      INTEGER(w2f__i8) OpenAD_Symbol_487
      REAL(w2f__8) OpenAD_Symbol_488
      INTEGER(w2f__i8) OpenAD_Symbol_489
      REAL(w2f__8) OpenAD_Symbol_490
      INTEGER(w2f__i8) OpenAD_Symbol_491
      INTEGER(w2f__i8) OpenAD_Symbol_492
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        __value__(FLDNEW(INT(L))) = (__value__(FLDOLD(L)) + __value__(
     > DFLDDT(L)) * DELTA_T * 2.0D00)
      END DO
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_407 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_142 = (DELTA_T * 2.0D00)
        OpenAD_Symbol_145 = (__value__(FLDOLD(L)) + __value__(DFLDDT(L)
     > ) * OpenAD_Symbol_142)
        OpenAD_Symbol_140 = 1_w2f__i8
        OpenAD_Symbol_143 = OpenAD_Symbol_142
        OpenAD_Symbol_141 = 1_w2f__i8
        __value__(FLDNEW(INT(L))) = OpenAD_Symbol_145
        OpenAD_Symbol_256 = (OpenAD_Symbol_143 * OpenAD_Symbol_141)
        OpenAD_Symbol_258 = OpenAD_Symbol_140
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_256)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_258)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_407 = (INT(OpenAD_Symbol_407) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_407)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_405)
      OpenAD_Symbol_406 = 1
      DO WHILE(INT(OpenAD_Symbol_406) .LE. INT(OpenAD_Symbol_405))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_487)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_488)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_488, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_487))), __deriv__(OpenAD_Symbol_259))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_489)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_490)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_490, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_489))), __deriv__(OpenAD_Symbol_257))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNEW(INT(OpenAD_Symbol_489))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_491)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_257), __deriv__(DFLDDT(
     > INT(OpenAD_Symbol_491))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_257))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_492)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_259), __deriv__(FLDOLD(
     > INT(OpenAD_Symbol_492))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_259))
        OpenAD_Symbol_406 = INT(OpenAD_Symbol_406) + 1
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
      OpenAD_Symbol_410 = 0_w2f__i8
      DO L = 1, 3, 1
        OpenAD_Symbol_142 = (DELTA_T * 2.0D00)
        OpenAD_Symbol_145 = (__value__(FLDOLD(L)) + __value__(DFLDDT(L)
     > ) * OpenAD_Symbol_142)
        OpenAD_Symbol_140 = 1_w2f__i8
        OpenAD_Symbol_143 = OpenAD_Symbol_142
        OpenAD_Symbol_141 = 1_w2f__i8
        __value__(FLDNEW(INT(L))) = OpenAD_Symbol_145
        OpenAD_Symbol_256 = (OpenAD_Symbol_143 * OpenAD_Symbol_141)
        OpenAD_Symbol_258 = OpenAD_Symbol_140
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_256)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_258)
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(L)
        OpenAD_Symbol_410 = (INT(OpenAD_Symbol_410) + INT(1_w2f__i8))
      END DO
C     $OpenAD$ INLINE push_i(subst)
      CALL push_i(OpenAD_Symbol_410)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_408)
      OpenAD_Symbol_409 = 1
      DO WHILE(INT(OpenAD_Symbol_409) .LE. INT(OpenAD_Symbol_408))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_487)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_488)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_488, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_487))), __deriv__(OpenAD_Symbol_259))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_489)
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_490)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_490, __deriv__(FLDNEW(INT(
     > OpenAD_Symbol_489))), __deriv__(OpenAD_Symbol_257))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(FLDNEW(INT(OpenAD_Symbol_489))))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_491)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_257), __deriv__(DFLDDT(
     > INT(OpenAD_Symbol_491))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_257))
C       $OpenAD$ INLINE pop_i(subst)
        CALL pop_i(OpenAD_Symbol_492)
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_259), __deriv__(FLDOLD(
     > INT(OpenAD_Symbol_492))))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_259))
        OpenAD_Symbol_409 = INT(OpenAD_Symbol_409) + 1
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
      REAL(w2f__8) OpenAD_Symbol_100
      REAL(w2f__8) OpenAD_Symbol_102
      REAL(w2f__8) OpenAD_Symbol_103
      REAL(w2f__8) OpenAD_Symbol_105
      REAL(w2f__8) OpenAD_Symbol_107
      REAL(w2f__8) OpenAD_Symbol_108
      REAL(w2f__8) OpenAD_Symbol_109
      REAL(w2f__8) OpenAD_Symbol_110
      REAL(w2f__8) OpenAD_Symbol_111
      REAL(w2f__8) OpenAD_Symbol_112
      REAL(w2f__8) OpenAD_Symbol_113
      REAL(w2f__8) OpenAD_Symbol_114
      REAL(w2f__8) OpenAD_Symbol_115
      REAL(w2f__8) OpenAD_Symbol_116
      REAL(w2f__8) OpenAD_Symbol_118
      REAL(w2f__8) OpenAD_Symbol_119
      REAL(w2f__8) OpenAD_Symbol_120
      REAL(w2f__8) OpenAD_Symbol_121
      REAL(w2f__8) OpenAD_Symbol_122
      REAL(w2f__8) OpenAD_Symbol_123
      REAL(w2f__8) OpenAD_Symbol_160
      REAL(w2f__8) OpenAD_Symbol_161
      REAL(w2f__8) OpenAD_Symbol_162
      REAL(w2f__8) OpenAD_Symbol_163
      REAL(w2f__8) OpenAD_Symbol_164
      TYPE (OpenADTy_active) OpenAD_Symbol_165
      REAL(w2f__8) OpenAD_Symbol_166
      REAL(w2f__8) OpenAD_Symbol_167
      REAL(w2f__8) OpenAD_Symbol_168
      REAL(w2f__8) OpenAD_Symbol_169
      REAL(w2f__8) OpenAD_Symbol_170
      REAL(w2f__8) OpenAD_Symbol_171
      TYPE (OpenADTy_active) OpenAD_Symbol_172
      REAL(w2f__8) OpenAD_Symbol_173
      TYPE (OpenADTy_active) OpenAD_Symbol_174
      REAL(w2f__8) OpenAD_Symbol_175
      TYPE (OpenADTy_active) OpenAD_Symbol_176
      REAL(w2f__8) OpenAD_Symbol_177
      TYPE (OpenADTy_active) OpenAD_Symbol_178
      REAL(w2f__8) OpenAD_Symbol_179
      TYPE (OpenADTy_active) OpenAD_Symbol_180
      REAL(w2f__8) OpenAD_Symbol_181
      TYPE (OpenADTy_active) OpenAD_Symbol_182
      REAL(w2f__8) OpenAD_Symbol_183
      REAL(w2f__8) OpenAD_Symbol_184
      REAL(w2f__8) OpenAD_Symbol_185
      REAL(w2f__8) OpenAD_Symbol_186
      REAL(w2f__8) OpenAD_Symbol_187
      REAL(w2f__8) OpenAD_Symbol_188
      REAL(w2f__8) OpenAD_Symbol_189
      TYPE (OpenADTy_active) OpenAD_Symbol_190
      REAL(w2f__8) OpenAD_Symbol_191
      TYPE (OpenADTy_active) OpenAD_Symbol_192
      REAL(w2f__8) OpenAD_Symbol_193
      REAL(w2f__8) OpenAD_Symbol_194
      REAL(w2f__8) OpenAD_Symbol_195
      REAL(w2f__8) OpenAD_Symbol_196
      REAL(w2f__8) OpenAD_Symbol_197
      TYPE (OpenADTy_active) OpenAD_Symbol_198
      REAL(w2f__8) OpenAD_Symbol_199
      REAL(w2f__8) OpenAD_Symbol_200
      REAL(w2f__8) OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      TYPE (OpenADTy_active) OpenAD_Symbol_203
      REAL(w2f__8) OpenAD_Symbol_204
      TYPE (OpenADTy_active) OpenAD_Symbol_205
      REAL(w2f__8) OpenAD_Symbol_206
      TYPE (OpenADTy_active) OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      TYPE (OpenADTy_active) OpenAD_Symbol_209
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
      REAL(w2f__8) OpenAD_Symbol_212
      REAL(w2f__8) OpenAD_Symbol_213
      REAL(w2f__8) OpenAD_Symbol_214
      REAL(w2f__8) OpenAD_Symbol_215
      TYPE (OpenADTy_active) OpenAD_Symbol_216
      REAL(w2f__8) OpenAD_Symbol_217
      TYPE (OpenADTy_active) OpenAD_Symbol_218
      REAL(w2f__8) OpenAD_Symbol_219
      REAL(w2f__8) OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_220
      REAL(w2f__8) OpenAD_Symbol_221
      REAL(w2f__8) OpenAD_Symbol_222
      REAL(w2f__8) OpenAD_Symbol_223
      TYPE (OpenADTy_active) OpenAD_Symbol_224
      REAL(w2f__8) OpenAD_Symbol_225
      TYPE (OpenADTy_active) OpenAD_Symbol_226
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_27
      INTEGER(w2f__i8) OpenAD_Symbol_278
      INTEGER(w2f__i8) OpenAD_Symbol_279
      REAL(w2f__8) OpenAD_Symbol_28
      INTEGER(w2f__i8) OpenAD_Symbol_280
      INTEGER(w2f__i8) OpenAD_Symbol_281
      INTEGER(w2f__i8) OpenAD_Symbol_282
      INTEGER(w2f__i8) OpenAD_Symbol_283
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
      REAL(w2f__8) OpenAD_Symbol_37
      REAL(w2f__8) OpenAD_Symbol_38
      REAL(w2f__8) OpenAD_Symbol_39
      REAL(w2f__8) OpenAD_Symbol_40
      REAL(w2f__8) OpenAD_Symbol_41
      REAL(w2f__8) OpenAD_Symbol_42
      REAL(w2f__8) OpenAD_Symbol_43
      REAL(w2f__8) OpenAD_Symbol_45
      REAL(w2f__8) OpenAD_Symbol_46
      REAL(w2f__8) OpenAD_Symbol_48
      REAL(w2f__8) OpenAD_Symbol_49
      REAL(w2f__8) OpenAD_Symbol_51
      REAL(w2f__8) OpenAD_Symbol_52
      REAL(w2f__8) OpenAD_Symbol_54
      REAL(w2f__8) OpenAD_Symbol_56
      REAL(w2f__8) OpenAD_Symbol_57
      REAL(w2f__8) OpenAD_Symbol_58
      REAL(w2f__8) OpenAD_Symbol_59
      REAL(w2f__8) OpenAD_Symbol_60
      REAL(w2f__8) OpenAD_Symbol_61
      REAL(w2f__8) OpenAD_Symbol_62
      REAL(w2f__8) OpenAD_Symbol_63
      REAL(w2f__8) OpenAD_Symbol_64
      REAL(w2f__8) OpenAD_Symbol_66
      REAL(w2f__8) OpenAD_Symbol_67
      REAL(w2f__8) OpenAD_Symbol_68
      REAL(w2f__8) OpenAD_Symbol_69
      REAL(w2f__8) OpenAD_Symbol_70
      REAL(w2f__8) OpenAD_Symbol_71
      REAL(w2f__8) OpenAD_Symbol_72
      REAL(w2f__8) OpenAD_Symbol_73
      REAL(w2f__8) OpenAD_Symbol_75
      REAL(w2f__8) OpenAD_Symbol_76
      REAL(w2f__8) OpenAD_Symbol_78
      REAL(w2f__8) OpenAD_Symbol_79
      REAL(w2f__8) OpenAD_Symbol_81
      REAL(w2f__8) OpenAD_Symbol_82
      REAL(w2f__8) OpenAD_Symbol_84
      REAL(w2f__8) OpenAD_Symbol_86
      REAL(w2f__8) OpenAD_Symbol_87
      REAL(w2f__8) OpenAD_Symbol_88
      REAL(w2f__8) OpenAD_Symbol_89
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
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      IF(__value__(UVELLOC) .GE. 0.0D00) THEN
        OpenAD_Symbol_31 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_28 = (GAMMALOC * OpenAD_Symbol_31)
        OpenAD_Symbol_36 = (__value__(FLDNOW(3)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_21 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_28 +
     >  __value__(UVELLOC) * OpenAD_Symbol_36)
        OpenAD_Symbol_41 = (OpenAD_Symbol_21 / VOL(1))
        OpenAD_Symbol_35 = (-1_w2f__i8)
        OpenAD_Symbol_33 = GAMMALOC
        OpenAD_Symbol_30 = VOL(1)
        OpenAD_Symbol_27 = 1_w2f__i8
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_37 = OpenAD_Symbol_36
        OpenAD_Symbol_39 = 1_w2f__i8
        OpenAD_Symbol_40 = (-1_w2f__i8)
        OpenAD_Symbol_38 = __value__(UVELLOC)
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = (INT(1_w2f__i8) / VOL(1))
        __value__(DFLDDT(1)) = OpenAD_Symbol_41
        OpenAD_Symbol_52 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_49 = (GAMMALOC * OpenAD_Symbol_52)
        OpenAD_Symbol_57 = (__value__(FLDNOW(1)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_42 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_49 +
     >  __value__(UVELLOC) * OpenAD_Symbol_57)
        OpenAD_Symbol_62 = (OpenAD_Symbol_42 / VOL(2))
        OpenAD_Symbol_56 = (-1_w2f__i8)
        OpenAD_Symbol_54 = GAMMALOC
        OpenAD_Symbol_51 = VOL(2)
        OpenAD_Symbol_48 = 1_w2f__i8
        OpenAD_Symbol_45 = 1_w2f__i8
        OpenAD_Symbol_58 = OpenAD_Symbol_57
        OpenAD_Symbol_60 = 1_w2f__i8
        OpenAD_Symbol_61 = (-1_w2f__i8)
        OpenAD_Symbol_59 = __value__(UVELLOC)
        OpenAD_Symbol_46 = 1_w2f__i8
        OpenAD_Symbol_43 = (INT(1_w2f__i8) / VOL(2))
        __value__(DFLDDT(2)) = OpenAD_Symbol_62
        OpenAD_Symbol_66 = (__value__(FLDNOW(2)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_63 = (__value__(UVELLOC) * OpenAD_Symbol_66)
        OpenAD_Symbol_71 = (OpenAD_Symbol_63 / VOL(3))
        OpenAD_Symbol_67 = OpenAD_Symbol_66
        OpenAD_Symbol_69 = 1_w2f__i8
        OpenAD_Symbol_70 = (-1_w2f__i8)
        OpenAD_Symbol_68 = __value__(UVELLOC)
        OpenAD_Symbol_64 = (INT(1_w2f__i8) / VOL(3))
        __value__(DFLDDT(3)) = OpenAD_Symbol_71
        OpenAD_Symbol_160 = (OpenAD_Symbol_45 * OpenAD_Symbol_43)
        OpenAD_Symbol_161 = (OpenAD_Symbol_46 * OpenAD_Symbol_43)
        OpenAD_Symbol_162 = (OpenAD_Symbol_24 * OpenAD_Symbol_22)
        OpenAD_Symbol_163 = (OpenAD_Symbol_25 * OpenAD_Symbol_22)
        OpenAD_Symbol_164 = (OpenAD_Symbol_67 * OpenAD_Symbol_64)
        OpenAD_Symbol_166 = (OpenAD_Symbol_68 * OpenAD_Symbol_64)
        OpenAD_Symbol_167 = (OpenAD_Symbol_58 * OpenAD_Symbol_161)
        OpenAD_Symbol_168 = (OpenAD_Symbol_59 * OpenAD_Symbol_161)
        OpenAD_Symbol_169 = (OpenAD_Symbol_37 * OpenAD_Symbol_163)
        OpenAD_Symbol_170 = (OpenAD_Symbol_38 * OpenAD_Symbol_163)
        OpenAD_Symbol_171 = (OpenAD_Symbol_69 * OpenAD_Symbol_166)
        OpenAD_Symbol_173 = (OpenAD_Symbol_70 * OpenAD_Symbol_166)
        OpenAD_Symbol_175 = (OpenAD_Symbol_60 * OpenAD_Symbol_168)
        OpenAD_Symbol_177 = (OpenAD_Symbol_61 * OpenAD_Symbol_168)
        OpenAD_Symbol_179 = (OpenAD_Symbol_39 * OpenAD_Symbol_170)
        OpenAD_Symbol_181 = (OpenAD_Symbol_40 * OpenAD_Symbol_170)
        OpenAD_Symbol_183 = (OpenAD_Symbol_48 * OpenAD_Symbol_160)
        OpenAD_Symbol_184 = (OpenAD_Symbol_27 * OpenAD_Symbol_162)
        OpenAD_Symbol_185 = (OpenAD_Symbol_51 * OpenAD_Symbol_183)
        OpenAD_Symbol_186 = (OpenAD_Symbol_30 * OpenAD_Symbol_184)
        OpenAD_Symbol_187 = (OpenAD_Symbol_54 * OpenAD_Symbol_185)
        OpenAD_Symbol_188 = (OpenAD_Symbol_33 * OpenAD_Symbol_186)
        OpenAD_Symbol_189 = (OpenAD_Symbol_56 * OpenAD_Symbol_187)
        OpenAD_Symbol_191 = (OpenAD_Symbol_35 * OpenAD_Symbol_188)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_164)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_167)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_169)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_171)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_173)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_175)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_177)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_179)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_181)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_189)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_191)
        OpenAD_Symbol_279 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_279)
      ELSE
        OpenAD_Symbol_82 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_79 = (GAMMALOC * OpenAD_Symbol_82)
        OpenAD_Symbol_87 = (__value__(FLDNOW(2)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_72 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_79 -
     >  __value__(UVELLOC) * OpenAD_Symbol_87)
        OpenAD_Symbol_92 = (OpenAD_Symbol_72 / VOL(1))
        OpenAD_Symbol_86 = (-1_w2f__i8)
        OpenAD_Symbol_84 = GAMMALOC
        OpenAD_Symbol_81 = VOL(1)
        OpenAD_Symbol_78 = 1_w2f__i8
        OpenAD_Symbol_75 = 1_w2f__i8
        OpenAD_Symbol_88 = OpenAD_Symbol_87
        OpenAD_Symbol_90 = 1_w2f__i8
        OpenAD_Symbol_91 = (-1_w2f__i8)
        OpenAD_Symbol_89 = __value__(UVELLOC)
        OpenAD_Symbol_76 = (-1_w2f__i8)
        OpenAD_Symbol_73 = (INT(1_w2f__i8) / VOL(1))
        __value__(DFLDDT(1)) = OpenAD_Symbol_92
        OpenAD_Symbol_103 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_100 = (GAMMALOC * OpenAD_Symbol_103)
        OpenAD_Symbol_108 = (__value__(FLDNOW(3)) - __value__(FLDNOW(2)
     > ))
        OpenAD_Symbol_93 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_100 -
     >  __value__(UVELLOC) * OpenAD_Symbol_108)
        OpenAD_Symbol_113 = (OpenAD_Symbol_93 / VOL(2))
        OpenAD_Symbol_107 = (-1_w2f__i8)
        OpenAD_Symbol_105 = GAMMALOC
        OpenAD_Symbol_102 = VOL(2)
        OpenAD_Symbol_99 = 1_w2f__i8
        OpenAD_Symbol_96 = 1_w2f__i8
        OpenAD_Symbol_109 = OpenAD_Symbol_108
        OpenAD_Symbol_111 = 1_w2f__i8
        OpenAD_Symbol_112 = (-1_w2f__i8)
        OpenAD_Symbol_110 = __value__(UVELLOC)
        OpenAD_Symbol_97 = (-1_w2f__i8)
        OpenAD_Symbol_94 = (INT(1_w2f__i8) / VOL(2))
        __value__(DFLDDT(2)) = OpenAD_Symbol_113
        OpenAD_Symbol_118 = (__value__(FLDNOW(1)) - __value__(FLDNOW(3)
     > ))
        OpenAD_Symbol_115 = (__value__(UVELLOC) * OpenAD_Symbol_118)
        OpenAD_Symbol_123 = (-(OpenAD_Symbol_115 / VOL(3)))
        OpenAD_Symbol_119 = OpenAD_Symbol_118
        OpenAD_Symbol_121 = 1_w2f__i8
        OpenAD_Symbol_122 = (-1_w2f__i8)
        OpenAD_Symbol_120 = __value__(UVELLOC)
        OpenAD_Symbol_116 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_114 = (-1_w2f__i8)
        __value__(DFLDDT(3)) = OpenAD_Symbol_123
        OpenAD_Symbol_193 = (OpenAD_Symbol_96 * OpenAD_Symbol_94)
        OpenAD_Symbol_194 = (OpenAD_Symbol_97 * OpenAD_Symbol_94)
        OpenAD_Symbol_195 = (OpenAD_Symbol_75 * OpenAD_Symbol_73)
        OpenAD_Symbol_196 = (OpenAD_Symbol_76 * OpenAD_Symbol_73)
        OpenAD_Symbol_197 = (OpenAD_Symbol_109 * OpenAD_Symbol_194)
        OpenAD_Symbol_199 = (OpenAD_Symbol_110 * OpenAD_Symbol_194)
        OpenAD_Symbol_200 = (OpenAD_Symbol_88 * OpenAD_Symbol_196)
        OpenAD_Symbol_201 = (OpenAD_Symbol_89 * OpenAD_Symbol_196)
        OpenAD_Symbol_202 = (OpenAD_Symbol_111 * OpenAD_Symbol_199)
        OpenAD_Symbol_204 = (OpenAD_Symbol_112 * OpenAD_Symbol_199)
        OpenAD_Symbol_206 = (OpenAD_Symbol_90 * OpenAD_Symbol_201)
        OpenAD_Symbol_208 = (OpenAD_Symbol_91 * OpenAD_Symbol_201)
        OpenAD_Symbol_210 = (OpenAD_Symbol_99 * OpenAD_Symbol_193)
        OpenAD_Symbol_211 = (OpenAD_Symbol_78 * OpenAD_Symbol_195)
        OpenAD_Symbol_212 = (OpenAD_Symbol_116 * OpenAD_Symbol_114)
        OpenAD_Symbol_213 = (OpenAD_Symbol_119 * OpenAD_Symbol_212)
        OpenAD_Symbol_214 = (OpenAD_Symbol_120 * OpenAD_Symbol_212)
        OpenAD_Symbol_215 = (OpenAD_Symbol_121 * OpenAD_Symbol_214)
        OpenAD_Symbol_217 = (OpenAD_Symbol_122 * OpenAD_Symbol_214)
        OpenAD_Symbol_219 = (OpenAD_Symbol_102 * OpenAD_Symbol_210)
        OpenAD_Symbol_220 = (OpenAD_Symbol_81 * OpenAD_Symbol_211)
        OpenAD_Symbol_221 = (OpenAD_Symbol_105 * OpenAD_Symbol_219)
        OpenAD_Symbol_222 = (OpenAD_Symbol_84 * OpenAD_Symbol_220)
        OpenAD_Symbol_223 = (OpenAD_Symbol_107 * OpenAD_Symbol_221)
        OpenAD_Symbol_225 = (OpenAD_Symbol_86 * OpenAD_Symbol_222)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_197)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_200)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_202)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_204)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_206)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_208)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_213)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_215)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_217)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_223)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_225)
        OpenAD_Symbol_280 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_280)
      ENDIF
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_278)
      IF(OpenAD_Symbol_278 .ne. 0) THEN
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_421)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_421, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_192))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_422)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_422, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_190))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_423)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_423, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_182))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_424)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_424, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_180))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_425)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_425, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_178))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_426)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_426, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_176))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_427)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_427, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_174))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_428)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_428, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_172))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_429)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_429, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_165))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_430)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_430, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_165))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_431)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_431, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_165))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_165), __deriv__(UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_165))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_172), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_172))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_174), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_174))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_176), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_176))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_178), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_178))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_180), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_180))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_182), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_182))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_190), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_190))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_192), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_192))
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_432)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_432, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_226))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_433)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_433, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_224))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_434)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_434, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_218))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_435)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_435, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_216))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_436)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_436, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_198))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_437)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_437, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_209))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_438)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_438, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_207))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_439)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_439, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_205))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_440)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_440, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_203))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_441)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_441, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_198))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_442)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_442, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_198))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_198), __deriv__(UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_198))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_203), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_203))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_205), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_205))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_207), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_207))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_209), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_209))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_216), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_216))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_218), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_218))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_224), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_224))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_226), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_226))
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
        OpenAD_Symbol_31 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_28 = (GAMMALOC * OpenAD_Symbol_31)
        OpenAD_Symbol_36 = (__value__(FLDNOW(3)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_21 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_28 +
     >  __value__(UVELLOC) * OpenAD_Symbol_36)
        OpenAD_Symbol_41 = (OpenAD_Symbol_21 / VOL(1))
        OpenAD_Symbol_35 = (-1_w2f__i8)
        OpenAD_Symbol_33 = GAMMALOC
        OpenAD_Symbol_30 = VOL(1)
        OpenAD_Symbol_27 = 1_w2f__i8
        OpenAD_Symbol_24 = 1_w2f__i8
        OpenAD_Symbol_37 = OpenAD_Symbol_36
        OpenAD_Symbol_39 = 1_w2f__i8
        OpenAD_Symbol_40 = (-1_w2f__i8)
        OpenAD_Symbol_38 = __value__(UVELLOC)
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = (INT(1_w2f__i8) / VOL(1))
        __value__(DFLDDT(1)) = OpenAD_Symbol_41
        OpenAD_Symbol_52 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_49 = (GAMMALOC * OpenAD_Symbol_52)
        OpenAD_Symbol_57 = (__value__(FLDNOW(1)) - __value__(FLDNOW(2))
     > )
        OpenAD_Symbol_42 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_49 +
     >  __value__(UVELLOC) * OpenAD_Symbol_57)
        OpenAD_Symbol_62 = (OpenAD_Symbol_42 / VOL(2))
        OpenAD_Symbol_56 = (-1_w2f__i8)
        OpenAD_Symbol_54 = GAMMALOC
        OpenAD_Symbol_51 = VOL(2)
        OpenAD_Symbol_48 = 1_w2f__i8
        OpenAD_Symbol_45 = 1_w2f__i8
        OpenAD_Symbol_58 = OpenAD_Symbol_57
        OpenAD_Symbol_60 = 1_w2f__i8
        OpenAD_Symbol_61 = (-1_w2f__i8)
        OpenAD_Symbol_59 = __value__(UVELLOC)
        OpenAD_Symbol_46 = 1_w2f__i8
        OpenAD_Symbol_43 = (INT(1_w2f__i8) / VOL(2))
        __value__(DFLDDT(2)) = OpenAD_Symbol_62
        OpenAD_Symbol_66 = (__value__(FLDNOW(2)) - __value__(FLDNOW(3))
     > )
        OpenAD_Symbol_63 = (__value__(UVELLOC) * OpenAD_Symbol_66)
        OpenAD_Symbol_71 = (OpenAD_Symbol_63 / VOL(3))
        OpenAD_Symbol_67 = OpenAD_Symbol_66
        OpenAD_Symbol_69 = 1_w2f__i8
        OpenAD_Symbol_70 = (-1_w2f__i8)
        OpenAD_Symbol_68 = __value__(UVELLOC)
        OpenAD_Symbol_64 = (INT(1_w2f__i8) / VOL(3))
        __value__(DFLDDT(3)) = OpenAD_Symbol_71
        OpenAD_Symbol_160 = (OpenAD_Symbol_45 * OpenAD_Symbol_43)
        OpenAD_Symbol_161 = (OpenAD_Symbol_46 * OpenAD_Symbol_43)
        OpenAD_Symbol_162 = (OpenAD_Symbol_24 * OpenAD_Symbol_22)
        OpenAD_Symbol_163 = (OpenAD_Symbol_25 * OpenAD_Symbol_22)
        OpenAD_Symbol_164 = (OpenAD_Symbol_67 * OpenAD_Symbol_64)
        OpenAD_Symbol_166 = (OpenAD_Symbol_68 * OpenAD_Symbol_64)
        OpenAD_Symbol_167 = (OpenAD_Symbol_58 * OpenAD_Symbol_161)
        OpenAD_Symbol_168 = (OpenAD_Symbol_59 * OpenAD_Symbol_161)
        OpenAD_Symbol_169 = (OpenAD_Symbol_37 * OpenAD_Symbol_163)
        OpenAD_Symbol_170 = (OpenAD_Symbol_38 * OpenAD_Symbol_163)
        OpenAD_Symbol_171 = (OpenAD_Symbol_69 * OpenAD_Symbol_166)
        OpenAD_Symbol_173 = (OpenAD_Symbol_70 * OpenAD_Symbol_166)
        OpenAD_Symbol_175 = (OpenAD_Symbol_60 * OpenAD_Symbol_168)
        OpenAD_Symbol_177 = (OpenAD_Symbol_61 * OpenAD_Symbol_168)
        OpenAD_Symbol_179 = (OpenAD_Symbol_39 * OpenAD_Symbol_170)
        OpenAD_Symbol_181 = (OpenAD_Symbol_40 * OpenAD_Symbol_170)
        OpenAD_Symbol_183 = (OpenAD_Symbol_48 * OpenAD_Symbol_160)
        OpenAD_Symbol_184 = (OpenAD_Symbol_27 * OpenAD_Symbol_162)
        OpenAD_Symbol_185 = (OpenAD_Symbol_51 * OpenAD_Symbol_183)
        OpenAD_Symbol_186 = (OpenAD_Symbol_30 * OpenAD_Symbol_184)
        OpenAD_Symbol_187 = (OpenAD_Symbol_54 * OpenAD_Symbol_185)
        OpenAD_Symbol_188 = (OpenAD_Symbol_33 * OpenAD_Symbol_186)
        OpenAD_Symbol_189 = (OpenAD_Symbol_56 * OpenAD_Symbol_187)
        OpenAD_Symbol_191 = (OpenAD_Symbol_35 * OpenAD_Symbol_188)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_164)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_167)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_169)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_171)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_173)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_175)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_177)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_179)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_181)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_189)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_191)
        OpenAD_Symbol_282 = 1_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_282)
      ELSE
        OpenAD_Symbol_82 = (FLDSTAR(1) - __value__(FLDNOW(1)))
        OpenAD_Symbol_79 = (GAMMALOC * OpenAD_Symbol_82)
        OpenAD_Symbol_87 = (__value__(FLDNOW(2)) - __value__(FLDNOW(1))
     > )
        OpenAD_Symbol_72 = (EXTFORLOC(1) + VOL(1) * OpenAD_Symbol_79 -
     >  __value__(UVELLOC) * OpenAD_Symbol_87)
        OpenAD_Symbol_92 = (OpenAD_Symbol_72 / VOL(1))
        OpenAD_Symbol_86 = (-1_w2f__i8)
        OpenAD_Symbol_84 = GAMMALOC
        OpenAD_Symbol_81 = VOL(1)
        OpenAD_Symbol_78 = 1_w2f__i8
        OpenAD_Symbol_75 = 1_w2f__i8
        OpenAD_Symbol_88 = OpenAD_Symbol_87
        OpenAD_Symbol_90 = 1_w2f__i8
        OpenAD_Symbol_91 = (-1_w2f__i8)
        OpenAD_Symbol_89 = __value__(UVELLOC)
        OpenAD_Symbol_76 = (-1_w2f__i8)
        OpenAD_Symbol_73 = (INT(1_w2f__i8) / VOL(1))
        __value__(DFLDDT(1)) = OpenAD_Symbol_92
        OpenAD_Symbol_103 = (FLDSTAR(2) - __value__(FLDNOW(2)))
        OpenAD_Symbol_100 = (GAMMALOC * OpenAD_Symbol_103)
        OpenAD_Symbol_108 = (__value__(FLDNOW(3)) - __value__(FLDNOW(2)
     > ))
        OpenAD_Symbol_93 = (EXTFORLOC(2) + VOL(2) * OpenAD_Symbol_100 -
     >  __value__(UVELLOC) * OpenAD_Symbol_108)
        OpenAD_Symbol_113 = (OpenAD_Symbol_93 / VOL(2))
        OpenAD_Symbol_107 = (-1_w2f__i8)
        OpenAD_Symbol_105 = GAMMALOC
        OpenAD_Symbol_102 = VOL(2)
        OpenAD_Symbol_99 = 1_w2f__i8
        OpenAD_Symbol_96 = 1_w2f__i8
        OpenAD_Symbol_109 = OpenAD_Symbol_108
        OpenAD_Symbol_111 = 1_w2f__i8
        OpenAD_Symbol_112 = (-1_w2f__i8)
        OpenAD_Symbol_110 = __value__(UVELLOC)
        OpenAD_Symbol_97 = (-1_w2f__i8)
        OpenAD_Symbol_94 = (INT(1_w2f__i8) / VOL(2))
        __value__(DFLDDT(2)) = OpenAD_Symbol_113
        OpenAD_Symbol_118 = (__value__(FLDNOW(1)) - __value__(FLDNOW(3)
     > ))
        OpenAD_Symbol_115 = (__value__(UVELLOC) * OpenAD_Symbol_118)
        OpenAD_Symbol_123 = (-(OpenAD_Symbol_115 / VOL(3)))
        OpenAD_Symbol_119 = OpenAD_Symbol_118
        OpenAD_Symbol_121 = 1_w2f__i8
        OpenAD_Symbol_122 = (-1_w2f__i8)
        OpenAD_Symbol_120 = __value__(UVELLOC)
        OpenAD_Symbol_116 = (INT(1_w2f__i8) / VOL(3))
        OpenAD_Symbol_114 = (-1_w2f__i8)
        __value__(DFLDDT(3)) = OpenAD_Symbol_123
        OpenAD_Symbol_193 = (OpenAD_Symbol_96 * OpenAD_Symbol_94)
        OpenAD_Symbol_194 = (OpenAD_Symbol_97 * OpenAD_Symbol_94)
        OpenAD_Symbol_195 = (OpenAD_Symbol_75 * OpenAD_Symbol_73)
        OpenAD_Symbol_196 = (OpenAD_Symbol_76 * OpenAD_Symbol_73)
        OpenAD_Symbol_197 = (OpenAD_Symbol_109 * OpenAD_Symbol_194)
        OpenAD_Symbol_199 = (OpenAD_Symbol_110 * OpenAD_Symbol_194)
        OpenAD_Symbol_200 = (OpenAD_Symbol_88 * OpenAD_Symbol_196)
        OpenAD_Symbol_201 = (OpenAD_Symbol_89 * OpenAD_Symbol_196)
        OpenAD_Symbol_202 = (OpenAD_Symbol_111 * OpenAD_Symbol_199)
        OpenAD_Symbol_204 = (OpenAD_Symbol_112 * OpenAD_Symbol_199)
        OpenAD_Symbol_206 = (OpenAD_Symbol_90 * OpenAD_Symbol_201)
        OpenAD_Symbol_208 = (OpenAD_Symbol_91 * OpenAD_Symbol_201)
        OpenAD_Symbol_210 = (OpenAD_Symbol_99 * OpenAD_Symbol_193)
        OpenAD_Symbol_211 = (OpenAD_Symbol_78 * OpenAD_Symbol_195)
        OpenAD_Symbol_212 = (OpenAD_Symbol_116 * OpenAD_Symbol_114)
        OpenAD_Symbol_213 = (OpenAD_Symbol_119 * OpenAD_Symbol_212)
        OpenAD_Symbol_214 = (OpenAD_Symbol_120 * OpenAD_Symbol_212)
        OpenAD_Symbol_215 = (OpenAD_Symbol_121 * OpenAD_Symbol_214)
        OpenAD_Symbol_217 = (OpenAD_Symbol_122 * OpenAD_Symbol_214)
        OpenAD_Symbol_219 = (OpenAD_Symbol_102 * OpenAD_Symbol_210)
        OpenAD_Symbol_220 = (OpenAD_Symbol_81 * OpenAD_Symbol_211)
        OpenAD_Symbol_221 = (OpenAD_Symbol_105 * OpenAD_Symbol_219)
        OpenAD_Symbol_222 = (OpenAD_Symbol_84 * OpenAD_Symbol_220)
        OpenAD_Symbol_223 = (OpenAD_Symbol_107 * OpenAD_Symbol_221)
        OpenAD_Symbol_225 = (OpenAD_Symbol_86 * OpenAD_Symbol_222)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_197)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_200)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_202)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_204)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_206)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_208)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_213)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_215)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_217)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_223)
C       $OpenAD$ INLINE push(subst)
        CALL push(OpenAD_Symbol_225)
        OpenAD_Symbol_283 = 0_w2f__i8
C       $OpenAD$ INLINE push_i(subst)
        CALL push_i(OpenAD_Symbol_283)
      ENDIF
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
      CALL box_update(__deriv__(FLDNEW), __deriv__(FLDOLD), __deriv__(
     > DFLDDT))
C     $OpenAD$ INLINE pop_i(subst)
      CALL pop_i(OpenAD_Symbol_281)
      IF(OpenAD_Symbol_281 .ne. 0) THEN
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_421)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_421, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_192))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_422)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_422, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_190))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_423)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_423, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_182))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_424)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_424, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_180))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_425)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_425, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_178))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_426)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_426, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_176))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_427)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_427, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_174))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_428)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_428, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_172))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_429)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_429, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_165))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_430)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_430, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_165))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_431)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_431, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_165))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_165), __deriv__(UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_165))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_172), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_172))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_174), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_174))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_176), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_176))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_178), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_178))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_180), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_180))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_182), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_182))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_190), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_190))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_192), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_192))
      ELSE
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_432)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_432, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_226))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_433)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_433, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_224))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_434)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_434, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_218))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_435)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_435, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_216))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_436)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_436, __deriv__(DFLDDT(3)), __deriv__(
     > OpenAD_Symbol_198))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(3)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_437)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_437, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_209))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_438)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_438, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_207))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_439)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_439, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_205))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_440)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_440, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_203))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_441)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_441, __deriv__(DFLDDT(1)), __deriv__(
     > OpenAD_Symbol_198))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(1)))
C       $OpenAD$ INLINE Pop(subst)
        CALL Pop(OpenAD_Symbol_442)
C       $OpenAD$ INLINE Saxpy(subst,subst,subst)
        CALL Saxpy(OpenAD_Symbol_442, __deriv__(DFLDDT(2)), __deriv__(
     > OpenAD_Symbol_198))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(DFLDDT(2)))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_198), __deriv__(UVELLOC))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_198))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_203), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_203))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_205), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_205))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_207), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_207))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_209), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_209))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_216), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_216))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_218), __deriv__(FLDNOW(3)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_218))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_224), __deriv__(FLDNOW(2)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_224))
C       $OpenAD$ INLINE IncDeriv(subst,subst)
        CALL IncDeriv(__deriv__(OpenAD_Symbol_226), __deriv__(FLDNOW(1)
     > ))
C       $OpenAD$ INLINE ZeroDeriv(subst)
        CALL ZeroDeriv(__deriv__(OpenAD_Symbol_226))
      ENDIF
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
