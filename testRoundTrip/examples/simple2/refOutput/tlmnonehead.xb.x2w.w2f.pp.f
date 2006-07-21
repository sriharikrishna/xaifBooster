C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 16:17:25 2006
C ***********************************************************
C ***********************************************************


      SUBROUTINE head(X1, X2, Y1, Y2)
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
      REAL(w2f__8) OpenAD_Symbol_20
      REAL(w2f__8) OpenAD_Symbol_21
      type(active) :: OpenAD_Symbol_22
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
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
      type(active) :: X2
      type(active) :: Y1
      type(active) :: Y2
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
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
      OpenAD_Symbol_2 = (X1%v*X2%v)
      OpenAD_Symbol_0 = X2%v
      OpenAD_Symbol_1 = X1%v
      T1%v = OpenAD_Symbol_2
      OpenAD_Symbol_3 = SIN(T1%v)
      OpenAD_Symbol_7 = (X1%v*OpenAD_Symbol_3)
      OpenAD_Symbol_4 = OpenAD_Symbol_3
      OpenAD_Symbol_6 = COS(T1%v)
      OpenAD_Symbol_5 = X1%v
      T2%v = OpenAD_Symbol_7
      OpenAD_Symbol_9 = COS(T2%v)
      OpenAD_Symbol_8 = (-SIN(T2%v))
      Y1%v = OpenAD_Symbol_9
      OpenAD_Symbol_12 = (X2%v*T2%v)
      OpenAD_Symbol_10 = T2%v
      OpenAD_Symbol_11 = X2%v
      Y2%v = OpenAD_Symbol_12
      OpenAD_Symbol_13 = (OpenAD_Symbol_6 * OpenAD_Symbol_5)
      OpenAD_Symbol_14 = (OpenAD_Symbol_0 * OpenAD_Symbol_13)
      OpenAD_Symbol_15 = (OpenAD_Symbol_1 * OpenAD_Symbol_13)
      OpenAD_Symbol_16 = (OpenAD_Symbol_4 * OpenAD_Symbol_8)
      OpenAD_Symbol_18 = (OpenAD_Symbol_4 * OpenAD_Symbol_11)
      OpenAD_Symbol_19 = (OpenAD_Symbol_14 * OpenAD_Symbol_8)
      OpenAD_Symbol_20 = (OpenAD_Symbol_14 * OpenAD_Symbol_11)
      OpenAD_Symbol_21 = (OpenAD_Symbol_15 * OpenAD_Symbol_8)
      OpenAD_Symbol_23 = (OpenAD_Symbol_15 * OpenAD_Symbol_11)
      OpenAD_Symbol_24 = OpenAD_Symbol_10
      CALL setderiv(OpenAD_Symbol_22,X2)
      CALL setderiv(OpenAD_Symbol_17,X1)
      CALL sax(OpenAD_Symbol_16,OpenAD_Symbol_17,Y1)
      CALL sax(OpenAD_Symbol_18,OpenAD_Symbol_17,Y2)
      CALL saxpy(OpenAD_Symbol_19,OpenAD_Symbol_17,Y1)
      CALL saxpy(OpenAD_Symbol_20,OpenAD_Symbol_17,Y2)
      CALL saxpy(OpenAD_Symbol_21,OpenAD_Symbol_22,Y1)
      CALL saxpy(OpenAD_Symbol_23,OpenAD_Symbol_22,Y2)
      CALL saxpy(OpenAD_Symbol_24,OpenAD_Symbol_22,Y2)
      RETURN
      END SUBROUTINE
