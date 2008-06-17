
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
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 2)
      TYPE (OpenADTy_active) Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      __value__(AGLOBAL) = (__value__(X(1)) * __value__(X(2)))
      OpenAD_Symbol_0 = __value__(X(2))
      OpenAD_Symbol_1 = __value__(X(1))
      __value__(Y) = __value__(AGLOBAL)
      CALL sax(OpenAD_Symbol_0, __deriv__(X(1)), __deriv__(AGLOBAL))
      CALL saxpy(OpenAD_Symbol_1, __deriv__(X(2)), __deriv__(AGLOBAL))
      CALL sax(OpenAD_Symbol_0, __deriv__(X(1)), __deriv__(Y))
      CALL saxpy(OpenAD_Symbol_1, __deriv__(X(2)), __deriv__(Y))
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use globals
      IMPLICIT NONE
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
      CALL setderiv(__deriv__(Y(2)), __deriv__(P))
      END SUBROUTINE

      SUBROUTINE bar(AP)
      use w2f__types
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_2
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) AP
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      __value__(AP) = (__value__(AGLOBAL) ** 3)
      OpenAD_Symbol_2 = (3 *(__value__(AGLOBAL) **(3 - INT(1_w2f__i8)))
     > )
      CALL sax(OpenAD_Symbol_2, __deriv__(AGLOBAL), __deriv__(AP))
      END SUBROUTINE
