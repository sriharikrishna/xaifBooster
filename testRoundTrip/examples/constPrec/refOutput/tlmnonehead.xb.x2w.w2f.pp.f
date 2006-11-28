C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:39:11 2006
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
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) DEG2RAD
      PARAMETER ( DEG2RAD =   0.01745329251994330)
      REAL(w2f__8) PI
      PARAMETER ( PI =     3.141592653589793)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = (1.74532925199432954744D-02*X(1)%v)
      OpenAD_Symbol_4 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_3 = 1.74532925199432954744D-02
      OpenAD_Symbol_1 = (- SIN(OpenAD_Symbol_0))
      Y(1)%v = OpenAD_Symbol_4
      OpenAD_Symbol_5 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      CALL setderiv(OpenAD_Symbol_6,X(1))
      CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(1))
      RETURN
      END SUBROUTINE
