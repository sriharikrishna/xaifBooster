

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X
      type(active) :: Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_3 = (X%v*2.0D00)
      OpenAD_Symbol_1 = 2.0D00
      Y%v = OpenAD_Symbol_3
      OpenAD_Symbol_4 = OpenAD_Symbol_1
      CALL setderiv(OpenAD_Symbol_5,X)
      CALL sax(OpenAD_Symbol_4,OpenAD_Symbol_5,Y)
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_0
      type(active) :: OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      INTEGER(w2f__i4) K
      INTEGER(w2f__i4) L
      REAL(w2f__8) P(1 : 2)
      type(active) :: Q(1 : 2)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      K = 1
      CALL foo(X(K),Y)
      Q(1)%v = Y%v
      CALL setderiv(OpenAD_Symbol_6,Y)
      CALL setderiv(Q(1),OpenAD_Symbol_6)
      Y%v = Q(1)%v
      P(1) = 1.0
      CALL setderiv(OpenAD_Symbol_7,Q(1))
      CALL setderiv(Y,OpenAD_Symbol_7)
      L = 1
C     $OpenAD$ INLINE convert_p2a_scalar(subst,subst)
      CALL convert_p2a_scalar(OpenAD_Symbol_0,P(K))
      CALL foo(OpenAD_Symbol_0,Q(L))
C     $OpenAD$ INLINE convert_a2p_scalar(subst,subst)
      CALL convert_a2p_scalar(P(K),OpenAD_Symbol_0)
      END SUBROUTINE
