C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:39:05 2006
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

      SUBROUTINE foo(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_4
C
C     **** Parameters and Result ****
C
      type(active) :: X
      type(active) :: Y
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (X%v*2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      Y%v = OpenAD_Symbol_2
      OpenAD_Symbol_3 = OpenAD_Symbol_0
      CALL setderiv(OpenAD_Symbol_4,X)
      CALL sax(OpenAD_Symbol_3,OpenAD_Symbol_4,Y)
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_5
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
      type(active) :: P(1 : 2)
      type(active) :: Q(1 : 2)
      type(active) :: R
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
      CALL setderiv(OpenAD_Symbol_5,Y)
      CALL setderiv(Q(1),OpenAD_Symbol_5)
      Y%v = Q(1)%v
      P(1)%v = 1.0D00
      CALL setderiv(OpenAD_Symbol_6,Q(1))
      CALL setderiv(Y,OpenAD_Symbol_6)
      CALL zero_deriv(P(1))
      L = 1
      CALL foo(P(K),Q(L))
      R%v = P(1)%v
      CALL setderiv(OpenAD_Symbol_7,P(1))
      CALL setderiv(R,OpenAD_Symbol_7)
      CALL foo(R,Q(L))
      RETURN
      END SUBROUTINE
