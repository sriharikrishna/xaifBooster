
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
      type(active) :: OpenAD_Symbol_11
      REAL(w2f__8) OpenAD_Symbol_12
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y(1 : 2)
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
      OpenAD_Symbol_2 = (X(1)%v*X(2)%v)
      OpenAD_Symbol_0 = X(2)%v
      OpenAD_Symbol_1 = X(1)%v
      T%v = OpenAD_Symbol_2
      OpenAD_Symbol_4 = SIN(T%v)
      OpenAD_Symbol_3 = COS(T%v)
      Y(1)%v = OpenAD_Symbol_4
      OpenAD_Symbol_6 = COS(T%v)
      OpenAD_Symbol_5 = (-SIN(T%v))
      Y(2)%v = OpenAD_Symbol_6
      OpenAD_Symbol_7 = (OpenAD_Symbol_0 * OpenAD_Symbol_3)
      OpenAD_Symbol_9 = (OpenAD_Symbol_0 * OpenAD_Symbol_5)
      OpenAD_Symbol_10 = (OpenAD_Symbol_1 * OpenAD_Symbol_3)
      OpenAD_Symbol_12 = (OpenAD_Symbol_1 * OpenAD_Symbol_5)
      CALL setderiv(OpenAD_Symbol_11,X(2))
      CALL setderiv(OpenAD_Symbol_8,X(1))
      CALL sax(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(1))
      CALL sax(OpenAD_Symbol_9,OpenAD_Symbol_8,Y(2))
      CALL saxpy(OpenAD_Symbol_10,OpenAD_Symbol_11,Y(1))
      CALL saxpy(OpenAD_Symbol_12,OpenAD_Symbol_11,Y(2))
      END SUBROUTINE
