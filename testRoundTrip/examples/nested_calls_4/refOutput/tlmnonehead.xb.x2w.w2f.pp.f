

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
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
      Y(3)%v = (C%v*D%v)
      OpenAD_Symbol_1 = D%v
      OpenAD_Symbol_2 = C%v
      CALL sax(OpenAD_Symbol_1,C,Y(3))
      CALL saxpy(OpenAD_Symbol_2,D,Y(3))
      Y(4)%v = (C%v+D%v)
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_4 = 1_w2f__i8
      CALL sax(1 _w2f__i8,C,Y(4))
      CALL saxpy(1 _w2f__i8,D,Y(4))
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
      C%v = SIN(OpenAD_Symbol_5)
      OpenAD_Symbol_7 = B%v
      OpenAD_Symbol_8 = A%v
      OpenAD_Symbol_6 = COS(OpenAD_Symbol_5)
      OpenAD_Symbol_9 = (A%v+B%v)
      D%v = COS(OpenAD_Symbol_9)
      OpenAD_Symbol_11 = 1_w2f__i8
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_10 = (- SIN(OpenAD_Symbol_9))
      OpenAD_Symbol_13 = (OpenAD_Symbol_7 * OpenAD_Symbol_6)
      OpenAD_Symbol_14 = (OpenAD_Symbol_8 * OpenAD_Symbol_6)
      CALL sax(OpenAD_Symbol_13,A,C)
      CALL saxpy(OpenAD_Symbol_14,B,C)
      CALL sax(OpenAD_Symbol_10,A,D)
      CALL saxpy(OpenAD_Symbol_10,B,D)
      END SUBROUTINE
