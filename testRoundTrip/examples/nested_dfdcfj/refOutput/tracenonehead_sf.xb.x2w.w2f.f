
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
C     $OpenAD$ INLINE oad_trace_call(subst,subst)
      CALL oad_trace_call('foo', 124_w2f__i8)
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('NX')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('NY')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('X')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('FVEC')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('R')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('N')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('HX')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('HY')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('HY2')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
C     $OpenAD$ INLINE oad_trace_arg(subst)
      CALL oad_trace_arg('HX2')
C     $OpenAD$ INLINE oad_trace_earg()
      CALL oad_trace_earg()
      CALL foo(NX, NY, __deriv__(X), __deriv__(FVEC), R, N, HX, HY, HY2
     > , HX2)
C     $OpenAD$ INLINE oad_trace_ecall()
      CALL oad_trace_ecall()
      DO K = 1, N, 1
        __value__(FVEC(INT(K))) = (__value__(FVEC(K)) * HX2 * HY2)
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE foo(NX, NY, X, FVEC, R, N, HX, HY, HY2, HX2)
      use w2f__types
      IMPLICIT NONE
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
C         $OpenAD$ INLINE oad_trace_call(subst,subst)
          CALL oad_trace_call('bar', 215_w2f__i8)
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PBB')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PBL')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PB')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PBR')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PLL')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PL')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('P')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PR')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PRR')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PTL')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PT')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PTR')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PTT')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('HY2')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('HX2')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PLAP')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PBLAP')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PLLAP')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PRLAP')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
C         $OpenAD$ INLINE oad_trace_arg(subst)
          CALL oad_trace_arg('PTLAP')
C         $OpenAD$ INLINE oad_trace_earg()
          CALL oad_trace_earg()
          CALL bar(__deriv__(PBB), __deriv__(PBL), __deriv__(PB),
     >  __deriv__(PBR), __deriv__(PLL), __deriv__(PL), __deriv__(P),
     >  __deriv__(PR), __deriv__(PRR), __deriv__(PTL), __deriv__(PT),
     >  __deriv__(PTR), __deriv__(PTT), HY2, HX2, __deriv__(PLAP),
     >  __deriv__(PBLAP), __deriv__(PLLAP), __deriv__(PRLAP), __deriv__
     > (PTLAP))
C         $OpenAD$ INLINE oad_trace_ecall()
          CALL oad_trace_ecall()
          __value__(FVEC(INT(K))) = (((__value__(PBLAP) + __value__(
     > PTLAP) - __value__(PLAP) * 2.0D00) / HY2) +((__value__(PLLAP) +
     >  __value__(PRLAP) - __value__(PLAP) * 2.0D00) / HX2) - R *(((
     > __value__(DPDY) *(__value__(PRLAP) - __value__(PLLAP))) /(HX *
     >  2.0D00)) -((__value__(DPDX) *(__value__(PTLAP) - __value__(
     > PBLAP))) /(HY * 2.0D00))))
        END DO
      END DO
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE

      SUBROUTINE bar(PBB, PBL, PB, PBR, PLL, PL, P, PR, PRR, PTL, PT,
     >  PTR, PTT, HY2, HX2, PLAP, PBLAP, PLLAP, PRLAP, PTLAP)
      use w2f__types
      IMPLICIT NONE
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
      END SUBROUTINE
