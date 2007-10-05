C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:12:05 2007
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
      REAL(w2f__8) OpenAD_Symbol_10
      type(active) :: OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      type(active) :: OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      type(active) :: OpenAD_Symbol_9
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
          OpenAD_Symbol_2 = (X(I)%v*X(I)%v)
          OpenAD_Symbol_0 = X(I)%v
          OpenAD_Symbol_1 = X(I)%v
          Y(INT(I))%v = OpenAD_Symbol_2
          OpenAD_Symbol_6 = OpenAD_Symbol_0
          OpenAD_Symbol_8 = OpenAD_Symbol_1
          CALL setderiv(OpenAD_Symbol_9,X(I))
          CALL setderiv(OpenAD_Symbol_7,X(I))
          CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,Y(I))
          CALL saxpy(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(I))
        END DO
      ELSE
        DO I = 1, 2, 1
          OpenAD_Symbol_5 = (X(I)%v*X(I)%v)
          OpenAD_Symbol_3 = X(I)%v
          OpenAD_Symbol_4 = X(I)%v
          Y(INT(I))%v = OpenAD_Symbol_5
          OpenAD_Symbol_10 = OpenAD_Symbol_3
          OpenAD_Symbol_12 = OpenAD_Symbol_4
          CALL setderiv(OpenAD_Symbol_13,X(I))
          CALL setderiv(OpenAD_Symbol_11,X(I))
          CALL sax(OpenAD_Symbol_10,OpenAD_Symbol_11,Y(I))
          CALL saxpy(OpenAD_Symbol_12,OpenAD_Symbol_13,Y(I))
        END DO
      ENDIF
      END SUBROUTINE
