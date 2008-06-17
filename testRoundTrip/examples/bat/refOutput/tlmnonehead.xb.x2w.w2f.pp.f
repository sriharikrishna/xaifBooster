

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
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 4)
      type(active) :: Y(1 : 4)
C
C     **** Local Variables and Functions ****
C
      type(active) :: T1
      type(active) :: T2
      type(active) :: T3
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
      T2%v = (X(3)%v*X(4)%v)
      OpenAD_Symbol_2 = X(4)%v
      OpenAD_Symbol_3 = X(3)%v
      T3%v = (T1%v*T2%v)
      OpenAD_Symbol_4 = T2%v
      OpenAD_Symbol_5 = T1%v
      Y(1)%v = (T1%v*T3%v)
      OpenAD_Symbol_6 = T3%v
      OpenAD_Symbol_7 = T1%v
      OpenAD_Symbol_13 = (OpenAD_Symbol_2 * OpenAD_Symbol_5)
      OpenAD_Symbol_14 = (OpenAD_Symbol_3 * OpenAD_Symbol_5)
      OpenAD_Symbol_15 = (OpenAD_Symbol_6 + OpenAD_Symbol_4 *
     >  OpenAD_Symbol_7)
      OpenAD_Symbol_16 = (OpenAD_Symbol_13 * OpenAD_Symbol_7)
      OpenAD_Symbol_17 = (OpenAD_Symbol_14 * OpenAD_Symbol_7)
      OpenAD_Symbol_18 = (OpenAD_Symbol_0 * OpenAD_Symbol_4)
      OpenAD_Symbol_19 = (OpenAD_Symbol_0 * OpenAD_Symbol_15)
      OpenAD_Symbol_20 = (OpenAD_Symbol_1 * OpenAD_Symbol_4)
      OpenAD_Symbol_21 = (OpenAD_Symbol_1 * OpenAD_Symbol_15)
      CALL sax(OpenAD_Symbol_2,X(3),T2)
      CALL saxpy(OpenAD_Symbol_3,X(4),T2)
      CALL sax(OpenAD_Symbol_13,X(3),T3)
      CALL saxpy(OpenAD_Symbol_14,X(4),T3)
      CALL saxpy(OpenAD_Symbol_18,X(1),T3)
      CALL saxpy(OpenAD_Symbol_20,X(2),T3)
      CALL sax(OpenAD_Symbol_16,X(3),Y(1))
      CALL saxpy(OpenAD_Symbol_17,X(4),Y(1))
      CALL saxpy(OpenAD_Symbol_19,X(1),Y(1))
      CALL saxpy(OpenAD_Symbol_21,X(2),Y(1))
      Y(2)%v = (1.0D00/T3%v)
      OpenAD_Symbol_9 = (-(1.0D00/(T3%v*T3%v)))
      CALL sax(OpenAD_Symbol_9,T3,Y(2))
      Y(3)%v = SIN(T3%v)
      OpenAD_Symbol_10 = COS(T3%v)
      CALL sax(OpenAD_Symbol_10,T3,Y(3))
      Y(4)%v = (T2%v*T3%v)
      OpenAD_Symbol_11 = T3%v
      OpenAD_Symbol_12 = T2%v
      CALL sax(OpenAD_Symbol_11,T2,Y(4))
      CALL saxpy(OpenAD_Symbol_12,T3,Y(4))
      END SUBROUTINE
