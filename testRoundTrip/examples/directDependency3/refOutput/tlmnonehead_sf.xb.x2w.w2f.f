C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:00:46 2007
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

      SUBROUTINE foo()
      use w2f__types
      IMPLICIT NONE
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      TYPE (OpenADTy_active) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      TYPE (OpenADTy_active) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      TYPE (OpenADTy_active) T
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      __value__(T) = __value__(X(1))
      CALL setderiv(__deriv__(OpenAD_Symbol_3), __deriv__(X(1)))
      CALL setderiv(__deriv__(T), __deriv__(OpenAD_Symbol_3))
      CALL foo()
      OpenAD_Symbol_2 = (__value__(T) * 2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      __value__(Y) = OpenAD_Symbol_2
      OpenAD_Symbol_4 = OpenAD_Symbol_0
      CALL setderiv(__deriv__(OpenAD_Symbol_5), __deriv__(T))
      CALL sax(OpenAD_Symbol_4, __deriv__(OpenAD_Symbol_5), __deriv__(Y
     > ))
      END SUBROUTINE
