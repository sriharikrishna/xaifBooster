
      MODULE all_globals_mod
      use w2f__types
      use active_module
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
      type(active) :: RHO(1 : 3)
      REAL(w2f__8) ROBERT_FILTER_COEFF
      REAL(w2f__8) R_S(1 : 6)
      REAL(w2f__8) R_T(1 : 6)
      type(active) :: S(1 : 3)
      type(active) :: SNEW(1 : 3)
      type(active) :: SNOW(1 : 3)
      type(active) :: SOLD(1 : 3)
      REAL(w2f__8) SSTAR(1 : 2)
      REAL(w2f__8) SV
      type(active) :: T(1 : 3)
      REAL(w2f__8) THC_S
      REAL(w2f__8) THC_T
      REAL(w2f__8) THC_TOT
      REAL(w2f__8) THOUSAND
      type(active) :: TNEW(1 : 3)
      type(active) :: TNOW(1 : 3)
      type(active) :: TOLD(1 : 3)
      REAL(w2f__8) TSTAR(1 : 2)
      REAL(w2f__8) TSVEC(1 : 6)
      REAL(w2f__8) U0
      REAL(w2f__8) UBAR
      type(active) :: UVEL
      LOGICAL(w2f__i4) VERBMODE
      REAL(w2f__8) VOL(1 : 3)
      REAL(w2f__8) X(1 : 6, 1 : 6)
      type(active) :: XX(1 : 6)
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
      use active_module
      use all_globals_mod
      IMPLICIT NONE
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
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      IKEY = ILEV1
      CALL box_density(TNOW,SNOW,RHO)
      CALL box_transport(RHO,UVEL)
      CALL box_timestep(GAMMA_T,TSTAR,NULLFORCE,UVEL,TNOW,TOLD,TNEW)
      CALL box_timestep(GAMMA_S,SSTAR,FW,UVEL,SNOW,SOLD,SNEW)
      CALL box_robert_filter(TNOW,TOLD,TNEW)
      CALL box_robert_filter(SNOW,SOLD,SNEW)
      CALL box_cycle_fields()
      DO L = 1, 3, 1
        IF (TNOW(L)%v .LT. (-2.0D00)) THEN
          TNOW(INT(L))%v = 2.0
          CALL zero_deriv(TNOW(INT(L)))
        ENDIF
      END DO
      END SUBROUTINE

      SUBROUTINE box_final_state()
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
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
C$OPENAD XXX Template ad_template.f
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
      END DO
      DO L = 1, 3, 1
        TSVEC(INT(L)) = TNOW(L)%v
        TSVEC(INT(L+3)) = SNOW(L)%v
      END DO
      END SUBROUTINE

      SUBROUTINE box_ini_fields()
      use w2f__types
      use active_module
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
      type(active) :: OpenAD_Symbol_207
      REAL(w2f__8) OpenAD_Symbol_208
      REAL(w2f__8) OpenAD_Symbol_209
      type(active) :: OpenAD_Symbol_210
      REAL(w2f__8) OpenAD_Symbol_211
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
      T(1)%v = 2.0D+01
      T(2)%v = 1.0D00
      T(3)%v = 1.0D00
      S(1)%v = 3.55D+01
      S(2)%v = 3.45D+01
      S(3)%v = 3.45D+01
      CALL zero_deriv(T(1))
      CALL zero_deriv(T(2))
      CALL zero_deriv(T(3))
      CALL zero_deriv(S(1))
      CALL zero_deriv(S(2))
      CALL zero_deriv(S(3))
      DO L = 1, 6, 1
        TSVEC(INT(L)) = 0.0
      END DO
      DO L = 1, 3, 1
        T(INT(L))%v = (T(L)%v+XX(L)%v)
        OpenAD_Symbol_128 = 1_w2f__i8
        OpenAD_Symbol_129 = 1_w2f__i8
        S(INT(L))%v = (S(L)%v+XX(L+3)%v)
        OpenAD_Symbol_130 = 1_w2f__i8
        OpenAD_Symbol_131 = 1_w2f__i8
        OpenAD_Symbol_206 = OpenAD_Symbol_128
        OpenAD_Symbol_208 = OpenAD_Symbol_129
        OpenAD_Symbol_209 = OpenAD_Symbol_130
        OpenAD_Symbol_211 = OpenAD_Symbol_131
        CALL setderiv(OpenAD_Symbol_210,S(L))
        CALL setderiv(OpenAD_Symbol_207,T(L))
        CALL sax(OpenAD_Symbol_206,OpenAD_Symbol_207,T(L))
        CALL saxpy(OpenAD_Symbol_208,XX(L),T(L))
        CALL sax(OpenAD_Symbol_209,OpenAD_Symbol_210,S(L))
        CALL saxpy(OpenAD_Symbol_211,XX(L+3),S(L))
      END DO
      DO L = 1, 3, 1
        TNEW(INT(L))%v = T(L)%v
        SNEW(INT(L))%v = S(L)%v
        TOLD(INT(L))%v = T(L)%v
        SOLD(INT(L))%v = S(L)%v
        TNOW(INT(L))%v = T(L)%v
        SNOW(INT(L))%v = S(L)%v
        CALL setderiv(TNEW(L),T(L))
        CALL setderiv(SNEW(L),S(L))
        CALL setderiv(TOLD(L),T(L))
        CALL setderiv(SOLD(L),S(L))
        CALL setderiv(TNOW(L),T(L))
        CALL setderiv(SNOW(L),S(L))
      END DO
      UVEL%v = UBAR
      CALL zero_deriv(UVEL)
      END SUBROUTINE

      SUBROUTINE box_ini_params()
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
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
      END SUBROUTINE

      SUBROUTINE box_model_body()
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
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
      END SUBROUTINE

      SUBROUTINE box_density(TLOC, SLOC, RHOLOC)
      use w2f__types
      use active_module
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
      REAL(w2f__8) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      type(active) :: TLOC(1 : 3)
      type(active) :: SLOC(1 : 3)
      type(active) :: RHOLOC(1 : 3)
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
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        RHOLOC(INT(L))%v = (SLOC(L)%v*BETA-TLOC(L)%v*ALPHA)
        OpenAD_Symbol_2 = BETA
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_4 = ALPHA
        OpenAD_Symbol_1 = (-1_w2f__i8)
        OpenAD_Symbol_137 = (OpenAD_Symbol_2 * OpenAD_Symbol_0)
        OpenAD_Symbol_138 = (OpenAD_Symbol_4 * OpenAD_Symbol_1)
        CALL sax(OpenAD_Symbol_137,SLOC(L),RHOLOC(L))
        CALL saxpy(OpenAD_Symbol_138,TLOC(L),RHOLOC(L))
      END DO
      END SUBROUTINE

      SUBROUTINE box_transport(RHOLOC, UVELLOC)
      use w2f__types
      use active_module
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
      type(active) :: RHOLOC(1 : 3)
      type(active) :: UVELLOC
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_16 = (1.0D00 - DELTA)
      OpenAD_Symbol_7 = (RHOLOC(1)%v*DELTA+RHOLOC(3)%v*OpenAD_Symbol_16-
     +RHOLOC(2)%v)
      UVELLOC%v = (-(U0*OpenAD_Symbol_7))
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
      CALL sax(OpenAD_Symbol_141,RHOLOC(2),UVELLOC)
      CALL saxpy(OpenAD_Symbol_144,RHOLOC(3),UVELLOC)
      CALL saxpy(OpenAD_Symbol_145,RHOLOC(1),UVELLOC)
      END SUBROUTINE

      SUBROUTINE box_robert_filter(FLDNOW, FLDOLD, FLDNEW)
      use w2f__types
      use active_module
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
      type(active) :: OpenAD_Symbol_201
      REAL(w2f__8) OpenAD_Symbol_202
      type(active) :: OpenAD_Symbol_203
