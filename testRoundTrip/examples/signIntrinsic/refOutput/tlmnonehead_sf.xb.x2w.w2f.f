
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
      REAL(w2f__8) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
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
      OpenAD_Symbol_0 = (- __value__(X(2)))
      OpenAD_Symbol_3 = SIGN(__value__(X(1)), OpenAD_Symbol_0)
      OpenAD_Symbol_1 = (SIGN(1.0D00, __value__(X(1))) * SIGN(1.0D00,
     >  OpenAD_Symbol_0))
      __value__(Y(1)) = OpenAD_Symbol_3
      CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_1, __deriv__(OpenAD_Symbol_4), __deriv__(Y
     > (1)))
      END SUBROUTINE
