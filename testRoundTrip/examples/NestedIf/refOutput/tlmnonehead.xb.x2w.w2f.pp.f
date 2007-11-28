

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
      type(active) :: OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      type(active) :: OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      type(active) :: OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      type(active) :: OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
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
        IF (X(1)%v .eq. X(2)%v) THEN
          OpenAD_Symbol_2 = (X(1)%v*X(1)%v)
          OpenAD_Symbol_0 = X(1)%v
          OpenAD_Symbol_1 = X(1)%v
          Y(1)%v = OpenAD_Symbol_2
          OpenAD_Symbol_7 = OpenAD_Symbol_0
          OpenAD_Symbol_9 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_10,X(1))
          CALL setderiv(OpenAD_Symbol_8,X(1))
          CALL sax(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(1))
          CALL saxpy(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(1))
        ELSE
          Y(1)%v = (X(2)%v-X(1)%v)
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = (-1_w2f__i8)
          OpenAD_Symbol_12 = OpenAD_Symbol_3
          OpenAD_Symbol_14 = OpenAD_Symbol_4
          CALL setderiv(OpenAD_Symbol_15,X(1))
          CALL setderiv(OpenAD_Symbol_13,X(2))
          CALL sax(OpenAD_Symbol_12,OpenAD_Symbol_13,Y(1))
          CALL saxpy(OpenAD_Symbol_14,OpenAD_Symbol_15,Y(1))
        ENDIF
      ELSE
        Y(1)%v = (X(1)%v-X(2)%v)
        OpenAD_Symbol_5 = 1_w2f__i8
        OpenAD_Symbol_6 = (-1_w2f__i8)
        OpenAD_Symbol_16 = OpenAD_Symbol_5
        OpenAD_Symbol_18 = OpenAD_Symbol_6
        CALL setderiv(OpenAD_Symbol_19,X(2))
        CALL setderiv(OpenAD_Symbol_17,X(1))
        CALL sax(OpenAD_Symbol_16,OpenAD_Symbol_17,Y(1))
        CALL saxpy(OpenAD_Symbol_18,OpenAD_Symbol_19,Y(1))
      ENDIF
      Y(2)%v = Y(1)%v
      CALL setderiv(OpenAD_Symbol_11,Y(1))
      CALL setderiv(Y(2),OpenAD_Symbol_11)
      END SUBROUTINE
