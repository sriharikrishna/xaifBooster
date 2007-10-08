C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:14:48 2007
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

      SUBROUTINE foo(A, B)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(A) * __value__(A))
      OpenAD_Symbol_0 = __value__(A)
      OpenAD_Symbol_1 = __value__(A)
      __value__(B) = OpenAD_Symbol_2
      OpenAD_Symbol_3 = OpenAD_Symbol_0
      OpenAD_Symbol_5 = OpenAD_Symbol_1
      CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(A))
      CALL sax(OpenAD_Symbol_3, __deriv__(OpenAD_Symbol_4), __deriv__(B
     > ))
      CALL saxpy(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_4), __deriv__
     > (B))
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL foo(__deriv__(X(1)), __deriv__(Y(1)))
      END SUBROUTINE
