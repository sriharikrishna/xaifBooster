
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
      type(active) :: OpenAD_Symbol_24
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
      type(active) :: X(1 : 5)
      INTENT(IN)  X
      type(active) :: Y(1 : 3)
      INTENT(OUT)  Y
C
C     **** Local Variables and Functions ****
C
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
      OpenAD_Symbol_0 = (X(1)%v*X(2)%v)
      T%v = (X(3)%v*OpenAD_Symbol_0)
      OpenAD_Symbol_1 = OpenAD_Symbol_0
      OpenAD_Symbol_3 = X(2)%v
      OpenAD_Symbol_4 = X(1)%v
      OpenAD_Symbol_2 = X(3)%v
      Y(1)%v = SIN(T%v)
      OpenAD_Symbol_5 = COS(T%v)
      OpenAD_Symbol_14 = (OpenAD_Symbol_3 * OpenAD_Symbol_2)
      OpenAD_Symbol_15 = (OpenAD_Symbol_4 * OpenAD_Symbol_2)
      OpenAD_Symbol_16 = (OpenAD_Symbol_1 * OpenAD_Symbol_5)
      OpenAD_Symbol_17 = (OpenAD_Symbol_14 * OpenAD_Symbol_5)
      OpenAD_Symbol_18 = (OpenAD_Symbol_15 * OpenAD_Symbol_5)
      CALL sax(OpenAD_Symbol_14,X(1),T)
      CALL saxpy(OpenAD_Symbol_15,X(2),T)
      CALL saxpy(OpenAD_Symbol_1,X(3),T)
      CALL sax(OpenAD_Symbol_16,X(3),Y(1))
      CALL saxpy(OpenAD_Symbol_17,X(1),Y(1))
      CALL saxpy(OpenAD_Symbol_18,X(2),Y(1))
      OpenAD_Symbol_6 = (X(4)%v*T%v)
      OpenAD_Symbol_11 = (X(5)%v*OpenAD_Symbol_6)
      OpenAD_Symbol_7 = OpenAD_Symbol_6
      OpenAD_Symbol_9 = T%v
      OpenAD_Symbol_10 = X(4)%v
      OpenAD_Symbol_8 = X(5)%v
      T%v = OpenAD_Symbol_11
      Y(2)%v = SIN(T%v)
      OpenAD_Symbol_12 = COS(T%v)
      OpenAD_Symbol_19 = (OpenAD_Symbol_9 * OpenAD_Symbol_8)
      OpenAD_Symbol_20 = (OpenAD_Symbol_10 * OpenAD_Symbol_8)
      OpenAD_Symbol_21 = (OpenAD_Symbol_7 * OpenAD_Symbol_12)
      OpenAD_Symbol_22 = (OpenAD_Symbol_19 * OpenAD_Symbol_12)
      OpenAD_Symbol_23 = (OpenAD_Symbol_20 * OpenAD_Symbol_12)
      CALL setderiv(OpenAD_Symbol_24,T)
      CALL sax(OpenAD_Symbol_19,X(4),T)
      CALL saxpy(OpenAD_Symbol_20,OpenAD_Symbol_24,T)
      CALL saxpy(OpenAD_Symbol_7,X(5),T)
      CALL sax(OpenAD_Symbol_21,X(5),Y(2))
      CALL saxpy(OpenAD_Symbol_22,X(4),Y(2))
      CALL saxpy(OpenAD_Symbol_23,OpenAD_Symbol_24,Y(2))
      Y(3)%v = COS(T%v)
      OpenAD_Symbol_13 = (-SIN(T%v))
      CALL sax(OpenAD_Symbol_13,T,Y(3))
      END SUBROUTINE
