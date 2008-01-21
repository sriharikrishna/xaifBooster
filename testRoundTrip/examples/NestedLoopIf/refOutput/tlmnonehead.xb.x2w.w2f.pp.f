

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
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
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
      DO I = 1, 2, 1
        IF(I .eq. 1) THEN
          OpenAD_Symbol_2 = (X(I)%v*X(I)%v)
          OpenAD_Symbol_0 = X(I)%v
          OpenAD_Symbol_1 = X(I)%v
          Y(INT(I))%v = OpenAD_Symbol_2
          OpenAD_Symbol_5 = OpenAD_Symbol_0
          OpenAD_Symbol_7 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_8,X(I))
          CALL setderiv(OpenAD_Symbol_6,X(I))
          CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(I))
          CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(I))
        ELSE
          Y(INT(I))%v = (X(I)%v+X(I)%v)
          OpenAD_Symbol_3 = 1_w2f__i8
          OpenAD_Symbol_4 = 1_w2f__i8
          OpenAD_Symbol_9 = OpenAD_Symbol_3
          OpenAD_Symbol_11 = OpenAD_Symbol_4
          CALL setderiv(OpenAD_Symbol_12,X(I))
          CALL setderiv(OpenAD_Symbol_10,X(I))
          CALL sax(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(I))
          CALL saxpy(OpenAD_Symbol_11,OpenAD_Symbol_12,Y(I))
        ENDIF
        X(INT(I))%v = 0.0
        CALL zero_deriv(X(INT(I)))
      END DO
      END SUBROUTINE
