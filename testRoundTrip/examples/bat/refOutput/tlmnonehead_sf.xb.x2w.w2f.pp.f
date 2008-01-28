
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
      REAL(w2f__8) OpenAD_Symbol_25
      REAL(w2f__8) OpenAD_Symbol_26
      REAL(w2f__8) OpenAD_Symbol_27
      REAL(w2f__8) OpenAD_Symbol_28
      REAL(w2f__8) OpenAD_Symbol_29
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_30
      REAL(w2f__8) OpenAD_Symbol_31
      REAL(w2f__8) OpenAD_Symbol_32
      REAL(w2f__8) OpenAD_Symbol_33
      REAL(w2f__8) OpenAD_Symbol_34
      REAL(w2f__8) OpenAD_Symbol_35
      REAL(w2f__8) OpenAD_Symbol_36
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
      Y(2)%v = (1.0D00/T3%v)
      OpenAD_Symbol_9 = (-(1.0D00/(T3%v*T3%v)))
      Y(3)%v = SIN(T3%v)
      OpenAD_Symbol_10 = COS(T3%v)
      Y(4)%v = (T2%v*T3%v)
      OpenAD_Symbol_11 = T3%v
      OpenAD_Symbol_12 = T2%v
      OpenAD_Symbol_13 = (OpenAD_Symbol_0 * OpenAD_Symbol_4)
      OpenAD_Symbol_14 = (OpenAD_Symbol_0 * OpenAD_Symbol_6)
      OpenAD_Symbol_15 = (OpenAD_Symbol_1 * OpenAD_Symbol_4)
      OpenAD_Symbol_16 = (OpenAD_Symbol_1 * OpenAD_Symbol_6)
      OpenAD_Symbol_17 = (OpenAD_Symbol_2 * OpenAD_Symbol_5)
      OpenAD_Symbol_18 = (OpenAD_Symbol_2 * OpenAD_Symbol_11)
      OpenAD_Symbol_19 = (OpenAD_Symbol_3 * OpenAD_Symbol_5)
      OpenAD_Symbol_20 = (OpenAD_Symbol_3 * OpenAD_Symbol_11)
      OpenAD_Symbol_21 = (OpenAD_Symbol_14 + OpenAD_Symbol_13 *
     >  OpenAD_Symbol_7)
      OpenAD_Symbol_22 = (OpenAD_Symbol_13 * OpenAD_Symbol_9)
      OpenAD_Symbol_23 = (OpenAD_Symbol_13 * OpenAD_Symbol_10)
      OpenAD_Symbol_24 = (OpenAD_Symbol_13 * OpenAD_Symbol_12)
      OpenAD_Symbol_25 = (OpenAD_Symbol_16 + OpenAD_Symbol_15 *
     >  OpenAD_Symbol_7)
      OpenAD_Symbol_26 = (OpenAD_Symbol_15 * OpenAD_Symbol_9)
      OpenAD_Symbol_27 = (OpenAD_Symbol_15 * OpenAD_Symbol_10)
      OpenAD_Symbol_28 = (OpenAD_Symbol_15 * OpenAD_Symbol_12)
      OpenAD_Symbol_29 = (OpenAD_Symbol_17 * OpenAD_Symbol_7)
      OpenAD_Symbol_30 = (OpenAD_Symbol_17 * OpenAD_Symbol_9)
      OpenAD_Symbol_31 = (OpenAD_Symbol_17 * OpenAD_Symbol_10)
      OpenAD_Symbol_32 = (OpenAD_Symbol_18 + OpenAD_Symbol_17 *
     >  OpenAD_Symbol_12)
      OpenAD_Symbol_33 = (OpenAD_Symbol_19 * OpenAD_Symbol_7)
      OpenAD_Symbol_34 = (OpenAD_Symbol_19 * OpenAD_Symbol_9)
      OpenAD_Symbol_35 = (OpenAD_Symbol_19 * OpenAD_Symbol_10)
      OpenAD_Symbol_36 = (OpenAD_Symbol_20 + OpenAD_Symbol_19 *
     >  OpenAD_Symbol_12)
      CALL sax(OpenAD_Symbol_21,X(1),Y(1))
      CALL sax(OpenAD_Symbol_22,X(1),Y(2))
      CALL sax(OpenAD_Symbol_23,X(1),Y(3))
      CALL sax(OpenAD_Symbol_24,X(1),Y(4))
      CALL saxpy(OpenAD_Symbol_25,X(2),Y(1))
      CALL saxpy(OpenAD_Symbol_26,X(2),Y(2))
      CALL saxpy(OpenAD_Symbol_27,X(2),Y(3))
      CALL saxpy(OpenAD_Symbol_28,X(2),Y(4))
      CALL saxpy(OpenAD_Symbol_29,X(3),Y(1))
      CALL saxpy(OpenAD_Symbol_30,X(3),Y(2))
      CALL saxpy(OpenAD_Symbol_31,X(3),Y(3))
      CALL saxpy(OpenAD_Symbol_32,X(3),Y(4))
      CALL saxpy(OpenAD_Symbol_33,X(4),Y(1))
      CALL saxpy(OpenAD_Symbol_34,X(4),Y(2))
      CALL saxpy(OpenAD_Symbol_35,X(4),Y(3))
      CALL saxpy(OpenAD_Symbol_36,X(4),Y(4))
      END SUBROUTINE
