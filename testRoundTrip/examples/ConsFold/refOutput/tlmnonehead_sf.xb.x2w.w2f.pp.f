
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
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      REAL(w2f__8) OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
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
      T3%v = (T2%v*5.0D-01)
      OpenAD_Symbol_2 = 5.0D-01
      T4%v = (T3%v*2.0D00)
      OpenAD_Symbol_4 = 2.0D00
      T5%v = (T4%v+4.0D00)
      OpenAD_Symbol_6 = 1_w2f__i8
      T6%v = (T5%v+3.0D00)
      OpenAD_Symbol_8 = 1_w2f__i8
      T7%v = (T6%v+(-9.0D00))
      OpenAD_Symbol_10 = 1_w2f__i8
      Y1%v = EXP(T7%v)
      OpenAD_Symbol_12 = EXP(T7%v)
      Y(1)%v = Y1%v
      OpenAD_Symbol_13 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_14 = (OpenAD_Symbol_13 * OpenAD_Symbol_4)
      OpenAD_Symbol_15 = (OpenAD_Symbol_14 * OpenAD_Symbol_6)
      OpenAD_Symbol_16 = (OpenAD_Symbol_15 * OpenAD_Symbol_8)
      OpenAD_Symbol_17 = (OpenAD_Symbol_16 * OpenAD_Symbol_10)
      OpenAD_Symbol_18 = (OpenAD_Symbol_17 * OpenAD_Symbol_12)
      OpenAD_Symbol_19 = (OpenAD_Symbol_18 * INT(1_w2f__i8))
      CALL sax(OpenAD_Symbol_19,X(1),Y(1))
      END SUBROUTINE
