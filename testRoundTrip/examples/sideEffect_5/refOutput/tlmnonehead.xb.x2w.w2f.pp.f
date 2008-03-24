

      SUBROUTINE foo(A, N)
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) N
      type(active) :: A(1 : INT((N + G)))
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, (N + 1), 1
        OpenAD_Symbol_2 = (A(I)%v*2.0D00)
        OpenAD_Symbol_0 = 2.0D00
        A(INT(I))%v = OpenAD_Symbol_2
        OpenAD_Symbol_5 = OpenAD_Symbol_0
        CALL setderiv(OpenAD_Symbol_6,A(I))
        CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,A(I))
      END DO
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 3)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      INTEGER(w2f__i4) I
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      G = 1
      I = 2
      CALL foo(X,2)
      CALL foo(X,I)
      Y(1)%v = 0
      CALL zero_deriv(Y(1))
      DO I = 1, 3, 1
        Y(1)%v = (X(I)%v+Y(1)%v)
        OpenAD_Symbol_3 = 1_w2f__i8
        OpenAD_Symbol_4 = 1_w2f__i8
        OpenAD_Symbol_7 = OpenAD_Symbol_3
        OpenAD_Symbol_8 = OpenAD_Symbol_4
        CALL setderiv(OpenAD_Symbol_9,Y(1))
        CALL sax(OpenAD_Symbol_7,X(I),Y(1))
        CALL saxpy(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(1))
      END DO
      END SUBROUTINE
