C ***********************************************************
C Fortran file translated from WHIRL Wed Aug  1 10:15:06 2007
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
      REAL(w2f__8) OpenAD_Symbol_10
      type(active) :: OpenAD_Symbol_11
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
      type(active) :: Y(1 : 1)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (X(1)%v*2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      X(1)%v = OpenAD_Symbol_2
      OpenAD_Symbol_6 = OpenAD_Symbol_0
      CALL setderiv(OpenAD_Symbol_7,X(1))
      CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,X(1))
      OpenAD_Symbol_5 = (X(1)%v*X(2)%v)
      OpenAD_Symbol_3 = X(2)%v
      OpenAD_Symbol_4 = X(1)%v
      Y(1)%v = OpenAD_Symbol_5
      OpenAD_Symbol_8 = OpenAD_Symbol_3
      OpenAD_Symbol_10 = OpenAD_Symbol_4
      CALL setderiv(OpenAD_Symbol_11,X(2))
      CALL setderiv(OpenAD_Symbol_9,X(1))
      CALL sax(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(1))
      CALL saxpy(OpenAD_Symbol_10,OpenAD_Symbol_11,Y(1))
      RETURN
      END SUBROUTINE
