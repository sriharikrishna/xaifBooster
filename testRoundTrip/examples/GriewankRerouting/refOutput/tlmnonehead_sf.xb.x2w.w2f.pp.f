C ***********************************************************
C Fortran file translated from WHIRL Thu Aug 16 22:10:13 2007
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

      SUBROUTINE ad_reroute(X1, X2, Y1, Y2)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
      REAL(w2f__8) OpenAD_Symbol_14
      REAL(w2f__8) OpenAD_Symbol_15
      REAL(w2f__8) OpenAD_Symbol_16
      type(active) :: OpenAD_Symbol_17
      REAL(w2f__8) OpenAD_Symbol_18
      REAL(w2f__8) OpenAD_Symbol_19
      REAL(w2f__8) OpenAD_Symbol_2
      type(active) :: OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X1
      INTENT(IN)  X1
      type(active) :: X2
      INTENT(IN)  X2
      type(active) :: Y1
      type(active) :: Y2
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
      type(active) :: T3
      type(active) :: T4
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X1)
C$OPENAD INDEPENDENT(X2)
C$OPENAD DEPENDENT(Y1)
C$OPENAD DEPENDENT(Y2)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      T1%v = X1%v
      T2%v = X2%v
      OpenAD_Symbol_2 = (T1%v/T2%v)
      OpenAD_Symbol_0 = (INT(1 _w2f__i8)/T2%v)
      OpenAD_Symbol_1 = (-(T1%v/(T2%v*T2%v)))
      T3%v = OpenAD_Symbol_2
      OpenAD_Symbol_5 = (T1%v*T2%v)
      OpenAD_Symbol_3 = T2%v
      OpenAD_Symbol_4 = T1%v
      T4%v = OpenAD_Symbol_5
      OpenAD_Symbol_8 = (T3%v*T4%v)
      OpenAD_Symbol_6 = T4%v
      OpenAD_Symbol_7 = T3%v
      Y1%v = OpenAD_Symbol_8
      OpenAD_Symbol_11 = (T3%v/T4%v)
      OpenAD_Symbol_9 = (INT(1 _w2f__i8)/T4%v)
      OpenAD_Symbol_10 = (-(T3%v/(T4%v*T4%v)))
      Y2%v = OpenAD_Symbol_11
      OpenAD_Symbol_12 = (OpenAD_Symbol_0 * OpenAD_Symbol_6)
      OpenAD_Symbol_13 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_14 = (OpenAD_Symbol_1 * OpenAD_Symbol_6)
      OpenAD_Symbol_15 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_16 = (OpenAD_Symbol_12 + OpenAD_Symbol_3 *
     >  OpenAD_Symbol_7)
      OpenAD_Symbol_18 = (OpenAD_Symbol_13 + OpenAD_Symbol_3 *
     >  OpenAD_Symbol_10)
      OpenAD_Symbol_19 = (OpenAD_Symbol_14 + OpenAD_Symbol_4 *
     >  OpenAD_Symbol_7)
      OpenAD_Symbol_21 = (OpenAD_Symbol_15 + OpenAD_Symbol_4 *
     >  OpenAD_Symbol_10)
      CALL setderiv(OpenAD_Symbol_20,X2)
      CALL setderiv(OpenAD_Symbol_17,X1)
      CALL sax(OpenAD_Symbol_16,OpenAD_Symbol_17,Y1)
      CALL sax(OpenAD_Symbol_18,OpenAD_Symbol_17,Y2)
      CALL saxpy(OpenAD_Symbol_19,OpenAD_Symbol_20,Y1)
      CALL saxpy(OpenAD_Symbol_21,OpenAD_Symbol_20,Y2)
      RETURN
      END SUBROUTINE
