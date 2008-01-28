

      SUBROUTINE foo()
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      END SUBROUTINE

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
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 2)
      type(active) :: Y
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
      type(active) :: T
      type(active) :: T2
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      T%v = (X(1)%v+X(2)%v)
      OpenAD_Symbol_0 = 1_w2f__i8
      OpenAD_Symbol_1 = 1_w2f__i8
      T2%v = (T%v*2.0D00)
      OpenAD_Symbol_2 = 2.0D00
      OpenAD_Symbol_10 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_11 = (OpenAD_Symbol_1 * OpenAD_Symbol_2)
      OpenAD_Symbol_12 = OpenAD_Symbol_0
      OpenAD_Symbol_13 = OpenAD_Symbol_1
      CALL sax(OpenAD_Symbol_10,X(1),T2)
      CALL saxpy(OpenAD_Symbol_11,X(2),T2)
      CALL sax(OpenAD_Symbol_12,X(1),T)
      CALL saxpy(OpenAD_Symbol_13,X(2),T)
      CALL foo()
      Y%v = (T2%v*3.0D00+T%v*2.0D00)
      OpenAD_Symbol_6 = 3.0D00
      OpenAD_Symbol_4 = 1_w2f__i8
      OpenAD_Symbol_8 = 2.0D00
      OpenAD_Symbol_5 = 1_w2f__i8
      OpenAD_Symbol_14 = (OpenAD_Symbol_6 * OpenAD_Symbol_4)
      OpenAD_Symbol_15 = (OpenAD_Symbol_8 * OpenAD_Symbol_5)
      CALL sax(OpenAD_Symbol_14,T2,Y)
      CALL saxpy(OpenAD_Symbol_15,T,Y)
      END SUBROUTINE
