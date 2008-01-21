

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
      INTEGER(w2f__i4) t__1
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
C$OPENAD XXX Simple loop\t
      t__1 = K * 2
      DO I = 1, (K * 2), 1
        Y(INT(I))%v = X(I)%v
        CALL setderiv(OpenAD_Symbol_0,X(I))
        CALL setderiv(Y(I),OpenAD_Symbol_0)
      END DO
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
      CALL bar(X,Y,2)
      END SUBROUTINE
