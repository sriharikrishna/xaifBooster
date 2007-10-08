C ***********************************************************
C Fortran file translated from WHIRL Thu Oct  4 23:46:34 2007
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
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_22
      type(active) :: OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
      type(active) :: T3
      type(active) :: T4
      type(active) :: T5
      type(active) :: T6
      type(active) :: T7
      type(active) :: Y1
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      T1%v = X(1)%v
      T2%v = (T1%v+2.0D00)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_4 = (T2%v*5.0D-01)
      OpenAD_Symbol_2 = 5.0D-01
      T3%v = OpenAD_Symbol_4
      OpenAD_Symbol_7 = (T3%v*2.0D00)
      OpenAD_Symbol_5 = 2.0D00
      T4%v = OpenAD_Symbol_7
      T5%v = (T4%v+4.0D00)
      OpenAD_Symbol_8 = 1_w2f__i8
      T6%v = (T5%v+3.0D00)
      OpenAD_Symbol_10 = 1_w2f__i8
      T7%v = (T6%v+(-9.0D00))
      OpenAD_Symbol_12 = 1_w2f__i8
      OpenAD_Symbol_15 = EXP(T7%v)
      OpenAD_Symbol_14 = EXP(T7%v)
      Y1%v = OpenAD_Symbol_15
      Y(1)%v = Y1%v
      OpenAD_Symbol_16 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_17 = (OpenAD_Symbol_16 * OpenAD_Symbol_5)
      OpenAD_Symbol_18 = (OpenAD_Symbol_17 * OpenAD_Symbol_8)
      OpenAD_Symbol_19 = (OpenAD_Symbol_18 * OpenAD_Symbol_10)
      OpenAD_Symbol_20 = (OpenAD_Symbol_19 * OpenAD_Symbol_12)
      OpenAD_Symbol_21 = (OpenAD_Symbol_20 * OpenAD_Symbol_14)
      OpenAD_Symbol_22 = (OpenAD_Symbol_21 * INT(1_w2f__i8))
      CALL setderiv(OpenAD_Symbol_23,X(1))
      CALL sax(OpenAD_Symbol_22,OpenAD_Symbol_23,Y(1))
      END SUBROUTINE
