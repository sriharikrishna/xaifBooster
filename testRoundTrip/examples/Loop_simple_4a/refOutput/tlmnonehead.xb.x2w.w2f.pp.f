C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:07:36 2007
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(J, X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: OpenAD_Symbol_0
C
C     **** Parameters and Result ****
C
      INTEGER(w2f__i4) J
      type(active) :: X(1 : 1)
      INTENT(IN)  X
      type(active) :: Y(1 : 1)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
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
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        Y(INT(J))%v = X(J)%v
        CALL setderiv(OpenAD_Symbol_0,X(J))
        CALL setderiv(Y(J),OpenAD_Symbol_0)
      END DO
      END SUBROUTINE
