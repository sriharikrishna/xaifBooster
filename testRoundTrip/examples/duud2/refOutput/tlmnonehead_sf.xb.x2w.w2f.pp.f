C ***********************************************************
C Fortran file translated from WHIRL Fri Oct  5 00:01:08 2007
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
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      type(active) :: LOCALX(1 : 1)
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
      LOCALX(1)%v = OpenAD_Symbol_2
      OpenAD_Symbol_6 = OpenAD_Symbol_0
      CALL setderiv(OpenAD_Symbol_7,X(1))
      CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,LOCALX(1))
      OpenAD_Symbol_5 = (LOCALX(1)%v*LOCALX(1)%v)
      OpenAD_Symbol_3 = LOCALX(1)%v
      OpenAD_Symbol_4 = LOCALX(1)%v
      Y(1)%v = OpenAD_Symbol_5
      OpenAD_Symbol_8 = OpenAD_Symbol_3
      OpenAD_Symbol_10 = OpenAD_Symbol_4
      CALL setderiv(OpenAD_Symbol_11,LOCALX(1))
      CALL setderiv(OpenAD_Symbol_9,LOCALX(1))
      CALL sax(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(1))
      CALL saxpy(OpenAD_Symbol_10,OpenAD_Symbol_11,Y(1))
      END SUBROUTINE
