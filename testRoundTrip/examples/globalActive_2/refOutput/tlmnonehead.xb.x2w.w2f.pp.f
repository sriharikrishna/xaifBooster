C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:58:15 2006
C ***********************************************************
C ***********************************************************


      MODULE globals
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Global Variables & Derived Type Definitions ****
C
      type(active) :: AGLOBAL
      REAL(w2f__8) APASSIVEGLOBAL
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      use globals
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
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
      APASSIVEGLOBAL = 2.0D00
      OpenAD_Symbol_2 = (X(1)%v*X(2)%v)
      OpenAD_Symbol_0 = X(2)%v
      OpenAD_Symbol_1 = X(1)%v
      AGLOBAL%v = OpenAD_Symbol_2
      OpenAD_Symbol_5 = (AGLOBAL%v*APASSIVEGLOBAL)
      OpenAD_Symbol_3 = APASSIVEGLOBAL
      Y(1)%v = OpenAD_Symbol_5
      OpenAD_Symbol_6 = (OpenAD_Symbol_0 * OpenAD_Symbol_3)
      OpenAD_Symbol_8 = (OpenAD_Symbol_1 * OpenAD_Symbol_3)
      OpenAD_Symbol_10 = OpenAD_Symbol_0
      OpenAD_Symbol_11 = OpenAD_Symbol_1
      CALL setderiv(OpenAD_Symbol_9,X(2))
      CALL setderiv(OpenAD_Symbol_7,X(1))
      CALL sax(OpenAD_Symbol_6,OpenAD_Symbol_7,Y(1))
      CALL saxpy(OpenAD_Symbol_8,OpenAD_Symbol_9,Y(1))
      CALL sax(OpenAD_Symbol_10,OpenAD_Symbol_7,AGLOBAL)
      CALL saxpy(OpenAD_Symbol_11,OpenAD_Symbol_9,AGLOBAL)
      RETURN
      END SUBROUTINE
