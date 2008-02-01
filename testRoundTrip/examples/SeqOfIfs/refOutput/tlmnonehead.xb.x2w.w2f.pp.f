

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
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      INTENT(IN)  X
      type(active) :: Y(1 : 2)
      INTENT(OUT)  Y
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      IF (X(1)%v .LE. X(2)%v) THEN
        Y(1)%v = (X(2)%v-X(1)%v)
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_1 = (-1_w2f__i8)
        OpenAD_Symbol_4 = OpenAD_Symbol_0
        OpenAD_Symbol_5 = OpenAD_Symbol_1
        CALL sax(OpenAD_Symbol_4,X(2),Y(1))
        CALL saxpy(OpenAD_Symbol_5,X(1),Y(1))
      ELSE
        Y(1)%v = (X(1)%v-X(2)%v)
        OpenAD_Symbol_2 = 1_w2f__i8
        OpenAD_Symbol_3 = (-1_w2f__i8)
        OpenAD_Symbol_7 = OpenAD_Symbol_2
        OpenAD_Symbol_8 = OpenAD_Symbol_3
        CALL sax(OpenAD_Symbol_7,X(1),Y(1))
        CALL saxpy(OpenAD_Symbol_8,X(2),Y(1))
      ENDIF
      IF (Y(1)%v .eq. 0.0D00) THEN
        Y(2)%v = X(1)%v
        CALL setderiv(Y(2),X(1))
      ELSE
        Y(2)%v = Y(1)%v
        CALL setderiv(OpenAD_Symbol_6,Y(1))
        CALL setderiv(Y(2),OpenAD_Symbol_6)
      ENDIF
      END SUBROUTINE
