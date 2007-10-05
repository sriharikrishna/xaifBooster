C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:07:50 2007
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
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
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
      IF (X(1)%v .LT. 4.0D00) THEN
C$OPENAD XXX Simple loop\t
        DO I = 1, 3, 1
          Y(INT(I))%v = X(I)%v
          CALL setderiv(OpenAD_Symbol_3,X(I))
          CALL setderiv(Y(I),OpenAD_Symbol_3)
        END DO
      ELSE
C$OPENAD XXX Simple loop\t
        DO I = 1, 3, 1
          OpenAD_Symbol_2 = (X(I)%v*2.0D00)
          OpenAD_Symbol_0 = 2.0D00
          Y(INT(I))%v = OpenAD_Symbol_2
          OpenAD_Symbol_4 = OpenAD_Symbol_0
          CALL setderiv(OpenAD_Symbol_5,X(I))
          CALL sax(OpenAD_Symbol_4,OpenAD_Symbol_5,Y(I))
        END DO
      ENDIF
      END SUBROUTINE
