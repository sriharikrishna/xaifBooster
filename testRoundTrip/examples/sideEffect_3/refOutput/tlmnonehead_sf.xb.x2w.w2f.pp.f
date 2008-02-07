
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE bar(C, D)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
C
C     **** Parameters and Result ****
C
      type(active) :: C
      type(active) :: D
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      D%v = (C%v*C%v)
      OpenAD_Symbol_0 = C%v
      OpenAD_Symbol_1 = C%v
      OpenAD_Symbol_2 = OpenAD_Symbol_0
      OpenAD_Symbol_3 = OpenAD_Symbol_1
      CALL sax(OpenAD_Symbol_2,C,D)
      CALL saxpy(OpenAD_Symbol_3,C,D)
      END SUBROUTINE

      SUBROUTINE foo(A, B)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: A
      type(active) :: B
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL bar(A,B)
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
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
      CALL foo(X(1),Y(1))
      END SUBROUTINE
