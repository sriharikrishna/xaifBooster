C ***********************************************************
C Fortran file translated from WHIRL Thu Oct  4 23:46:52 2007
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
      REAL(w2f__8) OpenAD_Symbol_2
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
      PARAMETER ( DEG2RAD = 1.74532925199432954744D-02)
      REAL(w2f__8) PI
      PARAMETER ( PI = 3.141592653589793116D00)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = (X(1)%v*1.74532925199432954744D-02)
      OpenAD_Symbol_4 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = 1.74532925199432954744D-02
      OpenAD_Symbol_1 = (- SIN(OpenAD_Symbol_0))
      Y(1)%v = OpenAD_Symbol_4
      OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      CALL setderiv(OpenAD_Symbol_6,X(1))
      CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y(1))
      END SUBROUTINE
