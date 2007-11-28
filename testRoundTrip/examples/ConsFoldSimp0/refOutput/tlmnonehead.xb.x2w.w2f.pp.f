

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      type(active) :: OpenAD_Symbol_10
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
      type(active) :: OpenAD_Symbol_8
      REAL(w2f__8) OpenAD_Symbol_9
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
      T1%v = (X(1)%v+X(1)%v)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = 1_w2f__i8
      OpenAD_Symbol_4 = (T1%v*2.0D00)
      OpenAD_Symbol_2 = 2.0D00
      T2%v = OpenAD_Symbol_4
      Y1%v = T2%v
      Y(1)%v = Y1%v
      OpenAD_Symbol_5 = (INT(1_w2f__i8) * INT(1_w2f__i8))
      OpenAD_Symbol_6 = (OpenAD_Symbol_2 * OpenAD_Symbol_5)
      OpenAD_Symbol_7 = (OpenAD_Symbol_0 * OpenAD_Symbol_6)
      OpenAD_Symbol_9 = (OpenAD_Symbol_1 * OpenAD_Symbol_6)
      CALL setderiv(OpenAD_Symbol_10,X(1))
      CALL setderiv(OpenAD_Symbol_8,X(1))
      CALL sax(OpenAD_Symbol_7,OpenAD_Symbol_8,Y(1))
      CALL saxpy(OpenAD_Symbol_9,OpenAD_Symbol_10,Y(1))
      END SUBROUTINE
