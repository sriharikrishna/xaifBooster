C ***********************************************************
C Fortran file translated from WHIRL Thu Oct  4 23:46:50 2007
C ***********************************************************
C ***********************************************************

      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) PI
      PARAMETER ( PI = 3.141592653589793116D00)
C
C     **** Statements ****
C
      END MODULE

      MODULE anothermodule
      use w2f__types
      use all_globals_mod
      IMPLICIT NONE
      SAVE
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) PI2
      PARAMETER ( PI2 = 3.141592653589793116D00)
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use anothermodule
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
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) * 3.141592653589793116D00)
      OpenAD_Symbol_0 = (OpenAD_Symbol_2 * 2.0D00)
      OpenAD_Symbol_7 = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_5 = 3.141592653589793116D00
      OpenAD_Symbol_3 = 2.0D00
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      __value__(Y(1)) = OpenAD_Symbol_7
      OpenAD_Symbol_8 = (OpenAD_Symbol_5 * OpenAD_Symbol_3)
      OpenAD_Symbol_9 = (OpenAD_Symbol_8 * OpenAD_Symbol_1)
      CALL setderiv(__deriv__(OpenAD_Symbol_10), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_9, __deriv__(OpenAD_Symbol_10), __deriv__(
     > Y(1)))
      END SUBROUTINE
