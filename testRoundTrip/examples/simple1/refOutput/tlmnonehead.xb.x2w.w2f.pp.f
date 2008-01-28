

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_4
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_6
      REAL(w2f__8) OpenAD_Symbol_7
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
      T%v = (X(1)%v*X(2)%v)
      OpenAD_Symbol_0 = X(2)%v
      OpenAD_Symbol_1 = X(1)%v
      Y(1)%v = SIN(T%v)
      OpenAD_Symbol_2 = COS(T%v)
      Y(2)%v = COS(T%v)
      OpenAD_Symbol_3 = (-SIN(T%v))
      OpenAD_Symbol_4 = (OpenAD_Symbol_0 * OpenAD_Symbol_2)
      OpenAD_Symbol_5 = (OpenAD_Symbol_0 * OpenAD_Symbol_3)
      OpenAD_Symbol_6 = (OpenAD_Symbol_1 * OpenAD_Symbol_2)
      OpenAD_Symbol_7 = (OpenAD_Symbol_1 * OpenAD_Symbol_3)
      CALL sax(OpenAD_Symbol_4,X(1),Y(1))
      CALL sax(OpenAD_Symbol_5,X(1),Y(2))
      CALL saxpy(OpenAD_Symbol_6,X(2),Y(1))
      CALL saxpy(OpenAD_Symbol_7,X(2),Y(2))
      END SUBROUTINE
