C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:58:07 2006
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
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
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
      OpenAD_Symbol_0 = FLOAT(INT(6_w2f__i8))
      OpenAD_Symbol_3 = (OpenAD_Symbol_0*X(1)%v)
      OpenAD_Symbol_2 = OpenAD_Symbol_0
      Y(1)%v = OpenAD_Symbol_3
      OpenAD_Symbol_4 = OpenAD_Symbol_2
      CALL setderiv(OpenAD_Symbol_5,X(1))
      CALL sax(OpenAD_Symbol_4,OpenAD_Symbol_5,Y(1))
      RETURN
      END SUBROUTINE