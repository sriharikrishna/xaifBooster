

      SUBROUTINE foo()
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Global Variables & Derived Type Definitions ****
C
      REAL(w2f__8) OpenAD_Symbol_0
      REAL(w2f__8) OpenAD_Symbol_1
      REAL(w2f__8) OpenAD_Symbol_2
      REAL(w2f__8) OpenAD_Symbol_3
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      Y(1)%v = (X(1)%v*X(2)%v)
      OpenAD_Symbol_0 = X(2)%v
      OpenAD_Symbol_1 = X(1)%v
      OpenAD_Symbol_2 = OpenAD_Symbol_0
      OpenAD_Symbol_3 = OpenAD_Symbol_1
      CALL sax(OpenAD_Symbol_2,X(1),Y(1))
      CALL saxpy(OpenAD_Symbol_3,X(2),Y(1))
      END SUBROUTINE

      SUBROUTINE head()
      use w2f__types
      use active_module
      use all_globals_mod
      IMPLICIT NONE
C
C     **** Local Variables and Functions ****
C
      EXTERNAL foo
C
C     **** Top Level Pragmas ****
C
C$OPENAD INDEPENDENT(X)
C$OPENAD DEPENDENT(Y)
C
C     **** Statements ****
C
C$OPENAD XXX Template ad_template.f
      CALL foo()
      END SUBROUTINE
