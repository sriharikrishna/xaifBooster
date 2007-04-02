C ***********************************************************
C Fortran file translated from WHIRL Mon Apr  2 13:28:25 2007
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
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      type(active) :: OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
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
      DO I = 1, 3, 1
        select_expr_temp_0 = I
        IF ( I  .EQ.  1)  GO TO  19
        IF ( I  .EQ.  2)  GO TO  23
        GO TO 24
24      CONTINUE
        OpenAD_Symbol_6 = (X(I)%v*2.0D00)
        OpenAD_Symbol_4 = 2.0D00
        Y(INT(I))%v = OpenAD_Symbol_6
        OpenAD_Symbol_11 = OpenAD_Symbol_4
        CALL setderiv(OpenAD_Symbol_12,X(I))
        CALL sax(OpenAD_Symbol_11,OpenAD_Symbol_12,Y(I))
        GO TO 21
19      CONTINUE
        OpenAD_Symbol_1 = SIN(X(I)%v)
        OpenAD_Symbol_0 = COS(X(I)%v)
        Y(INT(I))%v = OpenAD_Symbol_1
        OpenAD_Symbol_7 = OpenAD_Symbol_0
        CALL setderiv(OpenAD_Symbol_8,X(I))
        CALL sax(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(I))
        GO TO 21
23      CONTINUE
        OpenAD_Symbol_3 = COS(X(I)%v)
        OpenAD_Symbol_2 = (-SIN(X(I)%v))
        Y(INT(I))%v = OpenAD_Symbol_3
        OpenAD_Symbol_9 = OpenAD_Symbol_2
        CALL setderiv(OpenAD_Symbol_10,X(I))
        CALL sax(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(I))
        GO TO 21
21      CONTINUE
      END DO
      RETURN
      END SUBROUTINE
