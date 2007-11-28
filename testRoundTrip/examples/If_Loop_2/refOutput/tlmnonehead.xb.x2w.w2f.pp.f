

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
      REAL(w2f__8) OpenAD_Symbol_13
      type(active) :: OpenAD_Symbol_14
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
      type(active) :: X(1 : 1)
      INTENT(IN)  X
      type(active) :: Y(1 : 1)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      INTEGER(w2f__i4) J
      INTEGER(w2f__i4) K
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      DO I = 1, 1, 1
        Y(1)%v = X(1)%v
        CALL setderiv(OpenAD_Symbol_6,X(1))
        CALL setderiv(Y(1),OpenAD_Symbol_6)
        IF (Y(1)%v .GT. 0.0D00) THEN
          DO J = 1, 3, 1
            DO K = 1, 3, 1
              IF (X(1)%v .GT. 0.0D00) THEN
                OpenAD_Symbol_2 = (X(1)%v*Y(1)%v)
                OpenAD_Symbol_0 = Y(1)%v
                OpenAD_Symbol_1 = X(1)%v
                Y(1)%v = OpenAD_Symbol_2
                OpenAD_Symbol_7 = OpenAD_Symbol_0
                OpenAD_Symbol_9 = OpenAD_Symbol_1
                CALL setderiv(OpenAD_Symbol_10,Y(1))
                CALL setderiv(OpenAD_Symbol_8,X(1))
                CALL sax(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(1))
                CALL saxpy(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(1))
              ENDIF
            END DO
          END DO
        ELSE
          OpenAD_Symbol_5 = (Y(1)%v/X(1)%v)
          OpenAD_Symbol_3 = (INT(1 _w2f__i8)/X(1)%v)
          OpenAD_Symbol_4 = (-(Y(1)%v/(X(1)%v*X(1)%v)))
          Y(1)%v = OpenAD_Symbol_5
          OpenAD_Symbol_11 = OpenAD_Symbol_3
          OpenAD_Symbol_13 = OpenAD_Symbol_4
          CALL setderiv(OpenAD_Symbol_14,X(1))
          CALL setderiv(OpenAD_Symbol_12,Y(1))
          CALL sax(OpenAD_Symbol_11,OpenAD_Symbol_12,Y(1))
          CALL saxpy(OpenAD_Symbol_13,OpenAD_Symbol_14,Y(1))
        ENDIF
      END DO
      END SUBROUTINE
