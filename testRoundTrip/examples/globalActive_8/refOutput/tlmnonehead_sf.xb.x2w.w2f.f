
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
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_6
      TYPE (OpenADTy_active) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      TYPE (OpenADTy_active) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_0 = __value__(X(2))
      OpenAD_Symbol_1 = __value__(X(1))
      __value__(AGLOBAL) = OpenAD_Symbol_2
      __value__(Y) = __value__(AGLOBAL)
      OpenAD_Symbol_6 = (OpenAD_Symbol_0 * INT(1_w2f__i8))
      OpenAD_Symbol_8 = (OpenAD_Symbol_1 * INT(1_w2f__i8))
      OpenAD_Symbol_10 = OpenAD_Symbol_0
      OpenAD_Symbol_11 = OpenAD_Symbol_1
      CALL setderiv(__deriv__(OpenAD_Symbol_9), __deriv__(X(2)))
      CALL setderiv(__deriv__(OpenAD_Symbol_7), __deriv__(X(1)))
      CALL sax(OpenAD_Symbol_6, __deriv__(OpenAD_Symbol_7), __deriv__(Y
     > ))
      CALL saxpy(OpenAD_Symbol_8, __deriv__(OpenAD_Symbol_9), __deriv__
     > (Y))
      CALL sax(OpenAD_Symbol_10, __deriv__(OpenAD_Symbol_7), __deriv__(
     > AGLOBAL))
      CALL saxpy(OpenAD_Symbol_11, __deriv__(OpenAD_Symbol_9),
     >  __deriv__(AGLOBAL))
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      TYPE (OpenADTy_active) OpenAD_Symbol_12
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
      EXTERNAL foo
      TYPE (OpenADTy_active) P
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL foo(__deriv__(X), __deriv__(Y(1)))
      CALL bar(__deriv__(P))
      __value__(Y(2)) = __value__(P)
      CALL setderiv(__deriv__(OpenAD_Symbol_12), __deriv__(P))
      CALL setderiv(__deriv__(Y(2)), __deriv__(OpenAD_Symbol_12))
      END SUBROUTINE

      SUBROUTINE bar(AP)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_13
      TYPE (OpenADTy_active) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) AP
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (__value__(AGLOBAL) ** INT(3_w2f__i8))
      OpenAD_Symbol_3 = (INT(3_w2f__i8) *(__value__(AGLOBAL) **(INT(
     > 3_w2f__i8) - INT(1_w2f__i8))))
      __value__(AP) = OpenAD_Symbol_5
      OpenAD_Symbol_13 = OpenAD_Symbol_3
      CALL setderiv(__deriv__(OpenAD_Symbol_14), __deriv__(AGLOBAL))
      CALL sax(OpenAD_Symbol_13, __deriv__(OpenAD_Symbol_14), __deriv__
     > (AP))
      END SUBROUTINE
