
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      type(active) :: OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: Y(1 : 4)
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
      CALL foo(X(1),X(2),Y(1))
      OpenAD_Symbol_0 = (X(1)%v*X(2)%v)
      Y(2)%v = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = X(2)%v
      OpenAD_Symbol_3 = X(1)%v
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_17 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      OpenAD_Symbol_18 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      CALL sax(OpenAD_Symbol_17,X(1),Y(2))
      CALL saxpy(OpenAD_Symbol_18,X(2),Y(2))
      OpenAD_Symbol_5 = SIN(X(3)%v)
      OpenAD_Symbol_4 = COS(X(3)%v)
      Y(3)%v = OpenAD_Symbol_5
      CALL setderiv(OpenAD_Symbol_19,X(3))
      CALL sax(OpenAD_Symbol_4,OpenAD_Symbol_19,Y(3))
      OpenAD_Symbol_7 = COS(X(4)%v)
      OpenAD_Symbol_6 = (-SIN(X(4)%v))
      Y(4)%v = OpenAD_Symbol_7
      CALL setderiv(OpenAD_Symbol_20,X(4))
      CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_20,Y(4))
      END SUBROUTINE

      SUBROUTINE foo(A, B, C)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: A
      type(active) :: B
      type(active) :: C
C
C     **** Local Variables and Functions ****
C
      EXTERNAL bar
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL bar(B)
      C%v = (B%v+A%v*A%v)
      OpenAD_Symbol_8 = 1_w2f__i8
      OpenAD_Symbol_10 = A%v
      OpenAD_Symbol_11 = A%v
      OpenAD_Symbol_9 = 1_w2f__i8
      CALL sax(OpenAD_Symbol_10,A,C)
      CALL saxpy(OpenAD_Symbol_11,A,C)
      CALL saxpy(1 _w2f__i8,B,C)
      END SUBROUTINE

      SUBROUTINE bar(A)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      type(active) :: OpenAD_Symbol_23
      type(active) :: OpenAD_Symbol_24
C
C     **** Parameters and Result ****
C
      type(active) :: A
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_12 = (A%v*A%v)
      OpenAD_Symbol_16 = COS(OpenAD_Symbol_12)
      OpenAD_Symbol_14 = A%v
      OpenAD_Symbol_15 = A%v
      OpenAD_Symbol_13 = (- SIN(OpenAD_Symbol_12))
      A%v = OpenAD_Symbol_16
      OpenAD_Symbol_21 = (OpenAD_Symbol_14 * OpenAD_Symbol_13)
      OpenAD_Symbol_22 = (OpenAD_Symbol_15 * OpenAD_Symbol_13)
      CALL setderiv(OpenAD_Symbol_23,A)
      CALL setderiv(OpenAD_Symbol_24,A)
      CALL sax(OpenAD_Symbol_21,OpenAD_Symbol_23,A)
      CALL saxpy(OpenAD_Symbol_22,OpenAD_Symbol_24,A)
      END SUBROUTINE
