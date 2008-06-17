

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      type(active) :: S
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      I = 1
      Y(1)%v = 0.0
      Y(2)%v = 0.0
      CALL zero_deriv(Y(1))
      CALL zero_deriv(Y(2))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        S%v = X(I)%v
        CALL setderiv(S,X(I))
        IF (S%v .GT. 0.0D00) THEN
          S%v = 0.0D00
          CALL zero_deriv(S)
        ENDIF
        Y(INT(I))%v = (X(I)%v+S%v)
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_1 = 1_w2f__i8
        CALL sax(1 _w2f__i8,X(I),Y(I))
        CALL saxpy(1 _w2f__i8,S,Y(I))
      END DO
      END SUBROUTINE