C
C     **** Parameters and Result ****
C
      type(active) :: FLDNOW(1 : 3)
      type(active) :: FLDOLD(1 : 3)
      type(active) :: FLDNEW(1 : 3)
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
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        OpenAD_Symbol_118 = (FLDOLD(L)%v+FLDNEW(L)%v-FLDNOW(L)%v*2.0D00)
        OpenAD_Symbol_127 = (FLDNOW(L)%v+ROBERT_FILTER_COEFF*OpenAD_Symb
     +ol_118)
        OpenAD_Symbol_116 = 1_w2f__i8
        OpenAD_Symbol_121 = 1_w2f__i8
        OpenAD_Symbol_123 = 1_w2f__i8
        OpenAD_Symbol_125 = 2.0D00
        OpenAD_Symbol_124 = (-1_w2f__i8)
        OpenAD_Symbol_122 = 1_w2f__i8
        OpenAD_Symbol_120 = ROBERT_FILTER_COEFF
        OpenAD_Symbol_117 = 1_w2f__i8
        FLDNOW(INT(L))%v = OpenAD_Symbol_127
        OpenAD_Symbol_195 = (OpenAD_Symbol_120 * OpenAD_Symbol_117)
        OpenAD_Symbol_196 = (OpenAD_Symbol_121 * OpenAD_Symbol_195)
        OpenAD_Symbol_197 = (OpenAD_Symbol_122 * OpenAD_Symbol_195)
        OpenAD_Symbol_198 = (OpenAD_Symbol_123 * OpenAD_Symbol_197)
        OpenAD_Symbol_199 = (OpenAD_Symbol_124 * OpenAD_Symbol_197)
        OpenAD_Symbol_200 = (OpenAD_Symbol_125 * OpenAD_Symbol_199)
        OpenAD_Symbol_202 = OpenAD_Symbol_116
        CALL setderiv(OpenAD_Symbol_203,FLDNOW(L))
        CALL setderiv(OpenAD_Symbol_201,FLDNOW(L))
        CALL sax(OpenAD_Symbol_196,FLDOLD(L),FLDNOW(L))
        CALL saxpy(OpenAD_Symbol_198,FLDNEW(L),FLDNOW(L))
        CALL saxpy(OpenAD_Symbol_200,OpenAD_Symbol_201,FLDNOW(L))
        CALL saxpy(OpenAD_Symbol_202,OpenAD_Symbol_203,FLDNOW(L))
      END DO
      END SUBROUTINE

      SUBROUTINE box_cycle_fields()
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_204
      type(active) :: OpenAD_Symbol_205
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
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        TOLD(INT(L))%v = TNOW(L)%v
        TNOW(INT(L))%v = TNEW(L)%v
        CALL setderiv(OpenAD_Symbol_204,TNOW(L))
        CALL setderiv(TOLD(L),OpenAD_Symbol_204)
        CALL setderiv(TNOW(L),TNEW(L))
        SOLD(INT(L))%v = SNOW(L)%v
        SNOW(INT(L))%v = SNEW(L)%v
        CALL setderiv(OpenAD_Symbol_205,SNOW(L))
        CALL setderiv(SOLD(L),OpenAD_Symbol_205)
        CALL setderiv(SNOW(L),SNEW(L))
      END DO
      END SUBROUTINE

      SUBROUTINE box_update(FLDNEW, FLDOLD, DFLDDT)
      use w2f__types
      use active_module
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
C
C     **** Parameters and Result ****
C
      type(active) :: FLDNEW(1 : 3)
      type(active) :: FLDOLD(1 : 3)
      type(active) :: DFLDDT(1 : 3)
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
C$OPENAD XXX Template ad_template.f
      DO L = 1, 3, 1
        OpenAD_Symbol_134 = (DELTA_T * 2.0D00)
        FLDNEW(INT(L))%v = (FLDOLD(L)%v+DFLDDT(L)%v*OpenAD_Symbol_134)
        OpenAD_Symbol_132 = 1_w2f__i8
        OpenAD_Symbol_135 = OpenAD_Symbol_134
        OpenAD_Symbol_133 = 1_w2f__i8
        OpenAD_Symbol_212 = (OpenAD_Symbol_135 * OpenAD_Symbol_133)
        OpenAD_Symbol_213 = OpenAD_Symbol_132
        CALL sax(OpenAD_Symbol_212,DFLDDT(L),FLDNEW(L))
        CALL saxpy(OpenAD_Symbol_213,FLDOLD(L),FLDNEW(L))
      END DO
      END SUBROUTINE

      SUBROUTINE box_timestep(GAMMALOC, FLDSTAR, EXTFORLOC, UVELLOC,
     >  FLDNOW, FLDOLD, FLDNEW)
      use w2f__types
      use active_module
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
      type(active) :: UVELLOC
      type(active) :: FLDNOW(1 : 3)
      type(active) :: FLDOLD(1 : 3)
      type(active) :: FLDNEW(1 : 3)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL box_update
      type(active) :: DFLDDT(1 : 3)
      INTEGER(w2f__i4) ISBYTE
      PARAMETER ( ISBYTE = 8)
      INTEGER(w2f__i4) NLEV1
      PARAMETER ( NLEV1 = 73)
      INTEGER(w2f__i4) NLEV2
      PARAMETER ( NLEV2 = 50)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      IF (UVELLOC%v .GE. 0.0D00) THEN
        OpenAD_Symbol_29 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_26 = (GAMMALOC * OpenAD_Symbol_29)
        OpenAD_Symbol_34 = (FLDNOW(3)%v-FLDNOW(1)%v)
        OpenAD_Symbol_19 = (EXTFORLOC(1)+VOL(1)*OpenAD_Symbol_26+UVELLOC
     +%v*OpenAD_Symbol_34)
        DFLDDT(1)%v = (OpenAD_Symbol_19/VOL(1))
        OpenAD_Symbol_33 = (-1_w2f__i8)
        OpenAD_Symbol_31 = GAMMALOC
        OpenAD_Symbol_28 = VOL(1)
        OpenAD_Symbol_25 = 1_w2f__i8
        OpenAD_Symbol_22 = 1_w2f__i8
        OpenAD_Symbol_35 = OpenAD_Symbol_34
        OpenAD_Symbol_37 = 1_w2f__i8
        OpenAD_Symbol_38 = (-1_w2f__i8)
        OpenAD_Symbol_36 = UVELLOC%v
        OpenAD_Symbol_23 = 1_w2f__i8
        OpenAD_Symbol_20 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_49 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_46 = (GAMMALOC * OpenAD_Symbol_49)
        OpenAD_Symbol_54 = (FLDNOW(1)%v-FLDNOW(2)%v)
        OpenAD_Symbol_39 = (EXTFORLOC(2)+VOL(2)*OpenAD_Symbol_46+UVELLOC
     +%v*OpenAD_Symbol_54)
        DFLDDT(2)%v = (OpenAD_Symbol_39/VOL(2))
        OpenAD_Symbol_53 = (-1_w2f__i8)
        OpenAD_Symbol_51 = GAMMALOC
        OpenAD_Symbol_48 = VOL(2)
        OpenAD_Symbol_45 = 1_w2f__i8
        OpenAD_Symbol_42 = 1_w2f__i8
        OpenAD_Symbol_55 = OpenAD_Symbol_54
        OpenAD_Symbol_57 = 1_w2f__i8
        OpenAD_Symbol_58 = (-1_w2f__i8)
        OpenAD_Symbol_56 = UVELLOC%v
        OpenAD_Symbol_43 = 1_w2f__i8
        OpenAD_Symbol_40 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_62 = (FLDNOW(2)%v-FLDNOW(3)%v)
        OpenAD_Symbol_59 = (UVELLOC%v*OpenAD_Symbol_62)
        DFLDDT(3)%v = (OpenAD_Symbol_59/VOL(3))
        OpenAD_Symbol_63 = OpenAD_Symbol_62
        OpenAD_Symbol_65 = 1_w2f__i8
        OpenAD_Symbol_66 = (-1_w2f__i8)
        OpenAD_Symbol_64 = UVELLOC%v
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
        CALL sax(OpenAD_Symbol_150,UVELLOC,DFLDDT(3))
        CALL sax(OpenAD_Symbol_152,UVELLOC,DFLDDT(2))
        CALL sax(OpenAD_Symbol_154,UVELLOC,DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_156,FLDNOW(2),DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_157,FLDNOW(3),DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_158,FLDNOW(1),DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_159,FLDNOW(2),DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_160,FLDNOW(3),DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_161,FLDNOW(1),DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_168,FLDNOW(2),DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_169,FLDNOW(1),DFLDDT(1))
      ELSE
        OpenAD_Symbol_77 = (FLDSTAR(1)-FLDNOW(1)%v)
        OpenAD_Symbol_74 = (GAMMALOC * OpenAD_Symbol_77)
        OpenAD_Symbol_82 = (FLDNOW(2)%v-FLDNOW(1)%v)
        OpenAD_Symbol_67 = (EXTFORLOC(1)+VOL(1)*OpenAD_Symbol_74-UVELLOC
     +%v*OpenAD_Symbol_82)
        DFLDDT(1)%v = (OpenAD_Symbol_67/VOL(1))
        OpenAD_Symbol_81 = (-1_w2f__i8)
        OpenAD_Symbol_79 = GAMMALOC
        OpenAD_Symbol_76 = VOL(1)
        OpenAD_Symbol_73 = 1_w2f__i8
        OpenAD_Symbol_70 = 1_w2f__i8
        OpenAD_Symbol_83 = OpenAD_Symbol_82
        OpenAD_Symbol_85 = 1_w2f__i8
        OpenAD_Symbol_86 = (-1_w2f__i8)
        OpenAD_Symbol_84 = UVELLOC%v
        OpenAD_Symbol_71 = (-1_w2f__i8)
        OpenAD_Symbol_68 = (INT(1_w2f__i8) / VOL(1))
        OpenAD_Symbol_97 = (FLDSTAR(2)-FLDNOW(2)%v)
        OpenAD_Symbol_94 = (GAMMALOC * OpenAD_Symbol_97)
        OpenAD_Symbol_102 = (FLDNOW(3)%v-FLDNOW(2)%v)
        OpenAD_Symbol_87 = (EXTFORLOC(2)+VOL(2)*OpenAD_Symbol_94-UVELLOC
     +%v*OpenAD_Symbol_102)
        DFLDDT(2)%v = (OpenAD_Symbol_87/VOL(2))
        OpenAD_Symbol_101 = (-1_w2f__i8)
        OpenAD_Symbol_99 = GAMMALOC
        OpenAD_Symbol_96 = VOL(2)
        OpenAD_Symbol_93 = 1_w2f__i8
        OpenAD_Symbol_90 = 1_w2f__i8
        OpenAD_Symbol_103 = OpenAD_Symbol_102
        OpenAD_Symbol_105 = 1_w2f__i8
        OpenAD_Symbol_106 = (-1_w2f__i8)
        OpenAD_Symbol_104 = UVELLOC%v
        OpenAD_Symbol_91 = (-1_w2f__i8)
        OpenAD_Symbol_88 = (INT(1_w2f__i8) / VOL(2))
        OpenAD_Symbol_111 = (FLDNOW(1)%v-FLDNOW(3)%v)
        OpenAD_Symbol_108 = (UVELLOC%v*OpenAD_Symbol_111)
        DFLDDT(3)%v = (-(OpenAD_Symbol_108/VOL(3)))
        OpenAD_Symbol_112 = OpenAD_Symbol_111
        OpenAD_Symbol_114 = 1_w2f__i8
        OpenAD_Symbol_115 = (-1_w2f__i8)
        OpenAD_Symbol_113 = UVELLOC%v
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
        CALL sax(OpenAD_Symbol_174,UVELLOC,DFLDDT(2))
        CALL sax(OpenAD_Symbol_176,UVELLOC,DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_178,FLDNOW(3),DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_179,FLDNOW(2),DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_180,FLDNOW(2),DFLDDT(1))
        CALL saxpy(OpenAD_Symbol_181,FLDNOW(1),DFLDDT(1))
        CALL sax(OpenAD_Symbol_185,UVELLOC,DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_187,FLDNOW(1),DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_188,FLDNOW(3),DFLDDT(3))
        CALL saxpy(OpenAD_Symbol_193,FLDNOW(2),DFLDDT(2))
        CALL saxpy(OpenAD_Symbol_194,FLDNOW(1),DFLDDT(1))
      ENDIF
      CALL box_update(FLDNEW,FLDOLD,DFLDDT)
      END SUBROUTINE
