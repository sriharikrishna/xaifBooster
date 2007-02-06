C ***********************************************************
C Fortran file translated from WHIRL Tue Nov 28 15:40:08 2006
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

      SUBROUTINE foo()
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      RETURN
      END SUBROUTINE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      type(active) :: OpenAD_Symbol_5
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      type(active) :: T
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      T%v = X(1)%v
      CALL setderiv(OpenAD_Symbol_3,X(1))
      CALL setderiv(T,OpenAD_Symbol_3)
      CALL foo()
      OpenAD_Symbol_2 = (2.0D00*T%v)
      OpenAD_Symbol_1 = 2.0D00
      Y%v = OpenAD_Symbol_2
      OpenAD_Symbol_4 = OpenAD_Symbol_1
      CALL setderiv(OpenAD_Symbol_5,T)
      CALL sax(OpenAD_Symbol_4,OpenAD_Symbol_5,Y)
      RETURN
      END SUBROUTINE
