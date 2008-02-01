
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
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
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
      IF (Y(1)%v .GT. 0.0D00) THEN
        DO I = 1, 3, 1
          OpenAD_Symbol_2 = (X(1)%v*Y(1)%v)
          OpenAD_Symbol_0 = Y(1)%v
          OpenAD_Symbol_1 = X(1)%v
          Y(1)%v = OpenAD_Symbol_2
          OpenAD_Symbol_6 = OpenAD_Symbol_0
          OpenAD_Symbol_7 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_8,Y(1))
          CALL sax(OpenAD_Symbol_6,X(1),Y(1))
          CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(1))
        END DO
      ELSE
        OpenAD_Symbol_5 = (Y(1)%v/X(1)%v)
        OpenAD_Symbol_3 = (INT(1 _w2f__i8)/X(1)%v)
        OpenAD_Symbol_4 = (-(Y(1)%v/(X(1)%v*X(1)%v)))
        Y(1)%v = OpenAD_Symbol_5
        OpenAD_Symbol_9 = OpenAD_Symbol_3
        OpenAD_Symbol_11 = OpenAD_Symbol_4
        CALL setderiv(OpenAD_Symbol_10,Y(1))
        CALL sax(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(1))
        CALL saxpy(OpenAD_Symbol_11,X(1),Y(1))
      ENDIF
      END SUBROUTINE
