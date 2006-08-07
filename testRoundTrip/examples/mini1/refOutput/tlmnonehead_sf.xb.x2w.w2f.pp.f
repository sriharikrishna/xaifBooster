C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 15:54:51 2006
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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      type(active) :: OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
C
C     **** Parameters and Result ****
C
      type(active) :: X
      INTENT(IN)  X
      type(active) :: Y
      INTENT(OUT)  Y
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = (X%v*X%v)
      OpenAD_Symbol_4 = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = X%v
      OpenAD_Symbol_3 = X%v
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      Y%v = OpenAD_Symbol_4
      OpenAD_Symbol_5 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      OpenAD_Symbol_7 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      CALL setderiv(OpenAD_Symbol_6,X)
      CALL sax(OpenAD_Symbol_5,OpenAD_Symbol_6,Y)
      CALL saxpy(OpenAD_Symbol_7,OpenAD_Symbol_6,Y)
      RETURN
      END SUBROUTINE