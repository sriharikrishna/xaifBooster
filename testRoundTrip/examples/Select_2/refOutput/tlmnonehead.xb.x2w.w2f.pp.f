

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
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 3)
      INTENT(IN)  X
      type(active) :: Y(1 : 3)
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
      DO I = 1, 3, 1
        IF ( I  .EQ.  1)  GO TO  19
        IF ( I  .EQ.  2)  GO TO  23
        GO TO 24
24      CONTINUE
        Y(INT(I))%v = (X(I)%v*2.0D00)
        OpenAD_Symbol_4 = 2.0D00
        CALL sax(2.0D00,X(I),Y(I))
        GO TO 21
19      CONTINUE
        OpenAD_Symbol_1 = SIN(X(I)%v)
        OpenAD_Symbol_0 = COS(X(I)%v)
        Y(INT(I))%v = OpenAD_Symbol_1
        CALL setderiv(OpenAD_Symbol_6,X(I))
        CALL sax(OpenAD_Symbol_0,OpenAD_Symbol_6,Y(I))
        GO TO 21
23      CONTINUE
        OpenAD_Symbol_3 = COS(X(I)%v)
        OpenAD_Symbol_2 = (-SIN(X(I)%v))
        Y(INT(I))%v = OpenAD_Symbol_3
        CALL setderiv(OpenAD_Symbol_7,X(I))
        CALL sax(OpenAD_Symbol_2,OpenAD_Symbol_7,Y(I))
        GO TO 21
21      CONTINUE
      END DO
      END SUBROUTINE
