

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_15
      type(active) :: OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      type(active) :: OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
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
      REAL(w2f__8) P
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      P = 2.0D00
      CALL foo(X(1),X(2),C,D)
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(OpenAD_Symbol_0,P)
      CALL foo(X(1),OpenAD_Symbol_0,C,D)
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(P,OpenAD_Symbol_0)
      OpenAD_Symbol_3 = (C%v*D%v)
      OpenAD_Symbol_1 = D%v
      OpenAD_Symbol_2 = C%v
      Y(3)%v = OpenAD_Symbol_3
      Y(4)%v = (C%v+D%v)
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_15 = OpenAD_Symbol_1
      OpenAD_Symbol_17 = OpenAD_Symbol_2
      OpenAD_Symbol_19 = OpenAD_Symbol_4
      OpenAD_Symbol_20 = OpenAD_Symbol_5
      CALL setderiv(OpenAD_Symbol_18,D)
      CALL setderiv(OpenAD_Symbol_16,C)
      CALL sax(OpenAD_Symbol_15,OpenAD_Symbol_16,Y(3))
      CALL saxpy(OpenAD_Symbol_17,OpenAD_Symbol_18,Y(3))
      CALL sax(OpenAD_Symbol_19,OpenAD_Symbol_16,Y(4))
      CALL saxpy(OpenAD_Symbol_20,OpenAD_Symbol_18,Y(4))
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
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_21
      type(active) :: OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      type(active) :: OpenAD_Symbol_24
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
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
      OpenAD_Symbol_6 = (A%v*B%v)
      OpenAD_Symbol_10 = SIN(OpenAD_Symbol_6)
      OpenAD_Symbol_8 = B%v
      OpenAD_Symbol_9 = A%v
      OpenAD_Symbol_7 = COS(OpenAD_Symbol_6)
      C%v = OpenAD_Symbol_10
      OpenAD_Symbol_11 = (A%v+B%v)
      D%v = COS(OpenAD_Symbol_11)
      OpenAD_Symbol_13 = 1_w2f__i8
      OpenAD_Symbol_14 = 1_w2f__i8
      OpenAD_Symbol_12 = (- SIN(OpenAD_Symbol_11))
      OpenAD_Symbol_21 = (OpenAD_Symbol_8 * OpenAD_Symbol_7)
      OpenAD_Symbol_23 = (OpenAD_Symbol_9 * OpenAD_Symbol_7)
      OpenAD_Symbol_25 = (OpenAD_Symbol_13 * OpenAD_Symbol_12)
      OpenAD_Symbol_26 = (OpenAD_Symbol_14 * OpenAD_Symbol_12)
      CALL setderiv(OpenAD_Symbol_24,B)
      CALL setderiv(OpenAD_Symbol_22,A)
      CALL sax(OpenAD_Symbol_21,OpenAD_Symbol_22,C)
      CALL saxpy(OpenAD_Symbol_23,OpenAD_Symbol_24,C)
      CALL sax(OpenAD_Symbol_25,OpenAD_Symbol_22,D)
      CALL saxpy(OpenAD_Symbol_26,OpenAD_Symbol_24,D)
      END SUBROUTINE
