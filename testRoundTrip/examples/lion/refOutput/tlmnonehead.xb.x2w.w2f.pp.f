

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
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
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
      T1%v = (X(1)%v/X(2)%v)
      OpenAD_Symbol_0 = (INT(1 _w2f__i8)/X(2)%v)
      OpenAD_Symbol_1 = (-(X(1)%v/(X(2)%v*X(2)%v)))
      T2%v = COS(T1%v)
      OpenAD_Symbol_2 = (-SIN(T1%v))
      Y1%v = EXP(T2%v)
      OpenAD_Symbol_3 = EXP(T2%v)
      Y2%v = (T2%v*3.14000010490417480469D00)
      OpenAD_Symbol_4 = 3.14000010490417480469D00
      Y3%v = SIN(T2%v)
      OpenAD_Symbol_6 = COS(T2%v)
      Y4%v = (T1%v*T2%v)
      OpenAD_Symbol_7 = T2%v
      OpenAD_Symbol_8 = T1%v
      Y(1)%v = Y1%v
      OpenAD_Symbol_9 = (OpenAD_Symbol_2 * 3.14000010490417480469D00)
      OpenAD_Symbol_10 = (OpenAD_Symbol_2 * OpenAD_Symbol_6)
      OpenAD_Symbol_11 = (OpenAD_Symbol_7 + OpenAD_Symbol_2 *
     >  OpenAD_Symbol_8)
      OpenAD_Symbol_12 = (OpenAD_Symbol_2 * OpenAD_Symbol_3)
      OpenAD_Symbol_13 = (OpenAD_Symbol_0 * OpenAD_Symbol_11)
      OpenAD_Symbol_14 = (OpenAD_Symbol_0 * OpenAD_Symbol_9)
      OpenAD_Symbol_15 = (OpenAD_Symbol_0 * OpenAD_Symbol_10)
      OpenAD_Symbol_16 = (OpenAD_Symbol_0 * OpenAD_Symbol_12)
      OpenAD_Symbol_17 = (OpenAD_Symbol_1 * OpenAD_Symbol_11)
      OpenAD_Symbol_18 = (OpenAD_Symbol_1 * OpenAD_Symbol_9)
      OpenAD_Symbol_19 = (OpenAD_Symbol_1 * OpenAD_Symbol_10)
      OpenAD_Symbol_20 = (OpenAD_Symbol_1 * OpenAD_Symbol_12)
      CALL sax(OpenAD_Symbol_14,X(1),Y2)
      CALL saxpy(OpenAD_Symbol_18,X(2),Y2)
      CALL sax(OpenAD_Symbol_15,X(1),Y3)
      CALL saxpy(OpenAD_Symbol_19,X(2),Y3)
      CALL sax(OpenAD_Symbol_13,X(1),Y4)
      CALL saxpy(OpenAD_Symbol_17,X(2),Y4)
      CALL sax(OpenAD_Symbol_16,X(1),Y(1))
      CALL saxpy(OpenAD_Symbol_20,X(2),Y(1))
      Y(2)%v = Y2%v
      CALL setderiv(Y(2),Y2)
      Y(3)%v = Y3%v
      CALL setderiv(Y(3),Y3)
      Y(4)%v = Y4%v
      CALL setderiv(Y(4),Y4)
      END SUBROUTINE
