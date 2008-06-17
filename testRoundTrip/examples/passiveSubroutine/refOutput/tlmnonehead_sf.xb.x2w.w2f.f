
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
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) X(1 : 1)
      TYPE (OpenADTy_active) Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
      EXTERNAL foo
      REAL(w2f__8) P
      REAL(w2f__8) Q
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
      P = 1.0D00
      CALL bar(P, Q)
      END SUBROUTINE

      SUBROUTINE foo(A, B)
      use w2f__types
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
C
C     **** Parameters and Result ****
C
      TYPE (OpenADTy_active) A
      TYPE (OpenADTy_active) B
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      __value__(B) = (__value__(A) * __value__(A))
      OpenAD_Symbol_0 = __value__(A)
      OpenAD_Symbol_1 = __value__(A)
      CALL sax(OpenAD_Symbol_0, __deriv__(A), __deriv__(B))
      CALL saxpy(OpenAD_Symbol_1, __deriv__(A), __deriv__(B))
      END SUBROUTINE

      SUBROUTINE bar(A, B)
      use w2f__types
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      REAL(w2f__8) A
      REAL(w2f__8) B
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      B = COS(A)
      END SUBROUTINE
