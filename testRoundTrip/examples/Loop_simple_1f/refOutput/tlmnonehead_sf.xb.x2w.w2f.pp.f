C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 13:25:27 2007
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
      type(active) :: OpenAD_Symbol_0
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      INTENT(IN)  X
      type(active) :: Y(1 : 4)
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
      DO I = 0, 3, 1
        Y(INT(I+1))%v = X(I+1)%v
        CALL setderiv(OpenAD_Symbol_0,X(I+1))
        CALL setderiv(Y(I+1),OpenAD_Symbol_0)
      END DO
      RETURN
      END SUBROUTINE
