

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
          Y(INT(I))%v = (X(I)%v*X(I)%v)
          OpenAD_Symbol_0 = X(I)%v
          OpenAD_Symbol_1 = X(I)%v
          CALL sax(OpenAD_Symbol_0,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_1,X(I),Y(I))
        ELSE
          Y(INT(I))%v = (X(I)%v+X(I)%v)
          OpenAD_Symbol_2 = 1_w2f__i8
          OpenAD_Symbol_3 = 1_w2f__i8
          CALL sax(1 _w2f__i8,X(I),Y(I))
          CALL saxpy(1 _w2f__i8,X(I),Y(I))
        ENDIF
        X(INT(I))%v = 0.0
        CALL zero_deriv(X(INT(I)))
      END DO
      END SUBROUTINE
