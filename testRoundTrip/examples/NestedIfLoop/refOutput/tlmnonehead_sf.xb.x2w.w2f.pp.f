
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      INTENT(IN)  X
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
      IF (X(1)%v .LT. X(2)%v) THEN
        DO I = 1, 2, 1
          Y(INT(I))%v = (X(I)%v*X(I)%v)
          OpenAD_Symbol_0 = X(I)%v
          OpenAD_Symbol_1 = X(I)%v
          OpenAD_Symbol_4 = OpenAD_Symbol_0
          OpenAD_Symbol_5 = OpenAD_Symbol_1
          CALL sax(OpenAD_Symbol_4,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_5,X(I),Y(I))
        END DO
      ELSE
        DO I = 1, 2, 1
          Y(INT(I))%v = (X(I)%v*X(I)%v)
          OpenAD_Symbol_2 = X(I)%v
          OpenAD_Symbol_3 = X(I)%v
          OpenAD_Symbol_6 = OpenAD_Symbol_2
          OpenAD_Symbol_7 = OpenAD_Symbol_3
          CALL sax(OpenAD_Symbol_6,X(I),Y(I))
          CALL saxpy(OpenAD_Symbol_7,X(I),Y(I))
        END DO
      ENDIF
      END SUBROUTINE
