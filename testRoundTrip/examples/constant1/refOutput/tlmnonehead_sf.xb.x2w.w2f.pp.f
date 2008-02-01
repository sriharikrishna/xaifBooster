
      MODULE all_globals_mod
      use w2f__types
      use active_module
      IMPLICIT NONE
      SAVE
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) PI
      PARAMETER ( PI = 3.141592653589793116D00)
C
C     **** Statements ****
C
      END MODULE

      MODULE anothermodule
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
      SAVE
C
C     **** Local Variables and Functions ****
C
      REAL(w2f__8) PI2
      PARAMETER ( PI2 = 3.141592653589793116D00)
C
C     **** Statements ****
C
      END MODULE

      SUBROUTINE head(X, Y)
      use w2f__types
      use active_module
      use anothermodule
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
      REAL(w2f__8) OpenAD_Symbol_5
      REAL(w2f__8) OpenAD_Symbol_7
      REAL(w2f__8) OpenAD_Symbol_8
C
C     **** Parameters and Result ****
C
      type(active) :: X(1 : 1)
      type(active) :: Y(1 : 1)
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      OpenAD_Symbol_2 = (X(1)%v*3.141592653589793116D00)
      OpenAD_Symbol_0 = (OpenAD_Symbol_2 * 2.0D00)
      Y(1)%v = SIN(OpenAD_Symbol_0)
      OpenAD_Symbol_5 = 3.141592653589793116D00
      OpenAD_Symbol_3 = 2.0D00
      OpenAD_Symbol_1 = COS(OpenAD_Symbol_0)
      OpenAD_Symbol_7 = (OpenAD_Symbol_5 * OpenAD_Symbol_3)
      OpenAD_Symbol_8 = (OpenAD_Symbol_7 * OpenAD_Symbol_1)
      CALL sax(OpenAD_Symbol_8,X(1),Y(1))
      END SUBROUTINE
