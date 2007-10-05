C ***********************************************************
C Fortran file translated from WHIRL Thu Oct  4 23:45:30 2007
C ***********************************************************
C ***********************************************************


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
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
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
      CALL foo(X(K),X(K+1))
      CALL foo(X(K),Y)
      END SUBROUTINE
