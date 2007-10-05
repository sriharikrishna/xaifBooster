C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:06:44 2007
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
C
C     **** Local Variables and Functions ****
C
      INTEGER(w2f__i4) I
      type(active) :: S
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      I = 1
      Y(1)%v = 0.0D00
      Y(2)%v = 0.0D00
      CALL zero_deriv(Y(1))
      CALL zero_deriv(Y(2))
C$OPENAD XXX Simple loop
      DO I = 1, 2, 1
        S%v = X(I)%v
        CALL setderiv(OpenAD_Symbol_2,X(I))
        CALL setderiv(S,OpenAD_Symbol_2)
        IF (S%v .GT. 0.0D00) THEN
          S%v = 0.0D00
          CALL zero_deriv(S)
        ENDIF
        Y(INT(I))%v = (X(I)%v+S%v)
        OpenAD_Symbol_0 = 1_w2f__i8
        OpenAD_Symbol_1 = 1_w2f__i8
        OpenAD_Symbol_3 = OpenAD_Symbol_0
        OpenAD_Symbol_5 = OpenAD_Symbol_1
        CALL setderiv(OpenAD_Symbol_6,S)
        CALL setderiv(OpenAD_Symbol_4,X(I))
        CALL sax(OpenAD_Symbol_3,OpenAD_Symbol_4,Y(I))
        CALL saxpy(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(I))
      END DO
      END SUBROUTINE
