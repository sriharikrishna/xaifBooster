

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
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
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y(1)%v = X(1)%v
      CALL setderiv(Y(1),X(1))
C$OPENAD XXX Simple loop
      DO I = 2, 6, 1
        OpenAD_Symbol_0 = (X(1)%v*Y(1)%v)
        OpenAD_Symbol_5 = (I * OpenAD_Symbol_0)
        OpenAD_Symbol_3 = Y(1)%v
        OpenAD_Symbol_4 = X(1)%v
        OpenAD_Symbol_2 = I
        Y(1)%v = OpenAD_Symbol_5
        OpenAD_Symbol_6 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
        OpenAD_Symbol_7 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
        CALL setderiv(OpenAD_Symbol_8,Y(1))
        CALL sax(OpenAD_Symbol_6,X(1),Y(1))
        CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(1))
      END DO
      CALL setderiv(OpenAD_Symbol_9,Y(1))
      CALL setderiv(Y(1),OpenAD_Symbol_9)
      END SUBROUTINE
