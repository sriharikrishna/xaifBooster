C ***********************************************************
C Fortran file translated from WHIRL Mon Oct  1 09:49:00 2007
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

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      TYPE (OpenADTy_active) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) PI
      PARAMETER ( PI = 3.141592653589793116D00)
      REAL(w2f__8) OpenAD_Symbol_11
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C     $OpenAD$ BEGIN REPLACEMENT 1
C$OPENAD XXX Template ad_template.f
      __value__(Y(1)) = SIN(__value__(X(1)) * 2.0D00 *
     >  3.141592653589793116D00)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 2
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) * 2.0D00)
      OpenAD_Symbol_0 = (OpenAD_Symbol_2 * 3.141592653589793116D00)
      OpenAD_Symbol_7 = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_5 = 2.0D00
      OpenAD_Symbol_3 = 3.141592653589793116D00
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      __value__(Y(1)) = OpenAD_Symbol_7
      OpenAD_Symbol_8 = (OpenAD_Symbol_5 * OpenAD_Symbol_3)
      OpenAD_Symbol_9 = (OpenAD_Symbol_8 * OpenAD_Symbol_1)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_9)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 3
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_11)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_11, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
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
      OpenAD_Symbol_2 = (__value__(X(1)) * 2.0D00)
      OpenAD_Symbol_0 = (OpenAD_Symbol_2 * 3.141592653589793116D00)
      OpenAD_Symbol_7 = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_5 = 2.0D00
      OpenAD_Symbol_3 = 3.141592653589793116D00
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      __value__(Y(1)) = OpenAD_Symbol_7
      OpenAD_Symbol_8 = (OpenAD_Symbol_5 * OpenAD_Symbol_3)
      OpenAD_Symbol_9 = (OpenAD_Symbol_8 * OpenAD_Symbol_1)
C     $OpenAD$ INLINE push(subst)
      CALL push(OpenAD_Symbol_9)
      RETURN
C     $OpenAD$ END REPLACEMENT
C     $OpenAD$ BEGIN REPLACEMENT 11
C     $OpenAD$ INLINE Pop(subst)
      CALL Pop(OpenAD_Symbol_11)
C     $OpenAD$ INLINE Saxpy(subst,subst,subst)
      CALL Saxpy(OpenAD_Symbol_11, __deriv__(Y(1)), __deriv__(
     > OpenAD_Symbol_10))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(Y(1)))
C     $OpenAD$ INLINE IncDeriv(subst,subst)
      CALL IncDeriv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
C     $OpenAD$ INLINE ZeroDeriv(subst)
      CALL ZeroDeriv(__deriv__(OpenAD_Symbol_10))
C     $OpenAD$ END REPLACEMENT
      END SUBROUTINE
