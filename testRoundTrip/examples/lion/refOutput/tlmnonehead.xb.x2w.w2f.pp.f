C ***********************************************************
C Fortran file translated from WHIRL Thu Jul 20 15:43:51 2006
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
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_13
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
      REAL(w2f__8) OpenAD_Symbol_23
      REAL(w2f__8) OpenAD_Symbol_24
      type(active) :: OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      type(active) :: OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
      type(active) :: Y1
      type(active) :: Y2
      type(active) :: Y3
      type(active) :: Y4
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (X(1)%v/X(2)%v)
      OpenAD_Symbol_0 = (INT(1 _w2f__i8)/X(2)%v)
      OpenAD_Symbol_1 = (-(X(1)%v/(X(2)%v*X(2)%v)))
      T1%v = OpenAD_Symbol_2
      OpenAD_Symbol_4 = COS(T1%v)
      OpenAD_Symbol_3 = (-SIN(T1%v))
      T2%v = OpenAD_Symbol_4
      OpenAD_Symbol_6 = EXP(T2%v)
      OpenAD_Symbol_5 = EXP(T2%v)
      Y1%v = OpenAD_Symbol_6
      OpenAD_Symbol_9 = (T2%v*3.14000010490417480469D00)
      OpenAD_Symbol_7 = 3.14000010490417480469D00
      Y2%v = OpenAD_Symbol_9
      OpenAD_Symbol_11 = SIN(T2%v)
      OpenAD_Symbol_10 = COS(T2%v)
      Y3%v = OpenAD_Symbol_11
      OpenAD_Symbol_14 = (T1%v*T2%v)
      OpenAD_Symbol_12 = T2%v
      OpenAD_Symbol_13 = T1%v
      Y4%v = OpenAD_Symbol_14
      Y(1)%v = Y1%v
      Y(2)%v = Y2%v
      Y(3)%v = Y3%v
      Y(4)%v = Y4%v
      OpenAD_Symbol_15 = (OpenAD_Symbol_12 * INT(1_w2f__i8))
      OpenAD_Symbol_16 = (OpenAD_Symbol_13 * INT(1_w2f__i8))
      OpenAD_Symbol_17 = (OpenAD_Symbol_10 * INT(1_w2f__i8))
      OpenAD_Symbol_18 = (OpenAD_Symbol_7 * INT(1_w2f__i8))
      OpenAD_Symbol_19 = (OpenAD_Symbol_5 * INT(1_w2f__i8))
      OpenAD_Symbol_20 = (OpenAD_Symbol_15 + OpenAD_Symbol_3 *
     >  OpenAD_Symbol_16)
      OpenAD_Symbol_21 = (OpenAD_Symbol_3 * OpenAD_Symbol_17)
      OpenAD_Symbol_22 = (OpenAD_Symbol_3 * OpenAD_Symbol_18)
      OpenAD_Symbol_23 = (OpenAD_Symbol_3 * OpenAD_Symbol_19)
      OpenAD_Symbol_24 = (OpenAD_Symbol_0 * OpenAD_Symbol_20)
      OpenAD_Symbol_26 = (OpenAD_Symbol_0 * OpenAD_Symbol_21)
      OpenAD_Symbol_27 = (OpenAD_Symbol_0 * OpenAD_Symbol_22)
      OpenAD_Symbol_28 = (OpenAD_Symbol_0 * OpenAD_Symbol_23)
      OpenAD_Symbol_29 = (OpenAD_Symbol_1 * OpenAD_Symbol_20)
      OpenAD_Symbol_31 = (OpenAD_Symbol_1 * OpenAD_Symbol_21)
      OpenAD_Symbol_32 = (OpenAD_Symbol_1 * OpenAD_Symbol_22)
      OpenAD_Symbol_33 = (OpenAD_Symbol_1 * OpenAD_Symbol_23)
      CALL setderiv(OpenAD_Symbol_30,X(2))
      CALL setderiv(OpenAD_Symbol_25,X(1))
      CALL sax(OpenAD_Symbol_24,OpenAD_Symbol_25,Y(4))
      CALL sax(OpenAD_Symbol_26,OpenAD_Symbol_25,Y(3))
      CALL sax(OpenAD_Symbol_27,OpenAD_Symbol_25,Y(2))
      CALL sax(OpenAD_Symbol_28,OpenAD_Symbol_25,Y(1))
      CALL saxpy(OpenAD_Symbol_29,OpenAD_Symbol_30,Y(4))
      CALL saxpy(OpenAD_Symbol_31,OpenAD_Symbol_30,Y(3))
      CALL saxpy(OpenAD_Symbol_32,OpenAD_Symbol_30,Y(2))
      CALL saxpy(OpenAD_Symbol_33,OpenAD_Symbol_30,Y(1))
      RETURN
      END SUBROUTINE
