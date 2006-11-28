C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:43:14 2006
C ***********************************************************
C ***********************************************************


      SUBROUTINE bar(X, Y, K)
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
      INTEGER(w2f__i4) K
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop\t
      DO I = 1, (2 * K), 1
        Y(INT(I))%v = X(I)%v
        CALL setderiv(OpenAD_Symbol_0,X(I))
        CALL setderiv(Y(I),OpenAD_Symbol_0)
      END DO
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
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
      EXTERNAL bar
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL bar(X,Y,2 _w2f__i8)
      RETURN
      END SUBROUTINE
