
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X
      INTENT(IN)  X
      TYPE (OpenADTy_active) Y
      INTENT(OUT)  Y
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = (__value__(X) * __value__(X))
      __value__(Y) = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = __value__(X)
      OpenAD_Symbol_3 = __value__(X)
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_4 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      OpenAD_Symbol_5 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      CALL sax(OpenAD_Symbol_4, __deriv__(X), __deriv__(Y))
      CALL saxpy(OpenAD_Symbol_5, __deriv__(X), __deriv__(Y))
      END SUBROUTINE
