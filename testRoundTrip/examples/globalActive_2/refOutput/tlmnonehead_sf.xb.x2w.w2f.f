
      MODULE all_globals_mod
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      MODULE globals
      use w2f__types
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) AGLOBAL
      REAL(w2f__8) APASSIVEGLOBAL
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
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
      APASSIVEGLOBAL = 2.0D00
      __value__(AGLOBAL) = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_0 = __value__(X(2))
      OpenAD_Symbol_1 = __value__(X(1))
      __value__(Y(1)) = (__value__(AGLOBAL) * APASSIVEGLOBAL)
      OpenAD_Symbol_2 = APASSIVEGLOBAL
      OpenAD_Symbol_4 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_5 = (OpenAD_Symbol_1 * OpenAD_Symbol_2)
      CALL sax(OpenAD_Symbol_0, __deriv__(X(1)), __deriv__(AGLOBAL))
      CALL saxpy(OpenAD_Symbol_1, __deriv__(X(2)), __deriv__(AGLOBAL))
      CALL sax(OpenAD_Symbol_4, __deriv__(X(1)), __deriv__(Y(1)))
      CALL saxpy(OpenAD_Symbol_5, __deriv__(X(2)), __deriv__(Y(1)))
      END SUBROUTINE
