C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 14:57:47 2006
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
      REAL(w2f__8) OpenAD_Symbol_0
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      type(active) :: OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      type(active) :: OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
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
      type(active) :: T2
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
      OpenAD_Symbol_2 = (T%v*2.0D00)
      OpenAD_Symbol_0 = 2.0D00
      T2%v = OpenAD_Symbol_2
      OpenAD_Symbol_11 = OpenAD_Symbol_0
      CALL setderiv(OpenAD_Symbol_10,X(1))
      CALL setderiv(T,OpenAD_Symbol_10)
      CALL sax(OpenAD_Symbol_11,OpenAD_Symbol_10,T2)
      CALL foo()
      OpenAD_Symbol_9 = (T2%v*3.0D00+T%v*2.0D00)
      OpenAD_Symbol_5 = 3.0D00
      OpenAD_Symbol_3 = 1_w2f__i8
      OpenAD_Symbol_7 = 2.0D00
      OpenAD_Symbol_4 = 1_w2f__i8
      Y%v = OpenAD_Symbol_9
      OpenAD_Symbol_12 = (OpenAD_Symbol_5 * OpenAD_Symbol_3)
      OpenAD_Symbol_14 = (OpenAD_Symbol_7 * OpenAD_Symbol_4)
      CALL setderiv(OpenAD_Symbol_15,T)
      CALL setderiv(OpenAD_Symbol_13,T2)
      CALL sax(OpenAD_Symbol_12,OpenAD_Symbol_13,Y)
      CALL saxpy(OpenAD_Symbol_14,OpenAD_Symbol_15,Y)
      RETURN
      END SUBROUTINE
