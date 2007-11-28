
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
      REAL(w2f__8) OpenAD_Symbol_3
      TYPE (OpenADTy_active) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      TYPE (OpenADTy_active) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
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
      OpenAD_Symbol_2 = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_0 = __value__(X(2))
      OpenAD_Symbol_1 = __value__(X(1))
      __value__(AGLOBAL) = OpenAD_Symbol_2
      __value__(Y(1)) = __value__(AGLOBAL)
      OpenAD_Symbol_3 = (OpenAD_Symbol_0 * INT(1_w2f__i8))
      OpenAD_Symbol_5 = (OpenAD_Symbol_1 * INT(1_w2f__i8))
      OpenAD_Symbol_7 = OpenAD_Symbol_0
      OpenAD_Symbol_8 = OpenAD_Symbol_1
      CALL setderiv(__deriv__(OpenAD_Symbol_6), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_4), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_3, __deriv__(OpenAD_Symbol_4), __deriv__(Y
     > (1)))
      CALL saxpy(OpenAD_Symbol_5, __deriv__(OpenAD_Symbol_6), __deriv__
     > (Y(1)))
      CALL sax(OpenAD_Symbol_7, __deriv__(OpenAD_Symbol_4), __deriv__(
     > AGLOBAL))
      CALL saxpy(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_6), __deriv__
     > (AGLOBAL))
      END SUBROUTINE
