
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

      SUBROUTINE foo(X, Y)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) * __value__(X(1)))
      OpenAD_Symbol_0 = __value__(X(1))
      OpenAD_Symbol_1 = __value__(X(1))
      __value__(Y) = OpenAD_Symbol_2
      OpenAD_Symbol_6 = OpenAD_Symbol_0
      OpenAD_Symbol_8 = OpenAD_Symbol_1
      CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(X(1)))
      CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_7), __deriv__(Y
     > ))
      CALL saxpy(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_9), __deriv__
     > (Y))
      END SUBROUTINE

      SUBROUTINE bar(X)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      TYPE (OpenADTy_active) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      TYPE (OpenADTy_active) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (__value__(X) * __value__(AGLOBAL))
      OpenAD_Symbol_3 = __value__(AGLOBAL)
      OpenAD_Symbol_4 = __value__(X)
      __value__(X) = OpenAD_Symbol_5
      OpenAD_Symbol_10 = OpenAD_Symbol_3
      OpenAD_Symbol_12 = OpenAD_Symbol_4
      CALL setderiv(__deriv__(OpenAD_Symbol_13), __deriv__(AGLOBAL))
      CALL setderiv(__deriv__(OpenAD_Symbol_11), __deriv__(X))
      CALL sax(OpenAD_Symbol_10, __deriv__(OpenAD_Symbol_11), __deriv__
     > (X))
      CALL saxpy(OpenAD_Symbol_12, __deriv__(OpenAD_Symbol_13),
     >  __deriv__(X))
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_14
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
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
      __value__(AGLOBAL) = 2.0D00
      CALL zero_deriv(__deriv__(AGLOBAL))
      CALL bar(__deriv__(X(1)))
      CALL foo(__deriv__(X), __deriv__(AGLOBAL))
      __value__(Y(1)) = __value__(AGLOBAL)
      CALL setderiv(__deriv__(OpenAD_Symbol_14), __deriv__(AGLOBAL))
      CALL setderiv(__deriv__(Y(1)), __deriv__(OpenAD_Symbol_14))
      END SUBROUTINE
