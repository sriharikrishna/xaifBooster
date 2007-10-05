C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:08:15 2007
C ***********************************************************
C ***********************************************************

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
      REAL(w2f__8) OpenAD_Symbol_14
      type(active) :: OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      type(active) :: OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      type(active) :: C
      type(active) :: D
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
      CALL foo(X(1),X(2),C,D)
      OpenAD_Symbol_2 = (C%v*D%v)
      OpenAD_Symbol_0 = D%v
      OpenAD_Symbol_1 = C%v
      Y(3)%v = OpenAD_Symbol_2
      Y(4)%v = (C%v+D%v)
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_14 = OpenAD_Symbol_0
      OpenAD_Symbol_16 = OpenAD_Symbol_1
      OpenAD_Symbol_18 = OpenAD_Symbol_3
      OpenAD_Symbol_19 = OpenAD_Symbol_4
      CALL setderiv(OpenAD_Symbol_17,D)
      CALL setderiv(OpenAD_Symbol_15,C)
      CALL sax(OpenAD_Symbol_14,OpenAD_Symbol_15,Y(3))
      CALL saxpy(OpenAD_Symbol_16,OpenAD_Symbol_17,Y(3))
      CALL sax(OpenAD_Symbol_18,OpenAD_Symbol_15,Y(4))
      CALL saxpy(OpenAD_Symbol_19,OpenAD_Symbol_17,Y(4))
      END SUBROUTINE

      SUBROUTINE foo(A, B, C, D)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_20
      type(active) :: OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      type(active) :: OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: A
      type(active) :: B
      type(active) :: C
      type(active) :: D
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_5 = (A%v*B%v)
      OpenAD_Symbol_9 = SIN(OpenAD_Symbol_5)
      OpenAD_Symbol_7 = B%v
      OpenAD_Symbol_8 = A%v
      OpenAD_Symbol_6 = COS(OpenAD_Symbol_5)
      C%v = OpenAD_Symbol_9
      OpenAD_Symbol_10 = (A%v+B%v)
      D%v = COS(OpenAD_Symbol_10)
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_11 = (- SIN(OpenAD_Symbol_10))
      OpenAD_Symbol_20 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
      OpenAD_Symbol_22 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
      OpenAD_Symbol_24 = (OpenAD_Symbol_12 * OpenAD_Symbol_11)
      OpenAD_Symbol_25 = (OpenAD_Symbol_13 * OpenAD_Symbol_11)
      CALL setderiv(OpenAD_Symbol_23,B)
      CALL setderiv(OpenAD_Symbol_21,A)
      CALL sax(OpenAD_Symbol_20,OpenAD_Symbol_21,C)
      CALL saxpy(OpenAD_Symbol_22,OpenAD_Symbol_23,C)
      CALL sax(OpenAD_Symbol_24,OpenAD_Symbol_21,D)
      CALL saxpy(OpenAD_Symbol_25,OpenAD_Symbol_23,D)
      END SUBROUTINE
