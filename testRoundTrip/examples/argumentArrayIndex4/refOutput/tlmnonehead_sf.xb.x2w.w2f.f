C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:39:05 2006
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

      SUBROUTINE foo(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X) * 2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      __value__(Y) = OpenAD_Symbol_2
      OpenAD_Symbol_3 = OpenAD_Symbol_0
      CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(X))
      CALL sax(OpenAD_Symbol_3, __deriv__(OpenAD_Symbol_4), __deriv__(Y
     > ))
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) L
      TYPE (OpenADTy_active) P(1 : 2)
      TYPE (OpenADTy_active) Q(1 : 2)
      TYPE (OpenADTy_active) R
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      K = 1
      CALL foo(__deriv__(X(K)), __deriv__(Y))
      __value__(Q(1)) = __value__(Y)
      CALL setderiv(__deriv__(OpenAD_Symbol_5), __deriv__(Y))
      CALL setderiv(__deriv__(Q(1)), __deriv__(OpenAD_Symbol_5))
      __value__(Y) = __value__(Q(1))
      __value__(P(1)) = 1.0D00
      CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(Q(1)))
      CALL setderiv(__deriv__(Y), __deriv__(OpenAD_Symbol_6))
      CALL zero_deriv(__deriv__(P(1)))
      L = 1
      CALL foo(__deriv__(P(K)), __deriv__(Q(L)))
      __value__(R) = __value__(P(1))
      CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(P(1)))
      CALL setderiv(__deriv__(R), __deriv__(OpenAD_Symbol_7))
      CALL foo(__deriv__(R), __deriv__(Q(L)))
      RETURN
      END SUBROUTINE
