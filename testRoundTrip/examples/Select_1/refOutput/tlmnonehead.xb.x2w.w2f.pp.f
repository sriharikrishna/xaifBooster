

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      INTENT(IN)  X
      type(active) :: Y(1 : 1)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) select_expr_temp_0
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
      Y(1)%v = 2.0D00
      CALL zero_deriv(Y(1))
      select_expr_temp_0 = I
      IF ( I  .EQ.  1)  GO TO  4
      IF ( I  .EQ.  2)  GO TO  8
      GO TO 9
9     CONTINUE
      Y(1)%v = X(1)%v
      CALL setderiv(Y(1),X(1))
      GO TO 6
4     CONTINUE
      Y(1)%v = X(1)%v
      CALL setderiv(Y(1),X(1))
      GO TO 6
8     CONTINUE
      Y(1)%v = X(1)%v
      CALL setderiv(Y(1),X(1))
      GO TO 6
6     CONTINUE
      OpenAD_Symbol_2 = (Y(1)%v*Y(1)%v)
      OpenAD_Symbol_0 = Y(1)%v
      OpenAD_Symbol_1 = Y(1)%v
      Y(1)%v = OpenAD_Symbol_2
      OpenAD_Symbol_3 = OpenAD_Symbol_0
      OpenAD_Symbol_5 = OpenAD_Symbol_1
      CALL setderiv(OpenAD_Symbol_6,Y(1))
      CALL setderiv(OpenAD_Symbol_4,Y(1))
      CALL sax(OpenAD_Symbol_3,OpenAD_Symbol_4,Y(1))
      CALL saxpy(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(1))
      END SUBROUTINE
