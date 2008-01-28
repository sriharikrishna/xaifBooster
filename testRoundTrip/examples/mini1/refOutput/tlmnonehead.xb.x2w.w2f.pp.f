

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
C
C     **** Parameters and Result ****
C
      type(active) :: X
      INTENT(IN)  X
      type(active) :: Y
      INTENT(OUT)  Y
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_0 = (X%v*X%v)
      Y%v = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_2 = X%v
      OpenAD_Symbol_3 = X%v
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_4 = (OpenAD_Symbol_2 * OpenAD_Symbol_1)
      OpenAD_Symbol_5 = (OpenAD_Symbol_3 * OpenAD_Symbol_1)
      CALL sax(OpenAD_Symbol_4,X,Y)
      CALL saxpy(OpenAD_Symbol_5,X,Y)
      END SUBROUTINE
